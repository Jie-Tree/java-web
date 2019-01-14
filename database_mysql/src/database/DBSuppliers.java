package database;

import javabean.Suppliers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBSuppliers extends DButil {
    // add
    public int add(Suppliers suppliers) throws Exception {
        String sql = "insert into suppliers (sid, sname, city, telephone_no)" + "values(?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, suppliers.getSid());
        ps.setString(2, suppliers.getSname());
        ps.setString(3, suppliers.getCity());
        ps.setString(4, suppliers.getTelephone_no());
        int rs = ps.executeUpdate();
        return rs;
    }

    // del
    public int del(Suppliers suppliers) throws Exception {
        String sql = "DELETE FROM suppliers WHERE sid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, suppliers.getSid());
        int rs = ps.executeUpdate();
        return rs;
    }
    // update
    public int update(Suppliers suppliers, String id) throws Exception{
        String sql = "update suppliers set sid=?, sname=?, city=?, telephone_no=? WHERE sid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, suppliers.getSid());
        ps.setString(2, suppliers.getSname());
        ps.setString(3, suppliers.getCity());
        ps.setString(4, suppliers.getTelephone_no());
        ps.setString(5, id);
        System.out.println(suppliers.getSid());
        int rs = ps.executeUpdate();
        return rs;
    }

    public boolean delAll()throws Exception{
        String sql = "DELETE FROM suppliers;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int rs = ps.executeUpdate();
        return rs > 0 ? true : false;
    }

    public ArrayList<Suppliers> getAll() throws Exception {
        String sql = "SELECT * FROM suppliers order by sid;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Suppliers> list = new ArrayList<>();
        while (rs.next()) {
            Suppliers suppliers = new Suppliers();
            suppliers.setSid(rs.getString("sid"));
            suppliers.setSname(rs.getString("sname"));
            suppliers.setCity(rs.getString("city"));
            suppliers.setTelephone_no(rs.getString("telephone_no"));
            list.add(suppliers);
        }
        return list;
    }


}
