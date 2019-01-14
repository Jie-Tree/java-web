<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"%>
<html>
<body>
<%!
    String user;
    String pass;
%>
<%
    user = request.getParameter("username");
    pass = request.getParameter("password");
    if( "123456".equals(user) && "654321".equals(pass)){
        response.sendRedirect("https://www1.szu.edu.cn/szu.asp");
    }else{
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>