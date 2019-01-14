<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link href="layout.css" rel="stylesheet">
    <title>注册页</title>
</head>
<body>
<div class="all">
    <div class="top">
        <div class="logo">
            <img src="reg-title.png"/>
        </div>
    </div>

    <div class="bottom">
        <div class="bottom_left"></div>
        <div class="bottom_right">
            <div class="login">
                <div class="login_form">
                    <form action="register" id="LoginForm" class="fm-v clearfix amp-login-form" method="post">

                        <br>
                        <p>
                            <i class="auth_icon auth_icon_user"></i>
                            <input id="username" name="username" placeholder="用户名" class="auth_input" type="text" value=""/>
                            <span id="usernameError" style="display:none;" class="auth_error">请输入用户名</span>
                        </p>


                        <p>
                            <i class="auth_icon auth_icon_pwd"></i>
                            <input id="password" name="password" placeholder="密码" class="auth_input" type="password" value="" autocomplete="off"/>
                            <span id="passwordError" style="display:none;" class="auth_error">请输入密码</span>
                        </p>

                        <p>
                            <i class="auth_icon auth_icon_pwd"></i>
                            <input id="passwordValid" name="passwordValid" placeholder="确认密码" class="auth_input" type="password" value="" autocomplete="off"/>
                            <span id="passwordValidError" style="display:none;" class="auth_error">两次输入密码不一致</span>
                        </p>

                        <p>
                            <button type="button" name="register_sub" class="auth_login_btn primary full_width" onclick="login()">注册
                            </button>
                        </p>

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
        var passwordValid = document.getElementById("passwordValid");
        var usernameError = document.getElementById("usernameError");
        var passwordError = document.getElementById("passwordError");
        var passwordValidError = document.getElementById("passwordValidError");
        usernameError.style.display="none";
        passwordError.style.display="none";
        passwordValidError.style.display="none";
        if(username.value==""){
            usernameError.innerHTML="请输入用户名";
            usernameError.style.display="block";
        }else if(password.value==""){
            passwordError.innerHTML="请输入密码";
            passwordError.style.display="block";
        }else if(passwordValid.value!=password.value){
            passwordValidError.innerHTML="两次输入密码不一致";
            passwordValidError.style.display="block";
        }
        else{
            document.getElementById("LoginForm").submit();
        }
    }
</script>
</body>
</html>