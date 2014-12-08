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

<title>国家代码表维护界面</title>
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
<center>
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

		sql = "select * from countrycodes";
		rs = stmt.executeQuery(sql);
	%>

	<center class="style1"></center>
	<table width="502" border="1" align="center" height="126">
		<%
			out.println("<tr>");
			out.println("<td>国家代码 </td>");
			out.println("<td>国家名称  </td>");
			
			out.println("</tr>");
		%>
		<%
			while (rs.next()) {
				out.println("<tr>");
				out.print("<td>" + rs.getString("countryno") + "</td>");
				out.print("<td>" + rs.getString("country") + "</td>");
				out.println("</tr>");
		%>
		<%
			}//while end
		%>
		
		<%
			
		%>
	</table>
	</center>
	<center>
<form action="admin_guojiadaimabiaochaxun.jsp"
			name="guojiadaimabiaochaxun">
			<input type="submit" value="进入查询" />
		</form>
		<form action="admin_guojiadaimabiaoshanchu.jsp"
			name="guojiadaimabiaoshanchu">
			<input type="submit" value="进入删除" />
		</form>
		<form action="admin_guojiadaimabiaoxiugai.jsp"
			name="guojiadaimabiaoxiugai">
			<input type="submit" value="进入修改" />
		</form>
		<form action="admin_guojiadaimabiaocharu.jsp"
			name="guojiadaimabiaocharu">
			<input type="submit" value="进入插入" />
		</form>
</center>
<div align="center"><input type="button" value="返回上一步" name="back" onclick="javascript:location.href='admin_other.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
<div align="center"><input type="button" value="返回管理员系统" name="gobackform" onclick="javascript:location.href='admincheck.jsp.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
</body>
</html>
