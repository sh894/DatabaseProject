<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>主页</title>
    <style type="text/css">
    div.choose { font-weight:bold;
            font-size:20px }
    .style5 {font-size: 18px}

    </style>
</head>

<body >
    <center>
    <table  border="3" bordercolor="navy" bgcolor="white" height="200" width="400" style="margin-top:3.5cm">
    <tbody>
    <tr>
    <td height="45">
     <div align="center" class="choose">
     <font size="7" face="华文行楷" color="#0080ff">  请选择您的权限</font>
     
      </div></td>
    </tr>
    <form action="admin.jsp" method="post">
             <tr><td><div height="45" align="center">
              <input type="submit" class="style5" value="系统管理员登录">
             </div></td></tr>
    </form>
    <form action="Managelogin.jsp" method="post">
             <tr><td><div height="45" align="center">
              <input type="submit" class="style5" value="前台服务员登录">
            </div></td></tr>
    </form>
    </tbody>
    </table>
    </center>
</body>
</html>
