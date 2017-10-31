package com.ofs.horscope.action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;

import com.ofs.horscope.form.HoroscopeForm;

import javax.servlet.http.*;
import matrimony.database.Database;
public class  Horoscope extends Action {
	private Database db=null;
	private boolean exec;
	private Object client;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
		try{
				HoroscopeForm hf=(HoroscopeForm) form;
				db=Database.newInstance(request,response);
				HttpSession session=request.getSession(true);
				client=session.getAttribute("Client");
				if(client==null) {
									request.setAttribute("Exception","Invalid Session. You aren't Loggged on");
									return mapping.findForward("home");
				}
				Object[] value={
								client.toString(),								
								hf.getGroomname(),
								hf.getGroomyear()+"-"+hf.getGroommonth()+"-"+hf.getGroomday(),
								hf.getGroomhours()+"-"+hf.getGroomminutes(),
								hf.getGroompob(),
								hf.getBridename(),
								hf.getBrideyear()+"-"+hf.getBridemonth()+"-"+hf.getBrideday(),
								hf.getBridehours()+"-"+hf.getBrideminutes(),
								hf.getBridepob(),
								hf.getEmailid(),
								hf.getMatch(),
								};
				exec=db.insertRecord("matrimony.Matrimony_Horoscope",value);
				if(exec) {
					request.setAttribute("Information","<BR><center><h4>Your Details has been Received. <BR>We Will send the result with in 3 or 4 working days to Your E-mail.</h4></center><BR>");
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