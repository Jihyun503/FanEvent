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
	int num = Integer.parseInt(request.getParameter("num"));
	String getid = "";
	String idchk = "";
	int getnum = 0;
	
	LogonDBBean logon = LogonDBBean.getInstance();
	
	String check = "";
	String rid = "";
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "EVENT";
			String pass = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement("select JOINEVENT.chk as chk, JOINEVENT.id as id, EVENTBOARD.id as rid from JOINEVENT, EVENTBOARD where JOINEVENT.num = ? and JOINEVENT.RNUM = EVENTBOARD.NUM");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = rs.getString("chk").trim();
				idchk = rs.getString("id");	
				rid = rs.getString("rid");	
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
		if(check.equals("2")){
		if(!idchk.equals(session.getAttribute("id"))&&!rid.equals(session.getAttribute("id"))){
			System.out.println("test");
			out.println("<script>alert('비밀글입니다.')");
			out.println("history.go(-1)</script>");
		}
		/* else if(!rid.equals(session.getAttribute("id")))
		{
			out.println("<script>alert('비밀글입니다.')");
			out.println("history.go(-1)</script>");
		} */
	}
	
	ArrayList<LogonDataBean> list = logon.view2(num);
	for(LogonDataBean dto : list){
		getid = dto.getId();
		getnum = dto.getNum();
	%>

<center>
			<div class="container">
			  <h2>참여 게시판</h2>
			  <p>더욱 다양한 이벤트에 참여해보세요!</p>           
			  <table class="table table-bordered" style="text-align:center;">
			  	<tr>
				<td width=20><%=dto.getNum() %></td>
				<td width=400><%=dto.getTitle() %></td>
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

<%	
String id = "";
int chk = 0;
if(session.getAttribute("id")!=null){
 	id = (String)session.getAttribute("id");
}
 if (id.equals(getid)){
%>
 	 
	<%-- <button class="btn btn-primary" onclick="location.href='modify.jsp?num=<%=num%>'">수정</button> --%>
	<button class="btn btn-primary" onclick="location.href='delete2.jsp?num=<%=getnum%>'">삭제</button>
<%
	}
%>
	<button class="btn btn-primary" onclick="location.href='board.jsp'">목록</button><p><p>
</center>

</body>
</html>