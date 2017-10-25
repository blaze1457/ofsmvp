package matrimony.com;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import matrimony.database.Database;
import java.util.Vector;
import java.util.Date;
public class  OpenHold extends Action {
	private Database db=null;
	private String PASSWORD;
	private String TERMS;
	private boolean exec;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception{
		try{
				OpenHoldForm ohf=(OpenHoldForm) form;
				db=Database.newInstance(request,response);
				HttpSession session=request.getSession(true);
				Object client=session.getAttribute("Client");
				if(client==null) {
								request.setAttribute("Exception","Invalid Session You aren't Logged on");
								return mapping.findForward("home");
				}
	  	    /****************************Perform Transaction*************************/
  
			Object[] value={
							ohf.getProfileid(),
							session.getAttribute("Email").toString(),
							ohf.getMstype(),
							new Integer(ohf.getDuration()),
							new Float(ohf.getAmount()),
							ohf.getCardtype(),
							ohf.getCardno(),
							new String(ohf.getStartyear()+"-"+ohf.getStartmonth()+"-"+ohf.getStartday()),
							new String(ohf.getEndyear()+"-"+ohf.getEndmonth()+"-"+ohf.getEndday())
				};
				System.out.println("Object:"+value);
				exec=db.insertRecord("Matrimony_Profile_Management",value);
				exec=db.updateRecord("Matrimony_Profiles",new Object[][] { {"secure","true"}}, "Profile_Id='"+client.toString()+"'");
				if(exec) request.setAttribute("Information","<BR><center><h4>Success ! Your Information has made Secured and <BR> Is not visible to members who haven't Membership.</h4></center><BR>");
				return mapping.findForward("success");
			 }  catch(Exception error) {
									request.setAttribute("Exception",error.getMessage());
									return mapping.findForward("creditcard");
				 } 
	   }
}

