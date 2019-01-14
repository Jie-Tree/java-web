package database;

import javabean.Products;
import org.eclipse.jdt.internal.compiler.tool.EclipseBatchRequestor;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBProducts extends DButil {
    // add
    public int add(Products products) throws Exception {
        String sql = "insert into products (pid, pname, qoh, qoh_threshold, original_price, discnt_rate, sid)" + "values(?,?,?,?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, products.getPid());
        ps.setString(2, products.getPname());
        ps.setInt(3, products.getQoh());
        ps.setInt(4, products.getQoh_threshold());
        ps.setDouble(5, products.getOriginal_price());
        ps.setDouble(6,products.getDiscnt_rate());
        ps.setString(7,products.getSid());
        int rs = ps.executeUpdate();
        return rs;
    }

    // del
    public int del(Products products) throws Exception {
        String sql = "DELETE FROM products WHERE pid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, products.getPid());
        int rs = ps.executeUpdate();
        return rs;
    }
    // update
    public int update(Products products, String id) throws Exception{
        String sql = "update products set pid=?, pname=?, qoh=?, qoh_threshold=?, original_price=?, discnt_rate=?, sid=? WHERE pid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, products.getPid());
        ps.setString(2, products.getPname());
        ps.setInt(3, products.getQoh());
        ps.setInt(4, products.getQoh_threshold());
        ps.setDouble(5, products.getOriginal_price());
        ps.setDouble(6, products.getDiscnt_rate());
        ps.setString(7, products.getSid());
        ps.setString(8, id);
        int rs = ps.executeUpdate();
        return rs;
    }

    public boolean delAll()throws Exception{
        String sql = "DELETE FROM products;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int rs = ps.executeUpdate();
        return rs > 0 ? true : false;
    }

    public Products getById(String p_id) throws Exception {
        String sql = "SELECT * FROM products where pid=?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, p_id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Products products = new Products();
            products.setPid(rs.getString("pid"));
            products.setPname(rs.getString("pname"));
            products.setQoh(rs.getInt("qoh"));
            products.setQoh_threshold(rs.getInt("qoh_threshold"));
            products.setOriginal_price(rs.getDouble("original_price"));
            products.setDiscnt_rate(rs.getDouble("discnt_rate"));
            products.setSid(rs.getString("sid"));
            return products;
        }
        if(rs==null){
            throw new Exception("There is no this product");
        }
        return null;
    }

    public ArrayList<Products> getAll() throws Exception {
        String sql = "SELECT * FROM products order by pid;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Products> list = new ArrayList<>();
        while (rs.next()) {
            Products products = new Products();
            products.setPid(rs.getString("pid"));
            products.setPname(rs.getString("pname"));
            products.setQoh(rs.getInt("qoh"));
            products.setQoh_threshold(rs.getInt("qoh_threshold"));
            products.setOriginal_price(rs.getDouble("original_price"));
            products.setDiscnt_rate(rs.getDouble("discnt_rate"));
            products.setSid(rs.getString("sid"));
            list.add(products);
        }
        return list;
    }


}
