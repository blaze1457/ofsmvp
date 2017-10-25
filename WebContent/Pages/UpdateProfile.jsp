<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<%t.checkSession();%>
<%
	t.dynamicUpload(true);
%>
<html:html><HEAD>
<BR><BR><%t.setFooter();%></body></html:html>
