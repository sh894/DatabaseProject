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
<title>����</title>
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
		Statement stmtnewroomcode = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
	%>

	<%
		String sql;
		ResultSet rs;
		ResultSet rsnewroomcode;
	%>
	<form antion="guestchange.jsp" method=post name="chaxuntiaojian">
	<center>
		<table>
			<p>
			��������Ҫ�����ķ���ID
			</font> </a></p>
			<input type="text" name=nowroomcode>
			<p>
						��ѡ��Ҫ����ķ���ID</font> </a>
			</p>
			<%
				rsnewroomcode = stmtnewroomcode
						.executeQuery("select * from roomstate where roomstate='r'");
			%>
			<td><select name="newroomcode" width=15>
					<%
						while (rsnewroomcode.next()) {
					%>
					<option value="<%=rsnewroomcode.getString("roomcode")%>"><%=rsnewroomcode.getString("roomcode")%></option>
					<%
						}
					%>
			</select>
			</td>
		</table>
		<input type="submit" value="ȷ��" name=queding>
		
	</form>
	<form action="Manage.jsp" name="gobackform1">
			<input type="submit" id="goback1" name="goback1" value="�ص�������">
		</form>
		
	<%
		rsnewroomcode.close();
		stmtnewroomcode.close();
	%>
	<%
		request.setCharacterEncoding("gb2312");
		String nowroomcode = request.getParameter("nowroomcode");
		String newroomcode = request.getParameter("newroomcode");
		if (nowroomcode != "" && nowroomcode != null) {
			rs = stmt
					.executeQuery("select * from guests,countrycodes,certclasses,room "
							+ "where guests.certclassno=certclasses.certno and guests.countryno=countrycodes.countryno and guests.roomcode=room.roomcode and guests.roomcode='"
							+ nowroomcode + "'");
			if (!rs.next()) {
				out.println(request.getParameter("nowroomcode")
						+ " ����δ��ס���ˣ����Բ�����ɻ�����������ȷ����Ϣ");
	%>
	<input type="button" id="back" name="back" value="������һ��"
		onClick="javascript:history.go(-1)"> &nbsp; &nbsp;&nbsp;
	<form action="Manage.jsp" name="gobackform">
		<input type="submit" id="goback" name="goback" value="�ص�������">
	</form>
	</center>
	<%
		} else {//if (!rs.next())
				out.println("����ϸȷ��Ҫ�����Ŀ�����Ϣ,Ȼ���ٽ��л�������");
	%><br>
	<%
		out.println("��Ҫ�����ķ���" + nowroomcode + "��Ϣ:");
	%>
	<form action="guestchange_finish.jsp" method="post">
		<table width="400" align="center" border="1">
			<tr>
				<td width="100">������룺</td>
				<td>&nbsp;<input type="text" name="roomcode" width="15"
					value="<%=rs.getInt("roomcode")%>" />
				</td>
			</tr>
			<tr>
				<td width="100">������</td>
				<td>&nbsp;<input type="text" name="name" width="15"
					value="<%=rs.getString("name")%>" />
				</td>
			</tr>
			<tr>
				<td width="100">�Ա�</td>
				<td>&nbsp;<input type="text" name="sex"
					value="<%=rs.getString("sex")%>" />
				</td>
			<tr>
				<td width="100">���䣺</td>
				<td>&nbsp;<input type="text" name="age" width="15"
					value="<%=rs.getString("age")%>" />
				</td>
			</tr>

			<tr>
				<td width="100">֤�����ࣺ</td>
				<td>&nbsp;<input type="text" name="certno" width=15
					value="<%=rs.getString("certclass")%>" /></td>
			</tr>

			<tr>
				<td width="100">֤�����룺</td>
				<td>&nbsp;<input type="text" name="certificate" width=15
					value="<%=rs.getString("certificate")%>" />
				</td>
			</tr>

			<tr>
				<td width="100">����</td>
				<td>&nbsp;<input type="text" name="countryno" width=15
					value="<%=rs.getString("country")%>" /></td>
			</tr>
			<tr>
				<td width="100">�ִ����ڣ�</td>
				<td>&nbsp;<input type="text" name="arridate" width="15"
					value="<%=rs.getString("arridate")%>" />
				</td>
			</tr>
			<tr>
				<td width="100">�������ڣ�</td>
				<td>&nbsp;<input type="text" name="leftdate" width="15"
					value="<%=rs.getString("leftdate")%>" />
				</td>
			</tr>
			<tr>
				<td width="100">��ע��</td>
				<td colspan=3><textarea rows="15" cols="20" name="remarks"><%=rs.getString("remarks")%></textarea>
				</td>
			</tr>
		</table>
	</form>
	<%
		out.println("ȷ�Ϻ�ʵ�����������ť��ɻ���");
	%>
	<form action="guestchange_finish.jsp" method=post name="tijiao">
		<table>
		<%out.print("��"); %>
			<input type="text" name=now  value=<%=nowroomcode%>>
			<%out.print("�ŷ�  ����"); %>
			<input type="text" name=new value=<%=newroomcode%>>
			<%out.print("�ŷ�  "); %>
			<input type="submit" value="���л�������" name=huanfang>
		</table>
	</form>

	<%  }//in else end
		rs.close();
			stmt.close();
		}//if end

		else {
			//out.println("����������ȷ����Ϣ");
	%>


	<%
		}//else out end
	%>
	
</body>
</html>
