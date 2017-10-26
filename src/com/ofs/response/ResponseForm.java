package com.ofs.response;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import javax.servlet.http.*;
public class ResponseForm extends ActionForm {
	
							/*Resolve Transaction Errors*/

	public void reset(ActionMapping mapping, HttpServletRequest request) {
	    super.reset(mapping, request);
    }

	private ActionErrors errors = null;

	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request) {
			   errors = new ActionErrors();
	           String submit = request.getParameter("submit");
			   if ((sourceid == null) || (sourceid.length() ==0)) 
				   errors.add("sourceid", new ActionError("matrimony.response.sourceid"));
   			   if ((targetid == null) || (targetid.length() ==0))
				   errors.add("targetid", new ActionError("matrimony.response.targetid"));
			   if ((status == null) || (status.length() ==0)) 
				   errors.add("status", new ActionError("matrimony.response.status"));
			   if ((mgdate == null) || (mgdate.length() ==0)) 
				   errors.add("mgdate", new ActionError("matrimony.response.mgdate"));
   			   if ((remarks == null) || (remarks.length() ==0)) 
				   errors.add("remarks", new ActionError("matrimony.response.remarks"));
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

	private String status=null;

	public void setStatus(String status) {
		this.status=status;
	}

	public String getStatus(){ 
		return status;
	}
	
	private String mgdate=null;
	
	public void setMgdate(String mgdate) {
		this.mgdate=mgdate;
	}

	public String getMgdate(){ 
		return mgdate;
	}

	private String remarks=null;
	
	public void setRemarks(String remarks) {
		 this.remarks=remarks;
	 }
	
	public String getRemarks(){ 
		return   remarks;
	}
	
}