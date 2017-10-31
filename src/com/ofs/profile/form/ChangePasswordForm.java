package com.ofs.profile.form;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import javax.servlet.http.*;
public class ChangePasswordForm extends ActionForm {

	public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
    oldpassword = null;        
    newpassword = null;
    }

	private ActionErrors errors = null;

	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request) {
			   errors = new ActionErrors();
			   if ((oldpassword == null) || (oldpassword.length() ==0)) errors.add("oldpassword", new ActionError("matrimony.changepassword.oldpassword"));
   			   if ((newpassword == null) || (newpassword.length() ==0)) errors.add("newpassword", new ActionError("matrimony.changepassword.newpassword"));
   			   if ((confirmpassword == null) || (confirmpassword.length() ==0)) errors.add("confirmpassword", new ActionError("matrimony.changepassword.confirmpassword"));
			   if ((!confirmpassword.equals(newpassword))) errors.add("confirmpassword",new ActionError("matrimony.changepassword.passwordnotmatch","Confirm Password Not Matched"));
			   return errors;
	}

	private String oldpassword;

	public void setOldpassword(String oldpassword) {  
		this.oldpassword=oldpassword;
	}
	
	public String getOldpassword() {
		return oldpassword;
	}
	
	private String newpassword;

	public void setNewpassword(String newpassword) {
		this.newpassword=newpassword;
	}

	public String getNewpassword(){ 
		return  newpassword;
	}

	private String confirmpassword;

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword=confirmpassword;
	}

	public String getConfirmpassword(){ 
		return  confirmpassword;
	}

}
