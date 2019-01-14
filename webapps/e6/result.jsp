<%@ page import="java.util.ArrayList" %>
<%@ page import="javabean.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>结果页</title>
    <style type="text/css">
        .top{
            font-size: 20px;
            text-align: left;
            width: 500px;
            margin: 5px auto;
            background: #cfffa9;
        }
        .center{
            font-size: 20px;
            text-align: left;
            width: 500px;
            margin: 5px auto;
            background: #cfffa9;
        }
    </style>
</head>
<body>
<div class="top">
    <%
        out.print("<br>");

        out.print("state : " + request.getAttribute("state"));
        out.print("<br>");
        out.print("isLogin : " + session.getAttribute("isLogin"));
        out.print("<br>");
        if("true".equals(session.getAttribute("isLogin"))){
            out.print("username : " + session.getAttribute("user"));
            out.print("   ");
            out.print("<a href=\"logout\">logout</a>");
        }

    %>
</div>
<br>
<div class="center">
    <%
        Integer n = (Integer) application.getAttribute("online_num");
        if(n==null){
            n=0;
        }
        out.print("Number of online users : " + n);
        out.print("<br>online user :  ");
        ArrayList<String> list = (ArrayList<String>)application.getAttribute("users");
        if(list!=null){
            for(String ui : list){
                out.print(ui + "  ");
            }
        }
    %>
</div>
</body>
</html>
