<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="database.*"%>
<%@ page import="javabean.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

    <title>database-2016150113</title>

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
<body>

<br>
<br>
<br>
<div class="top">
    <%
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        out.print("now : " + df.format(now));
        out.print("<br>");
        Date d2=df.parse("2019-01-21 00:00:00");
        int n = (int) ((d2.getTime() - now.getTime()) / (1000*3600*24));
        out.print("距离放假还有 : "+ n +" 天!");
    %>
</div>
<br>
<div class="link">
    <a href="timeAndTables.jsp?data=cus">Customers</a>
    <a href="timeAndTables.jsp?data=emp">Employees</a>
    <a href="timeAndTables.jsp?data=log">Logs</a>
    <a href="timeAndTables.jsp?data=pro">Products</a>
    <a href="timeAndTables.jsp?data=pur">Purchases</a>
    <a href="timeAndTables.jsp?data=sup">Suppliers</a>
</div>
<br>

<div class="container">
    <div class="row">
        <div class="col-md-12" style="padding:2em 0;">
            <p>点击 <i class="fa fa-pencil box"></i> 按钮可以对该行进行编辑，点击 <i class="fa fa-trash-o box"></i>按钮可以将该行删除。</p>
            <div class="table-responsive">
                <%
                    if ("cus".equals(request.getParameter("data"))||request.getParameter("data")==null){
                        session.setAttribute("tableName", "cus");
                %>
                <table class="table table-bordered table-striped" id="mytable">
                    <thead>
                    <tr>
                        <td>cid</td>
                        <td>cname</td>
                        <td>city</td>
                        <td>visits_made</td>
                        <td>last_visit_time</td>
                    </tr>
                    </thead>
                    <%
                        DBCustomers dbCustomers =new DBCustomers();
                        dbCustomers.connect();
                        ArrayList<Customers> list = dbCustomers.getAll();
                        for(Customers tl:list)
                        {%>
                    <tr>
                        <td id="tdcid"><%=tl.getCid() %></td>
                        <td id="tdcname"><%=tl.getCname() %></td>
                        <td id="tdcity"><%=tl.getCity() %></td>
                        <td id="tdvisits_made"><%=tl.getVisits_made() %></td>
                        <td id="tdlast_visit_time"><%=tl.getLast_visit_time() %></td>
                        <td width="20px"> <input id="editbutton" type="button" value="编辑"><input id="delbutton" type="button" value="删除"></td>
                    </tr>
                    <%}
                    %>
                    <%
                        dbCustomers.close();
                    %>
                </table>
                <%
                }else if ("emp".equals(request.getParameter("data"))){
                    session.setAttribute("tableName", "emp");
                %>
                <table class="table table-bordered table-striped" id="mytable">
                    <thead>
                    <tr>
                        <td>eid</td>
                        <td>ename</td>
                        <td>city</td>
                    </tr>
                    </thead>
                    <%
                        DBEmployees dbEmployees =new DBEmployees();
                        dbEmployees.connect();
                        ArrayList<Employees> list = dbEmployees.getAll();
                        for(Employees tl:list)
                        {%>
                    <tr>
                        <td><%=tl.getEid() %></td>
                        <td><%=tl.getEname() %></td>
                        <td><%=tl.getCity() %></td>
                    </tr>
                    <%}
                    %>
                    <%
                        dbEmployees.close();
                    %>
                </table>
                <%
                }else if ("log".equals(request.getParameter("data"))){
                    session.setAttribute("tableName", "log");
                %>
                <table class="table table-bordered table-striped" id="mytable">
                    <thead>
                    <tr>
                        <td>logid</td>
                        <td>who</td>
                        <td>time</td>
                        <td>table_name</td>
                        <td>operation</td>
                        <td>key_value</td>
                    </tr>
                    </thead>
                    <%
                        DBLogs dbLogs =new DBLogs();
                        dbLogs.connect();
                        ArrayList<Logs> list = dbLogs.getAll();
                        for(Logs tl:list)
                        {%>
                    <tr>
                        <td><%=tl.getLogid() %></td>
                        <td><%=tl.getWho() %></td>
                        <td><%=tl.getTime() %></td>
                        <td><%=tl.getTable_name() %></td>
                        <td><%=tl.getOperation() %></td>
                        <td><%=tl.getKey_value() %></td>
                    </tr>
                    <%}
                    %>
                    <%
                        dbLogs.close();
                    %>
                </table>
                <%
                }else if ("pro".equals(request.getParameter("data"))){
                    session.setAttribute("tableName", "pro");
                %>
                <table class="table table-bordered table-striped" id="mytable">
                    <thead>
                    <tr>
                        <td>pid</td>
                        <td>pname</td>
                        <td>qoh</td>
                        <td>qoh_threshold</td>
                        <td>original_price</td>
                        <td>discnt_rate</td>
                        <td>sid</td>
                    </tr>
                    </thead>
                    <%
                        DBProducts dbProducts =new DBProducts();
                        dbProducts.connect();
                        ArrayList<Products> list = dbProducts.getAll();
                        for(Products tl:list)
                        {%>
                    <tr>
                        <td><%=tl.getPid() %></td>
                        <td><%=tl.getPname() %></td>
                        <td><%=tl.getQoh() %></td>
                        <td><%=tl.getQoh_threshold() %></td>
                        <td><%=tl.getOriginal_price() %></td>
                        <td><%=tl.getDiscnt_rate() %></td>
                        <td><%=tl.getSid() %></td>
                    </tr>
                    <%}
                    %>
                    <%
                        dbProducts.close();
                    %>
                </table>
                <%
                }else if ("pur".equals(request.getParameter("data"))){
                    session.setAttribute("tableName", "pur");
                %>
                <table class="table table-bordered table-striped" id="mytable">
                    <thead>
                    <tr>
                        <td>purid</td>
                        <td>cid</td>
                        <td>eid</td>
                        <td>pid</td>
                        <td>qty</td>
                        <td>ptime</td>
                        <td>total_price</td>
                    </tr>
                    </thead>
                    <%
                        DBPurchases dbPurchases =new DBPurchases();
                        dbPurchases.connect();
                        ArrayList<Purchases> list = dbPurchases.getAll();
                        for(Purchases tl:list)
                        {%>
                    <tr>
                        <td><%=tl.getPurid() %></td>
                        <td><%=tl.getCid() %></td>
                        <td><%=tl.getEid() %></td>
                        <td><%=tl.getPid() %></td>
                        <td><%=tl.getQty() %></td>
                        <td><%=tl.getPtime() %></td>
                        <td><%=tl.getTotal_price() %></td>
                    </tr>
                    <%}
                    %>
                    <%
                        dbPurchases.close();
                    %>
                </table>
                <%
                }else if ("sup".equals(request.getParameter("data"))){
                    session.setAttribute("tableName", "sup");
                %>
                <table class="table table-bordered table-striped" id="mytable">
                    <thead>
                    <tr>
                        <td>sid</td>
                        <td>sname</td>
                        <td>city</td>
                        <td>telephone_no</td>
                    </tr>
                    </thead>
                    <%
                        DBSuppliers dbSuppliers =new DBSuppliers();
                        dbSuppliers.connect();
                        ArrayList<Suppliers> list = dbSuppliers.getAll();
                        for(Suppliers tl:list)
                        {%>
                    <tr>
                        <td><%=tl.getSid() %></td>
                        <td><%=tl.getSname() %></td>
                        <td><%=tl.getCity() %></td>
                        <td><%=tl.getTelephone_no() %></td>
                    </tr>
                    <%}
                    %>
                    <%
                        dbSuppliers.close();
                    %>
                </table>
                <%
                    }
                %>
            </div>
        </div>
        <div class="col-md-12"  style="padding-bottom:2em;">
            <button class="btn btn-info" id="add"><i class="fa fa-plus"></i> 添加新行</button>
        </div>
    </div>
</div>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>数据库  实验３  游伟杰  2016150113</p>
    <p>网页参考来源：<a href="http://www.lanrenzhijia.com/" target="_blank">http://www.lanrenzhijia.com</a></p>
</div>
</body>
</html>