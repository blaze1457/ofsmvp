package matrimony.com;
import org.apache.struts.validator.ValidatorForm;
public class SigninForm extends ValidatorForm implements java.io.Serializable {
	String profileid,password;
	public void setProfileid(String profileid) {  
		this.profileid=profileid;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public String getProfileid() {
		return profileid;
	}
	public String getPassword(){ 
		return  password;
	}
}
