<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户界面</title>
<style type="text/css">
#userPage{
	text-align:center;
	background-color:#FFD0A2;
	border-radius: 20px; 
	width: 320px; 
	height: 300px; 
	margin: auto; 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0;
}
a{
	text-decoration:none;
}
a:link,a:visited{
	color:#8A673F;
}
a:hover{
	color:#2F2F2F;
}
</style>
</head>
<body background="pic/bg.jpg">
<div id="userPage">
<h1>用户界面</h1><br>
<h3><a href="userLogin.html">用户登录</a></h3>
<h3><a href="userAdd.html">用户注册</a></h3>
<h3><a href="userList.jsp">用户信息列表</a></h3>
</div>
</body>
</html>