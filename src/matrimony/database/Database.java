package matrimony.database;
import java.net.URL;
import java.util.Vector;
import java.io.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import java.sql.*;
	public class Database 	{

				private	int update=0;
				private String client=null;
				private String xml=null;
				private DataInputStream dis=null;
				private File fl=null;
				private FileInputStream fis=null;
				private FileOutputStream fos=null;
				private InputStream is=null;
				private OutputStream out=null;
				private URL url=null;
				private JspWriter console=null;
				private PageContext pc=null;
				private HttpServletRequest request=null;
				private HttpServletResponse response=null;
				private HttpSession session=null;
				private DocumentBuilderFactory factory =null;
				private DocumentBuilder domBuilder = null;
				private Document doc = null;
				private Element root =null;
				private NodeList nl=null;
				private Connection cn=null;
				private Statement st=null;
				private Statement scroll=null;
				private PreparedStatement pst=null;
				private ResultSet rs=null;
				private ResultSetMetaData rsmd=null;

		private Database(HttpServletRequest request,HttpServletResponse response) throws Exception {
				this.xml = request.getContextPath()+"/database/database.xml";
				this.request = request;	
				this.response = response;
				this.session = this.request.getSession(true);
				this.client = this.session.getAttribute("Client")!=null?this.session.getAttribute("Client").toString():"nothing";
				this.url = new URL(request.getScheme(),request.getServerName(),request.getServerPort(),xml);
				this.factory =  DocumentBuilderFactory.newInstance();
				this.domBuilder = factory.newDocumentBuilder();
				this.doc = domBuilder.parse(url.openStream());
				this.root = doc.getDocumentElement();
				this.cn = getConnection();
				this.st = cn.createStatement();
				this.scroll = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		}

		public static Database newInstance(HttpServletRequest req,HttpServletResponse res) throws Exception{
				Database db=new Database(req,res);
				return db;
		}
		
		public Connection getConnection() throws Exception {
				nl = doc.getElementsByTagName("mysql");
				nl=nl.item(0).getChildNodes();
				System.out.println(nl.item(1).getFirstChild().getNodeValue());
				Class.forName(nl.item(1).getFirstChild().getNodeValue());
				System.out.println("\n\n"+nl.item(1).getFirstChild().getNodeValue());
				String urlstring=nl.item(3).getFirstChild().getNodeValue()+"/";
				urlstring+=nl.item(5).getFirstChild().getNodeValue();
				urlstring+="?user="+nl.item(7).getFirstChild().getNodeValue();
				urlstring+="&password="+nl.item(9).getFirstChild().getNodeValue();
				return DriverManager.getConnection(urlstring);
		}
		
		public int resolveType(Object obj) {
				if(obj instanceof Integer) return Types.INTEGER;
				else if(obj instanceof Float) return Types.FLOAT;
				else if(obj instanceof String) return Types.VARCHAR;
				else if(obj instanceof java.util.Date) return Types.DATE;
				else if(obj instanceof java.io.InputStream) return Types.BLOB;
				else return Types.NULL;
		}
		
		public String[] getColumns(String table) throws Exception{
				String cmd="SELECT * from "+table;
				rs=st.executeQuery(cmd);
				rsmd=rs.getMetaData();
				String[] columns=new String[rsmd.getColumnCount()];
				int colcount=rsmd.getColumnCount()+1;
				for(int c=1;c<colcount;c++) columns[c-1]=rsmd.getColumnName(c);
				return columns;
		}

		public Vector getValues(String table,String fields[],String condition) throws Exception {
				StringBuffer buffer=new StringBuffer("SELECT ");
				for(int f=0;f<fields.length;f++) buffer.append(fields[f]+",");
				buffer.deleteCharAt(buffer.toString().length()-1);
				buffer.append(" from "+table+" WHERE "+condition);
				rs=st.executeQuery(buffer.toString());
				Vector data=new Vector();
				if(rs.next()) for(int c=0;c<rs.getMetaData().getColumnCount();c++) data.addElement(rs.getString(c+1));
				return data;
		}
		
		public String[][] getRows(String table,String params[],String condition) throws Exception {
			StringBuffer buffer=new StringBuffer("SELECT ");
			String temp="";
			if(params!=null) for(int i=0;i<params.length;i++) temp+=params[i]+",";
			temp=temp.length()>0?temp.substring(0,temp.length()-1):"*";
			buffer.append(temp+" from "+table);
			buffer.append(condition!=null?" where "+condition:"");
			System.out.println(buffer.toString());
			rs=st.executeQuery(buffer.toString());
			int colcount=rs.getMetaData().getColumnCount();
			Object[] vectors=new Object[params.length];
				for(int vec=0;vec<vectors.length;vec++) vectors[vec]=new Vector();
				for(;rs.next();) {
					for(int cl=0;cl<colcount;cl++)
						((Vector) vectors[cl]).addElement(rs.getString(cl+1));
				}
		 	  int rsize=((Vector) vectors[0]).size();
			  System.out.println("Size:"+rsize);
			  String[][] rows=new String[rsize][colcount];
				for(int rw=0;rw<rows.length;rw++) {
					for(int cls=0;cls<colcount;cls++) {
						Object var=((Vector) vectors[cls]).elementAt(rw);
						rows[rw][cls]=var!=null?var.toString():"Null";
					}
				}
				return rows;
			}

		public boolean checkRecord(String table,String condition) throws Exception {
				String cmd="SELECT * FROM "+table+" WHERE "+condition;
				rs=st.executeQuery(cmd);
				return rs.next();
		}

		public void rollback() throws Exception {
				if(cn!=null) cn.rollback();
		}

		public void closeAll() throws Exception {
				if(st!=null) st.close();
				if(pst!=null) pst.close();
				if(rs!=null) rs.close();
		}

		public boolean insertRecord(String table,Object[] values) throws Exception{
				StringBuffer sb=new StringBuffer("insert into "+table+" values(");
				for(int ph=0;ph<values.length;ph++) sb.append("?,");
				sb.deleteCharAt(sb.toString().length()-1);
				sb.append(")");
				pst=cn.prepareStatement(sb.toString());
				for(int s=0;s<values.length;s++) {
					Object obj=values[s];//.elementAt(s);
					pst.setObject((s+1),obj,resolveType(obj));}
					update=pst.executeUpdate();
					closeAll();
					return (update>0);
		}

		public boolean updateRecord(String table,Object[][] keypair,String condition) throws Exception {
				StringBuffer sb=new StringBuffer("update "+table+" set ");
				for(int ob=0;ob<keypair.length;ob++) sb.append(keypair[ob][0]+"=?,");
				sb.deleteCharAt(sb.toString().length()-1);sb.append(" where "+condition);
				pst=cn.prepareStatement(sb.toString());
				for(int s=0;s<keypair.length;s++) {
					Object obj=keypair[s][1];
					pst.setObject((s+1),obj,resolveType(obj));}
					//java.io.PrintWriter pw=response.getWriter();pw.println(pst);
					update=pst.executeUpdate();
					closeAll();
					return (update>0);
		}

		public boolean deleteRecord(String table,String condition) throws Exception{
				String cmd="DELETE FROM "+table+" where "+condition;
				System.out.println("\n\n\nDelete Query:"+cmd+"\n\n");
				update=st.executeUpdate(cmd);
				return (update>0);			
		}

		public String fetchRecords(String table,String[] columns, String condition,int width,int direction,boolean edit) throws Exception{
				StringBuffer sb=new StringBuffer("SELECT ");
				String bg="whitesmoke";
				String style="class=disable style='width:100px;border:0px;background:"+bg+";font:bold 11px tahoma;color:lightslategray'";
				StringBuffer result=new StringBuffer("<TABLE WIDTH='"+width+"' ALIGN=CENTER CELLSPACING=1 CELLPADDING=3 BGCOLOR=LIGHTSLATEGRAY STYLE='FONT:BOLD 11px TAHOMA'>\n");
				String editable=edit?"input "+style:"div "+style;
				int split=(width/2);
				if(columns!=null) {
					for(int c=0;c<columns.length;c++) sb.append(columns[c]+",");
					sb.deleteCharAt(sb.toString().length()-1);
				} else sb.append(" * ");
				sb.append(" from "+table);
				if(condition!=null) sb.append(" where "+condition);
				System.out.println("User Query:"+sb.toString());
				rs=st.executeQuery(sb.toString());
				rsmd=rs.getMetaData();
				int count=0;
				int colcount=rsmd.getColumnCount()+1;
				if(direction==0) {
					result.append("<TR>\n");			
					for(int cols=1;cols<colcount;cols++) result.append("<TH STYLE='color:aliceblue'>"+rsmd.getColumnName(cols).replaceAll("_"," ")+"</TH>\n");
					result.append("</TR>\n");
						for(;rs.next();) {
						count++;
						result.append("<TR bgcolor='"+bg+"' class=click>");
						for(int cell=1;cell<colcount;cell++) {
							String container=edit?"<input name='"+rsmd.getColumnName(cell)+"' type=text value='"+rs.getString(cell)+"' "+style+">":rs.getString(cell);
							result.append("<TD style='font:bold 11px tahoma;color:lightslategray'>"+container+"</TD>\n");}
						result.append("</TR>\n");}
					} else {
						for(;rs.next();) {
						count++;
						for(int cell=1;cell<colcount;cell++) {
							String container=edit?"<input name='"+rsmd.getColumnName(cell)+"' type=text value='"+rs.getString(cell)+"' "+style+">":rs.getString(cell);
							result.append("<TR bgcolor=whitesmoke><TD align=right width='"+split+"'><B><font color=lightslategray>"+rsmd.getColumnName(cell).replaceAll("_"," ")+"</font></b>&nbsp;&nbsp;:&nbsp;&nbsp;</TD><TD width='"+split+"' style='font:bold 11px tahoma;color:lightslategray'>"+container+"</TD></TR>\n");}
						}
						} result.append("</TABLE>\n");
						return (count>0?result.toString():"<BR><center><h4>No Information Found</h4><BR><button class=button style='width:120px;' onclick='parent.location=\"javascript:history.back()\"' accesskey='T'><u>T</U>ry Again</button><BR><BR></center>");

			}
		
		public ResultSet getResultset(String query) throws Exception{
					rs=st.executeQuery(query);
					return rs;
		}

		public File getImage() throws Exception {
						String Contenttype=request.getContentType();
						if((Contenttype!=null)&&(Contenttype.indexOf("multipart/form-data")>=0)) {
						DataInputStream in=new DataInputStream(request.getInputStream());
						int clength=request.getContentLength();
						byte data[]=new byte[clength];
						int byteread=0;
						int totalread=0;
						while(totalread<clength) {
								byteread=in.read(data,totalread,clength);
								totalread+=byteread;
							}
						String file=new String(data);
						String save=file.substring(file.indexOf("filename=\"")+10);
						save=save.substring(0,save.indexOf("\n"));
						save=save.substring(save.lastIndexOf("\\")+1,save.indexOf("\""));
						int lastindex=Contenttype.lastIndexOf("=");
						String boundary=Contenttype.substring(lastindex+1,Contenttype.length());
						int pos;
						pos=file.indexOf("filename=\"");
						pos=file.indexOf("\n",pos)+1;
						pos=file.indexOf("\n",pos)+1;
						pos=file.indexOf("\n",pos)+1;
						int boundloc=file.indexOf(boundary,pos)-4;
						int startpos=((file.substring(0,pos)).getBytes()).length;
						int endpos=((file.substring(0,boundloc)).getBytes()).length;
						String filename=client+"_resume.doc";
						String split=System.getProperty("file.separator");
						fl=new File("C:\\temp.gif"); if(fl.exists()) fl.delete();
						FileOutputStream fout=new FileOutputStream("C:\\temp.gif");
						fout.write(data,startpos,(endpos-startpos));
						fout.flush();
						fout.close();
						return new File("C:\\temp.gif");
						} return null;
		} 

		public boolean uploadImage(String table) throws Exception {
			try{
				fl=getImage();
				if(fl==null) return false;
				fis=new FileInputStream(fl);
				cn.setAutoCommit(false);
				String secure="false";
				rs=getResultset("select secure from matrimony_profiles where profile_id='"+client+"'");
				System.out.println("Before:"+secure);
				if(rs.next()) {
					secure=rs.getString(1);
					st.execute("delete from "+table+" where profile_id='"+client+"'"); 
				}
				pst=cn.prepareStatement("insert into "+table+" values(?,?,?,?)");
				pst.setString(1,client);
				pst.setString(2,session.getAttribute("Email").toString());
				System.out.println("After:"+secure);
				pst.setString(3,secure);
				pst.setBinaryStream(4,fis,(int)fl.length());
				update=pst.executeUpdate();
				fis.close();
				fl.delete();
				cn.commit();
				return (update>0);
				}catch(Exception e) {
							request.setAttribute("Exception","Unable To Upload Image Due to "+e.getMessage());
							request.getRequestDispatcher("../Exceptions/Exception.jsp").forward(request,response);
							return false;
					}
			}

		public boolean checkImage() throws Exception {
					String cmd="select photo from  matrimony_profiles where Profile_id='"+client+"'";
					rs=getResultset(cmd);
					if(rs.next()) {is=rs.getBinaryStream(1);return (is!=null);}
					else return false;
		}

		public boolean loadImage(String id) throws Exception {
					String cmd="select photo from  matrimony_profiles where Profile_id='"+id+"'";
					rs=getResultset(cmd);
					boolean imgfound=false;
					while(rs.next()) is=rs.getBinaryStream(1);
					if(is!=null) {
							imgfound=true;
							response.setContentType("image/jpeg");
							out=response.getOutputStream();
							byte[] buf=new byte[1024];
							int count=0;
							while((count=is.read(buf))>=0) out.write(buf,0,count);
							is.close();
							out.close();
							} return imgfound;
		}
}