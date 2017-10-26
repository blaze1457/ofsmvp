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
} else if(!db.checkRecord("Matrimony_Profile_Management","Profile_id='"+session.getAttribute("Client").toString()+"'")) {
	request.setAttribute("Exception","You aren't a Paid Customer. You have to take Membership to Communicate");
	pageContext.forward("index.jsp");
}
%>
<Table width=610 align=center cellspacing=0 cellpadding=3
	style='border: 1px solid teal'>
	<html:form action="/SendMessage" method="post">
		<TR bgcolor=#594344>
			<Th style='color: aliceblue; font: bold 12px tahoma' colspan=2
				class=cell>Send Message From Here</Th>
		</TR>
		<TR>
			<TD colspan=2 align=center>
				<%t.getError();%>
			</TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="sourceid" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><BR>
			<BR>
			<u>F</U>rom&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><BR>
			<BR>
			<input class=input accesskey='F' style='width: 400px' name="sourceid"
				readonly value="<%=session.getAttribute("Client")%>"></TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="targetid" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><u>T</u>o&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text accesskey='T' styleClass="input"
					style='width:400px' property="targetid" /></TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="subject" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><u>S</U>ubject&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text accesskey='S' styleClass="input"
					style='width:400px' property="subject" /></TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="message" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell valign=top><u>M</U>essage&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:textarea accesskey='M'
					styleClass="textarea" style='width:400px' property="message" /></TD>
		</TR>
		<TR>
			<TD align=center colspan=2 class=cell><BR>
				<button class=button type=submit accesskey='P'>
					<U>P</U>roceed
				</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class=button type=reset accesskey='C'>
					<U>C</U>lear
				</button>
				<BR>
			<BR></TD>
		</TR>
	</html:form>
</TABLE>
<BR>
<BR>
<%t.setFooter();%>

</body>
</html:html>
