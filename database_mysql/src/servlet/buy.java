package servlet;

import database.*;
import javabean.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
public class buy extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String s1 = request.getParameter("1");
        String s2 = request.getParameter("2");
        String s3 = request.getParameter("3");
        String s4 = request.getParameter("4");
        int s5 = Integer.parseInt(request.getParameter("5"));
        System.out.println(s1);
        System.out.println(s2);
        System.out.println(s3);
        System.out.println(s4);
        System.out.println(s5);
        if("Amy".equals(s3)){
            s3 = "e00";
        }else if("Bob".equals(s3)){
            s3 = "e01";
        }else if("John".equals(s3)){
            s3 = "e02";
        }else if("Lisa".equals(s3)){
            s3 = "e03";
        }else if("Matt".equals(s3)){
            s3 = "e04";
        }
        if("Kathy".equals(s2)){
            s2="c000";
        }else if("Brown".equals(s2)){
            s2="c001";
        }else if("Anne".equals(s2)){
            s2="c002";
        }else if("Jack".equals(s2)){
            s2="c003";
        }else if("Mike".equals(s2)){
            s2="c004";
        }
        DBPurchases db = new DBPurchases();
        DBCustomers dbc = new DBCustomers();
        try {
            db.connect();
            dbc.connect();
            Customers c_bean = dbc.getById(s2);
            c_bean.setVisits_made(c_bean.getVisits_made()+1);
            dbc.update(c_bean,s2);
            ArrayList<Purchases> all = db.getAll();
            int a=all.size();
            System.out.println("size:"+a);
            if(a>=10){
                s1 = "p0"+a;
            }else{
                s1="p00"+a;
            }
            System.out.println("add");
            DBProducts pro_db = new DBProducts();
            pro_db.connect();
            int old_qoh = pro_db.getById(s4).getQoh();
            int old_qoh_thod = pro_db.getById(s4).getQoh_threshold();
            Products pro_bean = pro_db.getById(s4);
            int re = db.addPurchase(s1,s2,s3,s4,s5);
            if(re>0){
                if(old_qoh-s5<old_qoh_thod){
                    String str = "success buy! "+
                            "the current qoh of the product is: "+(old_qoh)+
                            "; the quantity on hand of the product has been increased: "+ (old_qoh+s5);
                    pro_bean.setQoh(2*old_qoh);
                    pro_db.update(pro_bean,s4);
                    request.setAttribute("state",str);
                }else{
                    request.setAttribute("state","success buy");
                    pro_bean.setQoh(old_qoh-s5);
                    pro_db.update(pro_bean,s4);
                }
            }else {
                response.setHeader("state","fail buy");
            }
            db.close();
            dbc.close();
            pro_db.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("state", e.getMessage().split("\\(")[0]);

        }finally {
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
