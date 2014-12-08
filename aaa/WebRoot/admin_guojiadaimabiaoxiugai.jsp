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

<title>国家代码表修改</title>
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
		Statement stmtdelete = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmtinsert = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
	%>

	<%
		String sql;
		ResultSet rs;
		request.setCharacterEncoding("gb2312");
		String chaxunbiaozhun = request.getParameter("chaxunbiaozhun");

		request.setCharacterEncoding("gb2312");

		String chaxuntiaojian = request.getParameter("tiaojian");

		if (chaxunbiaozhun == null || chaxunbiaozhun == ""
				|| chaxuntiaojian == null || chaxuntiaojian == "") {
	%>
	<form action="admin_guojiadaimabiaoxiugai.jsp" method=post
		name="chaxuntiaojian">
		<table>
			<p>
						请输入查询标准</font> </a><font size=4 coler=red></font>
			</p>
			<select name="chaxunbiaozhun">
				<option seleced value="countryno">国家代码</option>
				<option value="country">国家</option>

			</select>
			<p>
						请输入查询条件</font> </a>
			</p>
			<input type="text" name=tiaojian>
			<input type="submit" value="查找修改项" name=chaxun>
		</table>
	</form>
	<%
		}//if(chaxunbiaozhun==null||chaxuntiaojian==null) end 
		else {
	%>
	<%
		sql = "select * " + "from countrycodes " + "where "
					+ chaxunbiaozhun + "='" + chaxuntiaojian + "'";

			rs = stmt.executeQuery(sql);
			if (!rs.next()) {
	%>
	<center>
		<p>未找到符合条件的信息
		<p>
	</center>
	<%
		} else {
	%>
	<table width="502" border="1" align="center" height="126">
		<%
			do {
						out.println("<tr>");
						out.print("<td>" + rs.getString("countryno") + "</td>");
						out.print("<td>" + rs.getString("country") + "</td>");
						out.println("</tr>");
		%>
		<%
			} while (rs.next());//while end

					rs.first();
		%>
	</table>
	<form action="admin_guojiadaimabiaoxiugai_action.jsp" method="post">
		<table width="400" align="center" border="1">
			<tr>
				<td width="100">旧国家代码：</td>
				<td>&nbsp;<input type="text" name="oldcountryno" width="15"
					value=<%=rs.getString("countryno")%> /></td>
			</tr>
			<tr>
				<td width="100">旧国家名称：</td>
				<td>&nbsp;<input type="text" name="oldcountry" width="15"
					value=<%=rs.getString("country")%> /></td>
			</tr>
			<tr>
				<td width="100">新国家代码：</td>
				<td>&nbsp;<input type="text" name="countryno" width="15" /></td>
			</tr>
			<tr>
				<td width="100">新国家名称：</td>
				<td>&nbsp;<input type="text" name="country" width="15" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="确认修改" /> | <input type="reset" value="重置" />
				</td>
			</tr>
		</table>
	</form>

	<%
		}

		}//elseend
	%>
	<%
		
	%>
	<div align="center"><input type="button" value="返回上一步" name="back" onclick="javascript:location.href='admin_guojiadaimabiaochaxun.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<div align="center"><input type="button" value="返回管理员系统" name="gobackform" onclick="javascript:location.href='admincheck.jsp.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<%
		stmt.close();
		conn.close();
	%>

</body>
</html>
