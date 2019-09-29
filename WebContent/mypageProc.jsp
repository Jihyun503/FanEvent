<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@page import="mirim.hs.kr.LogonDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
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
	request.setCharacterEncoding("utf-8");
	LogonDBBean logon = LogonDBBean.getInstance();
%>
<center>
<div class="container">
  <h2>내가 작성한 이벤트</h2>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>아티스트(작품)</th>
        <th>제목</th>
      </tr>
    </thead>
    <tbody>

<%	
	ArrayList<LogonDataBean> list = logon.showBoard((String)session.getAttribute("id")); 
	for(LogonDataBean dto : list){
%>
	<tr>
	<td><%=dto.getNum()%></td>
	<td><%=dto.getTarget() %></td>
	<td><a href="view2.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
	</tr>
<%
	}
	
%>
	</tbody>
  </table>
</div>
<hr>
<p>
<div class="container">
  <h2>내 이벤트 참여글 목록</h2>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>제목</th>
      </tr>
    </thead>
    <tbody>

<%	
	ArrayList<LogonDataBean> list2 = logon.showBoard2((String)session.getAttribute("id")); 
	for(LogonDataBean dto : list2){
%>
	<tr>
	<td><%=dto.getNum()%></td>
	<td><%=dto.getId() %></td>
	<td><a href="view2.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
	</tr>
<%
	}
	
%>
	</tbody>
  </table>
</div>
</center>
</body>
</html>