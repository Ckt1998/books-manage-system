<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别信息</title>
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
<h2>类别信息</h2>
<table bgcolor="#28231F">
	<tr><th>序号</th><th>类别名称</th><th>该类书籍数目</th>
	<th>删除</th>
	<th>修改</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String sql="select * from types";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<tr><%String id=rs.getString("typeId"); %>
	<td><%=id %></td>
	<td><%=rs.getString("typeName") %></td>
	<td><%=rs.getString("typeBookNum") %></td>
	<td><a  href="deleteTypeInfo.jsp?id=<%=id%>">删除</a></td>
	<td><a  href="ModifyTypeInfo.jsp?id=<%=id%>">修改</a></td>
</tr>
<%} 
rs.close();
stmt.close();
conn.close();
%>
<tr>
<td colspan="3"><a  href="deleteAdminInfoAll.jsp">全部删除</a></td>
</tr>
</table>
</center>
</body>
</html>