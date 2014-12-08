<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>系统初始化</title>
    
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
    This is my JSP page. <br>
  </body>
  <center>
  <div align="center"><input type="button" value="系统初始化" name="initsys" onclick="javascript:location.href='init_add.jsp'" style="height: 30px; width: 120px;"><br><br></div>
  <div align="center"><input type="button" value="系统清空" name="initsys" onclick="javascript:location.href='init_clear.jsp'" style="height: 30px; width: 120px;"><br><br></div>
  </center>
 
</html>
