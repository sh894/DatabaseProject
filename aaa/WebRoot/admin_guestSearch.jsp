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

<title>����Ա������Ϣ��ѯ</title>

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
		String sql;
		ResultSet rs;
		request.setCharacterEncoding("gb2312");
		String chaxunneirong = request.getParameter("chaxunneirong");
		request.setCharacterEncoding("gb2312");
		String chaxuntiaojian = request.getParameter("chaxuntiaojian");
	%>
	<center>
	<form antion="searchcustomers.jsp" method=post name="chaxuntiaojian">
		<p>
					�������ѯ��׼</font> </a><font size=4 coler=red></font>
		</p>
		<select name="chaxunneirong">
			<option seleced value="guests.name">�ͻ�����</option>
			<option value="guests.certificate">�ͻ�֤������</option>
		</select>
		<p>
					�������ѯ����</font> </a>
		</p>
		<input type="text" name=chaxuntiaojian> <input type="submit"
			value="��ѯ" name=chaxuntiaojian>
	</form>
	<%
		if (chaxunneirong == null || chaxunneirong == ""
				|| chaxuntiaojian == null || chaxuntiaojian == "") {
	%>
	<%
		}//if(chaxunbiaozhun==null||chaxuntiaojian==null) end 
		else {
	%>
	<%
		sql = "select * from guests,countrycodes,certclasses,room "
					+ "where guests.certclassno=certclasses.certno and guests.countryno=countrycodes.countryno and guests.roomcode=room.roomcode "
					+ "and " + chaxunneirong + "='" + chaxuntiaojian + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
			out.println(rs.getString("roomno") + "����");
	%>

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
			<td colspan=3><textarea rows="5" cols="20" name="remarks"><%=rs.getString("remarks")%></textarea>
			</td>
		</tr>
	
	</table>
	</center>
	<%
		rs.close();
				stmt.close();
				conn.close();
			}//ifin end
			else {
				out.println("��λ�˿���δ��ס���Ƶ꣬��ȷ��������Ϣ");
			}
		}//elseend
	%>
		<div align="center"><input type="button" value="������ҳ" name="back" onclick="javascript:location.href='admincheck.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
		<div align="center"><input type="button" value="���µ�¼" name="goback" onclick="javascript:location.href='Managelogin.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
</body>
</html>
