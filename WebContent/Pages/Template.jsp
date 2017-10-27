<%@page import="matrimony.database.Database"%>
<%!
	public class Template {
		PageContext pc;
		JspWriter out;
		Database db;
		public String[] months={"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
		public String[] days={"1","31"};
		public String[] years={"1900","2006"};
	    public String[] ages={"18","61"};
	    public String[] marstatus={"Unmarried","Widow-Widower","Divorce","Separated"};
	    public String[] languages={"Tamil","English","Hindi","Urdu","Kannada","Telugu","Malayalam","Oriya","Marathi","Bengali","Assamese","Rajasthani","Manipuri","Others"};
		public String[] hrs={"00-AM","01-AM","02-AM","03-AM","04-AM","05-AM","06-AM","07-AM","08-AM","09-AM","10-AM","11-AM","00-PM","01-PM","02-PM","03-PM","04-PM","05-PM","06-PM","07-PM","08-PM","09-PM","10-PM","11-PM"};
		public String[] hours={"1","13"};
	    public String[] mins={"0","60"};
	    public String[] castes={"Any","Caste-No-Bar","gnikula-Kshatriya","Arya Vysya","Balija","Besta","Brahmin","Chettiar","Devanga","Gandla","Gapublic","Gowda","Intercaste","Kalinga","Kamma","Kapu","Kshatriya","Kummari","Kuruba","Lingayath","Mannuru Kapu","Madiga","Mahendra","Mala","Maratha","Meru Darji","Mudaliyar","Mudiraj","Nadar","Nai","Naidu","Padmasali","Patnaick","Rajaka","Rajput","Reddy","SC","Telaga","Tribe","Uppara","Vaddera","Vaishnava","Valmiki","Vanjara","Vokkaliga","Velama","Viswabrahmin","Yadava","Other"};
	    public String[] education={"Any","Bachelors-Engineering-Computers","Masters-Engineering-Computers","Bachelors-Arts-Science-Commerce-Others","Masters-Arts-Science-Commerce-Others","Management-BBA-MBA-Others","Medicine-General-Dental-Surgeon-Others","Legal-BL-ML-LLB-LLM-Others","Service-IAS-IPS-Others","Ph-Diploma","Higher-Secondary-Secondary"};
	    public String[] religions={"Hindu","Muslim","Christian","Sikh","Jain","Parsi","Buddhist","InterReligion","NoReligion"};
	    public String[] employment={"Government","Private","Business","Defence","Not-Working"};
	    public String[] residency={"Citizen","Permanent-Resident","Work-Permit","Student-Visa","Temporary-Visa"};

		String nbsp=new String("&nbsp;&nbsp;");
		String templatejs=new String();
		String itemsjs=new String();
		String style=new String();
		String toplogo=new String();
		String watermark=new String();
		String couple=new String();
		String horoscope=new String();
		javax.servlet.http.HttpServletRequest httprequest;
		javax.servlet.http.HttpServletResponse httpresponse;
		javax.servlet.http.HttpSession session;
			public Template(PageContext pc) throws Exception{
					this.pc=pc;
					this.out=pc.getOut();
					this.httprequest=(javax.servlet.http.HttpServletRequest) pc.getRequest();
					this.httpresponse=(javax.servlet.http.HttpServletResponse) pc.getResponse();
					this.session=httprequest.getSession(true);
					this.db=Database.newInstance(httprequest,httpresponse);
					this.style=getPath("/Styles/Matrimony.css");
					this.templatejs=getPath("/Scripts/Template.js");
 				    this.itemsjs=getPath("/Scripts/Items.js");
					this.toplogo=getPath("/Images/wedding.jpg");
					//this.watermark=getPath("/Images/pallaki.jpg");
					this.horoscope=getPath("/Images/horoscope.gif");
					this.couple=getPath("/Images/horoscope.couple.jpg");
				    this.httpresponse.setHeader("Cahce-Control","no-cache");
				    this.httpresponse.setHeader("Cache-Control","no-store");
				    this.httpresponse.setHeader("Pragma","no-cache");
				    this.httpresponse.setDateHeader("Expires",0);
			}

			public void getInbox() throws Exception{
					StringBuffer sb=new StringBuffer("<TABLE width=610 cellspacing=1 cellpadding=3 bgcolor=#345443 style='font:bold 11px tahoma'><form action=\"Inbox.jsp\" method=post>\n");
					sb.append("<TR><TH style='color:aliceblue'>S.No</TH><TH style='color:aliceblue'>From</TH><TH style='color:aliceblue'>Subject</TH><TH style='color:aliceblue'>Date</TH>");
					java.sql.ResultSet rs=db.getResultset("SELECT Msgid,Target_Id,Subject,Message,Msgdate FROM Matrimony_Messages where Source_Id='"+session.getAttribute("Client")+"'");
					boolean found=false;
					for(int count=0;rs.next();count++) {
						found=true;
						sb.append("<TR><TD align=center bgcolor=whitesmoke>"+(count+1)+"</TD><TD bgcolor=whitesmoke><input type=checkbox name=from value='"+rs.getString(1)+"'>"+rs.getString(2).toUpperCase()+"</TD><TD style='padding-left:20px' bgcolor=whitesmoke><a href='javascript:showMessage()'>"+rs.getString(3)+"</a></TD><div id=message style='display:none'>"+rs.getString(4)+"</div><TD bgcolor=whitesmoke style='padding-left:20px'>"+rs.getString(5)+"</TD></TR>\n");
					} sb.append("<TR bgcolor=whitesmoke><TD colspan=4 align=center><button class=button type=button accesskey='A' onclick=checkAll(this.form,event);>Check <u>A</u>ll</button>&nbsp;&nbsp;<button  class=button type=submit accesskey='D'><u>D</u>elete</button>&nbsp;&nbsp;<button  class=button type=sumit accesskey='C'><u>C</u>lear</button>&nbsp;&nbsp;</TD></TR>");
					if(found) out.println(sb.toString()+"</TABLE>");
					else out.println("<BR><BR><Center><h4>No New Messages Found. Your Inbox Folder is Empty</h4></center>");
			}
			
			public void deleteMessages() throws Exception {
					String[] msgs=pc.getRequest().getParameterValues("from");
					if(msgs!=null) for(int i=0;i<msgs.length;i++) db.deleteRecord("Matrimony_Messages","msgid="+msgs[i]);
					getInbox();
			}

			public String getPath(String path) throws java.net.MalformedURLException {
					return new java.net.URL(pc.getRequest().getScheme(),pc.getRequest().getServerName(),pc.getRequest().getServerPort(),httprequest.getContextPath()+path).toString();
			}

			public void loadJavaScript() throws Exception {
				out.println("<LINK HREF=\""+style+"\" REL=\"STYLESHEET\">"); 
				out.println("<SCRIPT SRC=\""+templatejs+"\"></SCRIPT>"); 
				out.println("<SCRIPT SRC=\""+itemsjs+"\"></SCRIPT>"); 
				out.println("<SCRIPT>site.header('Matrimony.com','"+watermark+"','"+toplogo+"')</SCRIPT>"); 
			}
		
			public void getTime() throws Exception{
				buildMenu(hours,"hrs",60);out.println("&nbsp;&nbsp;");
				buildMenu(mins,"mins",60);out.println("&nbsp;&nbsp;");
				out.println("<SELECT name=meridian class=ctrl style='width:60px'><option value='AM'>AM</option><option value='PM'>PM</option></select>");
			}

			public void getError() throws Exception {
				String Exception=(String) pc.getRequest().getAttribute("Exception");
				String msg="null, message from server:";
				if(Exception!=null && Exception.length()>0) {
				if(Exception.indexOf(msg)!=-1) Exception=Exception.substring(Exception.indexOf(msg)+msg.length());
				if(Exception.toLowerCase().indexOf("duplicate")!=-1) Exception="Specified Data is Available. Profile Id , E-mail Id and Name Should be Unique";
				out.println("<LI class=error>"+Exception+"</li>");
				}
			}

			public void getInformation() throws Exception {
				String Response=(String) pc.getRequest().getAttribute("Information");
				if(Response!=null && Response.length()>0) 
				out.println(Response);
			}

			public void getValue(String value) throws Exception {
				String Value=(String) pc.getRequest().getAttribute(value);
				if(Value!=null && Value.length()>0) 
				out.println("<LI class=error>Your's Password is ::&gt;&gt;&nbsp;&nbsp;\"&nbsp;"+Value+"&nbsp;\"</li>");
			}

			public void checkSession() throws Exception {
				if(session.getAttribute("Client")==null) {
				pc.getRequest().setAttribute("Exception","Invalid Session. You are Not Logged on");
				pc.getRequest().getRequestDispatcher("index.jsp").forward(pc.getRequest(),pc.getResponse());
				}
			}
			
			public void dynamicUpload(boolean update) throws Exception {
				boolean image=db.checkImage();
				StringBuffer sb=new StringBuffer("<Table width=610 align=center cellspacing=0 cellpadding=3 style='border:1px solid gray'>");
				String edit=update?"<TR><TD align=center colspan=2><a href='"+getPath("/Pages/EditProfile.jsp")+"'>Edit and Update Profiles</a></TD></TR>":"";
				if(!image || update) {
						sb.append("<form enctype=\"multipart/form-data\" method=\"post\" action='"+getPath("/Pages/UploadImage.jsp")+"'/>");
						sb.append("<TR bgcolor=#594344><Th style='color:aliceblue;font:bold 12px tahoma' colspan=2 class=cell>Add Your Profile</Th></TR>");
						sb.append("<TR><TD class=cell colspan=2 align=center><BR><BR>Profile Id&nbsp;&nbsp;:&nbsp;&nbsp;"+session.getAttribute("Client")+"</TD></TR>");
						sb.append("<TR><TD class=cell align=right>Submit Ur's Profile&nbsp;&nbsp;:&nbsp;&nbsp;</TD><TD><input type=file name=profile class=input style='width:300px'></TD></TR>");
						sb.append("<TR><TD align=center colspan=2 class=cell><BR>");
						sb.append("<button style='width:150px' class=button type=submit accesskey='A'><U>A</U>dd Profile</button>&nbsp;&nbsp;&nbsp;&nbsp;");
						sb.append("	<button style='width:150px' class=button type=reset accesskey='C'><U>C</U>lear</button><BR><BR></TD></TR>"+edit+"</FORM></TABLE>");
				} else {
						sb.append("<TR bgcolor=#594344><Th style='color:aliceblue;font:bold 12px tahoma' colspan=2 class=cell>Your Profile Settings</Th></TR>");
						sb.append("<TR><TD class=cell colspan=2 align=center><BR><BR>Profile Id&nbsp;&nbsp;:&nbsp;&nbsp;"+session.getAttribute("Client")+"</TD></TR>");
						sb.append("<TR><TD align=center colspan=2 class=cell><BR>");
						sb.append("<button style='width:120px' class=button accesskey='S' onclick='location=\""+getPath("/SecureProfile.do")+"\"'><U>S</U>ecure Profile</button>&nbsp;&nbsp;&nbsp;&nbsp;");
						sb.append("<button style='width:120px' class=button accesskey='V' onclick='location=\""+getPath("/Pages/Preview.jsp")+"\"'><U>V</U>iew Profile</button>&nbsp;&nbsp;&nbsp;&nbsp;");
						sb.append("<button style='width:120px' class=button accesskey='U' onclick='location=\""+getPath("/Pages/UpdateProfile.jsp")+"\"'><U>U</U>pate Profile</button>&nbsp;&nbsp;&nbsp;&nbsp;");
						sb.append("<button style='width:120px' class=button accesskey='D' onclick='location=\""+getPath("/Pages/ConfirmDelete.jsp")+"\"'><U>D</U>elete Profile</button><BR><BR></TD></TR></FORM></TABLE>");
						}
					out.println(sb.toString());
				}

			public void autoDate(String formname,String year,String month,String day) throws Exception {
				out.println("<SELECT name='"+year+"' class=ctrl style='width:55px'><option value='' selected>Year</option></select>&nbsp;&nbsp;");
				out.println("<SELECT name='"+month+"' class=ctrl style='width:40px'><option value='' selected>Month</option></select>&nbsp;&nbsp;");
				out.println("<SELECT name='"+day+"' class=ctrl style='width:40px'><option value='' selected>Day</option></select>&nbsp;&nbsp;");
				out.println("<SCRIPT>\ntry{\nvar d1 = new dateObj(document."+formname+"."+day+", document."+formname+"."+month+", document."+formname+"."+year+");\ninitDates(1900, 2002, 1981, 4, 26, d1);}catch(error) { alert(error.description);}\n</SCRIPT>");
			}

			public void getSearchBox() throws Exception{
				out.println("<TR><TD colspan=2><TABLE cellspacing=0 cellpadding=0 width=600 align=center><form action='"+getPath("/Search.do")+"' method=post><TR><TD align=center style='color:gray;font:bold 11px tahoma'>"+nbsp);
				out.println("<font color=#779034>Matrimony Profile Id"+nbsp+":"+nbsp+"</font><input name='profileid' class=input>"+nbsp);
				out.println("<BUTTON TYPE=SUBMIT accesskey='P' class=ctrl><u>P</u>robe</BUTTON>"+nbsp+nbsp+"<a href='"+getPath("/Pages/Search.jsp")+"'>Advanced Search</a></TD></TR></FORM></TABLE></TD></TR>");
				out.println("<TR><TD><img width=180 height=180 src='"+getPath("/Images/couple.jpg")+"'></TD>");
				out.println("<TD><fieldset><legend>Search</legend>");
				out.println("<table width=400 align=center cellspacing=2 cellpadding=3>");
				out.println("<form method=post action='"+getPath("/Pages/OptionSearch.jsp")+"' onsubmit='return formValidate(this)'>");
				out.println("<TR><TD align=right  class=cell>Quest For:<TD><select class=ctrl style='width:120px' name='lookingfor'><option value='female'>Bride</option><option value='male'>Bridegroom</option></select></TD>");
				out.println("<Td rowspan=6><img src='"+getPath("/Images/horoscope.gif")+"' border=0 alt=\"Find Horoscope\" width=120><BR><BR><button type=submit class=button accesskey='P'><u>P</u>robe</button></tr>");
				out.println("<TR><TD align=right class=cell>Religion:</td><TD>");
				buildMenu(religions,"religion",120);
				out.println("</TD></TR><TR><TD align=right  class=cell>Age:</td><TD>");
				buildMenu(ages,"from",55);
				out.println("");buildMenu(ages,"to",55);
				out.println("</TD></TR><TR><TD align=right class=cell>Caste:</td><td>");
				buildMenu(castes,"caste",120);
				out.println("</TD></tr>");
				out.println("<TR><TD align=right class=cell nowrap>Martial Status:</td><TD>");
				buildMenu(marstatus,"status",120);
				out.println("</TD></TR><TR><TD align=right  class=cell>Display Results:</TD><TD class=cell><input type=checkbox checked>With Photo</td>");
				out.println("</TD></TR></form></table></fieldset></td></tr></table>");
			}
			
			public void getLoginPanel() throws Exception {
				String login = "<TABLE WIDTH=780 align=center cellspacing=0 cellpadding=2 border=0 bgcolor=#ebeadb>";
				login += "<form action='"+getPath("/Signin.do")+"' method=post>";
				login += "<TR><TD style='color:gray;font:bold 11px tahoma'>"+nbsp+"Profile <U>I</U>d"+nbsp+":"+nbsp+"<Input accesskey='I' class=ctrl name='profileid'>"+nbsp;
				login += "Pass<u>w</u>ord"+nbsp+":"+nbsp+"<input accesskey='W' name='password' class=ctrl type=password>"+nbsp;
				login += "<BUTTON TYPE=SUBMIT accesskey='S' class=ctrl><u>S</u>ign In</BUTTON>"+nbsp+nbsp;
				login += nbsp+"<a class=bar href='"+getPath("/Pages/ForgotPassword.jsp")+"'>Forgot Password ?</a>" +nbsp+"|"+nbsp;
				login += "<a class=bar href='"+getPath("/Pages/Register.jsp")+"'>Register New User !</a>" +nbsp+"|"+nbsp;
				login += "<a class=bar href='"+getPath("/Pages/Search.jsp")+"'>Search</a>" +nbsp+"|"+nbsp;
				login += "<a class=bar accesskey='H' href='"+getPath("/Pages/index.jsp")+"'><u>H</u>ome</a>" +nbsp;
				login += "</TD></TR></form></TABLE>";
				out.println(login);
			}

			public void getLinksPanel() throws Exception {
				String gender=session.getAttribute("Gender").toString();//.toLowerCase();
				System.out.println("Gender :"+gender);
				String name=(gender.equals("male")?"Mr. ":"Miss. ")+session.getAttribute("Name").toString();
				String link = "<TABLE WIDTH=780 align=center cellspacing=0 cellpadding=3 border=0 bgcolor=#ebeadb>";
				link += "<form action='"+getPath("/Search.do")+"' method=post><TR><TD align=center style='color:gray;font:bold 11px tahoma'>"+nbsp;
				link += "<font color=maroon>Welcome <B><I>"+name+"</B></I></font>"+nbsp+nbsp;;
				link += "<font color=black>Search Profile Id"+nbsp+":"+nbsp+"</font><input name='profileid' class=ctrl>"+nbsp;
				link += "<BUTTON TYPE=SUBMIT accesskey='Q' class=ctrl><u>Q</u>uest</BUTTON>"+nbsp+nbsp;
				link += nbsp+"<a accesskey='H' class=bar href='"+getPath("/Pages/index.jsp")+"'><U>H</U>ome</a>" +nbsp+"|"+nbsp;
				link += "<a class=bar href='"+getPath("/Pages/Register.jsp")+"'>About Us</a>" +nbsp+"|"+nbsp;
				link += "<a class=bar href='"+getPath("/Pages/Register.jsp")+"'>Contact</a>" +nbsp+"|"+nbsp;
				link += "<a class=bar href='"+getPath("/Pages/Search.jsp")+"'>Search</a>" +nbsp+"|"+nbsp;
				link += "<a class=bar href='"+getPath("/Pages/Signout.jsp")+"'>Sign Out</a>" +nbsp+nbsp;
				link += "</TD></TR></FORM></TABLE>";
				out.println(link);
			}

			public void getMenuList() throws Exception {
					String leftpanel=new String("");
					leftpanel += "<TABLE WIDTH=170 align=LEFT cellspacing=0 cellpadding=0 border=0 bgcolor=#ebeadb>";
					leftpanel += "<TR><TD class=head>Search Profiles</TD></TR>";
					leftpanel += "<TR><TD class=tree><UL><li><a href='"+getPath("/Pages/ProfileIdBasisSearch.jsp")+"' class=tree count='0'>Profile Id</a></li>";
					leftpanel += "<li><a href='"+getPath("/Pages/Search.jsp")+"' class=tree count='1'>Filtered Search</a></li>";
					leftpanel += "<TR><TD class=head>Managing Profiles</TD></TR>";
					leftpanel += "<TR><TD class=tree><UL><li><a href='"+getPath("/Pages/PhotoUpload.jsp")+"' class=tree  count='2'>Add My Profile</a></li>";
					leftpanel +="<li><a href='"+getPath("/Pages/Preview.jsp")+"' class=tree  count='3'>View Profile Details</a></li>";
					leftpanel +="<li><a href='"+getPath("/Pages/EditProfile.jsp")+"' class=tree  count='4'>Edit / Update Profile</a></li>";
					leftpanel +="<li><a href='"+getPath("/Pages/ConfirmDelete.jsp")+"' class=tree  count='5'>Delete My Profile</a></li>";
					leftpanel += "<li><a href='"+getPath("/SecureProfile.do")+"' class=tree  count='6'>Open-On Hold</a></li>";
					leftpanel +="<li><a href='"+getPath("/Pages/Lookingfor.jsp")+"' class=tree  count='7'>Looking For</a></li>";
					leftpanel +="<li><a href='"+getPath("/Pages/ChangePassword.jsp")+"' class=tree  count='8'>Change Password</a></li></UL></TD></TR>";
					leftpanel += "<TR><TD class=head>Message Transmission</TD></TR>";
					leftpanel += "<TR><TD class=tree><UL><li><a href='"+getPath("/Pages/ForwardMessage.jsp")+"' class=tree count='9'>Forward Message</a></li>";
					leftpanel += "<li><a href='"+getPath("/Pages/Inbox.jsp")+"' class=tree count='10'>View Inbox</a></li>";
					leftpanel += "<li><a href='"+getPath("/Pages/AddResponse.jsp")+"' class=tree count='11'>Add Response</a></li></UL></TD></TR>";
					leftpanel += "<TR><TD class=head>HoroScope</TD></TR>";
					leftpanel += "<TR><TD class=tree><UL><li><a href='"+getPath("/Pages/BestMatch.jsp")+"' class=tree count='12'>Best Match</a></li>";
					leftpanel += "<li><a href='"+getPath("/Pages/")+"' class=tree  count='13'>Basis of Job</a></li></UL></TD></TR>";
					leftpanel += "</TABLE>";
					out.println(leftpanel);
			}
			
			public void getPhotoUpload() throws Exception{
			String ua=httprequest.getHeader("User-Agent");
			String fstyle="border:1px solid gray";
			if(ua!=null && ua.length()>0) {
					if(ua.indexOf("MSIE")!=-1) out.println("<tr id=files><td class=cell align=right valign=top>Photo (s) &nbsp;&nbsp;:&nbsp;&nbsp;<TD valign=top><input class=input style='width:200px' type=\"file\" name=\"file1\"/>&nbsp;&nbsp;<a href='javascript:addOne(this)'>Add One More</a></tr>");
					else {
						out.println("<tr id=files><td class=cell align=right valign=top>Photo 1&nbsp;&nbsp;:&nbsp;&nbsp;<TD valign=top><input class=input style='width:200px' type='file' name='file1' style='"+fstyle+"'/></tr>");
						out.println("<tr id=files><td class=cell align=right valign=top>Photo 2&nbsp;&nbsp;:&nbsp;&nbsp;<TD valign=top><input class=input style='width:200px' type='file' name='file2'/></tr>");
						out.println("<tr id=files><td class=cell align=right valign=top>Photo 3&nbsp;&nbsp;:&nbsp;&nbsp;<TD valign=top><input class=input style='width:200px' type='file' name='file3'/></tr>");
					}
				}
			}

		   public void buildMenu(String arr[],String fname) throws Exception{
			   String append=new String("");
			   String width="70px";
			   String classname="select";
			   append+="<select name='"+fname+"' style='width:"+width+"px' class='"+classname+"'>\n\n";
			   append+="<option selected value='' style='text-transform:capitalize'>--"+fname+"--</option>\n\n";
				   if(arr!=null && arr.length>2) {
					  for(int it=0;it<arr.length;it++)
						   append+="<option value='"+arr[it]+"'>"+arr[it]+"</option>\n\n";
						   append+="</select>&nbsp;";
						   out.println(append);
				   } else if(arr!=null && arr.length==2){
					   int start=Integer.parseInt(arr[0]);
					   int end=Integer.parseInt(arr[0]);
						for(int it=start;it<end;it++)
						   append+="<option value='"+it+"'>"+it+"</option>\n\n";
 						   append+="</select>&nbsp;";
						   out.println(append);
			   	     }
		   }

		   public void buildMenu(String arr[],String fname,int fwidth) throws Exception{
		   String append=new String("");
		   String classname="select";
		   append+="<select name='"+fname+"' style='width:"+fwidth+"px' class='"+classname+"'>\n\n";
		   append+="<option selected value='' style='text-transform:capitalize'>--"+fname+"--</option>\n\n";
		   if(arr!=null && arr.length>2) {
				  for(int it=0;it<arr.length;it++)
					   append+="<option value='"+arr[it]+"'>"+arr[it]+"</option>\n\n";
					   append+="</select>&nbsp;";
					   out.println(append);
		   } else if(arr!=null && arr.length==2){
			   int start=Integer.parseInt(arr[0]);
			   int end=Integer.parseInt(arr[1]);
	 	       for(int it=start;it<end;it++)
					   append+="<option value='"+it+"'>"+it+"</option>\n\n";
 					   append+="</select>&nbsp;";
					   out.println(append);
			   }
		   }

		   public void buildMenu(String arr[],String fname,int width,String fclassname) throws Exception{
  		   String append=new String("");
		   append+="<select name='"+fname+"' style='width:"+width+"px' class='"+fclassname+"'>\n\n";
		   append+="<option selected value='' style='text-transform:capitalize'>--"+fname+"--</option>\n\n";
		   if(arr!=null && arr.length>2) {
				  for(int it=0;it<arr.length;it++)
					   append+="<option value='"+arr[it]+"'>"+arr[it]+"</option>\n\n";
					   append+="</select>&nbsp;";
					   out.println(append);
		   } else if(arr!=null && arr.length==2){
			   int start=Integer.parseInt(arr[0]);
			   int end=Integer.parseInt(arr[1]);
	 				for(int it=start;it<end;it++)
					   append+="<option value='"+it+"'>"+it+"</option>\n\n";
 					   append+="</select>&nbsp;";
					   out.println(append);
		   }
	   }

	   public void setFooter() throws Exception {
			String foot=new String("");
			String hscope=new String("");
			hscope += "<table width=600 cellspacing=0 cellpadding=0 border=0 align=center>";
			hscope += "<TR><TD class=cell><u>Personalize Reports</u><BR><BR>";
			hscope += "<a href='javascript:void(0)'>Horoscope Match</a><BR>";
			hscope += "<a href='javascript:void(0)'>Basic Horoscope</a><BR>";
			hscope += "<a href='javascript:void(0)'>Detailed Horoscope Match</a><BR>";
			hscope += "</TD><TD class=cell><u>Add Your Horoscope</u><BR><BR>";
			hscope += "<a href='javascript:void(0)'>Quick Response</a><BR>";
			hscope += "<a href='javascript:void(0)'>Match Profile</a><BR>";
			hscope += "<a href='javascript:void(0)'>Upgrade It</a><BR></TD>";
			hscope += "<TD class=cell><u>Wedding Halls</u><BR><BR>";
			hscope += "<a href='javascript:void(0)'>Area Wise</a><BR>";
			hscope += "<a href='javascript:void(0)'>Demand Wise</a><BR>";
			hscope += "<a href='javascript:void(0)'>Date Wise</a><BR>";
			hscope += "</TD><TD class=cell><u>Horoscope Game</u><BR><BR>";
			hscope += "<a href='javascript:void(0)'>Quick Response</a><BR>";
			hscope += "<a href='javascript:void(0)'>Match Profile</a><BR>";
			hscope += "<a href='javascript:void(0)'>Upgrade It</a><BR>";
			hscope += "</TD><TD><u>Horoscope Game</u><BR><BR>";
			hscope += "<a href='javascript:void(0)'>Quick Response</a><BR>";
			hscope += "<a href='javascript:void(0)'>Match Profile</a><BR>";
			hscope += "<a href='javascript:void(0)'>Upgrade It</a><BR>";
			hscope += "</TD></table></TD></TR></TABLE></TD></TR></TABLE><BR><BR>";
			foot += "<TABLE WIDTH=780 align=center cellspacing=0 cellpadding=0 border=0><TR><TD align=center>";
			foot += "<A HREF='javascript:void(0)'>About Us</a>"+nbsp+"|"+nbsp;	
			foot += "<A HREF='javascript:void(0)'>Contact Us</a>"+nbsp+"|"+nbsp;	
			foot += "<A HREF='javascript:void(0)'>Faqs</a>"+nbsp+"|"+nbsp;	
			foot += "<A HREF='javascript:void(0)'>Customer Support</a>"+nbsp+"|"+nbsp;	
			foot += "<A HREF='javascript:void(0)'>Site Map</a>"+nbsp+"|"+nbsp;	
			foot += "<A HREF='javascript:void(0)'>Terms and Conditions</a>"+nbsp+"|"+nbsp;	
			foot += "<A HREF='javascript:void(0)'>Media</a>"+nbsp+"|"+nbsp;	
			foot += "<A HREF='javascript:void(0)'>Payment</a>";
			foot += "</TD></TR></TABLE>";
			foot += "<P align=\"center\"><font color=\"gray\"><B>Best Viewed in 800x600. Most compatible with IE 5.0 and Netscape 7.0 and above.</font></B>";		     
			foot += "</p></BODY>";
			out.println(hscope+foot);
	   }
	}
%>
<% 
	Template t=new Template(pageContext);
	Database db=Database.newInstance(request,response);
	t.loadJavaScript();
	if(session.getAttribute("Client")==null) t.getLoginPanel();
	else t.getLinksPanel();
%></HEAD>
<div id=box></div>
<table align=center cellspacing=0 cellpadding=0 width=780>
	<TR>
		<TD valign=top valign=top>
			<%t.getMenuList();%>
		</TD>
		<TD valign=top>