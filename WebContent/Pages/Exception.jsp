<%@ taglib uri="struts/html-el" prefix="html"%>
<%@ taglib uri="struts/bean" prefix="bean"%>
<%@ taglib uri="struts/logic" prefix="logic"%>
<%@ include file="Template.jsp"%>
<%
	Object exception=request.getAttribute("Exception");
	String error=exception!=null?exception.toString():"Un Known Response From Server";
	error=error.toLowerCase().indexOf("duplicate")!=-1?"Already Such Id Exists Please Choose Another Id":error;
%>
<html:html><HEAD>
<html:errors/>
<Center><BR><BR><h4><%=error%></h4><BR><BR></center>
<center><button class=button accesskey="N" onclick='location="<%=t.getPath("/Pages/index.jsp")%>"' style="width:150px"><u>N</u>avigate Home</button>&nbsp;&nbsp;<button accesskey="C" onclick='location="javascript:history.back()"' class=button style="width:150px"><u>C</u>ontinue Back</button></center>
<SCRIPT>if(top!=self) top.location=self.location</script>
<BR><BR><%t.setFooter();%></body></html:html>
