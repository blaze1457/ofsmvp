<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<%@	page import="matrimony.database.Database"%>
<%t.checkSession();%>
<html:html>
<HEAD>
<fieldset>
	<legend>Message From Matrimony.com</legend>
	<br>
	<%t.getInformation();%>
	<BR>
	<center>
		<button class=button onclick='parent.location="index.jsp"'
			accesskey='N' style='width: 120px'>
			<u>N</U>avigate Home
		</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick='location="javascript:window.print()"' accesskey='P'
			class=button style='width: 120px'>
			<u>P</u>rint Details
		</button>
	</center>
	<BR> <BR>
</fieldset>

<BR>
<BR>
</body>
</html:html>
