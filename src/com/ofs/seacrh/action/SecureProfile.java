package com.ofs.seacrh.action;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import org.apache.struts.util.LabelValueBean;
import matrimony.database.Database;
import java.sql.*;
public class SecureProfile  extends Action {
	private Database db=null;
	private Connection cn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private String AGE;
	private String HEIGHT;
	private String secure;
	private HttpSession session;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
			session=request.getSession(true);
			db=Database.newInstance(request,response);
			cn=db.getConnection();
			Object client=session.getAttribute("Client");
			if(client==null) {
								request.setAttribute("Exception","Invalid Session You aren't Logged on");
								return mapping.findForward("home");
			} rs=db.getResultset("SELECT secure from matrimony_profiles where profile_id='"+client.toString()+"'");
			  if(rs.next()) secure=rs.getString(1);
			  else {
					request.setAttribute("Exception","Your Profile or Photo Not Added to Secure. <a href='./Pages/PhotoUpload.jsp'>Upload Your Photo Here</a>");
					return mapping.findForward("home");
			  }
			if(secure.equals("false")) {
				request.setAttribute("creditcards",getCreditCardTypes());
				return mapping.findForward("secure");
			}else {
					request.setAttribute("Exception","Your Profile is Already in a Secure Mode");
					return mapping.findForward("home");
			}

      }
	 public java.util.List getCreditCardTypes() {
			
			java.util.List cards=new java.util.ArrayList();
			cards.add(new LabelValueBean("Visa","Visa"));
			cards.add(new LabelValueBean("Master Card","Master-Card"));
			cards.add(new LabelValueBean("American Express","American-Express"));
			cards.add(new LabelValueBean("Diners Club","Diners-Club"));
			cards.add(new LabelValueBean("Carte Blanche","Carte-Blanche"));
			cards.add(new LabelValueBean("Discover","Discover"));
			cards.add(new LabelValueBean("JCB","JCB"));
			cards.add(new LabelValueBean("Enroute","Enroute"));
			return cards;
	 }
}
