package javabean;

public class Employees {
    String eid;
    String ename;
    String city;

    public Employees(){

    }

    public Employees(String eid, String ename, String city) {
        this.eid = eid;
        this.ename = ename;
        this.city = city;
    }

    @Override
    public String toString() {
        return "Customers [ " +
                "eid=" + eid +
                ", ename=" + ename +
                ", city=" + city +
                " ]";
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String id) {
        this.eid = id;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String name) {
        this.ename = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

}
