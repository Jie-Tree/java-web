<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>message</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link href="css/page.css" rel="stylesheet">
</head>
<body>
<%
    String s = (String) request.getAttribute("state");
%>
<br>
<br>
<div class="link">
    <a href="timeAndTables.jsp?data=cus">Customers</a>
    <a href="timeAndTables.jsp?data=emp">Employees</a>
    <a href="timeAndTables.jsp?data=log">Logs</a>
    <a href="timeAndTables.jsp?data=pro">Products</a>
    <a href="timeAndTables.jsp?data=pur">Purchases</a>
    <a href="timeAndTables.jsp?data=sup">Suppliers</a>
    <a href="month_select.html">月报表</a>
    <a href="goods.jsp">购物</a>
</div>
<br><br><br><br><br><br>
<div style="text-align: center; font-size: large; color: #985f0d">
    <%=s%>
</div>
</body>
</html>
