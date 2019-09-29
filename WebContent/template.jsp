<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String contentPage = request.getParameter("CONTENTPAGE");

%>
<center>
<table width="1040" height="712" cellpadding="2" cellspacing="0" border="0">
<tr height="140">
	<td colspan=3>
		<jsp:include page="top.jsp" flush="false"/>
	</td>
</tr>

<tr>
	<td valign="top">
		<jsp:include page="<%= contentPage %>" flush="false"/>
	</td>
</tr>

</table>
</center>
</body>
</html>