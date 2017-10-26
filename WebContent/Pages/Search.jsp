<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<html:html>
<HEAD>
<Table width=610 align=center cellspacing=0 cellpadding=3
	style='border: 1px solid gray'>
	<form action='<%=t.getPath("/Pages/OptionSearch.jsp")%>'>
		<TR bgcolor=#594344>
			<Th style='color: aliceblue; font: bold 12px tahoma' colspan=2
				class=cell>Advanced Search</Th>
		</TR>
		<TR>
			<TD align=right class=cell><BR>Looking
				For&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><BR> <select class=select name=lookingfor><option
						value="female">Bride</option>
					<option value="male">Bride Groom</option></TD>
		</TR>
		<TR>
			<TD align=right class=cell nowrap>Martial
				Status&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<TD>
				<%t.buildMenu(t.marstatus,"status");%>
			</TD>
		</TR>
		<TR>
			<TD align=right class=cell>Age&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<TD>
				<%t.buildMenu(t.ages,"from",60);%>&nbsp;&nbsp;To&nbsp;&nbsp;<%t.buildMenu(t.ages,"to",60);%>
			</TD>
		</TR>
		<TR>
			<TD align=right class=cell>Religion&nbsp;&nbsp;:&nbsp;&nbsp;</td>
			<TD>
				<%t.buildMenu(t.religions,"religion");%>
			</TD>
		</TR>
		<TR>
			<TD class=cell align=right>Caste&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD>
				<%t.buildMenu(t.castes,"caste");%>
			</TD>
		</TR>
		<TR>
			<TD align=right class=cell>Education&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD>
				<%t.buildMenu(t.education,"education");%>
			</TD>
		</TR>
		<TR>
			<TD align=right class=cell>Citizen Ship&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><input class=input name=citizenship></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Country
				Living&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><input class=input name=citizenship></TD>
		</TR>
		<!--
<TR><TD align=right class=cell>When Posted&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
<TD class=cell><input type=radio name=all>All&nbsp;
<input type=radio name=all>Posted After&nbsp;&nbsp;<%t.autoDate("forms[1]","pyear","pmonth","pday");%></TD></TR>
<TR><TD align=right class=cell>Search By&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
<TD class=cell><input type=radio name=all>Date Updated&nbsp;
<input type=radio name=all>Date Created</TD></TR>
-->
		<TR>
			<TD align=right class=cell>Show&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><input type=checkbox name=all>Profile
				With Photos&nbsp; <input type=checkbox name=all>Photos With
				Horoscopes</TD>
		</TR>
		<TR>
			<TD align=right class=cell>Display&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><select class=select>
					<option>5 Profiles Per Page</option>
					<option>10 Profiles Per Page</option>
					<option>15 Profiles Per Page</option>
					<option>20 Profiles Per Page</option>
					<option>25 Profiles Per Page</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class=button type=submit accesskey='P'>
					<U>P</U>robe
				</button></TD>
		</TR>
	</form>
</TABLE>
</TD>
</TR>
</TABLE>
<BR>
<BR>
</BODY>
</html:html>

