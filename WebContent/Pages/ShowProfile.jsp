<%@ page import="matrimony.database.Database"%>
<%@ page import="java.sql.*"%>
<title>Telugu Matrimony.com</title>
</head>
<STYLE>
H4 {
	background: #424334;
	color: aliceblue;
	border: 1px solid aliceblue;
	font: bold 12px tahoma;
	width: 300px;
	padding: 10px;
	-moz-border-radius: 20px;
}

BUTTON {
	border: 1px solid gray;
	background: teal;
	font: bold 11px tahoma;
	height: 18px;
	width: 120px;
	color: aliceblue;
	-moz-border-radius-bottomleft: 0px;
	-moz-border-radius-bottomright: 0px;
	-moz-border-radius-topleft: 20px;
	-moz-border-radius-topright: 20px;
	cursor: hand;
}
</STYLE>
<BODY bgcolor=ivory oncontextmenu="return false">
	<%
	Database db=Database.newInstance(request,response);
	String id=request.getQueryString();
	if(id!=null && id.length()>0) {
		if(!db.checkRecord("Matrimony_Profile_Management","Profile_Id='"+id+"' or email_id='"+id+"'")) {
			if(!db.loadImage(id)) out.println("<SCRIPT>alert('Sorry! \""+id+"\" Profile is Not Added');self.close();</SCRIPT>");
		} else out.println("<SCRIPT>alert('Sorry! \""+id+"\" Profile is Under Secure Mode.\\n\\nPlease Login and Communicate if You are a having a paid membership');self.close();</SCRIPT>");
		return;
	}
%>