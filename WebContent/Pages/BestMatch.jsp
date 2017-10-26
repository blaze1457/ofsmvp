<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<html:html>
<HEAD>
<Table width=610 align=left cellspacing=0 cellpadding=3
	style='border: 1px solid gray'>
	<html:form action="/BestMatch" method="post">
		<TR bgcolor=#594344>
			<Th style='color: aliceblue; font: bold 12px tahoma' colspan=2
				class=cell>Groom Details</Th>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="groomname" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><BR>Name&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><BR>
			<html:text styleClass="input" property="groomname" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="groomyear" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="groommonth" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="groomday" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell nowrap>Date of
				Births&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<TD>
				<%t.autoDate("forms[1]","groomyear","groommonth","groomday");%>
			</TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="groomhours" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="groomminutes" /></TD>
		</TR>
		<tr>
			<td align=right class=cell valign=top>Time of
				Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<td class=cell>
				<%t.buildMenu(t.hrs,"groomhours",65);%>&nbsp;&nbsp; <%t.buildMenu(t.mins,"groomminutes",75);%>
				<br>&nbsp;00 AM is Midnight, 12 PM is Noon
			</td>
		</tr>
		<TR>
			<TD align=right class=cell>Place of
				Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<TD><html:text styleClass="input" property="groompob" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="groompob" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center class=cell>Please enter city, state,
				country (This is needed to find the latitude & longitude of the
				place.)<BR>
			<BR>
			</TD>
		</TR>
		<!---------------Bride Details--------------------------------->
		<TR bgcolor=#594344>
			<Th style='color: aliceblue; font: bold 12px tahoma' colspan=2
				class=cell>Bride Details</Th>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="bridename" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><BR>Name&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><BR>
			<html:text styleClass="input" property="bridename" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="brideyear" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="bridemonth" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="brideday" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell nowrap>Date of
				Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<TD>
				<%t.autoDate("forms[1]","brideyear","bridemonth","brideday");%>
			</TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="bridehours" /></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="brideminutes" /></TD>
		</TR>
		<tr>
			<td align=right class=cell valign=top>Time of
				Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<td class=cell>
				<%t.buildMenu(t.hrs,"bridehours",65);%>&nbsp;&nbsp;<%t.buildMenu(t.mins,"brideminutes",75);%><br>&nbsp;00
				AM is Midnight, 12 PM is Noon</font>
			</td>
		</tr>
		<TR>
			<TD colspan=2><html:errors property="bridepob" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Place of
				Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<TD><html:text styleClass="input" property="bridepob" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center class=cell>Please enter city, state,
				country (This is needed to find the latitude & longitude of the
				place.)<BR>
			<BR>
			</TD>
		</TR>
		<TR bgcolor=#594344>
			<Th style='color: aliceblue; font: bold 12px tahoma' colspan=2
				class=cell>Requirements</Th>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="emailid" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><BR>E-Mail
				Id&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD><BR>
			<html:text styleClass="input" property="emailid" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Confirm E-Mail
				Id&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD><input class=input></TD>
		</TR>
		<TR>
			<TD colspan=2><html:errors property="match" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Match With&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:radio property="match" value="anotherbride">Another Bride</html:radio>&nbsp;
				<html:radio property="match" value="anothergroom">Another Groom</html:radio>&nbsp;
				<html:radio property="match" value="thisonly">This Only</html:radio>&nbsp;
			</TD>
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
</TABLE>
</TD>
</TR>
</html:form>
</TABLE>
<BR>
<BR>
<%t.setFooter();%>

</body>
</html:html>

