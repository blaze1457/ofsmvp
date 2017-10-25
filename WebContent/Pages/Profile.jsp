<%@ page import="matrimony.database.Database"%>
<BODY bgcolor=ivory style="margin:0px" style="overflow-x:hidden" oncontextmenu="return false">
<STYLE>
BUTTON {
		border:	1px solid gray;
		background:	teal;
		font:bold 11px tahoma;
		height:	18px;
		width:	120px;
		color:	aliceblue;
		-moz-border-radius-bottomleft:0px;
		-moz-border-radius-bottomright:0px;
		-moz-border-radius-topleft:20px;
		-moz-border-radius-topright:20px;
		cursor:hand;
}
</STYLE>
<BR><center><button class=button onclick='parent.location="index.jsp"' accesskey='N'><u>N</U>avigate Home</button>&nbsp;&nbsp;&nbsp;&nbsp;<button onclick='location="javascript:window.print()"' accesskey='P' class=button><u>P</u>rint Details</button></center><BR>
<%
	Database db=Database.newInstance(request,response);
	String[] fields={"Profile_Id","Name","Age","Date_of_Birth","Time_of_Birth","Place_of_Birth","Gender","Height","Weight","Mother_Tongue","Physical_Status","Caste","Sub_Caste","Gotram","Star","Sun_Sign","Kuja_Dosham","Eating_Habits","Education","Occupation","Annual_Income","City","State","Phoneno","Regd_by","Ref_by","Marital_Status","No_of_Children","Childeren_Living_Status","Religion","Country","Citizenship","Resident_Status","Employed_In","Email_Id"};
	out.println(db.fetchRecords("matrimony_customer_info",fields,"profile_id='"+session.getAttribute("Client")+"'",500,1,false));
%>