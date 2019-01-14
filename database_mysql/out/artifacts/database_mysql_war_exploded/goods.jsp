<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="database.*" %>
<%@ page import="javabean.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    DBProducts dbProducts = new DBProducts();
    dbProducts.connect();
    ArrayList<Products> list = dbProducts.getAll();
    DecimalFormat df = new DecimalFormat("#.00");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>database</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link href="css/page.css" rel="stylesheet">
    <style type="text/css">
        .box{
            width: 20px;
            height: 20px;
            padding: 2px;
            border:1px solid #ccc;
            border-radius: 2px;
        }
    </style>

</head>
<body style="background-color:#fff;">
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
<br>
<br>
    <input type="text" style="width: 200px; margin-left: 35%; padding: 0px" class="form-control" placeholder="-请选择一个顾客进行测试-"
           id="usr" list="list">
    <datalist id="list">
        <option>Kathy</option>
        <option>Brown</option>
        <option>Anne</option>
        <option>Jack</option>
        <option>Mike</option>
    </datalist>
    <input type="text" style="width: 200px; margin-left: 35%; padding: 0px;" class="form-control" placeholder="-请选择一个导购的售货员-"
           id="emp" list="list1">
    <datalist id="list1">
        <option>Amy</option>
        <option>Bob</option>
        <option>John</option>
        <option>Lisa</option>
        <option>Matt</option>
    </datalist>
