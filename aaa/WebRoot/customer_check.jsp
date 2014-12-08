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
		Statement stmtcountry = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
	%>
	<center>住户登记</center>
	<hr>
	<table width="400" align="center" border="1">

	</table>
	<form action="guestcheckin_finish.jsp" method="post">
		<table width="400" align="center" border="1">
			<tr>
				<td width="100">房间编码：</td>
				<td>&nbsp;<input type="text" name="roomcode" width="15"
					value="<%=request.getParameter("str")%>" />
				</td>
			</tr>
			<tr>
				<td width="100">姓名：</td>
				<td>&nbsp;<input type="text" name="name" width="15" />
				</td>
			</tr>
			<tr>
				<td width="100">性别：</td>
				<td>&nbsp;<input type="radio" name="sex" value="男" checked />男
					<input type="radio" name="sex" value="女" />女</td>
			<tr>
				<td width="100">年龄：</td>
				<td>&nbsp;<input type="text" name="age" width="15" />
				</td>
			</tr>
			<%
				ResultSet rs = stmt.executeQuery("select * from certclasses");
			%>
			<tr>
				<td width="100">证件种类：</td>
				<td>&nbsp;<select name="certclassno">
						<%
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("certno")%>"><%=rs.getString("certclass")%></option>
						<%
							}
						%>
				</select></td>
			</tr>

			<tr>
				<td width="100">证件号码：</td>
				<td>&nbsp;<input type="text" name="certificate" width="15" />
				</td>
			</tr>
			<%
				ResultSet rscontrycodes = stmtcountry
						.executeQuery("select * from countrycodes");
			%>
			<tr>
				<td width="100">国别：</td>
				<td>&nbsp;<select name="countryno">
						<%
							while (rscontrycodes.next()) {
						%>
						<option value="<%=rscontrycodes.getString("countryno")%>"><%=rscontrycodes.getString("country")%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td width="100">抵达日期：</td>
				<td>&nbsp;<input type="text" name="arridate" width="15" />
				</td>
			</tr>
			<tr>
				<td width="100">拟走日期：</td>
				<td>&nbsp;<input type="text" name="leftdate" width="15" />
				</td>
			</tr>
			<tr>
				<td width="100">备注：</td>
				<td colspan=3><textarea rows="5" cols="20" name="remarks"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="提交" />
					| <input type="reset" value="重置" /></td>
			</tr>



		</table>
	</form>
	<%
		rs.close();
		stmtcountry.close();
		stmt.close();
		conn.close();
	%>
	<input type="button" id="back" name="back" value="返回上一步"
		onClick="javascript:history.go(-1)">
</body>
</html>
