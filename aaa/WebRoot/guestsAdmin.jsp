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
    <title>客人管理</title>
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
  <center>     
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#393F59" width="760" id="AutoNumber111" bgcolor="#F5F5F5">

<div align="center"><input type="button" value="客人入住" name="guestcheckin" onclick="javascript:location.href='guestcheckin.jsp'" style="height: 30px; width: 120px;"> 
 <br><br></div>
<div align="center"><input type="button" value="客人换房" name="guestchange" onclick="javascript:location.href='guestchange.jsp'" style="height: 30px; width: 120px;" ><br><br></div>

<div align="center"><input type="button" value="退房结算" name="guestcheckout" onclick="javascript:location.href='guestcheckout.jsp'" style="height: 30px; width: 120px;"><br><br></div>
    </td>
  </tr>
  </center>
  </body>
</html>
