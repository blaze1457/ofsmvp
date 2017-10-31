package com.ofs.profile.action;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import com.ofs.profile.form.RegisterForm;

import matrimony.database.Database;
import java.util.Vector;

public class  RegisterAction extends Action {
	private Database db=null;
	private String PASSWORD;
	private String TERMS;
	private boolean exec;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception{
		try{
				RegisterForm rf=(RegisterForm) form;
				db=Database.newInstance(request,response);
				HttpSession session=request.getSession(true);

			/***************************Password Checking**********************/
				
				String passwordwarn="Confirm Password Not Matched";
				if(rf.getPwd1()!=null && rf.getPwd2()!=null) {
						if(rf.getPwd1().equals(rf.getPwd2())) 
							PASSWORD=rf.getPwd2();
						else {
								request.setAttribute("Exception",passwordwarn);
								return mapping.getInputForward();
							}
				} else {
						request.setAttribute("Exception","Password and Confirm are Required");
						return mapping.getInputForward();
				}
				
			/******************************Terms and Conditions*******************/
				
				if(rf.getTermsandconditions()==null) {
						request.setAttribute("Exception","You are Not Accepted the Terms and Conditions");
						return mapping.getInputForward();
				}
			
	  	    /****************************Perform Transaction*************************/
		  
				Object[] value={
								"C"+rf.getProfileid(),rf.getUsername(),rf.getAge(),rf.getyear()+"-"+rf.getmonth()+"-"+rf.getDay(),rf.getPob(),rf.getGender(),
 								 rf.getMothertongue(),rf.getCaste(),rf.getEducation(),rf.getOccupation(),rf.getAnnualincome(),rf.getCity(),rf.getState(),rf.getPhoneno(),
								 rf.getStatus(),rf.getReligion(),rf.getCountry(),rf.getCitizenship(),rf.getResident(),rf.getEmployment(),
								 rf.getEmail(),PASSWORD
								};
				exec=db.insertRecord("matrimony.Matrimony_Customer_Info",value);
				if(exec) {
					session.setAttribute("Client",value[0]);
					session.setAttribute("Name",rf.getUsername());
					session.setAttribute("Email",rf.getEmail());
					session.setAttribute("Gender",rf.getGender());
					request.setAttribute("Information","<BR><center><h4>Registration Completed ! Welcome <B><I>"+rf.getUsername()+"</b></i><BR><BR>Your Matrimony Profile Id is : \"&nbsp;"+value[0]+"&nbsp;\"</h4></center><BR>");
				} return mapping.findForward("success");
			}  catch(Exception error) {
									request.setAttribute("Exception",error.getMessage());
									return mapping.getInputForward();
				 } 
	   }
}

