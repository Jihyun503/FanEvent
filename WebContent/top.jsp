<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<center>
<a href="index.jsp"><img src="img/logo.png"></a>
</center>
<% if(session.getAttribute("id")!=null){
	  	out.print("<h5 style='text-align:right'>"+session.getAttribute("id")+"님 환영합니다");
%>

	<form action="logout.jsp">
	<input type="submit" value="로그아웃">
	
<% 	
  		}
	  
%>
</form>
</h5>
<nav class="navbar navbar-expand-sm bg-light justify-content-center">
  <ul class="navbar-nav">
  	<li class="nav-item">
      <a class="nav-link" href="join.jsp">회원가입</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="login.jsp">로그인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="event.jsp">더쿠 이벤트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="eventEnd.jsp">마감된 이벤트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="board.jsp">참여게시판</a>
    </li>
<% String id="";
	if(session.getAttribute("id")!=null){
 	id = (String)session.getAttribute("id");
%>
    <li class="nav-item">
      <a class="nav-link" href="mypage.jsp">마이페이지</a>
    </li>
<%} %>
  </ul>
</nav>
<br>

</body>
</html>