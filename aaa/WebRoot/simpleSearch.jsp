<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客人查询结果</title>
    
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
    This is my JSP page. <br>
    <br> <br> <br>
 
 <div align="center">
<h1><font size="7" face="华文行楷" color="#0080ff"> 客人详细信息</font>
 <br> <br>
 <%
    Connection conn;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=hotel","HSM-WIN7","123");
  %>
<% 
	request.setCharacterEncoding("UTF-8");
 	String str=request.getParameter("name");
 	out.print(str);
 %>
 <%
  	ResultSet rs = null;
	Statement stmt = null;
  	stmt=conn.createStatement(); 
	String sql="select * from guests where (guests.name= '"+str+"' or guests.certificate='"+str+"')  ";
	rs=stmt.executeQuery(sql);
 %></h1>
</div><center>
<table border=1>
	<td>房间号</td><td>游客姓名</td><td>性别</td><td>年龄</td><td>证件种类</td><td>证件号</td><td>国籍编码</td><td>抵达日期</td><td>拟走日期</td><td>目前状态</td>
 	<form action="" method="post" >
<% 	
  while(rs.next()) 
	{
	out.println("<tr>");
	out.println("<td>"+rs.getString("roomcode")+"</td>");
	out.println("<td>"+rs.getString("name")+"</td>");
	out.println("<td>"+rs.getString("sex")+"</td>");	
	out.println("<td>"+rs.getString("age")+"</td>");
 	out.println("<td>"+rs.getString("certclassno")+"</td>");
 	out.println("<td>"+rs.getString("certificate")+"</td>");
	out.println("<td>"+rs.getString("countryno")+"</td>");
	out.println("<td>"+rs.getString("arridate")+"</td>");
	out.println("<td>"+rs.getString("leftdate")+"</td>");
	}
  %>
  <%
  	rs.close(); 
	stmt.close(); 
	conn.close(); 
 %>  
 </table>
 <form action="" method="post" >
 <div align="center"><input type="button" value="返回继续查询" name="roomSearch" onclick="javascript:location.href='guestSearch.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
 <div align="center"><input type="button" value="返回主页" name="roomSearch" onclick="javascript:location.href='Manage.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
 </form> 
  </body>
</html>
