<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除用户信息</title>
</head>
<body>
<%
	dbConn.DBCon dbcon=new dbConn.DBCon();
Connection conn=dbcon.getConnection();
Statement stmt= conn.createStatement();
String id=request.getParameter("id");
if(id!=null){
	byte b[]=id.getBytes("iso-8859-1");
	id=new String(b,"utf-8");
}
String sql="delete from users where UserId='"+id+"'";
int n=stmt.executeUpdate(sql);
if(n==1) out.print("删除成功！");
response.sendRedirect("userList.jsp");
%>
</body>
</html>