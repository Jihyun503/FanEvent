<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("id")==null){
	out.print("<script>alert('로그인 후에 이용해주세요');history.go(-1)</script>");
}
%>
<center>
<form action="InsertGoods" method="post" enctype="multipart/form-data">
<table border="1" style="text-align:center;">
<tr>
<td width="100">제목</td>
<td width="600"><input type="text" name="title" size="85"><br>비밀글 : 
<select name="chk"><option value="1">안함</option><option value="2">함</option></select></td> 
</tr>
<tr>
<td width="100">아티스트(작품)명</td>
<td width="600"><input type="text" name="target" size="85"></td> 
</tr>
<tr>
<td width="100">첨부파일</td>
<td><input type="file" name="files"></td> 
</tr>
<tr>
<td width="100">시작일</td>
<td><input type="date" name="sDate"></td> 
</tr>
<tr>
<td width="100">마감일</td>
<td><input type="date" name="eDate"></td> 
</tr>
<tr height="300">
<td>내용</td>
<td><textarea name="content" rows="18" cols="85" placeholder="자세한 참여방법과 상품을 꼭 기재해주세요"></textarea></td>
</tr>
</table>
<input type="hidden" name="id" value="<%=session.getAttribute("id") %>">
<input type="submit" value="완료">
</form>
</center>
</body>
</html>