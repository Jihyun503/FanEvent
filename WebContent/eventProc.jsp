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
	
	
	/* Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String name = "";
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SCHOOL_MENU";
	String pass = "1234";
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	pstmt=conn.prepareStatement("select num, id, title, count from review");
	rs=pstmt.executeQuery();  */
%>
<center>
<div class="container">
  <h2>더쿠 이벤트</h2>
  <p>내 아티스트를 위한 자체적인 이벤트를 진행할 수 있어요!</p>            
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
	ArrayList<LogonDataBean> list = logon.borad(); 
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
<button onclick="location.href='write.jsp'">글쓰기</button>
</center>
</body>
</html>