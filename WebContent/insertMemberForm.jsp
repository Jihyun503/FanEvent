<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> Member 테이블에 회원가입</h2>

<form action="insertMemberProc.jsp" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="passwd"><br>
이름 : <input type="text" name="name"> <br>
<input type="submit" value="회원가입">

</form>

</body>
</html>