<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍信息修改</title>
<style type="text/css">
#modifybook{
	text-align:center;
	background-color:#F4A660;
	color: #fff;
	width: 320px; 
	height: 270px; 
	margin: auto; 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0;
	border:2px solid #28231F;
}
table,tr,th{
 	border-color:#28231F;
}
 </style>
</head>
<body background="pic/bg.jpg">
<div id="modifybook">
<h2>书籍信息修改</h2><br>
<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String id=request.getParameter("id");
if(id!=null){
	byte b[]=id.getBytes("iso-8859-1");
	id=new String(b,"utf-8");
}
String sql="select * from books where BookId='"+id+"'";
ResultSet rs =stmt.executeQuery(sql);
if(rs.next()){
%>
<form action="modifyBookInfoCheck.jsp">
<center>
<table>
	<tr>
		<th>序号</th>
		<td><input type="text" name="id" value="<%=id %>" readonly></td>
	</tr>
	<tr>
		<th>书名</th>
		<td><input type="text" name="bookname" value="<%=rs.getString("BookName") %>" ></td>
	</tr>
	<tr>
		<th>书籍分类</th>
		<td>
			<select name="booktype"><option>地理人文</option><option>文学著作</option><option>教辅资料</option></select>
		</td>
	</tr>
	<tr>
		<th>作者</th>
		<td><input type="text" name="authorname" value="<%=rs.getString("authorName") %>" ></td>
	</tr>
		
	<tr>
		<th>书籍单价</th>
		<td><input type="text" name="bookprice" value="<%=rs.getString("BookPrice") %>"></td>
	</tr>
	<tr>
	<th colspan="2"><input  type="submit" value="修改"></th>
	</tr>
</table>
</center>	
</form>	
<%
}
%>
</div>
</body>
</html>