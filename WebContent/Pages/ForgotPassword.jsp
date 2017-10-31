<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<html:html>
<HEAD>
<fieldset>
	<legend>Retrieve Password</legend>
	<%t.getError();%>
	<html:errors />
	<table align=center cellspacing=0 cellpadding=3 width=100%>
		<form action="<%=t.getPath("/ForgotPassword.do")%>" method=post
			onsubmit="return formValidate(this)">
			<TR>
			<TR>
				<TD align=right class=cell>Profile Id&nbsp;&nbsp;:&nbsp;&nbsp;

				
				<TD><input type=text class=input name="profileid"
					onkeypress="return blockKey(event,6)">&nbsp;&nbsp;</TD>
			</TR>
			<TR>
				<TD align=right class=cell>Mail Id:&nbsp;&nbsp;:&nbsp;&nbsp;
				<TD><input type=text class=input name="emailid"
					onkeypress="return emailID(event,30)">&nbsp;&nbsp;</TD>
			</TR>
			<TR>
				<TD align=right class=cell>Get Password &gt;&gt;
				<TD><button type=submit class=button accesskey='F'>
						<u>F</u>ind
					</button></TD>
			</tr>
			<TR>
				<TD colspan=2 style='text-align: justify'>Your Matrimony ID and
					password will be sent to the email id you had givenduring the time
					of registration.</TD>
			</tr>
			<TR>
				<TD colspan=2 class=cell align=center>FAQ (Frequently Asked
					Questions)</TD>
			</TR>
			<TR>
				<TD colspan=2 class=cell>1) How will I get my Password ?</TD>
			</TR>
			<TR>
				<TD colspan=2 style='text-align: justify'>Please fill in the
					form above and provide us your Matrimony ID or the email id you had
					given during the time of registration. Your Matrimony ID and
					password will be sent to the email id you had given during the time
					of registration</TD>
			</TR>
			<TR>
				<TD colspan=2 class=cell>2) I have forgotten both my Matrimony
					ID / E-mail ID I had given at the time of registration. How can I
					get my Password ?</TD>
			</TR>
			<TR>
				<TD colspan=2>We need either your Matrimony ID or E-mail ID you
					had given during the time of registration to provide you the
					Password. Please use our Search Profiles option to find your
					Matrimony ID. To narrow down your search use the "Caste" and "Date"
					options. Once you find your Matrimony ID or E-mail ID, please fill
					in the above form and your Password will be sent to you.</TD>
			</TR>
		</form>
	</table>
</fieldset>
</BODY>
</html:html>

