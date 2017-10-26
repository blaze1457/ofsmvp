package com.ofs.horscope;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.*;
import matrimony.database.Database;
public class  Response extends Action {
	private Database db=null;
	private boolean exec;
	private Object client;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
		try{
				ResponseForm rf=(ResponseForm) form;
				db=Database.newInstance(request,response);
				HttpSession session=request.getSession(true);
				client=session.getAttribute("Client");
				if(client==null) {
								request.setAttribute("Exception","Invalid Session You aren't Logged on");
								return mapping.findForward("home");
				} 
				if(db.checkRecord("Matrimony_Response","Source_Id='"+session.getAttribute("Client").toString()+"'")) {
					request.setAttribute("Exception","Your Response has Already been Sent");
					return mapping.findForward("home");
				}
				if(!db.checkRecord("Matrimony_Customer_Info","Profile_Id='"+rf.getTargetid()+"'")) {
					request.setAttribute("Exception","Specified Customer Not Found. Please Check Target-Id Once");
					return mapping.getInputForward();
				}
				Object[] value={
								client.toString(),								
								rf.getTargetid(),
								rf.getStatus(),
								rf.getMgdate(),
								rf.getRemarks()
								};
				exec=db.insertRecord("Matrimony_Response",value);
				if(exec) {
					request.setAttribute("Information","<BR><center><h4>Your Response has been Sent to The Specified Customer Successfully.</h4></center><BR>");
					return mapping.findForward("success");
				} else {
						request.setAttribute("Exception","Inable To Update Information. Please Enter Proper Details");
						return mapping.getInputForward();
				}
			 }  catch(Exception error) {
									request.setAttribute("Exception",error.getMessage());
									return mapping.getInputForward();
				 } 
	   }
}