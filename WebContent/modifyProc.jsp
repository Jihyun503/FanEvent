<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<form action="modifyProc2.jsp">
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String writer = "";
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "SCHOOL_MENU";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement("select * from REVIEW where num = ?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			int number = rs.getInt("num");
			writer = rs.getString("id").trim();
			String title = rs.getString("title");
			String content = rs.getString("content");
			int count = rs.getInt("count");%>

			<center>
			<div class="container">
			  <h2>와글와글</h2>
			  <p>급식에 관한 이야기를 자유롭게 나눠요!</p>            
			  <table class="table table-bordered" style="text-align:center;">
			  	<tr>
				<td width=50><input type="text" name="num" readonly value="<%=number %>"></td>
				<td width=300><input type="text" name="title" value="<%=title %>"></td>
				<td width=100><input type="text" disabled value="<%=writer %>"></td>
				<td width=50><input type="text" disabled value="<%=count %>"></td>
				</tr>
				<tr>
				<td colspan="4"><textarea name="content" rows="18" cols="85"><%=content %></textarea></td>
				</tr>
			
<%		}//if

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
<input class="btn btn-primary" type="submit" value="수정">
</form>
<p>
</center>
</body>
</html>