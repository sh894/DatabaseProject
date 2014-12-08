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

<title>证件代码表删除</title>
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
	<form action="admin_zhengjiandaimabiaoshanchu.jsp" method=post name="chaxuntiaojian">
		<table>
			<p>
						请输入删除标准</font> </a><font size=4 coler=red></font>
			</p>
			<select name="chaxunbiaozhun">
				<option seleced value="certno">证件代码</option>
				<option value="certclass">证件类型</option>
				
			</select>
			<p>
						请输入删除条件</font> </a>
			</p>
			<input type="text" name=tiaojian>
			<input type="submit" value="确认删除" name=chaxun>
		</table>
	</form>
	<%
		}//if(chaxunbiaozhun==null||chaxuntiaojian==null) end 
		else {
	%>
	<%
		sql = "select * "
					+ "from certclasses "
					+ "where "
					+ chaxunbiaozhun + "='" + chaxuntiaojian + "'";

			rs = stmt.executeQuery(sql);
			if (!rs.next()) {
	%>
	<center>
		<p>未找到要删除的信息请重新确认输入
		<p>
	</center>
	<%
		} else {
	%>
	
		<%
		stmtdelete.executeUpdate("delete from certclasses where "+chaxunbiaozhun+"='"+chaxuntiaojian+"'");
			System.out.print(chaxunbiaozhun);
			System.out.println(chaxuntiaojian);
			
		%>
		<center>
		<p>删除成功。
		<p>
	</center>
	
	<%
		}//elseend
	%>
	<%
		rs.close();}//elseend
	%>
	<div align="center"><input type="button" value="返回上一步" name="back" onclick="javascript:location.href='admin_zhengjiandaimaweihu.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<div align="center"><input type="button" value="返回管理员系统" name="gobackform" onclick="javascript:location.href='admincheck.jsp.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
	<%
	
		stmt.close();
		conn.close();
	%>

</body>
</html>

