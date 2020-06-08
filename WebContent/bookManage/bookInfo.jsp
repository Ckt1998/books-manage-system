<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,dbConn.*,bean.bookBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍详细信息</title>
<style type="text/css">
th{
	background-color: #28231F;
	color: #fff;

}
td{
	width:350px;
}
tr{
	height:65px;
}
tr:nth-child(odd){
	background-color: #F4A660;
}
tr:nth-child(even){
	background-color: #D3B288;
}
table{
	text-align:center;
}
a{
	text-decoration:none;
}
a:link,a:visited{
	color:#657B83;
}
a:hover{
	color:#2F2F2F;
}
</style>
</head>
<body background="pic/bg.jpg">
<center>
<h2>书籍详细信息</h2><br>
<%
request.setCharacterEncoding("utf-8");
DBCon dbcon=new DBCon();
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
	<table bgcolor="#28231F">
	<th colspan="2">书籍详细信息</th>
	<tr>
		<td><font>ID</font></td>
		<td><font><%=rs.getString("BookId") %></font></td>
	</tr>
	<tr>
		<td><font>书籍名称</font></td>
		<td><font><%=rs.getString("BookName") %></font></td>
	</tr>
	<tr>
		<td><font>书籍类别</font></td>
		<td><font><%=rs.getString("BookType") %></font></td>
	</tr>
	<tr>
		<td><font>作者/出版社</font></td>
		<td><font><%=rs.getString("authorName") %></font></td>
	</tr>
	<tr>
		<td><font>书籍单价</font></td>
		<td><font><%=rs.getString("BookPrice") %></font></td>
	</tr>
	<tr>
		<td><font>书籍简介</font></td>
		<td><font><%=rs.getString("BookIntroduction") %></font>
	</tr>
	</table>
<%
}
rs.close();
stmt.close();
conn.close();
%>
</center>
</body>
</html>