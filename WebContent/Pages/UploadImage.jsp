<%@ page import="matrimony.database.Database"%>
<%@ include file="Template.jsp"%>
<%@ page import="java.io.*"%>
<%t.checkSession();%><html><HEAD>
<%
	boolean upload=db.uploadImage("matrimony_profiles");
	if(upload) request.getRequestDispatcher("PhotoUpload.jsp").forward(request,response);
	else {
		request.setAttribute("Exception","Image Uploading Failed. Please Try again");
		request.getRequestDispatcher("Exception.jsp").forward(request,response);
	}
%>
