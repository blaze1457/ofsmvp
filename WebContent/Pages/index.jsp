<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<html:html>
<HEAD>
<html:errors />
<%t.getError();%>
<table align=center cellspacing=2 cellpadding=3 width=450>
	<TR>
		<TD colspan=2 style='text-align: justify'>The current days life
			has become very busy and mechanical. We don't find the timely time
			management at various stages of day-to-day life now. Adding strength
			to the busyness the computers has still fasten the life style. As the
			Internet has brought everything to home, here comes even arrangement
			of marriages through net. The current application will provide a
			better solution for the mechanical people, who hardly can spend any
			time to look after for their partner manually. The current
			application acts as an interface between the bride and bridegroom,
			not only belonging to same language, religion but also residing
			globally at various locations.</TD>
	</tr>
	<%t.getSearchBox();%>
	<%t.setFooter();%>
	</body>
	</html:html>