<br><br>
<section class="cartMain">
    <div class="cartBox">
        <div class="order_content" style="font-size: 20px">
            <ul class="order_lists">
                <li class="list_con">
                    <div class="list_img"><a href="javascript:;"><img src="images/milk.jpg" alt=""></a></div>
                    <div class="list_text"><a href="javascript:;">牛奶</a></div>
                </li>
                <li class="list_info">
                    <% int x = 0;%>
                    <p>原价：<%=list.get(x).getOriginal_price()%>
                    </p>
                    <p>折扣：<%=list.get(x).getDiscnt_rate()%>
                    </p>
                    <p>库存：<%=list.get(x).getQoh()%>
                    </p>
                </li>
                <li class="list_price">
                    <p class="price">折扣价
                        ￥<%=df.format(list.get(x).getOriginal_price() * (1 - list.get(x).getDiscnt_rate()))%>
                    </p>
                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <input id="milk_input" type="text" value="1" class="sum">
                    </div>
                </li>
                <%--<li class="list_sum">--%>
                <%--<p class="sum_price">--%>
                <%--总价￥<%=df.format(list.get(x).getOriginal_price() * (1 - list.get(x).getDiscnt_rate()))%>--%>
                <%--</p>--%>
                <%--</li>--%>
                <li class="list_op">
                    <p class="del">
                        <button id="milk_button"><a style="font-size: 24px; color: #5cb85c">购买</a></button>
                    </p>
                </li>
            </ul>

            <ul class="order_lists">
                <li class="list_con">
                    <div class="list_img"><a href="javascript:;"><img src="images/egg.jpg" alt=""></a></div>
                    <div class="list_text"><a href="javascript:;">鸡蛋</a></div>
                </li>
                <li class="list_info">
                    <% x = 1;%>
                    <p>原价：<%=list.get(x).getOriginal_price()%>
                    </p>
                    <p>折扣：<%=list.get(x).getDiscnt_rate()%>
                    </p>
                    <p>库存：<%=list.get(x).getQoh()%>
                    </p>
                </li>
                <li class="list_price">
                    <p class="price">折扣价
                        ￥<%=df.format(list.get(x).getOriginal_price() * (1 - list.get(x).getDiscnt_rate()))%>
                    </p>
                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <input id="egg_input" type="text" value="1" class="sum_price">
                    </div>
                </li>
                <li class="list_op">
                    <p class="del">
                        <button id="egg_button"><a style="font-size: 24px; color: #5cb85c">购买</a></button>
                    </p>
                </li>
            </ul>

            <ul class="order_lists">
                <li class="list_con">
                    <div class="list_img"><a href="javascript:;"><img src="images/bread.jpg" alt=""></a></div>
                    <div class="list_text"><a href="javascript:;">面包</a></div>
                </li>
                <li class="list_info">
                    <% x = 2;%>
                    <p>原价：<%=list.get(x).getOriginal_price()%>
                    </p>
                    <p>折扣：<%=list.get(x).getDiscnt_rate()%>
                    </p>
                    <p>库存：<%=list.get(x).getQoh()%>
                    </p>
                </li>
                <li class="list_price">
                    <p class="price">折扣价
                        ￥<%=df.format(list.get(x).getOriginal_price() * (1 - list.get(x).getDiscnt_rate()))%>
                    </p>
                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <input id="bread_input" type="text" value="1" class="sum">
                    </div>
                </li>
                <li class="list_op">
                    <p class="del">
                        <button id="bread_button"><a style="font-size: 24px; color: #5cb85c">购买</a></button>
                    </p>
                </li>
            </ul>

            <ul class="order_lists">
                <li class="list_con">
                    <div class="list_img"><a href="javascript:;"><img src="images/pineapple.jpg" alt=""></a></div>
                    <div class="list_text"><a href="javascript:;">菠萝</a></div>
                </li>
                <li class="list_info">
                    <% x = 3;%>
                    <p>原价：<%=list.get(x).getOriginal_price()%>
                    </p>
                    <p>折扣：<%=list.get(x).getDiscnt_rate()%>
                    </p>
                    <p>库存：<%=list.get(x).getQoh()%>
                    </p>
                </li>
                <li class="list_price">
                    <p class="price">折扣价
                        ￥<%=df.format(list.get(x).getOriginal_price() * (1 - list.get(x).getDiscnt_rate()))%>
                    </p>
                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <input id="pineapple_input" type="text" value="1" class="sum">
                    </div>
                </li>
                <li class="list_op">
                    <p class="del">
                        <button id="pineapple_button"><a style="font-size: 24px; color: #5cb85c">购买</a></button>
                    </p>
                </li>
            </ul>

            <ul class="order_lists">
                <li class="list_con">
                    <div class="list_img"><a href="javascript:;"><img src="images/knife.jpg" alt=""></a></div>
                    <div class="list_text"><a href="javascript:;">刀子</a></div>
                </li>
                <li class="list_info">
                    <% x = 4;%>
                    <p>原价：<%=list.get(x).getOriginal_price()%>
                    </p>
                    <p>折扣：<%=list.get(x).getDiscnt_rate()%>
                    </p>
                    <p>库存：<%=list.get(x).getQoh()%>
                    </p>
                </li>
                <li class="list_price">
                    <p class="price">折扣价
                        ￥<%=df.format(list.get(x).getOriginal_price() * (1 - list.get(x).getDiscnt_rate()))%>
                    </p>
                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <input id="knife_input" type="text" value="1" class="sum">
                    </div>
                </li>
                <li class="list_op">
                    <p class="del">
                        <button id="knife_button"><a style="font-size: 24px; color: #5cb85c">购买</a></button>
                    </p>
                </li>
            </ul>

            <ul class="order_lists">
                <li class="list_con">
                    <div class="list_img"><a href="javascript:;"><img src="images/shovel.jpg" alt=""></a></div>
                    <div class="list_text"><a href="javascript:;">铲子</a></div>
                </li>
                <li class="list_info">
                    <% x = 5;%>
                    <p>原价：<%=list.get(x).getOriginal_price()%>
                    </p>
                    <p>折扣：<%=list.get(x).getDiscnt_rate()%>
                    </p>
                    <p>库存：<%=list.get(x).getQoh()%>
                    </p>
                </li>
                <li class="list_price">
                    <p class="price">折扣价
                        ￥<%=df.format(list.get(x).getOriginal_price() * (1 - list.get(x).getDiscnt_rate()))%>
                    </p>
                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <input id="shovel_input" type="text" value="1" class="sum">
                    </div>
                </li>
                <li class="list_op">
                    <p class="del">
                        <button id="shovel_button"><a style="font-size: 24px; color: #5cb85c">购买</a></button>
                    </p>
                </li>
            </ul>
        </div>
    </div>
</section>
<script src="js/jquery.min.js"></script>
<script src="js/carts.js"></script>
</body>
</html>