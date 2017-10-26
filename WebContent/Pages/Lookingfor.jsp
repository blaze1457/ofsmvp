<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<%@ page import="matrimony.database.Database"%>
<%
	if(session.getAttribute("Client")==null) {
	request.setAttribute("Exception","Invalid Session. You are Not Logged on");
	pageContext.forward("index.jsp");
    } else if(db.checkRecord("Matrimony_Partner_Specification","Profile_Id='"+session.getAttribute("Client")+"'")) {
		request.setAttribute("Exception","Your Specification is Already Saved");
		pageContext.forward("index.jsp");
		}
%>
<html:html>
<HEAD>
<Table width=610 align=center cellspacing=0 cellpadding=2
	style="border: 1px solid gray">
	<html:form action="/PartnerSpecification" method="post">
		<TR bgcolor=#594344>
			<Th style="color: aliceblue; font: bold 12px tahoma" colspan=2
				class=cell>Specify How Your Partner Should be</Th>
		</TR>
		<%t.getError();%>
		<TR>
			<TD colspan=2 align=center><html:errors property="details" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Details&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:textarea styleClass="textarea"
					property="details" />
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="age" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Age&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell>
				<%t.buildMenu(t.ages,"age",70);%>&nbsp;&nbsp;Years
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="martialstatus" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><BR>Marital
				Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<td class=cell><BR>
				<%t.buildMenu(t.marstatus,"martialstatus",150,"ctrl");%></td>
		</tr>
		<TR>
			<TD colspan=2 align=center><html:errors property="havechildren" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Children Living
				Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:select styleClass="ctrl"
					style="width:150px" property="havechildren">
					<html:option value="no">No</html:option>
					<html:option value="yes">Yes</html:option>
				</html:select></td>
		</tr>
		<TR>
			<TD colspan=2 align=center><html:errors property="height" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Height&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" style="width:30px"
					property="height" onkeypress="return blockKey(event,2)" />&nbsp;&nbsp;&nbsp;
			
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="mothertongue" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell><BR>Mother
				Tongue&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><BR>
				<%t.buildMenu(t.languages,"mothertongue",150);%></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors
					property="physicalstatus" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Physical
				Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input"
					property="physicalstatus"
					onkeypress="return alphaNumeric(event,20)" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="caste" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Caste&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell>
				<%t.buildMenu(t.castes,"caste",150);%>
			</TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="religion" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Religion&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell>
				<%t.buildMenu(t.religions,"religion",150,"ctrl");%>
			
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="eatinghabits" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Eating
				Habits&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input"
					property="eatinghabits" onkeypress="return alphaNumeric(event,20)" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="education" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Education&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell>
				<%t.buildMenu(t.education,"education",150);%>
			</TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="citizenship" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Citizen Ship&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input"
					property="citizenship" onkeypress="return alphaNumeric(event,20)" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="occupation" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Occupation&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input"
					property="occupation" onkeypress="return alphaNumeric(event,20)" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="country" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Country Living
				In&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="country"
					onkeypress="return alphaNumeric(event,20)" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors property="state" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>State&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:text styleClass="input" property="state"
					onkeypress="return alphaNumeric(event,20)" /></TD>
		</TR>
		<TR>
			<TD colspan=2 align=center><html:errors
					property="residentstatus" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Resident
				Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell>
				<%t.buildMenu(t.residency,"residentstatus",150,"ctrl");%>
			</td>
		</tr>
		<TR>
			<TD colspan=2 align=center><html:errors property="conclusion" /></TD>
		</TR>
		<TR>
			<TD align=right class=cell>Conclusion&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
			<TD class=cell><html:textarea styleClass="textarea"
					property="conclusion" />
		</TR>
		<TR>
			<TD align=center colspan=2 class=cell><BR>
				<button class=button type=submit accesskey="P">
					<U>P</U>roceed
				</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class=button type=reset accesskey="C">
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