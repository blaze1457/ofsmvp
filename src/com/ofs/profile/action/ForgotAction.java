package com.ofs.profile.action;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import com.ofs.profile.form.ForgotForm;

import matrimony.database.Database;
import java.sql.*;
public class ForgotAction  extends Action {
	private Database db=null;
	private Connection cn=null;
	private Statement st=null;
	private String AGE;
	private String HEIGHT;
	private HttpSession session;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
			ForgotForm ff=(ForgotForm) form;
			session=request.getSession(true);
			db=Database.newInstance(request,response);
			System.out.println("Database Instance Created");
			cn=db.getConnection();
			System.out.println("Connection Succeeded");
			Statement st=cn.createStatement();
			String cmd="select password from matrimony_customer_info where profile_id='C"+ff.getProfileid()+"' and email='"+ff.getEmailid()+"'";
			System.out.println(cmd);
			ResultSet rs=st.executeQuery(cmd);
			if(rs.next())  {
				String password=rs.getString(1);
				System.out.println("Password Before Forward is : "+password);
				request.setAttribute("Password",password);
				return mapping.findForward("password");
			}
			else {
				request.setAttribute("Exception","No Such User Found with this Profile-Id and E-Mail Id");
				return mapping.findForward("failure");
			}
      }

}
