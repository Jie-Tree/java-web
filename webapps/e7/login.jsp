<%@ page language="java" import="java.util.*" import="java.lang.*" pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%

String names="";
String pwd="";
//取出Cookie
Cookie [] c=request.getCookies();
if(c!=null){
	for(int i=0;i<c.length;i++){
		if(c[i].getName().equals("username")){
			names=c[i].getValue();
		}
		if(c[i].getName().equals("password")){
			pwd=c[i].getValue();
		}
	}
}

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link href="layout.css" rel="stylesheet">
	<title>登录页</title>
</head>
<body>
<div class="all">
	<div class="top">
		<div class="logo">
			<img src="log-title.png"/>
		</div>
	</div>

	<div class="bottom">
		<div class="bottom_left"></div>
		<div class="bottom_right">
			<div class="login">
				<div class="login_form">
					<form action="login" id="LoginForm" class="fm-v clearfix amp-login-form" method="post">

						<br>
						<p>
							<i class="auth_icon auth_icon_user"></i>
							<input id="username" name="username" placeholder="用户名" class="auth_input" type="text" value="<%=names%>"/>
							<span id="usernameError" style="display:none;" class="auth_error">请输入用户名</span>
						</p>


						<p>
							<i class="auth_icon auth_icon_pwd"></i>
							<input id="password" name="password" placeholder="密码" class="auth_input" type="password" value="<%=pwd%>" autocomplete="off"/>
							<span id="passwordError" style="display:none;" class="auth_error">请输入密码</span>
						</p>

						<p>
							<input type="checkbox" name="ck">记住用户名和密码<br>
						</p>

						<p>
							<button type="button" name="login_sub" class="auth_login_btn primary full_width" onclick="login()">登录
							</button>
						</p>
						<a id="register" href="register.jsp" class="auth_register">
							<small>注册</small>
						</a>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    function login(){
        var username = document.getElementById("username");
        var password = document.getElementById("password");
        var usernameError = document.getElementById("usernameError");
        var passwordError = document.getElementById("passwordError");
        usernameError.style.display="none";
        passwordError.style.display="none";
        if(username.value==""){
            usernameError.innerHTML="请输入用户名";
            usernameError.style.display="block";
        }else if(password.value==""){
            passwordError.innerHTML="请输入密码";
            passwordError.style.display="block";
        }else{
            document.getElementById("LoginForm").submit();
        }
    }
</script>
</body>
</html>