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

<title>�����������</title>

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
		String nowroomcode = request.getParameter("now");
		String newroomcode = request.getParameter("new");
	%>
	<%
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=hotel";
		String userName = "HSM-WIN7";
		String userPwd = "123";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, userName,
				userPwd);
		Statement stmtnowroomcode = conn.createStatement(
				//����ɾ���ɼ�¼
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmtnewroomcode = conn.createStatement(
				//���ڲ����¼�¼
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmtsearchnowroomcode = conn.createStatement(
				//���ݾɷ���Ŷ�ȡ������Ϣ
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmtdeletenowroomcode = conn.createStatement(
				//���ݾɷ����ɾ��������Ϣ
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement changenowroomcodestate = conn.createStatement(
				//�����޸ľɷ����״̬
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement changenewroomcodestate = conn.createStatement(
				//�����޸��·����״̬
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		ResultSet rsnowroomcode;
		ResultSet rsnewroomcode;
		ResultSet rssearchnowroomcode;
		rssearchnowroomcode = stmtsearchnowroomcode
				.executeQuery("select * from guests where roomcode='"
						+ nowroomcode + "'");
		rssearchnowroomcode.next();
		String insertsql = "insert into guests values ('" + newroomcode
				+ "','" + rssearchnowroomcode.getString("name") + "','"
				+ rssearchnowroomcode.getString("sex") + "','"
				+ rssearchnowroomcode.getString("age") + "','"
				+ rssearchnowroomcode.getString("certclassno") + "','"
				+ rssearchnowroomcode.getString("certificate") + "','"
				+ rssearchnowroomcode.getString("countryno") + "','"
				+ rssearchnowroomcode.getString("arridate") + "','"
				+ rssearchnowroomcode.getString("leftdate") + "','"
				+ rssearchnowroomcode.getString("remarks") + "');";
		stmtnewroomcode.executeUpdate(insertsql);
		stmtdeletenowroomcode
				.executeUpdate("delete from guests where roomcode='"
						+ nowroomcode + "'");
		changenowroomcodestate
				.executeUpdate("update roomstate set roomstate='z' where roomcode='"
						+ nowroomcode + "'");
		changenewroomcodestate
				.executeUpdate("update roomstate set roomstate='l' where roomcode='"
						+ newroomcode + "'");
		rssearchnowroomcode.close();
		stmtsearchnowroomcode.close();
		stmtnewroomcode.close();
		stmtdeletenowroomcode.close();
		changenowroomcodestate.close();
		changenewroomcodestate.close();
		conn.close();
		out.println("���������ɹ������������");
	%>

	<form name="chaxunfangjiandegezhongxinxiform" action="roomSearch.jsp">
		<p align="center">
			<input type="submit" name="submit" value="�鿴�������">
		</p>
	</form>
	<p align="center">
		&nbsp;&nbsp;&nbsp; <input type="button" id="back" name="back"
			value="������һ��" onClick="javascript:history.go(-1)"> &nbsp;
		&nbsp;&nbsp;
	</p>
	<form action="Manage.jsp" name="gobackform">
		<p align="center">
			<input type="submit" id="goback" name="goback" value="�ص�������">
		</p>
	</form>
</body>
</html>
