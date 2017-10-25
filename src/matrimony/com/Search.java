package matrimony.com;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import matrimony.database.Database;
import java.sql.*;
import java.util.Vector;
import java.util.Date;
public class  Search extends Action {
	private Database db=null;
	private boolean exec;
	private Connection cn;
	private Vector vec;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
		try{
				SearchForm sf=(SearchForm) form;
				db=Database.newInstance(request,response);
				String searchform="<BR><CENTER><Form action=\"\" method=post>Search&nbsp;&nbsp;:&nbsp;<input class=input name=profileid value='"+sf.getProfileid()+"'>&nbsp;&nbsp;<button type=submit class=button accesskey='Q'><u>Q</u>uest</button>&nbsp;&nbsp;<A href='./Pages/Search.jsp'>Advanced Search</a></center></form>";
				String[] profile={"Name","Age","Date_of_birth","Time_of_Birth","Place_of_Birth","Gender","Height","Weight"};
				String[] personal={"Mother_tongue","Physical_Status","Caste","Sub_caste","Gotram","Star","Sun_sign","Kuja_dosham","Eating_habits","Education","Occupation","Annual_Income","Marital_Status","No_of_children","Childeren_Living_Status"};
				String[] contact={"City","State","Phoneno","Regd_by","Ref_by","Religion","country","citizenship","resident_status","employed_in","email_id"};
				String[] background={"details"};
				String[] lookfor={"Age","Marital_Status","Have_Children","Height","Mother_Tongue","Physical_Status","Caste","Religion","Eating_Habits","Education","Citizenship","Occupation","country","State","Resident_Status"};
				String[] conclusion={"conclusion"};
				String condition1="profile_id='"+sf.getProfileid()+"' or email_id='"+sf.getProfileid()+"'";
				String condition2="profile_id='"+sf.getProfileid()+"'";
				StringBuffer result=new StringBuffer();
				if(!db.checkRecord("Matrimony_Customer_Info",condition1)) {
					request.setAttribute("Result",searchform+"<BR><center><H4>Sorry! the Specified Customer Not Found. Please Try again</h4></center><br>");
					return mapping.findForward("results");
				}
				result.append("<fieldset><legend>Profile</legend><center><a href='javascript:viewPhoto(\"./Pages/ShowProfile.jsp?"+sf.getProfileid()+"\")'>View Profile</a><BR><BR>");	
				result.append(db.fetchRecords("Matrimony_Customer_Info",profile,condition1,600,1,false));
				result.append("<BR></fieldset>");
				result.append("<fieldset><legend>Personal Info</legend><BR>");	
				result.append(db.fetchRecords("Matrimony_Customer_Info",personal,condition1,600,1,false));
				result.append("<BR></fieldset>");
				result.append("<fieldset><legend>Contact and Status Info</legend><BR>");	
				result.append(db.fetchRecords("Matrimony_Customer_Info",contact,condition1,600,1,false));
				result.append("<BR></fieldset>");
				result.append("<fieldset><legend>Background</legend><BR>");	
				result.append(db.fetchRecords("Matrimony_Partner_Specification",background,condition2,600,1,false));
				result.append("<BR></fieldset>");
				result.append("<fieldset><legend>Looking For</legend><BR>");	
				result.append(db.fetchRecords("Matrimony_Partner_Specification",lookfor,condition2,600,1,false));
				result.append("<BR></fieldset>");
				result.append("<fieldset><legend>Conclusion</legend><BR>");	
				result.append(db.fetchRecords("Matrimony_Partner_Specification",conclusion,condition2,600,1,false));
				result.append("<BR></fieldset>");
				request.setAttribute("Result",searchform+result.toString());
				return mapping.findForward("results");
				 }  catch(Exception error) {
								request.setAttribute("Exception",error.getMessage());
								return mapping.getInputForward();
				 } 
	   }
}

