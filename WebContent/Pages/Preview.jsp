<HTML>
<%if(session.getAttribute("Client")==null) {
	request.setAttribute("Exception","Invalid Session. You aren't Logged On");
	pageContext.forward("index.jsp");
}
%>
<HEAD><TITLE>Telugu Matrimony.com</TITLE>
<frameset cols="40%,*" frameborder=0 framespacing=0>
<frame src="Photo.jsp" noresize scrolling=no>
<frame src="Profile.jsp" name=uploader scrolling=auto>
</frameset>