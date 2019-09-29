<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="mirim.hs.kr.LogonDataBean"/>
<jsp:setProperty name="member" property="*" />

<%
	//member.setReg_date(new Timestamp(System.currentTimeMillis()));
	/* LogonDBBean logon = LogonDBBean.getInstance();
	logon.insertMember(member); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:getProperty name="member" property="id" />님의 회원가입을 축하합니다
</body>
</html>