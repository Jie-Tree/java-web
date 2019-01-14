package database;

import javabean.Purchases;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBPurchases extends DButil {
    // add
    public int add(Purchases purchases) throws Exception {
        String sql = "insert into purchases (purid, cid, eid, pid ,qty, ptime, total_price)" + "values(?,?,?,?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, purchases.getPurid());
        ps.setString(2, purchases.getCid());
        ps.setString(3, purchases.getEid());
        ps.setString(4, purchases.getPid());
        ps.setInt(5, purchases.getQty());
        ps.setString(6,purchases.getPtime());
        ps.setDouble(7,purchases.getTotal_price());
        int rs = ps.executeUpdate();
        return rs;
    }

    public int addPurchase(String purid, String cid, String eid, String prid, int n)throws Exception {
        String sql = "call add_purchase(?,?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, purid);
        ps.setString(2, cid);
        ps.setString(3, eid);
        ps.setString(4, prid);
        ps.setInt(5, n);
        int rs = ps.executeUpdate();
        return rs;
    }

    // del
    public int del(Purchases purchases) throws Exception {
        String sql = "DELETE FROM purchases WHERE purid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, purchases.getPurid());
        int rs = ps.executeUpdate();
        return rs;
    }
    // update
    public int update(Purchases purchases, String id) throws Exception{
        String sql = "update purchases set purid=?, cid=?, eid=?, pid=?, qty=?, ptime=?, total_price=? WHERE purid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, purchases.getPurid());
        ps.setString(2, purchases.getCid());
        ps.setString(3, purchases.getEid());
        ps.setString(4, purchases.getPid());
        ps.setInt(5, purchases.getQty());
        ps.setString(6, purchases.getPtime());
        ps.setDouble(7, purchases.getTotal_price());
        ps.setString(8, id);
        int rs = ps.executeUpdate();
        return rs;
    }

    public boolean delAll()throws Exception{
        String sql = "DELETE FROM purchases;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int rs = ps.executeUpdate();
        return rs > 0 ? true : false;
    }

    public ArrayList<Purchases> getAll() throws Exception {
        String sql = "SELECT * FROM purchases order by purid;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Purchases> list = new ArrayList<>();
        while (rs.next()) {
            Purchases purchases = new Purchases();
            purchases.setPurid(rs.getString("purid"));
            purchases.setCid(rs.getString("cid"));
            purchases.setEid(rs.getString("eid"));
            purchases.setPid(rs.getString("pid"));
            purchases.setQty(rs.getInt("qty"));
            purchases.setPtime(rs.getString("ptime"));
            purchases.setTotal_price(rs.getDouble("total_price"));
            list.add(purchases);
        }
        return list;
    }


}
