<%@ include file="Template.jsp"%>
<%t.checkSession();%>
<html>
<HEAD>
<fieldset>
	<legend>Delete Profile</legend>
	<center>
		<span style='font: bold 12px tahoma; color: maroon'>Profile
			Id&nbsp;&nbsp;:&nbsp;&nbsp;<%=session.getAttribute("Client")%>
	</center>
	</span><BR>
	<form action='<%=t.getPath("/Pages/DeleteProfile.jsp")%>' method=post>
		<Center>
			<h4>Are You Sure To Delete Your Profile Permanently ?</h4>
		</center>
		<%
	t.getError();
	out.println("<BR><center><button style='width:100px' class=button type=submit accesskey='Y'><U>Y</u></U>es</button>&nbsp;&nbsp;&nbsp;&nbsp;");
	out.println("<button style='width:100px' class=button type=reset accesskey='N' onclick='location=\"PhotoUpload.jsp\"'><U>N</U>o</button></FORM></center><Br><BR><BR><BR>");
%></BODY>
</html>

