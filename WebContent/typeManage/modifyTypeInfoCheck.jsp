<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别信息</title>
</head>
<body>
<center>
<h2>类别信息</h2><br>
<%
DBCon dbcon=new DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String id=request.getParameter("id");
if(id!=null){
	byte b[]=id.getBytes("iso-8859-1");
	id=new String(b,"utf-8");
}
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

String sql="update types set typeName='" +typename+"',typeBookNum='"+booknum+"' where typeId='"+id+"'";
int n =stmt.executeUpdate(sql);
response.sendRedirect("typeList.jsp");
%>
</center>
</body>
</html>