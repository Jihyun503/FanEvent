<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
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
<div class="container">
<h2>식단표</h2>
<p>미림여자정보과학고등학교 9월 급식메뉴입니다.</p>  
<p>
<form action="menu.jsp" method="post">
<select name="choice">
<option value="all">전체</option>
<option value="b">조식</option>
<option value="l">중식</option>
<option value="d">석식</option>
</select>
날짜 : <input type="date" name="date">
<input class="btn btn-warning" type="submit" value="검색">
</form>
<table class="table table-bordered" style="text-align:center;">
<%
	request.setCharacterEncoding("utf-8");
	String date = request.getParameter("date");
	String choice = request.getParameter("choice");
	
	System.out.println("choice"+choice);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "SCHOOL_MENU";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);/* 
		if(choice==null){
			sql = "select TO_CHAR(MENU_DATE, 'YYYY/MM/DD'), BREAKFAST, LUNCH, DINNER from menu";		
		} */
		if(choice.equals("b")){
			sql = "select TO_CHAR(MENU_DATE, 'YYYY/MM/DD'), BREAKFAST from menu where menu_date='"+date+"'";
		}
		else if(choice.equals("l")){
			sql = "select TO_CHAR(MENU_DATE, 'YYYY/MM/DD'), LUNCH from menu where menu_date='"+date+"'";
		}
		else if(choice.equals("d")){
			sql = "select TO_CHAR(MENU_DATE, 'YYYY/MM/DD'), DINNER from menu where menu_date='"+date+"'";
		}
		else if(choice.equals("all")){
			sql = "select TO_CHAR(MENU_DATE, 'YYYY/MM/DD'), BREAKFAST, LUNCH, DINNER from menu where menu_date='"+date+"'";
		}
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){%>
			  	<tr class="bg-warning">
				<td colspan="3"><%=rs.getString(1) %></td>
				</tr>
				<!-- <tr class="bg-warning">
				<td>조식</td>
				<td>중식</td>
				<td>석식</td>	
				</tr> -->
				<%if (choice.equals("b")){ %>
				<tr>
				<td><%=rs.getString("BREAKFAST") %></td>
				</tr>
				<%} 
				else if (choice.equals("l")){ %>
				<tr>
				<td><%=rs.getString("LUNCH") %></td>
				</tr>
				<%}
				else if (choice.equals("d")){ %>
				<tr>
				<td><%=rs.getString("DINNER") %></td>
				</tr>
				<%}
				else{
					%>
					<tr>
					<td><%=rs.getString("BREAKFAST") %></td>
					<td><%=rs.getString("LUNCH") %></td>
					<td><%=rs.getString("DINNER") %></td>
					</tr>
<% 
				}
				
			}//if

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
<br>

<%
String id = "";
if(session.getAttribute("id")!=null){
 	id = (String)session.getAttribute("id");
}
if(id.equals("0000")){

%>
 	<p> 
<%
	}
%> 
</center>
</body>
</html>