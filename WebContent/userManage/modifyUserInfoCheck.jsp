<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息修改</title>
</head>
<body>
<center>
<h2>用户信息</h2><br>
<%
request.setCharacterEncoding("utf-8");
DBCon dbcon=new DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String id=request.getParameter("id");

String name=request.getParameter("username");

String pws=request.getParameter("pws");

String pho=request.getParameter("pho");

String addr=request.getParameter("addr");

String sql="update users set UserName='" +name+"',UserPassword='"+pws+"',UserPhone='"+pho+"',UserAddr='"+addr+"' where UserId='"+id+"'";
int n =stmt.executeUpdate(sql);
response.sendRedirect("userList.jsp");
%>
</center>
</body>
</html>