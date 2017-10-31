package com.ofs.response.form;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import javax.servlet.http.*;
public class MessageForm extends ActionForm {
	
							/*Resolve Transaction Errors*/

	public void reset(ActionMapping mapping, HttpServletRequest request) {
	    super.reset(mapping, request);
    }

	private ActionErrors errors = null;

	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request) {
			   errors = new ActionErrors();
	           String submit = request.getParameter("submit");
			   if ((sourceid == null) || (sourceid.length() ==0)) 
				   errors.add("sourceid", new ActionError("matrimony.message.sourceid"));
   			   if ((targetid == null) || (targetid.length() ==0))
				   errors.add("targetid", new ActionError("matrimony.message.targetid"));
			   if ((subject == null) || (subject.length() ==0)) 
				   errors.add("subject", new ActionError("matrimony.message.subject"));
			   if ((message == null) || (message.length() ==0)) 
				   errors.add("message", new ActionError("matrimony.message.message"));
		       return (errors);
    }
 
							/*Setter and Getter Methods*/

	private String sourceid=null;

	public void  setSourceid(String sourceid) {
		this.sourceid=sourceid;
	}

	public String getSourceid() {
		return sourceid;
	}

	private String targetid=null;

	public void  setTargetid(String targetid) {
		this.targetid=targetid;
	}

	public String getTargetid() {
		return targetid;
	}

	private String subject=null;

	public void setSubject(String subject) {
		this.subject=subject;
	}

	public String getSubject(){ 
		return subject;
	}
	private String message=null;
	
	public void setMessage(String message) {
		 this.message=message;
	 }
	
	public String getMessage(){ 
		return   message;
	}
	
}