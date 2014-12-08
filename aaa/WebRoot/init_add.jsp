<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="charset" content="gb2312">
<base href="<%=basePath%>">

<title>住户登记</title>
<meta http-equiv="charset" content="gb2312">
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
		Connection conn;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=hotel","HSM-WIN7","123");
		Statement stmt = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmtcountry = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
	%>
	<center>房间信息初始化</center>
	<hr>
	<table width="400" align="center" border="1">

	</table>
	<form action="init_add_finish.jsp" method="post">
		<table width="400" align="center" border="1">
			<tr>
				<td width="100">房间编码：</td>
				<td>&nbsp;<input type="text" name="roomcode" width="15" />
				</td>
			</tr>
			<tr>
				<td width="100">房间号码：</td>
				<td>&nbsp;<input type="text" name="roomno" width="15" />
				</td>
			</tr>
			<tr>
				<td width="100">房间类型：</td>
                <td>&nbsp;<input type="text" name="roomno" width="15" />
				</td>
			<tr>
				<td width="100">房间状态：</td>
				<td>&nbsp;<input type="text" name="roomstate" width="15" />
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="提交" />
					 <input type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
	<%
		
		stmtcountry.close();
		stmt.close();
		conn.close();
	%>
</body>
</html>
