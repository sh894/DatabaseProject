<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>前台服务员登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form name="form1" method="post" action="Manage.jsp">
		
		<p align="center">
			<br>
		</p>
		<hr width="100%" size="2">
		<p align="center">
			<br>
		</p>

		<p align="center">
			用户名:<input type="text" name="employee_username">
		</p>

		<p align="center">
			&nbsp;&nbsp;&nbsp;&nbsp; 密&nbsp; 码:<input type="password"
				name="employee_password">&nbsp;&nbsp;&nbsp;&nbsp; <br>
		</p>
		
		<p align="center">
			<input type="submit" name="submit" value="提交"> &nbsp;
			&nbsp;&nbsp; <input type="reset" name="cancel" id="cancel" value="取消">
		</p>
		<p align="center">
			<br>
		</p>
	</form>
  </body>
</html>
