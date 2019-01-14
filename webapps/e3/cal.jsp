<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"%>
<%!
   double number1;
   double number2;
   double resultd;
   double results;
%>
<%
    try{
        String str1 = request.getParameter("num1");
        String str2 = request.getParameter("num2");
        number1 = Double.parseDouble(str1);
        number2 = Double.parseDouble(str2);
        if(number2==0){
            throw new ArithmeticException();
        }
        resultd = number1/number2;
        results = Math.sqrt(resultd);
%>
        <%=number1%> / <%=number2%> = <%=resultd%>
        <br>
        sqrt( <%=number1%> / <%=number2%> ) = <%=results%>
<%    }
    catch (NumberFormatException e){
        out.print("输入错误，参数应为两个数字");
    }
    catch (ArithmeticException e1){
        out.print("除数不能为0");
    }
    catch (Exception e2){
        out.print("url携带参数错误");
    }

%>
