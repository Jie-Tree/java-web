<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>登录</title>
	<style type="text/css">
		body{
			background-color: #E2E4CB;
			margin: 0;
		}
		.top{
			font-size: 9pt;
			text-align: left;
			width: 500px;
			margin: 5px auto;
		}
		.login_form{
			padding-top: 15px;
			padding-bottom: 20px;
			width: 500px;
			background-color: skyblue;
			border: 1px solid blue;
			border-radius: 15px;
			margin: 0px auto;
		}

		.login_form table{
			margin: 0px auto;
			color: #282923;
		}
		.login_form input{
			border: 0;
			border-radius: 2px;
			height: 24px;
		}

		.login_form table td{
			padding-top: 5px;
			text-align: right;
		}
		.form_sub{
			margin: 0px auto;
		}

		.form_sub input{
			display: block;
			background-color: #18A689;
			border: 0;
			border-radius: 4px;
			height: 30px;
			width: 200px;
			color: #FFF;
			margin: 0px auto;
			margin-top: 15px;
		}
		.error{
			color: red;
			font-size: 10pt;
			text-align: center;
		}

	</style>
</head>
<body>
	<div class="top">
		<a href="board.jsp">返回</a>
	</div>
	<div class="login_form">
		<form action="login" id="login_form" method="post" name="login_form">
			<table>
				<caption>登录</caption>
				<tbody>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="password" /></td>
					</tr>
				</tbody>
			</table>
			<% 
				if("false".equals(session.getAttribute("isLogin"))){
					out.write("<div class=\"error\">");
					out.write("<span>用户名或密码错误</span>");
					out.write("</div>");
					session.removeAttribute("isLogin");
				}
			%>

			<div class="form_sub">
				<input type="submit" value="登录" name="login_sub" />
			</div>
		</form>
	</div>
</body>
</html>