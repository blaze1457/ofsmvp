<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<html:html><HEAD>
<Table width=610 align=center cellspacing=0 cellpadding=3 style="border:1px solid gray">
<html:form action="/RegisterCustomer" method="post" onsubmit="return formValidate(this)">
<TR bgcolor=#594344><Th style="color:aliceblue;font:bold 12px tahoma" colspan=2 class=cell>Profile</Th></TR>
<TR><TD colspan=2><%t.getError();%></TD></TR>
<TR>
	<TD   align=right class=cell><BR>Profile Id&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD   class=cell><BR><html:text styleClass="input" property="profileid"  onkeypress="return blockKey(event,6)"/></TD>
</TR>
<TR>
	<TD   align=right class=cell>Name&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD   class=cell><html:text styleClass="input" property="username" maxlength="50" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD   align=right class=cell>Age&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD   class=cell><%t.buildMenu(t.ages,"age",70);%>&nbsp;&nbsp;Years
</TR>
<TR><TD align=right class=cell nowrap>Date of Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td>
	<TD><%t.autoDate("forms[1]","year","month","day");%></TD>
</TR>
<TR>
	<TD   colspan=2 class=cell align=center>Date of birth will not be shown to others, its only for calculating your Age.&nbsp;&nbsp;</TD>
</TR>
	<tr>
		<td align=right class=cell valign=top>Time of Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td>
		<td class=cell><%t.getTime();%>
			<br>&nbsp;00 AM is Midnight, 12 PM is Noon</td></tr>
	<TR><TD align=right  class=cell>Place of Birth&nbsp;&nbsp;:&nbsp;&nbsp;</td><TD><input class=input name=pob></TD></TR>
	<TR><TD colspan=2 align=center class=cell>Please enter city, state, country (This is needed to find the latitude & longitude of the place.)</TD></TR>
<TR>
	<td align=right class=cell>Gender&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell>	<html:select styleClass="ctrl" style="width:70px" property="gender">
		<html:option value="male">Male</html:option>
		<html:option value="female">Female</html:option>
	</html:select>
&nbsp;&nbsp;&nbsp;Gender of the profile added</td>
</TR>
<TR>
	<TD align=right class=cell>Height&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell>
	<html:text styleClass="input" style="width:30px" property="height" onkeypress="return blockKey(event,2)"/>&nbsp;&nbsp;&nbsp;
	<html:select styleClass="ctrl" style="width:70px" property="icf">
		<html:option value="Inches">Inches</html:option>
		<html:option value="Cms">Cms</html:option>
		<html:option value="Feet">Feet</html:option>
	</html:select></TD>
</TR>
<TR>
	<TD align=right class=cell>Weight&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell>
	<html:text styleClass="input" style="width:30px" property="weight" onkeypress="return blockKey(event,2)"/>&nbsp&nbsp;&nbsp;
	<html:select styleClass="ctrl" style="width:70px" property="kp">
		<html:option value="Kilos">Kilos</html:option>
		<html:option value="Pounds">Pounds</html:option>
	</html:select>
</TD>
</TR>
<TR bgcolor=#594344>
	<Th style="color:aliceblue;font:bold 12px tahoma" colspan=2 class=cell>Personal Info</Th>
</TR>
<TR>
	<TD align=right class=cell><BR>Mother Tongue&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><BR><%t.buildMenu(t.languages,"mothertongue",150);%></TD>
</TR>
<TR>
	<TD align=right class=cell>Physical Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="physicalstatus" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Caste&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><%t.buildMenu(t.castes,"caste",150);%></TD>
</TR>
<TR>
	<TD align=right class=cell>Sub Caste&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="subcaste" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Gotram&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="gotram" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Star&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="star" onkeypress="return alphaNumeric(event,20)"/>
</TR>
<TR>
	<TD align=right class=cell>Sun Sign&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="sunsign" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Kuja Dosham&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="kujadosham" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Eating Habits&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="eatinghabits"  onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Education&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><%t.buildMenu(t.education,"education",150);%></TD>
