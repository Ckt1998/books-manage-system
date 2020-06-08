<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录检验</title>
</head>
<body>
<%
DBCon dbcon=new DBCon();
Connection conn = dbcon.getConnection();
Statement stmt = conn.createStatement();
String adminname = request.getParameter("adminname");
String adminpwd = request.getParameter("adminpwd");
String sql = "select * from admins where adminName='"+adminname+"'";
ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()){
		String sql2 = "select * from admins where adminPassword='"+adminpwd+"'";
		rs=stmt.executeQuery(sql2);
		if(rs.next()){
			response.sendRedirect("adminSuccess.html");
		}
		else{
			response.sendRedirect("adminLogin.html");
		}
	}
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>