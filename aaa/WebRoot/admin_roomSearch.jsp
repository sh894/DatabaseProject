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

<title>管理员查询房间的各种信息</title>
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
	%>

	<%
		String sql;
		ResultSet rs;
		request.setCharacterEncoding("gb2312");
		String chaxunbiaozhun = request.getParameter("chaxunbiaozhun");

		request.setCharacterEncoding("gb2312");
		String chaxuntiaojian = request.getParameter("tiaojian");
		if(chaxunbiaozhun!=null){
		if(chaxunbiaozhun.startsWith("roomstate.roomstate"))
		{
		if (chaxuntiaojian.startsWith("住人"))
			chaxuntiaojian = "l";
		if (chaxuntiaojian.startsWith("整理"))
			chaxuntiaojian = "z";
		if (chaxuntiaojian.startsWith("可租"))
		chaxuntiaojian = "r";
		if (chaxuntiaojian.startsWith("故障"))
			chaxuntiaojian = "o";
			}}
		System.out.print(chaxunbiaozhun);

		System.out.println(chaxuntiaojian);
		if (chaxunbiaozhun == null || chaxunbiaozhun == ""
				|| chaxuntiaojian == null || chaxuntiaojian == "") {

			sql = "select room.roomcode,room.roomno,roomclass.class,roomclass.bed,roomclass.price,roomstate.roomstate "
					+ "from room ,roomclass,roomstate "
					+ "where room.classno=roomclass.classno and room.roomcode=roomstate.roomcode";
			rs = stmt.executeQuery(sql);
	%>

	<center class="style1"></center>
	<table width="502" border="1" align="center" height="126">
		<%
			out.println("<tr>");
				out.println("<td>房间ID </td>");
				out.println("<td>房间号  </td>");
				out.println("<td>房间类型  </td>");
				out.println("<td>床位数 </td> ");
				out.println("<td>价格（元/天） </td>");
				out.println("<td>房间状态 </td>");
				out.println("<td>操作</td>");
				//在这里可以加一个入住按钮。
				out.println("</tr>");
		%>
		<%
			while (rs.next()) {
					out.println("<tr>");
					out.print("<td>" + rs.getInt("roomcode") + "</td>");
					out.print("<td>" + rs.getString("roomno") + "</td>");
					out.print("<td>" + rs.getString("class") + "</td>");
					out.print("<td>" + rs.getInt("bed") + "</td>");
					out.print("<td>" + rs.getInt("price") + "</td>");
					if (rs.getString("roomstate").startsWith("r"))
						out.print("<td><font color=red size=4 >可租</font></td> ");
					if (rs.getString("roomstate").startsWith("z"))
						out.print("<td><font color=blue size=4 >整理</font></td> ");
					if (rs.getString("roomstate").startsWith("o"))
						out.print("<td><font color=gray size=4 >故障</font></td> ");
					if (rs.getString("roomstate").startsWith("l"))
						out.print("<td><font color=black size=4 >住人</font></td> ");

					if (rs.getString("roomstate").startsWith("r"))
						out.print("<td><a href='guestcheckin.jsp?str="
								+ rs.getInt("roomcode") + "'>登记入住</a></td> ");
					if (rs.getString("roomstate").startsWith("z"))
						out.print("<td><a href='guestchange.jsp?str="
								+ rs.getInt("roomcode") + "'>更改状态</a></td> ");
					if (rs.getString("roomstate").startsWith("o"))
						out.print("<td><a href='guestchange.jsp?str="
								+ rs.getInt("roomcode") + "'>更改状态</a></td> ");
					if (rs.getString("roomstate").startsWith("l"))
						out.print("<td><a href='guestSearch.jsp?str="
								+ rs.getInt("roomcode") + "'>客人信息</a></td> ");
					out.println("</tr>");
		%>
		<%
			}//while end
		%>
		<%
			
		%>
	</table>


	<form antion="roomSearch.jsp" method=post name="chaxuntiaojian">
		<table>
			<p>
				<a href=Manage.jsp"><font color=red size=4 face="楷体">
						请输入查询标准</font> </a><font size=4 coler=red></font>
			</p>
			<select name="chaxunbiaozhun">
				<option seleced value="room.roomcode">房间ID</option>
				<option value="room.roomno">房间号</option>
				<option value="roomclass.class">房间类型</option>
				<option value="roomclass.bed">床位数</option>
				<option value="roomclass.price">价钱</option>
				<option value="roomstate.roomstste">房间状态</option>
				<option value="guests.name">客户姓名</option>
			</select>
			<p>
				<a href=Manage.jsp"><font color=red size=4 face="楷体">
						请输入查询条件</font> </a>
			</p>
			<input type="text" name=tiaojian>
			<input type="submit" value="查询" name=chaxun>
		</table>
	</form>
	<%
		}//if(chaxunbiaozhun==null||chaxuntiaojian==null) end 
		else {
	%>
	<%
		sql = "select * "
					+ "from room left join guests on room.roomcode=guests.roomcode,roomclass,roomstate "
					+ "where room.classno=roomclass.classno and room.roomcode=roomstate.roomcode and "
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
						out.print("<td>" + rs.getInt("roomcode") + "</td>");
						out.print("<td>" + rs.getString("roomno") + "</td>");
						out.print("<td>" + rs.getString("class") + "</td>");
						out.print("<td>" + rs.getInt("bed") + "</td>");
						out.print("<td>" + rs.getInt("price") + "</td>");
						if (rs.getString("roomstste").startsWith("r"))
							out.print("<td><font color=red size=4 >可租</font></td> ");
						if (rs.getString("roomstste").startsWith("z"))
							out.print("<td><font color=blue size=4 >整理</font></td> ");
						if (rs.getString("roomstste").startsWith("o"))
							out.print("<td><font color=gray size=4 >故障</font></td> ");
						if (rs.getString("roomstste").startsWith("l"))
							out.print("<td><font color=black size=4 >住人</font></td> ");

						if (rs.getString("roomstste").startsWith("r"))
							out.print("<td><a href='guestcheckin.jsp?str="
									+ rs.getInt("roomcode")
									+ "'>登记入住</a></td> ");
						if (rs.getString("roomstste").startsWith("z"))
							out.print("<td><a href='changeroomstate.jsp?str="
									+ rs.getInt("roomcode")
									+ "'>更改状态</a></td> ");
						if (rs.getString("roomstste").startsWith("o"))
							out.print("<td><a href='changeroomstate.jsp?str="
									+ rs.getInt("roomcode")
									+ "'>更改状态</a></td> ");
						if (rs.getString("roomstste").startsWith("l"))
							out.print("<td><a href='guestSearch.jsp?str="
									+ rs.getInt("roomcode")
									+ "'>客人信息</a></td> ");
						out.println("</tr>");
		%>
		<%
			} while (rs.next());//while end
		%>
	</table>
	<%
		}//elseend
	%>
	<%
		}//elseend
	%>
	<input type="button" id="back" name="back" value="返回上一步"
		onClick="javascript:history.go(-1)"> &nbsp; &nbsp;&nbsp;
	<form action="root_management.jsp" name="gobackform">
		<input type="submit" id="goback" name="goback" value="回到主界面">
	</form>
	<%
		rs.close();
		stmt.close();
		conn.close();
	%>

</body>
</html>
