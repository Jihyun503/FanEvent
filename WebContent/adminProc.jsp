<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<form action="menuModify.jsp" method="post">
날짜 : <input type="date" name="date"><p><p>
<input class="btn btn-warning" type="submit" value="급식메뉴 수정">
</form>
<hr>
<button class="btn btn-warning" onclick="location.href='add.jsp'">급식메뉴 추가</button>
</center>
</body>
</html>