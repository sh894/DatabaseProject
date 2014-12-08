<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>初始化清空</title>
    
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
    <%
    Connection conn;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=hotel","HSM-WIN7","123");
  %>

<% 
	request.setCharacterEncoding("UTF-8");
 	String str=request.getParameter("name");
 %>
 <%
  	ResultSet rs = null;
	Statement stmt = null;
  	stmt=conn.createStatement(); 
	String sql="delete from guests";
	String sql1="update roomstate set roomstate='r'";
	rs=stmt.executeQuery(sql);
	out.print("删除数据成功");
	rs=stmt.executeQuery(sql1);
	out.print("将房间状态全部置为可租");
 %>
  </body>
</html>
