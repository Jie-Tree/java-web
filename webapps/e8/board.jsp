<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(request.getAttribute("comments")==null){
		request.getRequestDispatcher("/board").forward(request, response);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
      <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>留言板</title>
	<style type="text/css">
		body{
			background-color: #E2E4CB;
			margin: 0;
		}
		a{
			text-decoration:none; 
		}
		.top a{
			color: #333;
		}

		.comment a{
			color: #666;
		}

		.top{
			font-size: 9pt;
			text-align: right;
			width: 500px;
			margin: 5px auto;
		}
		.board_form{
			padding-top: 15px;
			padding-bottom: 20px;
			width: 500px;
			background-color: skyblue;
			border: 1px solid blue;
			border-radius: 15px;
			margin: 0px auto;
		}
		.board_form table{
			margin: 0px auto;
			color: #282923;
		}
		.board_form input{
			border: 0;
			border-radius: 2px;
			height: 24px;
			width: 320px;
		}

		.board_form textarea{
			border: 0;
			border-radius: 2px;
			resize:none;
			width: 316px;
		}

		.board_form table td{
			padding-top: 5px;
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

		.comment{
			background-color: rgba(255,255,255,0.8);
			border:1px solid #fff;
			border-radius: 10px;
			margin: 0px auto;
			margin-top: 20px;
			padding: 0px 10px 10px 10px;
			width: 480px;
		}		
		.comment_item_outer{
			/*border-top: 1px solid rgba(0,0,0,0.1);*/
		}
		.comment_item_inner{
			margin-top: 20px;
			/*border: 1px solid #fff;*/
		}
		.com_left{
			border: 1px solid #C9C9C9;
			width: 50px;
			height: 50px;
			float: left;
			margin-right: 10px;
			margin-left: 5px;
		}
		.com_right{
			padding: 8px 5px 4px 5px;
			border-radius: 10px;
			border: 1px solid #C9C9C9;
			width: 400px;
			font-size: 9pt;
			float: left;
		}
		.clearfloat{
			clear: both;
		}
		.com_user_info{
			margin: 0px 0 5px 0;
		}
		.com_user_msg{
			margin: 0px 0 5px 0;
		}
		.user_name{
			color: #5B94BB;
			float: left;
		}
		.img_photo{
			width: 100%;
		}
		.content_before{
			color: #5B94BB;
		}
		.content{
			color: #000;
		}
		.user_date{
			color: #999;
			float: right;
		}
		.split{
			color: red;
		}
		.admin_reply{
			border-top: 1px solid rgba(0,0,0,0.2);
			padding-top: 5px;
			padding-bottom: 5px;
		}
		.com_user_option,.com_admin_option{
			text-align: right;
			color: #666;
		}
		.error{
			color: red;
			font-size: 10pt;
			text-align: left;
		}
		
/*		.reply_button{
			text-align: right;
		}
		.delete_button{
			text-align: right;
		}
		.modify_button{
			text-align: right;
		}*/
	</style>
</head>
<body>
<br><br><br><br><br><br>
	<div class="top">
	<%	
		if("true".equals(session.getAttribute("isLogin"))){
			out.write("<span>欢迎回来，管理员 </span><a href=\"login?outlogin=1\">退出</a>");
		}else{
			out.write("<a href=\"login.jsp\">管理员登录</a>");
		}
	 %>
		
		
	</div>
	<div class="board_form">
		<form action="comment" id="board_form" method="post" name="board_form">
			<table border="0" class="form_table" >
				<caption>留言板</caption>
				<tbody>
					<tr>
						<td >姓名：</td>
						<td><input type="text" name="user_name" /></td>
					</tr>
				  	<c:if test="${name_err!=null}">
						<tr class="error">
							<td></td>
							<td>${name_err}</td>
						</tr>
					</c:if>
					<tr>
						<td>邮箱：</td>
						<td><input type="text" name="user_email"/></td>
					</tr>
				  	<c:if test="${email_err!=null}">
						<tr class="error">
							<td></td>
							<td>${email_err}</td>
						</tr>
					</c:if>
					<tr>
						<td>内容：</td>
						<td><textarea rows="5" name="content"></textarea></td>
					</tr>
				  	<c:if test="${content_err!=null}">
						<tr class="error">
							<td></td>
							<td>${content_err}</td>
						</tr>
					</c:if>
				  	<c:if test="${state!=null}">
						<tr class="error">
							<td></td>
							<td>${state}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="form_sub">
				<input type="submit" value="提交" name="comment_sub"/>
			</div>
		</form>
	</div>

	<div class="comment">
		<p>留言内容</p>
		<div class="comment_item_outer">
			<c:forEach items="${comments}" var="item">
				<div class="comment_item_inner">
					<div class="com_left">
						<img src="img/default.jpg" class="img_photo" />
					</div>
					<div class="com_right">
						<div class="msg_item">
							<div class="com_user_info">
								<span class="user_name">${item.name}</span>
								<span class="user_date">${item.time}</span>
								<div class="clearfloat"></div>
							</div>
							<div class="com_user_msg">
								<div class="user_content">
									<span class="content_before">留言内容： </span>
									<span class="content">${item.content}</span>
									<c:if test="${isLogin=='true'}">
										<div class="com_user_option">
											<span class="delete_button"><a href="manage?type=comment&id=${item.id}">删除</a></span>
											<span>|</span>
											<span class="reply_button"><a href="reply.jsp?id=${item.id}">回复</a></span>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<c:if test="${item.reply!=null}">
							<div class="msg_item admin_reply">
								<div class="com_user_info">
									<span class="user_name">管理员回复：</span>
									<span class="user_date">${item.replytime}</span>
									<div class="clearfloat"></div>
								</div>
								<div class="user_content">
									<span class="content">${item.reply}</span>
									<c:if test="${isLogin=='true'}">
										<div class="com_admin_option">
											<span class="delete_button"><a href="manage?type=reply&id=${item.id}">删除</a></span>
											<span>|</span>
											<span class="reply_button"><a href="reply.jsp?id=${item.id}">修改</a></span>
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
					<div class="clearfloat"></div>
				</div>
			</c:forEach>
		</div>
	</div>
<%
	request.removeAttribute("comments");
%>

</body>
</html>
