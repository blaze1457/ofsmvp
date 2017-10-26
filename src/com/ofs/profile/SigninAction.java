package com.ofs.profile;
import java.util.Vector;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import matrimony.database.Database;
public class SigninAction  extends Action {
	private Database db=null;
	private String AGE;
	private String HEIGHT;
	private String table;
	private String condition;
	private HttpSession session;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
			SigninForm sf=(SigninForm) form;
			session=request.getSession(true);
			db=Database.newInstance(request,response);
			table="Matrimony_Customer_Info";
			condition="Profile_Id='"+sf.getProfileid()+"' or Email_Id='"+sf.getProfileid()+"' and Password='"+sf.getPassword()+"'";
			//db.getValues(table,new String[] {"Name"},condition)[0].toString();
			Vector obj=db.getValues(table,new String[] {"Profile_Id","Name","Gender","Email_Id"},condition);
			if(db.checkRecord(table,condition))  {
				session.setAttribute("Client", obj.elementAt(0).toString());
				session.setAttribute("Name", obj.elementAt(1).toString());
				session.setAttribute("Gender", obj.elementAt(2).toString());
				session.setAttribute("Email", obj.elementAt(3).toString());
				return mapping.findForward("success");
			}
			else {
				request.setAttribute("Exception","Invalid Profile-Id and Password");
				return mapping.findForward("exception");
			}
      }

}
