package database;

import javabean.Employees;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBEmployees extends DButil {
    // add
    public int add(Employees employees) throws Exception {
        String sql = "insert into employees (eid, ename, city)" + "values(?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, employees.getEid());
        ps.setString(2, employees.getEname());
        ps.setString(3, employees.getCity());
        int rs = ps.executeUpdate();
        return rs;
    }

    // del
    public int del(Employees employees) throws Exception {
        String sql = "DELETE FROM employees WHERE eid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, employees.getEid());
        int rs = ps.executeUpdate();
        return rs;
    }
    // update
    public int update(Employees employees, String id) throws Exception{
        String sql = "update employees set eid=?, ename=?, city=? WHERE eid = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, employees.getEid());
        ps.setString(2, employees.getEname());
        ps.setString(3, employees.getCity());
        ps.setString(4, id);
        int rs = ps.executeUpdate();
        return rs;
    }

    public boolean delAll()throws Exception{
        String sql = "DELETE FROM employees;";
        PreparedStatement ps = conn.prepareStatement(sql);
        int rs = ps.executeUpdate();
        return rs > 0 ? true : false;
    }

    public ArrayList<Employees> getAll() throws Exception {
        String sql = "SELECT * FROM employees order by eid;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Employees> list = new ArrayList<>();
        while (rs.next()) {
            Employees employees = new Employees();
            employees.setEid(rs.getString("eid"));
            employees.setEname(rs.getString("ename"));
            employees.setCity(rs.getString("city"));
            list.add(employees);
        }
        return list;
    }


}
