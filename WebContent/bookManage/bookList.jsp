<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,dbConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍信息</title>
<style type="text/css">
th{
	background-color: #28231F;
	color: #fff;
	width:90px;
}
tr{
	height:65px;
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
<h2>书籍信息</h2>
<hr>
<table bgcolor="#28231F">
	<tr><th>序号</th><th>书名</th><th>书籍分类</th><th>作者</th><th>书籍单价</th>
	<th>加入购物车</th>
	<th>删除</th>
	<th>修改</th>
	</tr>
<%
request.setCharacterEncoding("utf-8");
DBCon dbcon=new DBCon();
Connection conn=dbcon.getConnection();

int intPageSize;//一页显示记录数目
int intRowCount;//记录总数
int intPageCount;//总页数
int intPage;//待显示页码
String strPage;
int i;
intPageSize = 8;
strPage = request.getParameter("page");
	if(strPage==null){
		intPage = 1;
	}
	else{
		intPage = java.lang.Integer.parseInt(strPage);
		if(intPage<1) intPage = 1;
	}

Statement stmt= conn.createStatement();
String sql="select BookId,BookName,BookType,authorName,BookPrice from books";
ResultSet rs=stmt.executeQuery(sql);
rs.last();//光标指向查询结果的最后一条记录
intRowCount = rs.getRow();//获取记录总数
intPageCount = (intRowCount + intPageSize - 1)/intPageSize;//计算总页数
if(intPage>intPageCount)  intPage = intPageCount;
if(intPage>0){
	rs.absolute((intPage - 1)*intPageSize + 1);
	i = 0;
	while(i<intPageSize && !rs.isAfterLast()){%>
<tr><%String id=rs.getString("BookId"); %>
	<td><%=id %></td>
	<td><a href="bookInfo.jsp?id=<%=id%>"><%=rs.getString("BookName") %></a></td>
	<td><%=rs.getString("BookType") %></td>
	<td><%=rs.getString("authorName") %></td>
	<td><%=rs.getString("BookPrice") %></td>
	<td><a href="">加入购物车</a>
	<td><a  href="deleteBookInfo.jsp?id=<%=id%>">删除</a></td>
	<td><a  href="ModifyBookInfo.jsp?id=<%=id%>">修改</a></td>
</tr>

<%
rs.next();
i++;
	}
}
%>
</table>
<hr>
<div align="center">
第<%=intPage %>页   共<%=intPageCount %>页
<%
	if(intPage<intPageCount){
	%>
	<a href="bookList.jsp?page=<%=intPage+1 %>"><font size="4" color="red">下一页</font></a>
	<%
	}
if(intPage>1){
	%>
	<a href="bookList.jsp?page=<%=intPage-1 %>"><font size="4" color="red">上一页</font></a>
	<%
} 
rs.close();
stmt.close();
conn.close();
%>
</div>
</center>
</body>
</html>