<%@ page import="matrimony.database.Database"%>
<%@ page import="java.sql.*"%>
<%if(session.getAttribute("Client")==null) {
	request.setAttribute("Exception","Invalid Session. You aren't Logged On");
	pageContext.forward("index.jsp");
}
%>
<title>Process File Upload</title>
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
	String client=session.getAttribute("Client")!=null?session.getAttribute("Client").toString():"none";
	if(!db.loadImage(client)) out.println("<CENTER><H4>Sorry! Your Profile is Not Added</h4></CENTER><BR><BR>");
%>
	<BR>
	<center>
		<button class=button onclick='parent.location="PhotoUpload.jsp"'
			accesskey='U'>
			<u>U</U>pload Photo
		</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
	</center>
	<BR>