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
	String date = request.getParameter("date");
	String b = request.getParameter("b");
	String l = request.getParameter("l");
	String d = request.getParameter("d");
	
	//System.out.println(date1+b+l+d);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String user = "SCHOOL_MENU";
	    String pass = "1234";
	     
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    conn = DriverManager.getConnection(url, user, pass);
	    pstmt=conn.prepareStatement("UPDATE MENU SET BREAKFAST=?, LUNCH=?, DINNER=? where menu_date=?");
	    pstmt.setString(1, b);
	    pstmt.setString(2, l);
	    pstmt.setString(3, d);
	    pstmt.setString(4, date);
	    pstmt.executeUpdate();
	    
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
		response.sendRedirect("menu.jsp"); 
%>
</body>
</html>