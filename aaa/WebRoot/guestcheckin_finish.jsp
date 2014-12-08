<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
	<title>
	入住成功
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
		
		String roomno=request.getParameter("roomno");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		int age=Integer.parseInt(request.getParameter("age"));
		String certclassno=request.getParameter("certclass");
		String certificate=request.getParameter("certno");
		String countryno=request.getParameter("countryclass");
		String arridate=request.getParameter("aYear");
		String leftdate=request.getParameter("gYear");
		String remarks=request.getParameter("remarks");
		if(remarks==null) remarks="";
		String price=request.getParameter("price");
		if(price==null) price="";
		
		Statement stmt=conn.createStatement();
		String s1="insert into guests values ('"+roomno+"','"+name+"','"+sex+"','"+age+"','"+certclassno+"','"+certificate+"','"+countryno+"','"+arridate+"','"+leftdate+"','"+remarks+"','"+price+"')";
		String s2="update roomstate set roomstate='住人' where roomcode=(select roomcode from room where roomno='"+roomno+"')";
		out.print(s1);
		out.print(s2);
		stmt.executeUpdate(s1);
		stmt.executeUpdate(s2);
		//conn.commit();
		stmt.close();
		conn.close();
		out.print("入住登记已完成");
		}catch(Exception e){out.print("插入数据库失败!");}
		%>
	</body>
</html>