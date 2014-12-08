<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登记住客信息结果反馈</title>

<title>done</title>

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
	<%
		request.setCharacterEncoding("gb2312");
		
	%>
	<%
		Connection conn;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=hotel","HSM-WIN7","123");
		Statement stmt = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmtupdate = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement searchguestsmemory = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
				

		String insertsql = "insert into room values ('"
				+ request.getParameter("roomcode") + "','"

				+ request.getParameter("roomno") + "','"
				+ request.getParameter("roomno") + "','"
				+ request.getParameter("classno") + "');";
		stmt.executeUpdate(insertsql);
		
		String insertsql1 = "insert into roomstate values ('"
				+ request.getParameter("roomcode") + "','"				
				+ request.getParameter("roomstate") + "');";
		
		
		stmtupdate.executeUpdate(insertsql1);

		out.println("初始换信息完毕");

		stmt.close();
		stmtupdate.close();
		conn.close();
	%>
	<form action="init.jsp" name="上一页"></form>
	<form action="Manage.jsp" name="gobackform">
		<input type="submit" id="goback" name="goback" value="回到主界面">
	</form>

</body>
</html>
