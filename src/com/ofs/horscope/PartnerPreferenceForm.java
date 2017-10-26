package com.ofs.horscope;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import javax.servlet.http.*;
public class PartnerPreferenceForm extends ActionForm {
	
							/*Resolve Transaction Errors*/

	public void reset(ActionMapping mapping, HttpServletRequest request) {
	    super.reset(mapping, request);
        details = null;        
        age = "18-60";
    }

	private ActionErrors errors = null;

	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request) {
			   errors = new ActionErrors();
	           String submit = request.getParameter("submit");
			   if ((details == null) || (details.length() ==0)) errors.add("details", new ActionError("matrimony.preference.details","Minimum 100 characters Required"));
			   if ((age == null) || (age.length() ==0)) errors.add("age", new ActionError("matrimony.preference.age","Must be between 18-60"));
			   if ((martialstatus==null) || (martialstatus.length() ==0)) errors.add("martialstatus", new ActionError("matrimony.preference.martialstatus"));
			   if ((height==null) || (height.length() ==0)) errors.add("height", new ActionError("matrimony.preference.height"));
			   if ((havechildren == null) || (havechildren.length() ==0)) errors.add("havechildren", new ActionError("matrimony.preference.havechildren"));
			   if ((mothertongue == null) || (mothertongue.length() ==0)) errors.add("mothertongue", new ActionError("matrimony.preference.mothertongue"));	
		       if ((physicalstatus == null) || (physicalstatus.length() ==0)) errors.add("physicalstatus", new ActionError("matrimony.preference.physicalstatus"));	
		       if ((caste == null) || (caste.length() ==0)) errors.add("caste", new ActionError("matrimony.preference.caste"));	
		       if ((religion == null) || (religion.length() ==0)) errors.add("religion", new ActionError("matrimony.preference.religion"));	
   		       if ((eatinghabits == null) || (eatinghabits.length() ==0)) errors.add("eatinghabits", new ActionError("matrimony.preference.eatinghabits"));	
   		       if ((caste == null) || (caste.length() ==0)) errors.add("caste", new ActionError("matrimony.preference.caste"));	
   		       if ((education == null) || (education.length() ==0)) errors.add("education", new ActionError("matrimony.preference.education"));	
			   if ((citizenship == null) || (citizenship.length() ==0)) errors.add("citizenship", new ActionError("matrimony.preference.citizenship"));	
			   if ((occupation == null) || (occupation.length() ==0)) errors.add("occupation", new ActionError("matrimony.preference.occupation"));	
			   if ((country == null) || (country.length() ==0)) errors.add("country", new ActionError("matrimony.preference.country"));	
			   if ((state == null) || (state.length() ==0)) errors.add("state", new ActionError("matrimony.preference.state"));	
			   if ((residentstatus == null) || (residentstatus.length() ==0)) errors.add("residentstatus", new ActionError("matrimony.preference.residentstatus"));	
			   if ((conclusion == null) || (conclusion.length() ==0)) errors.add("conclusion", new ActionError("matrimony.preference.conclusion"));	
		       return (errors);
    }
 
							/*Setter and Getter Methods*/

	private String details=null;

	public void  setDetails(String details) {
		this.details=details;
	}

	public String getDetails() {
		return details;
	}

	private String age=null;

	public void setAge(String age) {
		this.age=age;
	}

	public String getAge(){ 
		return age;
	}
	
	private String martialstatus=null;
	
	public void setMartialstatus(String martialstatus) {
		this.martialstatus=martialstatus;
	}

	public String getMartialstatus(){ 
		return martialstatus;
	}

	private String havechildren=null;

	public void setHavechildren(String havechildren) {
		this.havechildren=havechildren;
	}

	public String getHavechildren(){ 
		return   havechildren;
	}
	
	private String height=null;
	
	public void setHeight(String height) {
		 this.height=height;
	 }
	
	public String getHeight(){ 
		return   height;
	}
	
	private String mothertongue=null;
	
	public void setMothertongue(String mothertongue) {
		this.mothertongue=mothertongue;
	}
	
	public String getMothertongue(){ 
		return   mothertongue;
	}
	
	private String physicalstatus=null;
	
	public void setPhysicalstatus(String  physicalstatus) {
		this.physicalstatus=physicalstatus;
	}

	public String getPhysicalstatus(){ 
		return   physicalstatus;
	}
	
	private String caste=null;
	

	public void setCaste(String caste) { 
		this.caste=caste;
	}

	public String getCaste(){
		return   caste;
	}
	
	private String religion=null;

	public void setReligion(String  religion) {  
		this.religion=religion;
	}
	
	public String getReligion() {
		return religion;
	}
	
	private String eatinghabits=null;

	public void setEatinghabits(String eatinghabits) {  
		this.eatinghabits=eatinghabits;
	}

	public String getEatinghabits(){ 
		return   eatinghabits;
	}

	private String education=null;
	
	public void setEducation(String education) {    
		this.education=education;
	}
	
	public String getEducation(){ 
		return   education;
	}
	
	private String citizenship=null;
	
	public void setCitizenship(String citizenship) {
		this.citizenship=citizenship;
	}

	public String getCitizenship(){ 
		return   citizenship;
	}

	private String occupation=null;
	
	public void setOccupation(String  occupation) {  
		this.occupation=occupation;
	}

	public String getOccupation(){ 
		return   occupation;
	}
	
	private String country=null;

	public void setCountry(String country) { 
		this.country=country;
	}

	public String getCountry(){ 
		return   country;
	}

	private String state=null;
	
	public void setState(String  state) {  
		this.state=state;
	}
	
	public String getState(){ 
		return   state;
	}

	private String residentstatus=null;

	public void setResidentstatus(String  residentstatus) { 
		this.residentstatus=residentstatus;
	}

	public String getResidentstatus(){ 
		return   residentstatus;
	}

	private String conclusion=null;

	public void setConclusion(String conclusion) {
		this.conclusion=conclusion;
	}

	public String getConclusion(){ 
		return   conclusion;
	}
}