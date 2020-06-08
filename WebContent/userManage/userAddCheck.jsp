<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息插入</title>
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
<h2>用户信息</h2>
<table bgcolor="#28231F">
	<tr><th>序号</th><th>用户名</th><th>密码</th><th>电话</th><th>地址</th>
	</tr>

<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String name=request.getParameter("username");
if(name!=null){
	byte b[]=name.getBytes("iso-8859-1");
	name=new String(b,"utf-8");
}
String pws=request.getParameter("pws");
if(pws!=null){
	byte b[]=pws.getBytes("iso-8859-1");
	pws=new String(b,"utf-8");
}
String pho=request.getParameter("pho");

String addr=request.getParameter("addr");
if(addr!=null){
	byte b[]=addr.getBytes("iso-8859-1");
	addr=new String(b,"utf-8");
}
String sql="insert into users(UserName,UserPassword,UserPhone,UserAddr)values('"+name+ "','"+pws+ "','"+pho+ "','"+addr+ "')";
int n=stmt.executeUpdate(sql);
if(n==1) out.print("插入成功！");
sql="select * from users";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
	<td><%=rs.getString("UserId") %></td>
	<td><%=rs.getString("UserName") %></td>
	<td><%=rs.getString("UserPassword") %></td>
	<td><%=rs.getString("UserPhone") %></td>
	<td><%=rs.getString("UserAddr") %></td>
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