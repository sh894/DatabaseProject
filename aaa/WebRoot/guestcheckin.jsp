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

<title>ס���Ǽ�</title>
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
		���˵Ǽ�
		</title>
	</head>
	<body >
		<script type="text/javascript">
		function sure()
		{
			mydate=new Date();
			if(document.form2.name.value=="")
			{
				alert("��������Ϊ��"); 
				return false;
			}
			if(document.form2.sex.value=="")
			{
				alert("��ѡ���Ա�"); 
				return false;
			}
			if(document.form2.age.value=="")
			{
				alert("���䲻��Ϊ��");
				return false;
			}
			if(parseInt(document.form2.age.value)>200)
			{
				alert("���䲻��ʵ");
				return false;
			}
			if(document.form2.certno.value=="")
			{
				alert("����д֤������");
				return false;
			}
			
			if(document.form2.aYear.value>document.form2.gYear.value)
			{
			
				alert("��������ȷ���뿪ʱ��");
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
		<font color="#8000ff">�����:</font> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="text" name="roomno" value=<%=request.getParameter("roomno")%>>
		<font color="#8000ff"><br>����: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			<input type="text" name="name" size=20>
		<font color="#8000ff"><br>�Ա�:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sex" value="��"> ��
			<input type="radio" name="sex" value="Ů"> Ů
		<font color="#8000ff"><br>����: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" name="age" size=20>
		<font color="#8000ff"><br>֤������:</font>&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="certclass" style="width:120">
				<option value="0">���֤</option>
				<option value="1">����֤</option>
				<option value="2">ѧ��֤</option>
			</select>
		<font color="#8000ff"><br>֤������: </font>&nbsp;&nbsp;&nbsp; 
			<input type="text" name="certno" size=30>
		<font color="#8000ff"><br>����:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="countryclass"  style="width:120">
				<option value="C">�й�</option>
				<option value="A">����</option>
				<option value="E">Ӣ��</option>
				<option value="F">����</option>
				<option value="G">�¹�</option>
			</select>
			<font color="#8000ff"><br>�ִ�����:</font>&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" name="aYear" value=<%=request.getParameter("arridate")%>>

		<font color="#8000ff"><br>��������:</font>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="gYear" value=<%=request.getParameter("leftdate")%>>
		  	
		<font color="#8000ff"><br>���ⷿ��:</font>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="price" size=10>
			
		<font color="#8000ff"><br>��ע:</font>
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea rows="5" cols="50" name="remarks"></textarea>
			
		<br><input type="submit" value="ȷ��" onclick=sure()>
		<input type="reset" value="ȡ��">
		<input type="submit" value="�ٵǼ�" onclick="again()"></form>
		<br><a href="guestsAdmin.jsp">��һҳ</a>
		<br><a href="Manage.jsp">������ҳ</a>
	</body>
</html>
