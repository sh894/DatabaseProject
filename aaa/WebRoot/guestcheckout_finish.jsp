<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
	<title>
	</title>
	</head>
	<body>
	<%
		try
		{
		Connection conn;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=hotel","HSM-WIN7","123");
		
		request.setCharacterEncoding("gb2312");	
		String roomno=request.getParameter("r");
		String name=request.getParameter("name");
		out.print(roomno+"roomcode  ");
		Statement stmt=conn.createStatement();
		String s1="delete guests where roomcode='"+roomno+"' and name='"+name+"'"; 
		String s2="update roomstate set roomstate='可租' where roomcode=(select roomcode from room where roomno='"+roomno+"')";
		stmt.executeUpdate(s1);
		stmt.executeUpdate(s2);
		conn.commit();
		stmt.close();
		conn.close();
		out.print("退房已完成");
		}catch(Exception e){
		 e.printStackTrace();
		 out.print("退房失败");};
		%>
	</body>
</html>