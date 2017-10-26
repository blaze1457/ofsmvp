<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<app:checkLogon />
<html:html>
<head>
<title><bean:message key="mainMenu.title" /></title>
<html:base />
</head>
<body bgcolor="white">

	<h3>
		<bean:message key="mainMenu.heading" />
		<jsp:getProperty name="user" property="username" /></h3>
	<ul>
		<li><html:link action="/editRegistration?action=Edit">
				<bean:message key="mainMenu.registration" />
			</html:link></li>
		<li><html:link forward="logoff">
				<bean:message key="mainMenu.logoff" />
			</html:link></li>
	</ul>

</body>
</html:html>
