<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("id")!=null){
	out.print("<script>alert('이미 로그인이 완료되었습니다');history.go(-1)</script>");
}
%>
<center>

<div class="container">
  <h2>로그인</h2>
  <form action="loginProc2.jsp" method="post">
    <div class="form-group">
      <label for="id">아이디:</label>
      <input type="text" class="form-control" id="id" name="id">
    </div>
    <div class="form-group">
      <label for="pw">비밀번호:</label>
      <input type="password" class="form-control" id="pw" name="pw">
    </div>
    <input type="submit" class="btn btn-primary" value="로그인">
  </form>
</div>

</center>
</body>
</html>