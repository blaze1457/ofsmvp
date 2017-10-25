package matrimony.com;
import org.apache.struts.validator.ValidatorForm;
public class ForgotForm extends ValidatorForm implements java.io.Serializable {
	String profileid,emailid;
	public void setProfileid(String profileid) {  
		this.profileid=profileid;
	}
	public void setEmailid(String emailid) {
		this.emailid=emailid;
	}
	public String getProfileid() {
		return profileid;
	}
	public String getEmailid(){ 
		return  emailid;
	}
}
