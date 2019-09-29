<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 폼</h2>

<form action="cookieLoginProc.jsp" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="passwd"><br>
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="loaction.href='insertMemberForm.jsp'">
</form>

</body>
</html>