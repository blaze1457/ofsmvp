<%@ include file="Template.jsp"%>
<%t.checkSession();%>
<html>
<HEAD>
<fieldset>
	<legend>Edit Profile</legend>
	<center>
		<span style='font: bold 12px tahoma; color: maroon'>Profile
			Id&nbsp;&nbsp;:&nbsp;&nbsp;<%=session.getAttribute("Client")%>
	</center>
	</span><BR>
	<form action='<%=t.getPath("/Pages/UpdateDetails.jsp")%>' method=post>
		<%
	t.getError();
	String[] fields={"Name","Age","Date_of_Birth","Time_of_birth","Place_of_Birth","Gender","Height","Weight","Mother_Tongue","Physical_Status","Caste","Sub_Caste","Gotram","Star","Sun_Sign","Kuja_Dosham","Eating_Habits","Education","Occupation","Annual_Income","City","State","Phoneno","Regd_by","Ref_by","Marital_Status","No_of_Children","Childeren_Living_Status","Religion","Country","Citizenship","Resident_Status","Employed_In","Email_Id","Password"};
	out.println(db.fetchRecords("matrimony_customer_info",fields,"profile_id='"+session.getAttribute("Client")+"'",500,1,true));
	out.println("<BR><center><button style='width:150px' class=button type=submit accesskey='U'><U>U</U>pdate Details</button>&nbsp;&nbsp;&nbsp;&nbsp;");
	out.println("<button style='width:150px' class=button type=reset accesskey='C'><U>C</U>lear</button></FORM></center><Br>");
	t.setFooter();
%></BODY>
</html>

