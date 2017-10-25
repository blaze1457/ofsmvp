package matrimony.com;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.*;
import java.util.Vector;
import matrimony.database.Database;
import java.sql.Connection;
public class  ChangePassword extends Action {
	private Database db=null;
	private Object client;
	private Vector vec;
	private boolean exec;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
		try{
				ChangePasswordForm cpf=(ChangePasswordForm) form;
				db=Database.newInstance(request,response);
				HttpSession session=request.getSession(true);
				client=session.getAttribute("Client");
				if(client==null) {
									request.setAttribute("Exception","Invalid Session. You aren't Loggged on");
									return mapping.findForward("home");
				}
				vec=db.getValues("Matrimony_Customer_Info",new String[] {"Password"},"profile_id='"+client.toString()+"'");
				String oldpassword=vec.elementAt(0).toString();
				if(!cpf.getOldpassword().equals(oldpassword)) {
									request.setAttribute("Exception","Please Check The Existing Password Once Again.");
									return mapping.getInputForward();
				}
				Object[][] value={
									{"Password",cpf.getConfirmpassword()}
								 };
				exec=db.updateRecord("Matrimony_Customer_Info",value,"Profile_Id='"+client.toString()+"'");
				if(exec) {
					request.setAttribute("Information","<BR><center><h4>Your Password has been Changed Successfully. Please Logout to Check It</h4></center><BR>");
					return mapping.findForward("success");
				} else {
						request.setAttribute("Exception","Unable To Update Information. Please Enter Proper Details");
						return mapping.getInputForward();
				}
			 }  catch(Exception error) {
									request.setAttribute("Exception",error.getMessage());
									return mapping.getInputForward();
				 }
	   }
}