<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
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

<title>证件代码表维护界面</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
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
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=hotel";
		String userName = "HSM-WIN7";
		String userPwd = "123";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, userName,
				userPwd);
		Statement stmt = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
	%>

	<%
		String sql;
		ResultSet rs;

		sql = "select * from certclasses";
		rs = stmt.executeQuery(sql);
	%>

	<center class="style1"></center>
	<table width="502" border="1" align="center" height="126">
		<%
			out.println("<tr>");
			out.println("<td>证件代码 </td>");
			out.println("<td>证件类型  </td>");
			//在这里可以加一个入住按钮。
			out.println("</tr>");
		%>
		<%
			while (rs.next()) {
				out.println("<tr>");
				out.print("<td>" + rs.getString("certno") + "</td>");
				out.print("<td>" + rs.getString("certclass") + "</td>");
				out.println("</tr>");
		%>
		<%
			}//while end
		%>
		
		<%
			
		%>
	</table>
<form action="admin_zhengjiandaimabiaochaxun.jsp"
			name="guojiadaimabiaochaxun">
			<input type="submit" value="进入查询" />
		</form>
		<form action="admin_zhengjiandaimabiaoshanchu.jsp"
			name="guojiadaimabiaoshanchu">
			<input type="submit" value="进入删除" />
		</form>
		<form action="amdin_zhengjiandaimabiaoxiugai.jsp"
			name="guojiadaimabiaoxiugai">
			<input type="submit" value="进入修改" />
		</form>
		<form action="admin_zhengjiandaimabiaocharu.jsp"
			name="guojiadaimabiaocharu">
			<input type="submit" value="进入插入" />
		</form>

<div align="center"><input type="button" value="返回上一步" name="back" onclick="javascript:location.href='admin_other.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
<div align="center"><input type="button" value="返回管理员系统" name="gobackform" onclick="javascript:location.href='admincheck.jsp.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	</form>
</body>
</html>

