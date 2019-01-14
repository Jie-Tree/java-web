package servlet;

import database.*;
import javabean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;

@WebServlet(name = "change")
public class change extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String tn = (String) session.getAttribute("tableName");
        String action = request.getParameter("action");
        System.out.println("tn  "+ tn);
        System.out.println("ac  "+action);
        if(tn.equals("cus")){
            String s1 = request.getParameter("1");
            String s2 = request.getParameter("2");
            String s3 = request.getParameter("3");
            int s4 = Integer.parseInt(request.getParameter("4"));
            String s5 = request.getParameter("5");
            DBCustomers db = new DBCustomers();
            Customers bean = new Customers(s1, s2, s3, s4, s5);
            try{
                db.connect();
                if(action.equals("update")){
                    String id = request.getParameter("oldid");
                    System.out.println(id);
                    System.out.println(s1);
                    if(id.equals("")) {
                        System.out.println("add");
                        int re = db.add(bean);
                        if(re>0){
                            response.setHeader("state","success add");
                        }else {
                            response.setHeader("state","fail add");
                        }
                    }
                    else{
                        System.out.println("update");
                        int re = db.update(bean,id);
                        if(re>0){
                            response.setHeader("state","success update");
                            System.out.println("update success");
                        }else {
                            response.setHeader("state", "a foreign key constraint fails");
                        }
                    }
                }
                else if(action.equals("del")){
                    int re = db.del(bean);
                    if(re>0){
                        response.setHeader("state","success delete");
                    }else {
                        response.setHeader("state","Cannot delete a parent row: a foreign key constraint fails");
                    }
                }
                db.close();
            }catch (Exception e){
                response.setHeader("state", e.getMessage().split("\\(")[0]);
                e.printStackTrace();
            }
        } else if(tn.equals("emp")){
            String s1 = request.getParameter("1");
            String s2 = request.getParameter("2");
            String s3 = request.getParameter("3");
            Employees bean = new Employees(s1, s2, s3);
            DBEmployees db = new DBEmployees();
            try{
                db.connect();
                if(action.equals("update")){
                    String id = request.getParameter("oldid");
                    System.out.println(id);
                    System.out.println(s1);
                    if(id.equals("")) {
                        System.out.println("add");
                        int re = db.add(bean);
                        if(re>0){
                            response.setHeader("state","success add");
                        }else {
                            response.setHeader("state","fail add");
                        }
                    }
                    else{
                        System.out.println("update");
                        int re = db.update(bean,id);
                        if(re>0){
                            response.setHeader("state","success update");
                            System.out.println("update success");
                        }else {
                            response.setHeader("state", "a foreign key constraint fails");
                        }
                    }
                }
                else if(action.equals("del")){
                    int re = db.del(bean);
                    if(re>0){
                        response.setHeader("state","success delete");
                    }else {
                        response.setHeader("state","Cannot delete a parent row: a foreign key constraint fails");
                    }
                }
                db.close();
            }catch (Exception e){
                response.setHeader("state", e.getMessage().split("\\(")[0]);
                e.printStackTrace();
            }
        }else if(tn.equals("log")){
            int s1 = Integer.parseInt(request.getParameter("1"));
            String s2 = request.getParameter("2");
            String s3 = request.getParameter("3");
            String s4 = request.getParameter("4");
            String s5 = request.getParameter("5");
            String s6 = request.getParameter("5");
            Logs bean = new Logs(s1, s2, s3, s4, s5, s6);
            DBLogs db = new DBLogs();
            try{
                db.connect();
                if(action.equals("update")){
                    String id = request.getParameter("oldid");
                    System.out.println(id);
                    System.out.println(s1);
                    if(id.equals("")) {
                        System.out.println("add");
                        int re = db.add(bean);
                        if(re>0){
                            response.setHeader("state","success add");
                        }else {
                            response.setHeader("state","fail add");
                        }
                    }
                    else{
                        System.out.println("update");
                        int re = db.update(bean,Integer.parseInt(id));
                        if(re>0){
                            response.setHeader("state","success update");
                            System.out.println("update success");
                        }else {
                            response.setHeader("state", "a foreign key constraint fails");
                        }
                    }
                }
                else if(action.equals("del")){
                    int re = db.del(bean);
                    if(re>0){
                        response.setHeader("state","success delete");
                    }else {
                        response.setHeader("state","Cannot delete a parent row: a foreign key constraint fails");
                    }
                }
                db.close();
            }catch (Exception e){
                response.setHeader("state", e.getMessage().split("\\(")[0]);
                e.printStackTrace();
            }
        }else if(tn.equals("pro")){
            String s1 = request.getParameter("1");
            String s2 = request.getParameter("2");
            int s3 = Integer.parseInt(request.getParameter("3"));
            int s4 = Integer.parseInt(request.getParameter("4"));
            double s5 = Double.parseDouble(request.getParameter("5"));
            double s6 = Double.parseDouble(request.getParameter("6"));
            String s7 = request.getParameter("7");
            Products bean = new Products(s1, s2, s3, s4, s5, s6, s7);
            DBProducts db = new DBProducts();
            try{
                db.connect();
                if(action.equals("update")){
                    String id = request.getParameter("oldid");
                    System.out.println(id);
                    System.out.println(s1);
                    if(id.equals("")) {
                        System.out.println("add");
                        int re = db.add(bean);
                        if(re>0){
                            response.setHeader("state","success add");
                        }else {
                            response.setHeader("state","fail add");
                        }
                    }
                    else{
                        System.out.println("update");
                        int re = db.update(bean,id);
                        if(re>0){
                            response.setHeader("state","success update");
                            System.out.println("update success");
                        }else {
                            response.setHeader("state", "a foreign key constraint fails");
                        }
                    }
                }
                else if(action.equals("del")){
                    int re = db.del(bean);
                    if(re>0){
                        response.setHeader("state","success delete");
                    }else {
                        response.setHeader("state","Cannot delete a parent row: a foreign key constraint fails");
                    }
                }
                db.close();
            }catch (Exception e){
                response.setHeader("state", e.getMessage().split("\\(")[0]);
                e.printStackTrace();
            }
        }else if(tn.equals("pur")){
            System.out.println("in pur");
            String s1 = request.getParameter("1");
            String s2 = request.getParameter("2");
            String s3 = request.getParameter("3");
            String s4 = request.getParameter("4");
            int s5 = Integer.parseInt(request.getParameter("5"));
            String s6 = request.getParameter("6");
            double s7 = Double.parseDouble(request.getParameter("7"));
            Purchases bean = new Purchases(s1, s2, s3, s4, s5, s6, s7);
            DBPurchases db = new DBPurchases();
            try{
                db.connect();
                if(action.equals("update")){
                    String id = request.getParameter("oldid");
                    System.out.println(id);
                    System.out.println(s1);
                    if(id.equals("")) {
                        System.out.println("add");
                        DBProducts pro_db = new DBProducts();
                        pro_db.connect();
                        int old_qoh = pro_db.getById(bean.getPid()).getQoh();
                        int old_qoh_thod = pro_db.getById(bean.getPid()).getQoh_threshold();
                        int re = db.add(bean);
                        if(re>0){
                            if(old_qoh-bean.getQty()<old_qoh_thod){
                                String str = "success add! "+
                                "the current qoh of the product is: "+(old_qoh-bean.getQty())+
                                "; the quantity on hand of the product has been increased: "+ (old_qoh+bean.getQty());
                                response.setHeader("state",str);
                            }else{
                                response.setHeader("state","success add");
                            }
                        }else {
                            response.setHeader("state","fail add");
                        }
                    }
                    else{
                        System.out.println("update");
                        int re = db.update(bean,id);
                        if(re>0){
                            response.setHeader("state","success update");
                            System.out.println("update success");
                        }else {
                            response.setHeader("state", "a foreign key constraint fails");
                        }
                    }
                }
                else if(action.equals("del")){
                    int re = db.del(bean);
                    if(re>0){
                        response.setHeader("state","success delete");
                    }else {
                        response.setHeader("state","Cannot delete a parent row: a foreign key constraint fails");
                    }
                }
                db.close();
            }catch (Exception e){
                response.setHeader("state", e.getMessage().split("\\(")[0]);
                e.printStackTrace();
            }
        }else if(tn.equals("sup")){
            String s1 = request.getParameter("1");
            String s2 = request.getParameter("2");
            String s3 = request.getParameter("3");
            String s4 = request.getParameter("4");
            Suppliers bean = new Suppliers(s1, s2, s3, s4);
            DBSuppliers db = new DBSuppliers();
            try{
                db.connect();
                if(action.equals("update")){
                    String id = request.getParameter("oldid");
                    System.out.println(id);
                    System.out.println(s1);
                    if(id.equals("")) {
                        System.out.println("add");
                        int re = db.add(bean);
                        if(re>0){
                            response.setHeader("state","success add");
                        }else {
                            response.setHeader("state","fail add");
                        }
                    }
                    else{
                        System.out.println("update");
                        int re = db.update(bean,id);
                        if(re>0){
                            response.setHeader("state","success update");
                            System.out.println("update success");
                        }else {
                            response.setHeader("state", "a foreign key constraint fails");
                        }
                    }
                }
                else if(action.equals("del")){
                    int re = db.del(bean);
                    if(re>0){
                        response.setHeader("state","success delete");
                    }else {
                        response.setHeader("state","Cannot delete a parent row: a foreign key constraint fails");
                    }
                }
                db.close();
            }catch (Exception e){
                response.setHeader("state", e.getMessage().split("\\(")[0]);
                e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
