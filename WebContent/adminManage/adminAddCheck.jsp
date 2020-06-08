<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员信息插入</title>
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
<h2>管理员信息</h2>
<table bgcolor="#28231F">
	<tr><th>序号</th><th>用户名</th><th>密码</th>
	</tr>

<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String name=request.getParameter("adname");
String pws=request.getParameter("pws");
String sql="insert into admins(adminName,adminPassword) values('"+name+ "','"+pws+ "') " ;
int n=stmt.executeUpdate(sql);
if(n==1) out.print("插入成功！");
sql="select * from admins";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
	<td><%=rs.getString("adminId") %></td>
	<td><%=rs.getString("adminName") %></td>
	<td><%=rs.getString("adminPassword") %></td>
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