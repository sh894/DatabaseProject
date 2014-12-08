<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<html>
	<head>
	<title>
	退房
	</title>
	</head>
	<body bgcolor="">
		<script type="text/javascript">
		function name()
		{
			document.l.action="guestcheckout.jsp";
			l.submit();
		}
		function tui()
		{
			document.l.action="guestcheckout_finish.jsp";
			l.submit();
		}
		</script>
		<form name="l" action="" method="post">
		<font color="#8000ff">选择您要退房的房号：</font>
		<input type="text" name="roomcode" size=20>
		<br><input type="submit" value="显示姓名" onclick="name()"><br>
		<%
		try
		{
		Connection conn;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=hotel","HSM-WIN7","123");
		
		request.setCharacterEncoding("gb2312");
		String roomno=request.getParameter("roomcode");
		
		out.print("您选择的房号：");
		out.print("<input name='r' type='text' value="+roomno+"><br>");
		out.print("所选房间顾客姓名:<br>");
		out.print("<select name='name' size='10' style='width:50'>");
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select name from guests where roomno='"+roomno+"'");
		while(rs.next())
		{
			out.print("<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
		}
		stmt.close();
		rs.close();
		out.print("</select><br>");
		conn.close();
		}catch(Exception e){out.print(e.getMessage());}
		%>
		<input type="submit" value="退房" onclick="tui()">
		</form>
		<a href="Manage.jsp">返回主页</a>
	</body>
</html>