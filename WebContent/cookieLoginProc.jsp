<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, passwd);
	
	if(check==1){
		Cookie cookie = new Cookie("coupang", id);
		cookie.setMaxAge(60*20);
		response.addCookie(cookie);
		response.sendRedirect("cookieMain.jsp");
	}
	else if(check==0){
		response.sendRedirect("cookieLoginForm.jsp");
	}
	else if(check==-1){
		response.sendRedirect("insertMemberForm.jsp");
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