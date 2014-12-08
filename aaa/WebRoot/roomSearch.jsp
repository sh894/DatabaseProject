<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>房号查询</title>
	</head>
	<form method="post" name="form2" action=simpleSearch_room.jsp>
	
	<p align="center"><strong><font size="4" face="宋体" color="#000000"><br></font></strong></p><p align="center"><strong><font size="4" face="宋体" color="#000000">请输入房间号码</font></strong></p><p align="center"> </p>
	<br><p align="center"><input type="text" name="name"><input type="Submit" name="button1" value="房号查找" ></p>
	<p align="center"><strong><font size="4" face="宋体" color="#000000"><br></font></strong></p><p align="center"><strong><font size="4" face="宋体" color="#000000">请选择房间类型</font></strong></p><p align="center"> </p>
     <center><td colspan="2"><label>房间类型
	<select name="房间类型">房间类型
	<option>默认</option>
	<option>豪华套</option>
	<option>总统套</option>
	<option>标准间</option>
	<option>三人间</option>
	<option>单人间</option>
	</select>
	<div align="center"><input type="submit" value="房间类型查询" name="房间类型" > <br><br></div>
	
	</label></td>
	</center>
	<p align="center"><strong><font size="4" face="宋体" color="#000000"><br></font></strong></p><p align="center"><strong><font size="4" face="宋体" color="#000000">请选择房间状态</font></strong></p><p align="center"> </p>
	<center><tr>
	  <td colspan="2"><label>房态查询
	   <select name="房间状态">
	   <option>默认</option>
	   <option>r</option>
	   <option>z</option>
	   <option>o</option>
	   <option>l</option>
	   </select>
	   </label></td>
	   </tr>
	  <label>
     
      <div align="center"><input type="submit" value="房间状态查询" name="房间状态" > </div>
    </label>
    <br>
    <br>
	<center>
	<div align="center"><input type="button" value="返回系统" name="back" onclick="javascript:location.href='Manage.jsp'" style="height: 30px; width: 120px;"> <br><br></div>
		</center>
		
	</body>
</html>