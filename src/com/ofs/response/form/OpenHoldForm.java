package com.ofs.response.form;
import org.apache.struts.validator.ValidatorForm;
public class OpenHoldForm extends ValidatorForm implements java.io.Serializable {
	String profileid,mstype,cardtype,cardno;
	int duration;
	float amount;
	String startyear,startmonth,startday,endyear,endmonth,endday;
	public void setProfileid(String profileid) {  
		this.profileid=profileid;
	}

	public void setMstype(String mstype) {
		this.mstype=mstype;
	}

	public void setCardtype(String cardtype) {
		this.cardtype=cardtype;
	}

	public void setcardno(String cardno) {
		this.cardno=cardno;
	}

	public void setStartyear(String startyear) {
		this.startyear=startyear;
	}

	public void setStartmonth(String startmonth) {
		this.startmonth=startmonth;
	}

	public void setStartday(String startday) {
		this.startday=startday;
	}

	public void setEndyear(String endyear) {
		this.endyear=endyear;
	}

	public void setEndmonth(String endmonth) {
		this.endmonth=endmonth;
	}

	public void setEndday(String endday) {
		this.endday=endday;
	}

	public void setDuration(int duration) {
		this.duration=duration;
	}

	public void setAmount(float amount) {
		this.amount=amount;
	}

	public String getProfileid() {
		return profileid;
	}

	public String getMstype(){ 
		return  mstype;
	}

	public String getCardtype() {
		return cardtype;
	}

	public String getCardno() {
		return cardno;
	}

	public String getStartyear() {
		return startyear;
	}

	public String getStartmonth() {
		return startmonth;
	}

	public String getStartday() {
		return startday;
	}

	public String getEndyear() {
		return endyear;
	}

	public String getEndmonth() {
		return endmonth;
	}

	public String getEndday() {
		return endday;
	}
	
	public int getDuration() {
		return duration;
	}

	public float getAmount() {
		return amount;
	}
}
