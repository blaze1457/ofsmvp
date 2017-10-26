<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<form action="<%=t.getPath("/Search.do")%>" name=hideform method=post
	style='display: none'>
	<input name=profileid>
</form>
<%
	String props[]={
					request.getParameter("lookingfor"),
					request.getParameter("religion"),
					request.getParameter("from"),
					request.getParameter("to"),
					request.getParameter("caste"),
					request.getParameter("status")
	};
	String columns[]={"Profile_Id","Age","Gender","Caste","State","Occupation"};
	String condition="gender='"+props[0]+"' and religion='"+props[1]+"' and caste='"+props[4]+"' and marital_status='"+props[5]+"' and age between '"+props[2]+"' and '"+props[3]+"'";
	String result=db.fetchRecords("Matrimony_customer_info",columns,condition,610,0,false);
	out.println(result);
%>
<html:html>
<HEAD>
</TR>
</TABLE>
<BR>
<BR>
<%t.setFooter();%>

</body>
</html:html>
