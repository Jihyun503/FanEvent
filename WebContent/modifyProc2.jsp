<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String user = "SCHOOL_MENU";
	    String pass = "1234";
	     
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    conn = DriverManager.getConnection(url, user, pass);
	    pstmt=conn.prepareStatement("UPDATE REVIEW SET title = ?, content = ? where num = ?");
	    pstmt.setString(1, (String)request.getParameter("title"));
	    pstmt.setString(2, (String)request.getParameter("content"));
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