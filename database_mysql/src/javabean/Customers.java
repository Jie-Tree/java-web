package javabean;

public class Customers {
    String cid;
    String cname;
    String city;
    int visits_made;
    String last_visit_time;

    @Override
    public String toString() {
        return "Customers [ " +
                "cid=" + cid +
                ", cname=" + cname +
                ", city=" + city +
                ", visits_made=" + visits_made +
                ", last_visit_time=" + last_visit_time +
                " ]";
    }

    public Customers(String cid, String cname, String city, int visits_made, String last_visit_time) {
        this.cid = cid;
        this.cname = cname;
        this.city = city;
        this.visits_made = visits_made;
        this.last_visit_time = last_visit_time;
    }

    public Customers() {
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String id) {
        this.cid = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String name) {
        this.cname = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getVisits_made() {
        return visits_made;
    }

    public void setVisits_made(int visits_made) {
        this.visits_made = visits_made;
    }

    public String getLast_visit_time() {
        return last_visit_time;
    }

    public void setLast_visit_time(String last_visit_time) {
        this.last_visit_time = last_visit_time;
    }

}
