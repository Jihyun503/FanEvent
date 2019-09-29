<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
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
	String choice = request.getParameter("choice");
	String search = request.getParameter("search");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String name = "";
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SCHOOL_MENU";
	String pass = "1234";
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	pstmt=conn.prepareStatement("select num, id, title, count from review");
	rs=pstmt.executeQuery(); 
%>
<center>
<div class="container">
  <h2>와글와글</h2>
  <p>급식에 관한 이야기를 자유롭게 나눠요!</p>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>

<%	
	while(rs.next()){
%>
	<tr>
	<td><%=rs.getInt("num")%></td>
	<td><a href="view.jsp?num=<%=rs.getInt("num")%>"><%=rs.getString("title") %></a></td>
   	<td><%=rs.getString("id") %></td>
	<td><%=rs.getString("count") %></td>
	</tr>
<%
	}
	
%>
	</tbody>
  </table>
</div>
<p>
<button onclick="location.href='writeProc.jsp'">글쓰기</button>
</center>
</body>
</html>