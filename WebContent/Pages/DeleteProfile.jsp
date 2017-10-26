<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<%@	page import="matrimony.database.Database"%>
<%t.checkSession();%>
<%
	t.checkSession();
	t.getError();
	String client="profile_id='"+session.getAttribute("Client").toString()+"'";
	boolean profile=db.deleteRecord("matrimony_profiles",client);
	boolean details=db.deleteRecord("matrimony_customer_info",client);
	if(details && profile) response.sendRedirect("Signout.jsp");
	else out.println("Invalid Transaction");
%>
<html:html>
<HEAD>
<BR>
<BR>
</body>
</html:html>
