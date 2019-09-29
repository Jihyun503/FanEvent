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
<center>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String getid = "";
	int getnum = 0;
	LogonDBBean logon = LogonDBBean.getInstance();
	ArrayList<LogonDataBean> list = logon.view(num);
	for(LogonDataBean dto : list){
		getid = dto.getId();
		getnum = dto.getNum();
	%>
			<div class="container">
			  <h2>더쿠 이벤트</h2>
			  <p>삶의 질을 향상 시키는 덕-질</p>            
			  <table class="table table-bordered" style="text-align:center;">
			  	<tr>
				<td width=20><%=dto.getNum() %></td>
				<td width=150><%=dto.getTarget() %></td>
				<td width=400><%=dto.getTitle() %></td>
				</tr>
				<tr>
				<td width=400 colspan="2">기간 : <%=dto.getsDate() %>~<%=dto.geteDate() %></td>
				<td>작성자 : <%=dto.getId() %></td>
				</tr>
				<tr>
				<td colspan="3" height="500">
				
<%		if(dto.getFiles()!=null){
%>
	<img src="upload/<%=dto.getFiles() %>">
<%
	}
%>
				<br><%=dto.getContent() %></td>
				</tr>
<%
		}//if
	
%>
</table>
<br>
<!-- <div class="container">
	<p>댓글</p>            
	<table class="table table-bordered" style="text-align:center;">
	<tr>
	<td width=50>작성자</td>
	<td width=300>내용</td>
	</tr> -->
<%-- <%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	String sql = "select ID, ADDCOMMENT from COMMENT_TBL where REVIEWNUM = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
%>
	<tr>
	<td width=50><%= rs.getString("id")%></td>
	<td width=300><%= rs.getString("addcomment")%></td>
	</tr>
<%		} 
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs!=null){ try{ rs.close(); } catch(Exception e) {} }//if
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
	}
%>
	</table>
	</div>
<br>
<%


%>
 	<form class="form-inline" action="comment.jsp?num=<%=number %>" method="post">
 	  <div class="form-group">
 	      <label for="id">댓글: </label>
 	      <input type="text" class="form-control" name="comment">
 	    </div>
 	<input type="submit" class="btn btn-primary" value="등록">
 	</form>
 --%>
<%	
String id = "";
int chk = 0;
if(session.getAttribute("id")!=null){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "EVENT";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement("select CASE WHEN sysdate > edate+1 THEN 1 ELSE 2 end from EVENTBOARD where num = ?");
		pstmt.setInt(1, getnum);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			chk = rs.getInt(1);	
		}

	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs!=null){try{rs.close();} catch(Exception e){} }
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if 
	}
	if(chk == 2){
%>
	<button class="btn btn-primary" onclick="location.href='write2.jsp?num=<%=num%>'">참여하기</button>
	
<%

}
 	id = (String)session.getAttribute("id");
}
 if (id.equals(getid)){
%>
 	 
	<%-- <button class="btn btn-primary" onclick="location.href='modify.jsp?num=<%=num%>'">수정</button> --%>
	<button class="btn btn-primary" onclick="location.href='delete.jsp?num=<%=getnum%>'">삭제</button>
<%
	}
%>
	<button class="btn btn-primary" onclick="location.href='event.jsp'">목록</button><p><p>
</center>
</body>
</html>