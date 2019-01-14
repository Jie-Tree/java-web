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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>database</title>
    <link href="css/page.css" rel="stylesheet">
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
        <a href="timeAndDatabase.jsp?data=cus">Customers</a>
        <a href="timeAndDatabase.jsp?data=emp">Employees</a>
        <a href="timeAndDatabase.jsp?data=log">Logs</a>
        <a href="timeAndDatabase.jsp?data=pro">Products</a>
        <a href="timeAndDatabase.jsp?data=pur">Purchases</a>
        <a href="timeAndDatabase.jsp?data=sup">Suppliers</a>
    </div>
<br>
    <div class="table">
        <%
            if ("cus".equals(request.getParameter("data"))||request.getParameter("data")==null){
                String sub = "cus";
                %>
        <form action="change" name="change_cus" method="post">
            <table>
                <thead>
                    <tr>
                        <td>cid</td>
                        <td>cname</td>
                        <td>city</td>
                        <td>visits_made</td>
                        <td>last_visit_time</td>
                        <td>action</td>
                    </tr>
                </thead>
                <%
                    DBCustomers dbCustomers =new DBCustomers();
                    dbCustomers.connect();
                    ArrayList<Customers> list = dbCustomers.getAll();
                    Customers add = new Customers("","","",0,"");
                    list.add(add);
                    for(Customers tl:list)
                    {%>
                <tr>
                    <td><input type="text" name="cid" value="<%=tl.getCid()%>"></td>
                    <td><input type="text" name="cname" value="<%=tl.getCname()%>"></td>
                    <td><input type="text" name="city" value="<%=tl.getCity()%>"></td>
                    <td><input type="text" name="visits_made" value="<%if(tl.getVisits_made()!=0)out.print(tl.getVisits_made());%>"></td>
                    <td><input type="text" name="last_visit_time" value="<%=tl.getLast_visit_time()%>"></td>
                </tr>
                <%}
                %>
                <%
                    dbCustomers.close();
                %>
            </table>
            <div class="form_sub" >
                <button type="submit" name="<%=sub%>" value="true">确认修改</button>
            </div>
        </form>
        <%
            }else if ("emp".equals(request.getParameter("data"))){
                String sub = "emp";
                %>
        <table>
            <tr>
                <td>eid</td>
                <td>ename</td>
                <td>city</td>
            </tr>
            <%
                DBEmployees dbEmployees =new DBEmployees();
                dbEmployees.connect();
                ArrayList<Employees> list = dbEmployees.getAll();
                Employees add = new Employees("","","");
                list.add(add);
                for(Employees tl:list)
                {%>
            <tr>
                <td><input type="text" name="eid" value="<%=tl.getEid()%>"></td>
                <td><input type="text" name="ename" value="<%=tl.getEname()%>"></td>
                <td><input type="text" name="city" value="<%=tl.getCity()%>"></td>
            </tr>
            <%}
            %>
            <%
                dbEmployees.close();
            %>
        </table>
        <%
            }else if ("log".equals(request.getParameter("data"))){
                String sub = "log";
                %>
        <table>
            <tr>
                <td>logid</td>
                <td>who</td>
                <td>time</td>
                <td>table_name</td>
                <td>operation</td>
                <td>key_value</td>
            </tr>
            <%
                DBLogs dbLogs =new DBLogs();
                dbLogs.connect();
                ArrayList<Logs> list = dbLogs.getAll();
                Logs add = new Logs(0,"","","","","");
                list.add(add);
                for(Logs tl:list)
                {%>
            <tr>
            <tr>
                <td><input type="text" name="logid" value="<%=tl.getLogid()%>"></td>
                <td><input type="text" name="who" value="<%=tl.getWho()%>"></td>
                <td><input type="text" name="time" value="<%=tl.getTime()%>"></td>
                <td><input type="text" name="table_name" value="<%=tl.getTable_name()%>"></td>
                <td><input type="text" name="operation" value="<%=tl.getOperation()%>"></td>
                <td><input type="text" name="key_value" value="<%=tl.getKey_value()%>"></td>
            </tr>
            </tr>
            <%}
            %>
            <%
                dbLogs.close();
            %>
        </table>
        <%
            }else if ("pro".equals(request.getParameter("data"))){
                String sub = "pro";
                %>
        <table>
            <tr>
                <td>pid</td>
                <td>pname</td>
                <td>qoh</td>
                <td>qoh_threshold</td>
                <td>original_price</td>
                <td>discnt_rate</td>
                <td>sid</td>
            </tr>
            <%
                DBProducts dbProducts =new DBProducts();
                dbProducts.connect();
                ArrayList<Products> list = dbProducts.getAll();
                Products add = new Products("","",0,0,0,0,"");
                list.add(add);
                for(Products tl:list)
                {%>
            <tr>
                <td><input type="text" name="pid" value="<%=tl.getPid()%>"></td>
                <td><input type="text" name="pname" value="<%=tl.getPname()%>"></td>
                <td><input type="text" name="qoh" value="<%=tl.getQoh()%>"></td>
                <td><input type="text" name="qoh_threshold" value="<%=tl.getQoh_threshold()%>"></td>
                <td><input type="text" name="original_price" value="<%=tl.getOriginal_price()%>"></td>
                <td><input type="text" name="discnt_rate" value="<%=tl.getDiscnt_rate()%>"></td>
                <td><input type="text" name="sid" value="<%=tl.getSid()%>"></td>
            </tr>
            <%}
            %>
            <%
                dbProducts.close();
            %>
        </table>
        <%
            }else if ("pur".equals(request.getParameter("data"))){
                String sub = "pur";
                %>
        <table>
            <tr>
                <td>purid</td>
                <td>cid</td>
                <td>eid</td>
                <td>pid</td>
                <td>qty</td>
                <td>ptime</td>
                <td>total_price</td>
            </tr>
            <%
                DBPurchases dbPurchases =new DBPurchases();
                dbPurchases.connect();
                ArrayList<Purchases> list = dbPurchases.getAll();
                Purchases add = new Purchases("","","","",0,"",0);
                list.add(add);
                for(Purchases tl:list)
                {%>
            <tr>
                <td><input type="text" name="purid" value="<%=tl.getPurid()%>"></td>
                <td><input type="text" name="cid" value="<%=tl.getCid()%>"></td>
                <td><input type="text" name="eid" value="<%=tl.getEid()%>"></td>
                <td><input type="text" name="pid" value="<%=tl.getPid()%>"></td>
                <td><input type="text" name="qty" value="<%=tl.getQty()%>"></td>
                <td><input type="text" name="ptime" value="<%=tl.getPtime()%>"></td>
                <td><input type="text" name="total_price" value="<%=tl.getTotal_price()%>"></td>
            </tr>
            <%}
            %>
            <%
                dbPurchases.close();
            %>
        </table>
        <%
            }else if ("sup".equals(request.getParameter("data"))){
                String sub = "sup";
                %>
        <table>
            <tr>
                <td>sid</td>
                <td>sname</td>
                <td>city</td>
                <td>telephone_no</td>
            </tr>
            <%
                DBSuppliers dbSuppliers =new DBSuppliers();
                dbSuppliers.connect();
                ArrayList<Suppliers> list = dbSuppliers.getAll();
                Suppliers add = new Suppliers("","","","");
                for(Suppliers tl:list)
                {%>
            <tr>
                <td><input type="text" name="sid" value="<%=tl.getSid()%>"></td>
                <td><input type="text" name="sname" value="<%=tl.getSname()%>"></td>
                <td><input type="text" name="city" value="<%=tl.getCity()%>"></td>
                <td><input type="text" name="telephone_no" value="<%=tl.getTelephone_no()%>"></td>
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
</body>
</html>