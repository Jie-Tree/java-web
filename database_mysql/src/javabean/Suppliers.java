package javabean;

public class Suppliers {
    String sid;
    String sname;
    String city;
    String telephone_no;

    public Suppliers(){}

    public Suppliers(String sid, String sname, String city, String telephone_no) {
        this.sid = sid;
        this.sname = sname;
        this.city = city;
        this.telephone_no = telephone_no;
    }

    @Override
    public String toString() {
        return "Suppliers{" +
                "sid='" + sid + '\'' +
                ", sname='" + sname + '\'' +
                ", city='" + city + '\'' +
                ", telephone_no='" + telephone_no + '\'' +
                '}';
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTelephone_no() {
        return telephone_no;
    }

    public void setTelephone_no(String telephone_no) {
        this.telephone_no = telephone_no;
    }
}
