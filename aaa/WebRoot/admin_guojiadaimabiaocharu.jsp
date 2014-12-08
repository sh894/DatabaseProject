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
		

		String countryno = request.getParameter("countryno");
		String country = request.getParameter("country");
System.out.println(countryno);
					System.out.println(country);
		if (countryno == null || countryno == ""
				|| country == null || country == "") {
	%>
	
	<form action="admin_guojiadaimabiaocharu.jsp" method="post">
		<table width="400" align="center" border="1">
			
				<td width="100">新国家代码：</td>
				<td>&nbsp;<input type="text" name="countryno" width="15" />
				</td>
			</tr>
			<tr>
				<td width="100">新国家名称：</td>
				<td>&nbsp;<input type="text" name="country" width="15" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="确认插入" /> | <input type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>

	<%	}//if(chaxunbiaozhun==null||chaxuntiaojian==null) end 
		else { %>
	
	<%
	

			stmt.executeUpdate("insert into countrycodes values('"+countryno+"','"+country+"')");
			out.println("插入成功");
	%>
	
	<%
	
		}//elseend
	%>
	<div align="center"><input type="button" value="返回上一步" name="back" onclick="javascript:location.href='admin_guojiadaimabiaochaxun.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<div align="center"><input type="button" value="返回管理员系统" name="gobackform" onclick="javascript:location.href='admincheck.jsp.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<%
		stmt.close();
		conn.close();
	%>

</body>
</html>
