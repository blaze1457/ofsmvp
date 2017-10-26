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
}else if(db.checkRecord("Matrimony_Response","Source_Id='"+session.getAttribute("Client")+"'")) {
		request.setAttribute("Exception","Your Response has already been sent");
		pageContext.forward("index.jsp");
		}
%>
<Table width=610 align=center cellspacing=0 cellpadding=3
	style='border: 1px solid teal'>
	<html:form action="/AddResponse" method="post">
		<TR bgcolor=#594344>
			<Th style='color: aliceblue; font: bold 12px tahoma' colspan=2
				class=cell>Give Response For Bride or Bridegroom</Th>
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
			<BR>Your Id&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><BR>
			<BR>
			<input class=input name="sourceid" readonly
				value="<%=session.getAttribute("Client")%>"></TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="targetid" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Destination
				ID&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="targetid" /></TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="status" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:radio property="status" value="success">&nbsp;Success</html:radio>&nbsp;&nbsp;
				<html:radio property="status" value="failure">&nbsp;Failure</html:radio>
			</TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="mgdate" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Marriage
				Date&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="mgdate" /></TD>
		</TR>
		<TR>
			<TD algin=center colspan=2><html:errors property="remarks" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Remarks&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="remarks" /></TD>
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