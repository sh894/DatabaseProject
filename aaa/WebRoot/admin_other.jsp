<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����ά��</title>
    
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
			<input type="submit" name="submit" value="���Ҵ���ά��">
		</p>
	</form>

    <form name="zhengjiandaimaweihu" action="admin_zhengjiandaimaweihu.jsp">
		<p align="center">
			<input type="submit" name="submit" value="֤������ά��">
		</p>
	</form> 
  
		<div align="center"><input type="button" value="������ҳ" name="back" onclick="javascript:location.href='admincheck.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
		<div align="center"><input type="button" value="���µ�¼" name="goback" onclick="javascript:location.href='Managelogin.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
  </body>
</html>
