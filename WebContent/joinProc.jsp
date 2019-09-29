<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
if(session.getAttribute("id")!=null){
	out.print("<script>alert('이미 회원입니다');history.go(-1)</script>");
}
%>
<center>
<div class="container">
  <h2>회원가입</h2>
  <form action="joinProc2.jsp" method="post">
  <div class="form-group">
      <label for="id">이름:</label>
      <input type="text" class="form-control" id="name" name="name">
    </div>
    <div class="form-group">
      <label for="id">아이디:</label>
      <input type="text" class="form-control" id="id" name="id">
    </div>
    <div class="form-group">
      <label for="pw">비밀번호:</label>
      <input type="password" class="form-control" id="pw" name="pw">
    </div>
    <div class="form-group">
      <label for="pw">이메일:</label>
      <input type=email" class="form-control" id="email" name="email">
    </div>
    <input type="submit" class="btn btn-primary" value="회원가입">
  </form>
</div>
</center>
</body>
</html>