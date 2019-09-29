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
	int num = Integer.parseInt(request.getParameter("num"));
	String comment = request.getParameter("comment");
	
	System.out.println(num);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "SCHOOL_MENU";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement("insert into COMMENT_TBL (ID, ADDCOMMENT, REVIEWNUM) values(?, ?, ?)");
		pstmt.setString(1, (String)session.getAttribute("id"));
		pstmt.setString(2, comment);
		pstmt.setInt(3, num);
		pstmt.executeUpdate();

	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if 
	}
	response.sendRedirect("board.jsp");
%>
</body>
</html>