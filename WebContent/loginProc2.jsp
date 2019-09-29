<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, pw);
	
	if(check==1){
		session.setAttribute("id", id);
		response.sendRedirect("index.jsp");
	}
	else if(check==0){
		response.sendRedirect("login.jsp");
	}
	else if(check==-1){
		response.sendRedirect("join.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>