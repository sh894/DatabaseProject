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

<title>���Ҵ�����޸�</title>
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
						�������ѯ��׼</font> </a><font size=4 coler=red></font>
			</p>
			<select name="chaxunbiaozhun">
				<option seleced value="countryno">���Ҵ���</option>
				<option value="country">����</option>

			</select>
			<p>
						�������ѯ����</font> </a>
			</p>
			<input type="text" name=tiaojian>
			<input type="submit" value="�����޸���" name=chaxun>
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
		<p>δ�ҵ�������������Ϣ
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
				<td width="100">�ɹ��Ҵ��룺</td>
				<td>&nbsp;<input type="text" name="oldcountryno" width="15"
					value=<%=rs.getString("countryno")%> /></td>
			</tr>
			<tr>
				<td width="100">�ɹ������ƣ�</td>
				<td>&nbsp;<input type="text" name="oldcountry" width="15"
					value=<%=rs.getString("country")%> /></td>
			</tr>
			<tr>
				<td width="100">�¹��Ҵ��룺</td>
				<td>&nbsp;<input type="text" name="countryno" width="15" /></td>
			</tr>
			<tr>
				<td width="100">�¹������ƣ�</td>
				<td>&nbsp;<input type="text" name="country" width="15" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="ȷ���޸�" /> | <input type="reset" value="����" />
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
	<div align="center"><input type="button" value="������һ��" name="back" onclick="javascript:location.href='admin_guojiadaimabiaochaxun.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<div align="center"><input type="button" value="���ع���Աϵͳ" name="gobackform" onclick="javascript:location.href='admincheck.jsp.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<%
		stmt.close();
		conn.close();
	%>

</body>
</html>
