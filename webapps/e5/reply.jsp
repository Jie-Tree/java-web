<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(request.getAttribute("reply")==null){
		request.getRequestDispatcher("/reply").forward(request, response);
	}
 %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>回复</title>
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
		.reply_form{
			padding-top: 15px;
			padding-bottom: 20px;
			width: 500px;
			background-color: skyblue;
			border: 1px solid blue;
			border-radius: 15px;
			margin: 0px auto;
		}

		.reply_form table{
			margin: 0px auto;
			color: #282923;
		}
		.reply_form input{
			border: 0;
			border-radius: 2px;
			height: 24px;
		}
		.reply_form textarea{
			border: 0;
			border-radius: 2px;
			resize:none;
		}

		.reply_form table td{
			padding-top: 5px;
			text-align: left;
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

	</style>
</head>
<body>
	<div class="top">
		<a href="board.jsp">返回</a>
	</div>
	<div class="reply_form">
		<form action="comment" id="reply_form" method="post" name="reply_form">
			<input type="hidden" name="id" value="${reply.id}"/>
			<table>
				<tbody>
					<tr>
						<td><span>回复：</span><span>${reply.name}</span></td>
					</tr>
					<tr>
						<td><span>邮箱：</span><span>${reply.email}</span></td>
					</tr>
					<tr>
						<td><textarea name="reply_content" id="reply_content" cols="60" rows="10">${reply.reply}</textarea></td>
					</tr>
					<c:if test="${state!=null}">
						<tr class="error">
							<td></td>
							<td>${state}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="form_sub">
				<input type="submit" value="提交" name="reply_sub"/>
			</div>
		</form>
	</div>
</body>
</html>