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
<title>���ķ���״̬����</title>

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
		{out.println("��Ϣ�����������˳���ģ�飬����ȷ����Ϣ");}else{
		rs = stmtsearch
				.executeQuery("select * from roomstate where roomcode='"
						+ roomcode + "'");
		rs.next();
	%>

	<form action="changeroomstate_action.jsp" method="post">
		<%
			out.println("��Ҫ����״̬�ķ���ţ�");
		%>
		<input type="text" name="str" value="<%=roomcode%>"> <br>
		<%
			out.println("��Ҫ����״̬�ķ�����޸�ǰ״̬����");
		%>
		<%
			if (rs.getString("roomstste").startsWith("z")) {
		%>
		<input type="text" name=roomststeold value="����">
		<%
			}
			if (rs.getString("roomstste").startsWith("o")) {
		%>
		<input type="text" name=roomststeold value="����">

		<%
			}
		%>
		<br>
		<%
			out.println("��Ҫ����״̬�ķ�����޸ĺ�״̬����");
		%>

		<select name="roomstste">
			<option value="r">����</option>
			<option value="z">����</option>
			<option value="o">����</option>
		</select> 
		<br> <input type="submit" value="���ķ���״̬" />
	</form>
	<%rs.close();
		}
		conn.close();
	%>
		<input type="button" id="back" name="back" value="������һ��"
		onClick="javascript:history.go(-1)"> &nbsp; &nbsp;&nbsp;
	<form action="management.jsp" name="gobackform">
		<input type="submit" id="goback" name="goback" value="�ص�������">
	</form>
</body>
</html>
