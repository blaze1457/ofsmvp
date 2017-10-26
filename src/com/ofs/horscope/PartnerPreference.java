package com.ofs.horscope;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.*;
import matrimony.database.Database;
import java.sql.Connection;
public class  PartnerPreference extends Action {
	private Database db=null;
	private String PASSWORD;
	private String TERMS;
	private boolean exec;
	private Connection cn;
	private Object client;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
		try{
				PartnerPreferenceForm ppf=(PartnerPreferenceForm) form;
				db=Database.newInstance(request,response);
				cn=db.getConnection();
				cn.setAutoCommit(false);
				HttpSession session=request.getSession(true);
				client=session.getAttribute("Client");
				if(client==null) {
									request.setAttribute("Exception","Invalid Session. You aren't Loggged on");
									return mapping.findForward("home");
				}
				Object[] value={
								client.toString(),
								session.getAttribute("Email").toString(),	
								ppf.getDetails(),
								ppf.getAge(),
								ppf.getMartialstatus(),
								ppf.getHavechildren(),
								ppf.getHeight(),
								ppf.getMothertongue(),
								ppf.getPhysicalstatus(),
								ppf.getCaste(),
								ppf.getReligion(),
								ppf.getEatinghabits(),
								ppf.getEducation(),
								ppf.getCitizenship(),
								ppf.getOccupation(),
								ppf.getCountry(),
								ppf.getState(),
								ppf.getResidentstatus(),
								ppf.getConclusion()
								};
				exec=db.insertRecord("Matrimony_Partner_Specification",value);
				cn.commit();
				if(exec) {
					request.setAttribute("Information","<BR><center><h4>Your Partner Specification has been Saved <BR> Your information will be added to Profiles Search.</h4></center><BR>");
					return mapping.findForward("success");
				} else {
						request.setAttribute("Exception","Inable To Update Information. Please Enter Proper Details");
						return mapping.getInputForward();
				}
			 }  catch(Exception error) {
									cn.rollback();
									request.setAttribute("Exception",error.getMessage());
									return mapping.getInputForward();
				 } finally { if(cn!=null) cn.close(); }
	   }
}