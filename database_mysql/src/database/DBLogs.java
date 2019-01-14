package database;

import javabean.Logs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBLogs extends DButil {
    // add
    public int add(Logs logs) throws Exception {
        String sql = "insert into logs (logid, who, time , table_name, operation, key_value)" + "values(?,?,?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, logs.getLogid());
        ps.setString(2, logs.getWho());
        ps.setString(3, logs.getTime());
        ps.setString(4, logs.getTable_name());
        ps.setString(5, logs.getOperation());
        ps.setString(6,logs.getKey_value());
        int rs = ps.executeUpdate();
        return rs;
    }

    // del
    public int del(Logs logs) throws Exception {
        String sql = "DELETE FROM logs WHERE logid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, logs.getLogid());
        int rs = ps.executeUpdate();
        return rs;
    }
    // update
    public int update(Logs logs, int id) throws Exception{
        String sql = "update logs set logid=?, who=?, time=?, table_name=?, operation=?, key_value=? WHERE logid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, logs.getLogid());
        ps.setString(2, logs.getWho());
        ps.setString(3, logs.getTime());
        ps.setString(4, logs.getTable_name());
        ps.setString(5, logs.getOperation());
        ps.setString(6, logs.getTable_name());
        ps.setInt(7, id);
        int rs = ps.executeUpdate();
        return rs;
    }

    public boolean delAll()throws Exception{
        String sql = "DELETE FROM logs;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int rs = ps.executeUpdate();
        return rs > 0 ? true : false;
    }

    public ArrayList<Logs> getAll() throws Exception {
        String sql = "SELECT * FROM logs order by logid;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Logs> list = new ArrayList<>();
        while (rs.next()) {
            Logs logs = new Logs();
            logs.setLogid(rs.getInt("logid"));
            logs.setWho(rs.getString("who"));
            logs.setTime(rs.getString("time"));
            logs.setTable_name(rs.getString("table_name"));
            logs.setOperation(rs.getString("operation"));
            logs.setKey_value(rs.getString("key_value"));
            list.add(logs);
        }
        return list;
    }


}
