<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍信息修改检查</title>
</head>
<body>
<center>
<h2>书籍信息修改</h2><br>
<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String id=request.getParameter("id");
if(id!=null){
	byte b[]=id.getBytes("iso-8859-1");
	id=new String(b,"utf-8");
}
String bookname=request.getParameter("bookname");
if(bookname!=null){
	byte b[]=bookname.getBytes("iso-8859-1");
	bookname=new String(b,"utf-8");
}
String authorname=request.getParameter("authorname");
if(authorname!=null){
	byte b[]=authorname.getBytes("iso-8859-1");
	authorname=new String(b,"utf-8");
}
String booktype=request.getParameter("booktype");
if(booktype!=null){
	byte b[]=booktype.getBytes("iso-8859-1");
	booktype=new String(b,"utf-8");
}
String bookprice=request.getParameter("bookprice");
if(bookprice!=null){
	byte b[]=bookprice.getBytes("iso-8859-1");
	bookprice=new String(b,"utf-8");
}

String sql="update books set BookName='" +bookname+"',BookType='"+booktype+"',authorName='"+authorname+"',BookPrice='"+bookprice+"' where BookId='"+id+"'";
int n =stmt.executeUpdate(sql);
response.sendRedirect("bookList.jsp");
%>
</center>
</body>
</html>