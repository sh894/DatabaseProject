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
    <title>饭店服务员管理</title>
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
 
 <center></center><h3>登录成功</h1> 
 <h3>欢迎<font color="red"><%=request.getParameter("employee_username")%></font>光临！！</h3> 
<div align="center"><input type="button" value="客 房 查 询" name="roomSearch" onclick="javascript:location.href='roomSearch.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
<div align="center"><input type="button" value="游 客 查 询" name="guestSearch" onclick="javascript:location.href='guestSearch.jsp'" style="height: 30px; width: 120px;" ><br><br></div>
<div align="center"><input type="button" value="客 房 管 理" name="roomAdmin" onclick="javascript:location.href='roomAdmin.jsp'" style="height: 30px; width: 120px;"><br><br></div>
<div align="center"><input type="button" value="游 客 管 理" name="guestsAdmin" onclick="javascript:location.href='guestsAdmin.jsp'" style="height: 30px; width: 120px;"><br><br></div>
    </td>
  </tr>
  </center>
  </body>
</html>
