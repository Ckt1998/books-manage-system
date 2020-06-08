<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除所有用户</title>
</head>
<body>
<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String sql="delete from admins";
stmt.executeUpdate(sql);
out.print("删除成功！");
response.sendRedirect("adminList.jsp");
%>
</body>
</html>