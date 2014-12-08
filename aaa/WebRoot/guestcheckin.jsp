<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="charset" content="gb2312">
<base href="<%=basePath%>">

<title>住户登记</title>
<meta http-equiv="charset" content="gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<head>
		<title>
		客人登记
		</title>
	</head>
	<body >
		<script type="text/javascript">
		function sure()
		{
			mydate=new Date();
			if(document.form2.name.value=="")
			{
				alert("姓名不能为空"); 
				return false;
			}
			if(document.form2.sex.value=="")
			{
				alert("请选择性别"); 
				return false;
			}
			if(document.form2.age.value=="")
			{
				alert("年龄不能为空");
				return false;
			}
			if(parseInt(document.form2.age.value)>200)
			{
				alert("年龄不属实");
				return false;
			}
			if(document.form2.certno.value=="")
			{
				alert("请填写证件编码");
				return false;
			}
			
			if(document.form2.aYear.value>document.form2.gYear.value)
			{
			
				alert("请输入正确的离开时间");
				return false;
			}
			document.form2.target="hidden";
			document.form2.action="finish.jsp";
			form2.submit();
		}
		function again()
		{
			document.form2.action="guestcheckin.jsp";
			form2.target="target_self";
			form2.submit();
		}
		</script>
		
		<form   action="" method="post" name="form2">
		<font color="#8000ff">房间号:</font> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="text" name="roomno" value=<%=request.getParameter("roomno")%>>
		<font color="#8000ff"><br>姓名: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			<input type="text" name="name" size=20>
		<font color="#8000ff"><br>性别:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sex" value="男"> 男
			<input type="radio" name="sex" value="女"> 女
		<font color="#8000ff"><br>年龄: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" name="age" size=20>
		<font color="#8000ff"><br>证件种类:</font>&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="certclass" style="width:120">
				<option value="0">身份证</option>
				<option value="1">军人证</option>
				<option value="2">学生证</option>
			</select>
		<font color="#8000ff"><br>证件编码: </font>&nbsp;&nbsp;&nbsp; 
			<input type="text" name="certno" size=30>
		<font color="#8000ff"><br>国籍:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="countryclass"  style="width:120">
				<option value="C">中国</option>
				<option value="A">美国</option>
				<option value="E">英国</option>
				<option value="F">法国</option>
				<option value="G">德国</option>
			</select>
			<font color="#8000ff"><br>抵达日期:</font>&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" name="aYear" value=<%=request.getParameter("arridate")%>>

		<font color="#8000ff"><br>拟走日期:</font>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="gYear" value=<%=request.getParameter("leftdate")%>>
		  	
		<font color="#8000ff"><br>特殊房价:</font>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="price" size=10>
			
		<font color="#8000ff"><br>备注:</font>
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea rows="5" cols="50" name="remarks"></textarea>
			
		<br><input type="submit" value="确定" onclick=sure()>
		<input type="reset" value="取消">
		<input type="submit" value="再登记" onclick="again()"></form>
		<br><a href="guestsAdmin.jsp">上一页</a>
		<br><a href="Manage.jsp">返回主页</a>
	</body>
</html>
