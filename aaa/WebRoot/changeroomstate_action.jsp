<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���ķ���״̬ȷ��</title>
    
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
  <%//out.println(request.getParameter("str"));out.println(request.getParameter("roomstste"));
  
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=hotel";
		String userName = "sa";
		String userPwd = "123";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, userName,
				userPwd);
		Statement stmt = conn.createStatement(
				//����ɾ���ɼ�¼
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		stmt.executeUpdate("update roomstate set roomstste='"+request.getParameter("roomstste")+"' where roomcode='"+request.getParameter("str")+"'");
		stmt.close();
		conn.close();
		out.println("����״̬���ĳɣ����������");
	%>
	<br>
  	<input type="button" id="back" name="back" value="������һ��"
		onClick="javascript:history.go(-1)"> &nbsp; &nbsp;&nbsp;
	<form action="Manage.jsp" name="gobackform">
		<input type="submit" id="goback" name="goback" value="�ص�������">
	</form>
  </body>
</html>
