<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="mirim.hs.kr.LogonDataBean"/>
<jsp:setProperty name="member" property="*" />

<%
	System.out.println(request.getParameter("files"));
	LogonDBBean logon = LogonDBBean.getInstance();
	logon.writeEvent(member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.sendRedirect("event.jsp");
%>
</body>
</html>