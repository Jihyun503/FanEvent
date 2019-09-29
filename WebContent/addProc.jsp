<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
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
<center>
<div class="container">
<h2>메뉴 추가</h2>
<p>
<form action="addProc2.jsp">
<div class="form-group">
  <label>날짜:</label>
  <input type="date" class="form-control" name="date">
</div>
<div class="form-group">
  <label>조식:</label>
  <input type="text" class="form-control" name="b">
</div>
<div class="form-group">
  <label>중식:</label>
  <input type="text" class="form-control" name="l">
</div>
<div class="form-group">
  <label>석식:</label>
  <input type="text" class="form-control" name="d">
</div>
<input class="btn btn-warning" type="submit" value="등록">
</form>
<p>
</center>
</body>
</html>