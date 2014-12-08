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
<title>更改房间状态操作</title>

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
		String roomcode = request.getParameter("str");
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=hotel";
		String userName = "sa";
		String userPwd = "123";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, userName,
				userPwd);
		Statement stmtsearch = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		ResultSet rs;
		Statement stmtchange = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		if(roomcode==null||roomcode=="")
		{out.println("信息输入有误请退出该模块，重新确认信息");}else{
		rs = stmtsearch
				.executeQuery("select * from roomstate where roomcode='"
						+ roomcode + "'");
		rs.next();
	%>

	<form action="changeroomstate_action.jsp" method="post">
		<%
			out.println("需要更改状态的房间号：");
		%>
		<input type="text" name="str" value="<%=roomcode%>"> <br>
		<%
			out.println("需要更改状态的房间的修改前状态：：");
		%>
		<%
			if (rs.getString("roomstste").startsWith("z")) {
		%>
		<input type="text" name=roomststeold value="整理">
		<%
			}
			if (rs.getString("roomstste").startsWith("o")) {
		%>
		<input type="text" name=roomststeold value="故障">

		<%
			}
		%>
		<br>
		<%
			out.println("需要更改状态的房间的修改后状态：：");
		%>

		<select name="roomstste">
			<option value="r">可租</option>
			<option value="z">整理</option>
			<option value="o">故障</option>
		</select> 
		<br> <input type="submit" value="更改房间状态" />
	</form>
	<%rs.close();
		}
		conn.close();
	%>
		<input type="button" id="back" name="back" value="返回上一步"
		onClick="javascript:history.go(-1)"> &nbsp; &nbsp;&nbsp;
	<form action="management.jsp" name="gobackform">
		<input type="submit" id="goback" name="goback" value="回到主界面">
	</form>
</body>
</html>
