<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <base href="<%=basePath%>">
    <title>客人查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<head>
<title>客人查询</title>
</head>
<body>
<center>
<h1><font size="7" face="华文行楷" color="#0080ff">客人查询</font></h1><br>
<form method="post" name="form1" action=simpleSearch.jsp>
	<p align="center"><strong><font size="4" face="宋体" color="#000000"><br></font></strong></p><p align="center"><strong><font size="4" face="宋体" color="#000000">请输入游客姓名或者房间号码</font></strong></p><p align="center"> </p>
	<p align="center"><input type="text" name="name"><input type="Submit" name="button1" value="快速查找" ></p>
	<p><br></p><p>&nbsp;</p></form><br>
	<div align="center"><input type="button" value="返回系统" name="back" onclick="javascript:location.href='Manage.jsp'" style="height: 30px; width: 120px;"> <br><br></div>

</center>
</body>
</html>
