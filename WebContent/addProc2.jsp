<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");
	String date = request.getParameter("date");
	String b = request.getParameter("b");
	String l = request.getParameter("l");
	String d = request.getParameter("d");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "SCHOOL_MENU";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement("insert into MENU (MENU_DATE, BREAKFAST, LUNCH, DINNER) values(?, ?, ?, ?)");
		pstmt.setString(1, date);
		pstmt.setString(2, b);
		pstmt.setString(3, l);
		pstmt.setString(4, d);
		pstmt.executeUpdate();

	}
	catch(Exception e){
		e.printStackTrace();
%>
<script>alert("이미 등록되어있는 날짜입니다!")</script>
<%
	}
	finally{
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if 
	}
%>
<meta http-equiv="refresh" content="1; url=menu.jsp">
</body>
</html>