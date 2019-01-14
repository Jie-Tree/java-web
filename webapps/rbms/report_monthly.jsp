<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="database.*" %>
<%@ page import="javabean.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>report-monthly-sale</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link href="css/page.css" rel="stylesheet">
    <style type="text/css">
        .box {
            width: 20px;
            height: 20px;
            padding: 2px;
            border: 1px solid #ccc;
            border-radius: 2px;
        }
    </style>
</head>
<body>
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
<br>
<%
    DButil db = new DButil();
    db.connect();
    String prid = request.getParameter("prid");
%>
<%
    Statement sta = db.conn.createStatement();
    String sql = "call report_monthly_sale('" + prid + "');";
    ResultSet rs = sta.executeQuery(sql);
%>
<div class="table-responsive">
    <table class="table table-bordered table-striped" id="mytable">
        <thead>
        <tr>
            <td>pname</td>
            <td>mon</td>
            <td>year</td>
            <td>month_total_qty</td>
            <td>month_total_price</td>
            <td>average_sale</td>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString(1) %>
            </td>
            <td><%=rs.getString(2)%>
            </td>
            <td><%=rs.getString(3)%>
            </td>
            <td><%=rs.getString(4)%>
            </td>
            <td><%=rs.getString(5)%>
            </td>
            <td><%=rs.getString(6)%>
            </td>
        </tr>
        <%}%>
        </tbody>

    </table>
    <%
        db.close();
    %>
</div>
</body>
</html>
