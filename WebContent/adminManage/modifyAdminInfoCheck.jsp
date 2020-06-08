<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>用户信息</h2><br>
<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String id=request.getParameter("id");
String name=request.getParameter("adname");
String pws=request.getParameter("pws");
String sql="update admins set adminName='" +name+"',adminPassword='"+pws+"' where adminId='"+id+"'";
int n =stmt.executeUpdate(sql);
response.sendRedirect("adminList.jsp");
%>
</center>
</body>
</html>