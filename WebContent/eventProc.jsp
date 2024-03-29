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
  <h2>더쿠 이벤트</h2>
  <p>내 아티스트를 위한 자체적인 이벤트를 진행할 수 있어요!</p>  
 <form action="event.jsp">
	<select name="choice">
	<option value="target">아티스트</option>
	<option value="title">제목</option>
	</select>
	<input type="text" name="search">
	<input type="submit" value="검색">
   </form>          
   <br>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>아티스트(작품)</th>
        <th>제목</th>
        <th>작성자</th>
        <th>마감일</th>
      </tr>
    </thead>
    <tbody>

<%	
	LogonDBBean logon = LogonDBBean.getInstance();
	ArrayList<LogonDataBean> list = null;
	list = logon.borad(1);
	String choice = request.getParameter("choice");
	String search = request.getParameter("search");

	if(choice==null){
		list = logon.borad(1);
	}
	else if(choice.equals("target")){
		list = logon.borad2(1, search);
	}
	else if(choice.equals("title")){
		list = logon.borad2(2, search);
	} 
	
	for(LogonDataBean dto : list){
%>
	<tr>
	<td><%=dto.getNum()%></td>
	<td><%=dto.getTarget()%></td>
	<td><a href="view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
   	<td><%=dto.getId() %></td>
	<td><%=dto.geteDate() %></td>
	</tr>
<%
	}

	
%>
	</tbody>
  </table>
</div>
<p>
<button class="btn btn-primary" onclick="location.href='write.jsp'">글쓰기</button>
</center>
</body>
</html>