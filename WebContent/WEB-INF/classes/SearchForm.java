package matrimony.com;
import org.apache.struts.action.ActionForm;
public class SearchForm extends ActionForm{
	private String profileid;
	public void setProfileid(String profileid) {  
		this.profileid=profileid;
	}
	public String getProfileid() {
		return profileid;
	}
}
