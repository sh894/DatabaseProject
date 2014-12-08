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
    <title>房间查询结果</title>
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
    <br> <br> <br>
 <div align="center">
<h1><font size="7" face="华文行楷" color="#0080ff"> 客房详细信息</font>
 <br> <br>
 <%
    Connection conn;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=hotel","HSM-WIN7","123");
 %>
 <% 
	request.setCharacterEncoding("UTF-8");
 	String str=request.getParameter("name");
 	String s1=request.getParameter("房间类型");
 	String s2=request.getParameter("房间状态");

 %>
 <%
  	ResultSet rs = null;
  	ResultSet rs1 = null;
  	ResultSet rs2 = null;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
  	stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); 
  	stmt1=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); 
  	stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); 
	String sql="select distinct * from room,roomclass,roomstate where room.roomcode=roomstate.roomcode and roomclass.classno=room.classno and (room.roomcode='"+str+"' or room.roomno='"+str+"')";
	String sql1="select distinct * from room,roomclass,roomstate where room.roomcode=roomstate.roomcode and roomclass.classno=room.classno and(roomclass.class='"+s1+"')";
	String sql2="select distinct * from room,roomclass,roomstate where room.roomcode=roomstate.roomcode and roomclass.classno=room.classno and(roomstate.roomstate='"+s2+"')";
	rs=stmt.executeQuery(sql);
	rs1=stmt1.executeQuery(sql1);
	rs2=stmt2.executeQuery(sql2);
 %></h1>
</div><center>
<table border=1>
	<td>房间编号</td><td>房间号码</td><td>房间类型</td><td>房间分类号</td><td>剩余床位</td><td>房间状态</td><td>床铺数</td><td>价格</td><td>备注</td>
 	<form action="" method="post" >
<% 	
  while(rs.next()) 
	{
	out.println("<tr>");
	out.println("<td>"+rs.getString("roomcode")+"</td>");
	out.println("<td>"+rs.getString("roomno")+"</td>");
	out.print("<td>"+rs.getString("class")+"</td>");
	
	out.println("<td>"+rs.getString("classno")+"</td>");	
	out.println("<td>"+rs.getString("leftbeds")+"</td>");
	//out.println("<td>"+rs.getString("roomstate")+"</td>");
	
 	if (rs.getString("roomstate").startsWith("r"))
						out.print("<td>可租</td> ");
					if (rs.getString("roomstate").startsWith("z"))
						out.print("<td>整理</td> ");
					if (rs.getString("roomstate").startsWith("o"))
						out.print("<td>故障</td> ");
					if (rs.getString("roomstate").startsWith("l"))
						out.print("<td>住人</td> ");
	
 	out.println("<td>"+rs.getString("bed")+"</td>");
	out.println("<td>"+rs.getString("price")+"</td>");
	out.println("<td>"+rs.getString("remarks")+"</td>");
	}
  %>
  <%
  rs.close(); 
  stmt.close();
  %>
  <%
   %>
  <%
   while(rs1.next()) 
	{
	out.println("<tr>");
	out.println("<td>"+rs1.getString("roomcode")+"</td>");
	out.println("<td>"+rs1.getString("roomno")+"</td>");
	out.print("<td>"+rs1.getString("class")+"</td>");
	
	out.println("<td>"+rs1.getString("classno")+"</td>");	
	out.println("<td>"+rs1.getString("leftbeds")+"</td>");
	//out.println("<td>"+rs1.getString("roomstate")+"</td>");
	 	if (rs1.getString("roomstate").startsWith("r"))
						out.print("<td>可租</td> ");
					if (rs1.getString("roomstate").startsWith("z"))
						out.print("<td>整理</td> ");
					if (rs1.getString("roomstate").startsWith("o"))
						out.print("<td>故障</td> ");
					if (rs1.getString("roomstate").startsWith("l"))
						out.print("<td>住人</td> ");
 	out.println("<td>"+rs1.getString("bed")+"</td>");
	out.println("<td>"+rs1.getString("price")+"</td>");
	out.println("<td>"+rs1.getString("remarks")+"</td>");
	}
   %>
   <% 
   rs1.close();
   stmt1.close();
   %>
   <%
    while(rs2.next()) 
	{
	
	out.println("<tr>");
	out.println("<td>"+rs2.getString("roomcode")+"</td>");
	out.println("<td>"+rs2.getString("roomno")+"</td>");
	out.print("<td>"+rs2.getString("class")+"</td>");
	
	out.println("<td>"+rs2.getString("classno")+"</td>");	
	out.println("<td>"+rs2.getString("leftbeds")+"</td>");
	out.println("<td>"+rs2.getString("roomstate")+"</td>");
	 	if (rs2.getString("roomstate").startsWith("r"))
						out.print("<td>可租</td> ");
					if (rs2.getString("roomstate").startsWith("z"))
						out.print("<td>整理</td> ");
					if (rs2.getString("roomstate").startsWith("o"))
						out.print("<td>故障</td> ");
					if (rs2.getString("roomstate").startsWith("l"))
						out.print("<td>住人</td> ");
	
 	out.println("<td>"+rs2.getString("bed")+"</td>");
	out.println("<td>"+rs2.getString("price")+"</td>");
	out.println("<td>"+rs2.getString("remarks")+"</td>");
	}
    %>
    <%
    rs2.close();
    stmt2.close();
     %>
 </table>
 <form action="" method="post" >
 <div align="center"><input type="button" value="返回继续查询" name="roomSearch" onclick="javascript:location.href='roomSearch.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
 <div align="center"><input type="button" value="返回主页" name="roomSearch" onclick="javascript:location.href='Manage.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
 </form>
 <%
	conn.close(); 
 %>  
  </body>
</html>
