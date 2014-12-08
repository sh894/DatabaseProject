<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>代码表维护</title>
    
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
  
    <form name="guojiadaimaweihu" action="admin_guojiadaimaweihu.jsp">
		<p align="center">
			<input type="submit" name="submit" value="国家代码维护">
		</p>
	</form>

    <form name="zhengjiandaimaweihu" action="admin_zhengjiandaimaweihu.jsp">
		<p align="center">
			<input type="submit" name="submit" value="证件代码维护">
		</p>
	</form> 
  
		<div align="center"><input type="button" value="返回主页" name="back" onclick="javascript:location.href='admincheck.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
		<div align="center"><input type="button" value="重新登录" name="goback" onclick="javascript:location.href='Managelogin.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
  </body>
</html>
