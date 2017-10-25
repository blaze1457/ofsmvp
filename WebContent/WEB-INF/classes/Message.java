package matrimony.com;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.*;
import matrimony.database.Database;
public class  Message extends Action {
	private Database db=null;
	private boolean exec;
	private Object client;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
		try{
				MessageForm mf=(MessageForm) form;
				db=Database.newInstance(request,response);
				HttpSession session=request.getSession(true);
				client=session.getAttribute("Client");
				if(client==null) {
								request.setAttribute("Exception","Invalid Session You aren't Logged on");
								return mapping.findForward("home");
				} 
				if(!db.checkRecord("Matrimony_Profile_Management","Profile_Id='"+mf.getTargetid()+"'")) {
					request.setAttribute("Exception","Specified Customer Not found In membership Terminal. Please Check Target-Id Once");
					return mapping.getInputForward();
				}
				java.sql.ResultSet rs1=db.getResultset("SELECT MAX(msgid) from Matrimony_Messages");
				int val=0;
					if(rs1.next()){
							val=rs1.getInt(1);
							if (val>0) val+=1;
							else val=1;
				}
				Object[] value={
								new Integer(val),
								client.toString(),								
								mf.getTargetid(),
								mf.getSubject(),
								mf.getMessage(),
								"2005-08-02"
								};
				exec=db.insertRecord("Matrimony_Messages",value);
				if(exec){
					request.setAttribute("Information","<BR><center><h4>Your Message Has Been Sent To \""+mf.getTargetid().toUpperCase()+"\"&nbsp;&nbsp;<a href='./Pages/ForwardMessage.jsp' class=bar style='color:aliceblue'>Send Another Message</A></h4></center><br>");
					return mapping.findForward("success");
				} else {
					request.setAttribute("Exception","Unable To Send Information. Please Enter Proper Details");
					return mapping.getInputForward();
				}
			 }  catch(Exception error) {
									request.setAttribute("Exception",error.getMessage());
									return mapping.getInputForward();
				 } 
	   }
}