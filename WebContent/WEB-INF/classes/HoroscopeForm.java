package matrimony.com;
import org.apache.struts.action.*;
import javax.servlet.http.*;
public class HoroscopeForm extends ActionForm {

	public void reset(ActionMapping mapping, HttpServletRequest request) {
	    super.reset(mapping, request);
    }

	private ActionErrors errors = null;

	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request) {
			   errors = new ActionErrors();
			   if ((groomname == null) || (groomname.length() ==0)) errors.add("groomname", new ActionError("matrimony.horoscope.groomname"));
			   if ((groomyear == null) || (groomyear.length() ==0)) errors.add("groomyear", new ActionError("matrimony.horoscope.groomyear"));
			   if ((groommonth==null) || (groommonth.length() ==0)) errors.add("groommonth", new ActionError("matrimony.horoscope.groommonth"));
			   if ((groomday==null) || (groomday.length() ==0)) errors.add("groomday", new ActionError("matrimony.horoscope.groomday"));
   			   if ((groomhours==null) || (groomhours.length() ==0)) errors.add("groomhours", new ActionError("matrimony.horoscope.groomhours"));
   			   if ((groomminutes==null) || (groomminutes.length() ==0)) errors.add("groomminutes", new ActionError("matrimony.horoscope.groomminutes"));
			   if ((groompob==null) || (groompob.length() ==0)) errors.add("groompob", new ActionError("matrimony.horoscope.groompob"));
			   if ((bridename == null) || (bridename.length() ==0)) errors.add("bridename", new ActionError("matrimony.horoscope.bridename"));
			   if ((brideyear == null) || (brideyear.length() ==0)) errors.add("brideyear", new ActionError("matrimony.horoscope.brideyear"));
			   if ((bridemonth==null) || (bridemonth.length() ==0)) errors.add("bridemonth", new ActionError("matrimony.horoscope.bridemonth"));
			   if ((brideday==null) || (brideday.length() ==0)) errors.add("brideday", new ActionError("matrimony.horoscope.brideday"));
   			   if ((bridehours==null) || (bridehours.length() ==0)) errors.add("bridehours", new ActionError("matrimony.horoscope.bridehours"));
   			   if ((brideminutes==null) || (brideminutes.length() ==0)) errors.add("brideminutes", new ActionError("matrimony.horoscope.brideminutes"));
   			   if ((bridepob==null) || (bridepob.length() ==0)) errors.add("bridepob", new ActionError("matrimony.horoscope.bridepob"));
   			   if ((emailid==null) || (emailid.length() ==0)) errors.add("emailid", new ActionError("matrimony.horoscope.emailid"));
   			   if ((match==null) || (match.length() ==0)) errors.add("match", new ActionError("matrimony.horoscope.match"));
		       return (errors);
    }

	private String profileid=null;
	public void setProfileid(String profileid) {  
		this.profileid=profileid;
	}

	public String getProfileid() {
		return profileid;
	}

	private String groomname=null;
	public void setGroomname(String groomname) {  
		this.groomname=groomname;
	}

	public String getGroomname() {
		return groomname;
	}

	private String groomyear=null;
	public void setGroomyear(String groomyear) {  
		this.groomyear=groomyear;
	}

	public String getGroomyear() {
		return groomyear;
	}


	private String groommonth=null;
	public void setGroommonth(String groommonth) {  
		this.groommonth=groommonth;
	}

	public String getGroommonth() {
		return groommonth;
	}


	private String groomday=null;
	public void setGroomday(String groomday) {  
		this.groomday=groomday;
	}

	public String getGroomday() {
		return groomday;
	}

	private String groomhours=null;
	public void setGroomhours(String groomhours) {  
		this.groomhours=groomhours;
	}

	public String getGroomhours() {
		return groomhours;
	}

	private String groomminutes=null;
	public void setGroomminutes(String groomminutes) {  
		this.groomminutes=groomminutes;
	}

	public String getGroomminutes() {
		return groomminutes;
	}

	private String groompob=null;
	public void setGroompob(String groompob) {  
		this.groompob=groompob;
	}

	public String getGroompob() {
		return groompob;
	}



	private String bridename=null;
	public void setBridename(String bridename) {  
		this.bridename=bridename;
	}

	public String getBridename() {
		return bridename;
	}

	private String brideyear=null;
	public void setBrideyear(String brideyear) {  
		this.brideyear=brideyear;
	}

	public String getBrideyear() {
		return brideyear;
	}


	private String bridemonth=null;
	public void setBridemonth(String bridemonth) {  
		this.bridemonth=bridemonth;
	}

	public String getBridemonth() {
		return bridemonth;
	}


	private String brideday=null;
	public void setBrideday(String brideday) {  
		this.brideday=brideday;
	}

	public String getBrideday() {
		return brideday;
	}

	private String bridehours=null;
	public void setBridehours(String bridehours) {  
		this.bridehours=bridehours;
	}

	public String getBridehours() {
		return bridehours;
	}

	private String brideminutes=null;
	public void setBrideminutes(String brideminutes) {  
		this.brideminutes=brideminutes;
	}

	public String getBrideminutes() {
		return brideminutes;
	}

	private String bridepob=null;
	public void setBridepob(String bridepob) {  
		this.bridepob=bridepob;
	}

	public String getBridepob() {
		return bridepob;
	}

	private String emailid=null;
	public void setEmailid(String emailid) {  
		this.emailid=emailid;
	}

	public String getEmailid() {
		return emailid;
	}

	private String match=null;
	public void setMatch(String match) {  
		this.match=match;
	}

	public String getMatch() {
		return match;
	}
}