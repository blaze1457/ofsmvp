<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<%
	Object result=request.getAttribute("Result");
	if(result!=null && result.toString().length()>0) out.println(result.toString());
	else out.println("<BR><BR><Center><h4>Sorry! No Records Found To Your Search Criteria</h4></center><BR><BR>");
%>
<html:html><HEAD>
</TR></TABLE><BR><BR><%t.setFooter();%></body></html:html>
