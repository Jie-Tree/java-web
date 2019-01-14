<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"%>
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
			<img src="login-logo.png"/>
		</div>
	</div>
	<div class="bottom">
		<div class="bottom_left"></div>
		<div class="bottom_right">
			<div class="login">
				<div class="img_title">
					<img src="log-title.png"/>
				</div>
				<div class="login_form">
					<form action="valid.jsp" id="LoginForm" class="fm-v clearfix amp-login-form" method="post">

						<br>
						<p>
							<i class="auth_icon auth_icon_user"></i>
							<input id="username" name="username" placeholder="校园卡号、教工号或学号" class="auth_input" type="text" value=""/>
							<span id="usernameError" style="display:none;" class="auth_error">请输入用户名</span>
						</p>


						<p>
							<i class="auth_icon auth_icon_pwd"></i>
							<input id="password" name="password" placeholder="密码" class="auth_input" type="password" value="" autocomplete="off"/>
							<span id="passwordError" style="display:none;" class="auth_error">请输入密码</span>
						</p>

						<p>
							<button type="button" class="auth_login_btn primary full_width" onclick="login()">登录
							</button>
						</p>
						<a id="getBackPasswordMainPage" href="getBackPasswordMainPage.do" class="auth_login_forgetp">
							<small>忘记密码？</small>
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