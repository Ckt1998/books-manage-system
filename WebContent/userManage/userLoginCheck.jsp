<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录检验</title>
</head>
<body>
<%
DBCon dbcon=new DBCon();
Connection conn = dbcon.getConnection();
Statement stmt = conn.createStatement();
String username = request.getParameter("username");
if(username!=null){
	byte b[] = username.getBytes("iso-8859-1");
	username = new String(b,"utf-8");
}
String userpwd = request.getParameter("userpwd");
String sql = "select * from users where UserName='"+username+"' and UserPassword='"+userpwd+"'";
ResultSet rs = stmt.executeQuery(sql);
  if(rs.next()){
	  response.sendRedirect("userSuccess.html"); 
  }else{
      response.sendRedirect("userLogin.html");
  }
rs.close();
stmt.close();
conn.close();
%>
</body>
</html>