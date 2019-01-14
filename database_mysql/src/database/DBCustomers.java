package database;

import javabean.Customers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBCustomers extends DButil {
    // add
    public int add(Customers customers) throws Exception {
        String sql = "insert into customers (cid, cname, city, visits_made, last_visit_time)" + "values(?,?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, customers.getCid());
        ps.setString(2, customers.getCname());
        ps.setString(3, customers.getCity());
        ps.setInt(4, customers.getVisits_made());
        ps.setString(5, customers.getLast_visit_time());
        int rs = ps.executeUpdate();
        return rs;
    }

    // del
    public int del(Customers customers) throws Exception {
        String sql = "DELETE FROM customers WHERE cid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, customers.getCid());
        int rs = ps.executeUpdate();
        return rs;
    }
    // update
    public int update(Customers customers, String id) throws Exception{
        String sql = "update customers set cid=?, cname=?, city=?, visits_made=?, last_visit_time=CURRENT_TIMESTAMP() WHERE cid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,customers.getCid());
        ps.setString(2, customers.getCname());
        ps.setString(3, customers.getCity());
        ps.setInt(4, customers.getVisits_made());
        ps.setString(5, id);
        int rs = ps.executeUpdate();
        return rs;
    }

    public boolean delAll()throws Exception{
        String sql = "DELETE FROM customers;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int rs = ps.executeUpdate();
        return rs > 0 ? true : false;
    }
    
    public Customers getById(String c_id) throws Exception {
        String sql = "SELECT * FROM customers where cid=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, c_id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Customers customers = new Customers();
            customers.setCid(rs.getString("cid"));
            customers.setCname(rs.getString("cname"));
            customers.setCity(rs.getString("city"));
            customers.setVisits_made(rs.getInt("visits_made"));
            customers.setLast_visit_time(rs.getString("last_visit_time"));
            return customers;
        }
        if(rs==null){
            throw new Exception("There is no this customer");
        }
        return null;
    }

    public ArrayList<Customers> getAll() throws Exception {
        String sql = "SELECT * FROM customers order by cid;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Customers> list = new ArrayList<>();
        while (rs.next()) {
            Customers customers = new Customers();
            customers.setCid(rs.getString("cid"));
            customers.setCname(rs.getString("cname"));
            customers.setCity(rs.getString("city"));
            customers.setVisits_made(rs.getInt("visits_made"));
            customers.setLast_visit_time(rs.getString("last_visit_time"));
            list.add(customers);
        }
        return list;
    }


}
