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
<form action="menuModifyProc2.jsp" method="post">
<%
	request.setCharacterEncoding("utf-8");
	String date = request.getParameter("date");
	
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
		pstmt = conn.prepareStatement("select * from menu where menu_date = ?");
		pstmt.setString(1, date);
		rs = pstmt.executeQuery();
		
		if(rs.next()){%>

			<center>
			<div class="container">      
			  <table class="table table-bordered" style="text-align:center;">
			  	<tr>
				<td colspan="4"><input type="date" name="date" readonly value="<%=date %>"></td>
				</tr>
				<tr>
				<td><textarea name="b" rows="9" cols="30"><%=rs.getString("BREAKFAST") %></textarea></td>
				<td><textarea name="l" rows="9" cols="30"><%=rs.getString("LUNCH") %></textarea></td>
				<td><textarea name="d" rows="9" cols="30"><%=rs.getString("DINNER") %></textarea></td>
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