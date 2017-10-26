<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<html:html>
<HEAD>
<%
if(session.getAttribute("Client")==null) {
	request.setAttribute("Exception","Invalid Session. You are Not Logged on");
	pageContext.forward("index.jsp");
} else if(!db.checkRecord("Matrimony_Profile_Management","Profile_id='"+session.getAttribute("Client")+"'")) {
	request.setAttribute("Exception","You aren't a Paid Customer. You have to take Membership to Communicate");
	pageContext.forward("index.jsp");
  } t.deleteMessages();	
%>
<BR>
<BR>
<%t.setFooter();%>

</body>
</html:html>
