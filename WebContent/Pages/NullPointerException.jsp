<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<html:html>
<HEAD>
<html:errors />
<BR>
<BR>
<center>
	<button class=button accesskey="N"
		onclick='location="<%=t.getPath("/Pages/index.jsp")%>"'
		style="width: 150px">
		<u>N</u>avigate Home
	</button>
	&nbsp;&nbsp;
	<button accesskey="C" onclick='location="javascript:history.back()"'
		class=button style="width: 150px">
		<u>C</u>ontinue Back
	</button>
</center>
<BR>
<BR>
<%t.setFooter();%>

</body>
</html:html>