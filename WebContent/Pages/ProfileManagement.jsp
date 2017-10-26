<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<%t.checkSession();%>
<html:html>
<HEAD>
<Table width=610 align=center cellspacing=0 cellpadding=3
	style='border: 1px solid teal'>
	<html:form method="post" action="/OpenHold"
		onsubmit="return creditCardValidate(this)">
		<TR bgcolor=#594344>
			<Th style='color: aliceblue; font: bold 12px tahoma' colspan=2
				class=cell>Your Profile</Th>
		</TR>
		<TR>
			<TD colspan=2>
				<%t.getError();%>
			</td>
		</TR>
		<TR>
			<TD align=right class=cell><BR> <BR>Profile
				Id&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><BR> <BR> <input class="input"
				value="<%=session.getAttribute("Client").toString()%>"
				name="profileid" readonly /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Membership
				Type&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="mstype"
					onkeypress="return alphaNumeric(event,15)" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Duration&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="duration"
					onkeypress="return blockKey(event,2)" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Amount&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="amount"
					onkeypress="return blockKey(event,5)" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Card Type&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD><html:select styleClass='select' property="cardtype">
					<html:option value=''>--Card Type--</html:option>
					<html:options collection="creditcards" property="value"
						labelProperty="label" />
				</html:select>&nbsp;&nbsp;</TD>
		</tR>
		<Tr>
			<td align=right class=cell>Card Number:&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<td><html:text property="cardno" styleClass="input"
					onkeypress="return alphaNumeric(event,30)" />
		</tr>
		<TR>
			<TD align=right class=cell>Start Date&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell>
				<%t.autoDate("forms[1]","startyear","startmonth","startday");%>
			</TD>
		</TR>
		<TR>
			<TD align=right class=cell>End Date&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell>
				<%t.autoDate("forms[1]","endyear","endmonth","endday");%>
			</TD>
		</TR>
		<TR>
			<TD align=center colspan=2 class=cell><BR>
				<button class=button type=submit accesskey='P'>
					<U>P</U>roceed
				</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class=button type=reset accesskey='C'>
					<U>C</U>lear
				</button> <BR> <BR></TD>
		</TR>
	</html:form>
</TABLE>
<BR>
<BR>
</body>
</html:html>