</TR>
<TR>
	<TD align=right class=cell>Occupation&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="occupation" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Annual Income&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="annualincome" onkeypress="return blockKey(event,10)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>City&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="city" onkeypress="return alphaNumeric(event,20)"/>
<TR>
	<TD align=right class=cell>State&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="state" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Phone No&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="phoneno" onkeypress="return blockKey(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Regd By&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="regdby" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Ref By&nbsp;&nbsp;:&nbsp;&nbsp;<BR><BR></TD>
	<TD class=cell><html:text styleClass="input" property="refby" onkeypress="return alphaNumeric(event,20)"/><BR><BR></TD>
</TR>
<TR bgcolor=#594344>
	<Th style="color:aliceblue;font:bold 12px tahoma" colspan=2 class=cell>Status Info</Th>
</TR>
<TR>
	<TD align=right class=cell><BR>Marital Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<td class=cell><BR><%t.buildMenu(t.marstatus,"status",150,"ctrl");%></td>
</tr>
<TR>
	<TD align=right class=cell>No.Of Children&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:select styleClass="select"  property="noofchildren">
					<html:option value="">- Select -</html:option>
					<html:option value="0">None</html:option>
					<html:option value="1">1</html:option>
					<html:option value="2">2</html:option>
					<html:option value="3">3</html:option>
					<html:option value="4">4 and above</html:option>
					</html:select></TD>
</TR>
<TR>
	<TD align=right class=cell>Children Living Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell>
	<html:select styleClass="ctrl" style="width:150px" property="childrenlivingstatus">
		<html:option value="no">Not Living With Me</html:option>
		<html:option value="yes">Living With Me</html:option>
	</html:select></td>
</tr>
<TR>
	<TD align=right class=cell>Religion&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><%t.buildMenu(t.religions,"religion",150,"ctrl");%>
</TR>
<TR>
	<TD align=right class=cell>Country Living In&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="country" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Citizen Ship&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:text styleClass="input" property="citizenship" onkeypress="return alphaNumeric(event,20)"/></TD>
</TR>
<TR>
	<TD align=right class=cell>Resident Status&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><%t.buildMenu(t.residency,"resident",150,"ctrl");%></td>
</tr>
<TR>
	<TD align=right class=cell>Employed In&nbsp;&nbsp;:&nbsp;&nbsp;<BR><BR></TD>
	<TD class=cell><%t.buildMenu(t.employment,"employment",150,"ctrl");%><BR><BR></td>
</tr>
<TR bgcolor=#594344>
	<Th style="color:aliceblue;font:bold 12px tahoma" colspan=2 class=cell>Accessing Info</Th>
</TR>
<TR>
	<Td align=right class=cell><BR>Provide E-Mail Id&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><BR><html:text styleClass="input" property="email" onkeypress="return emailID(event,20)"/></TD>
</TR>
<TR>
	<Td align=right class=cell>Choose Password&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:password styleClass="input" property="pwd1" redisplay="true" onkeypress="return password(event,20)"/>&nbsp;&nbsp; Minimum 8 Characters. No Spe. Characters Allowed</TD>
</TR>
<TR>
	<Td align=right class=cell>Confirm Password&nbsp;&nbsp;:&nbsp;&nbsp;</TD>
	<TD class=cell><html:password styleClass="input" property="pwd2" onkeypress="return password(event,20)"/></TD>
</TR>
<tr>
	<td colspan="2" align=center><html:checkbox property="termsandconditions" value="yes"/><a href="javascript:terms_openWin("/addtermscond.shtml","CB", 550, 400, "yes")" styleClass=""textsmall">I Accept the Terms & Conditions</u></a></td>
</tr>
<TR>
	<TD align=center colspan=2 class=cell><BR>
	<button class=button type=submit accesskey="R"><U>R</U>egister</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button class=button type=reset accesskey="C"><U>C</U>lear</button><BR><BR></TD>
</TR></html:form></TABLE><BR><BR><%t.setFooter();%></body></html:html>