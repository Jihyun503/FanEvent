<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="mirim.hs.kr.LogonDataBean"/>
<jsp:setProperty name="member" property="*" />

<%

	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	LogonDBBean logon = LogonDBBean.getInstance();
	logon.delete(member);
	response.sendRedirect("board.jsp"); 
	
%>

</body>
</html>