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
%>
<center>
<div class="container">
  <h2>참여 게시판</h2>
  <p>이벤트에 참여하는 글이 있는 게시판이에요!</p>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
      </tr>
    </thead>
    <tbody>

<%	
	LogonDBBean logon = LogonDBBean.getInstance();
	ArrayList<LogonDataBean> list = logon.joinborad(); 
	for(LogonDataBean dto : list){
%>
	<tr>
	<td><%=dto.getNum()%></td>
	<td><a href="view2.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
   	<td><%=dto.getId() %></td>
	</tr>
<%
	}
	
%>
	</tbody>
  </table>
</div>
<p>
<!-- <button onclick="location.href='write.jsp'">글쓰기</button> -->
</center>
</body>
</html>