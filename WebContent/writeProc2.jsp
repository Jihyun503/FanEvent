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

	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String title = "";

try{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "EVENT";
	String pass = "1234";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	pstmt = conn.prepareStatement("select title from EVENTBOARD where num = ?");
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		title = rs.getString("title");	
	}

}
catch(Exception e){
	e.printStackTrace();
}
finally{
	if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
	if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if 
}
%>
<center>
<form action="InsertGoods2" method="post" enctype="multipart/form-data">
<table border="1" style="text-align:center;">
<tr>
<td width="100">제목</td>
<td width="600"><input type="text" name="title" size="85" value="re: [<%=title%>]"></td> 
</tr>
<tr>
<td width="100">비밀글 여부</td>
<td width="50"><select name="chk"><option value="1">안함</option><option value="2">함</option></select></td> 
</tr>
<tr>
<td width="100">첨부파일</td>
<td><input type="file" name="files"></td> 
</tr>
<tr height="300">
<td>내용</td>
<td><textarea name="content" rows="18" cols="85" placeholder="이벤트 글에 기재된 양식대로 입력해주세요"></textarea></td>
</tr>
</table>
<input type="hidden" name="id" value="<%=session.getAttribute("id") %>">
<input type="hidden" name="rnum" value="<%=num %>">
<input type="submit" value="완료">
</form>
</center>
</body>
</html>