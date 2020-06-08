<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别信息插入</title>
<style type="text/css">
th{
	background-color: #28231F;
	color: #fff;
	width:135px;
}
tr:nth-child(odd){
	background-color: #F4A660;
}
tr:nth-child(even){
	background-color: #D3B288;
}
</style>
</head>
<body background="pic/bg.jpg">
<center>
<h2>类别信息</h2>
<table bgcolor="#28231F">
	<tr><th>序号</th><th>类别名称</th><th>该类书籍数目</th>
	</tr>

<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String typename=request.getParameter("typename");
if(typename!=null){
	byte b[]=typename.getBytes("iso-8859-1");
	typename=new String(b,"utf-8");
}
String booknum=request.getParameter("booknum");
if(booknum!=null){
	byte b[]=booknum.getBytes("iso-8859-1");
	booknum=new String(b,"utf-8");
}

String sql="insert into types(typeName,typeBookNum) values('"+typename+ "','"+booknum+ "') " ;
int n=stmt.executeUpdate(sql);
if(n==1) out.print("插入成功！");
sql="select * from types";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<tr><%String id=rs.getString("typeId"); %>
	<td><%=id %></td>
	<td><%=rs.getString("typeName") %></td>
	<td><%=rs.getString("typeBookNum") %></td>
</tr>
<%} 
rs.close();
stmt.close();
conn.close();
%>
</table>
</center>
</body>
</html>