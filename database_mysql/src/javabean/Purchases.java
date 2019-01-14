package javabean;

public class Purchases {
    String purid;
    String cid;
    String eid;
    String pid;
    int qty;
    String ptime;
    double total_price;

    public Purchases(){}

    public Purchases(String purid, String cid, String eid, String pid, int qty, String ptime, double total_price) {
        this.purid = purid;
        this.cid = cid;
        this.eid = eid;
        this.pid = pid;
        this.qty = qty;
        this.ptime = ptime;
        this.total_price = total_price;
    }

    @Override
    public String toString() {
        return "Purchases{" +
                "purid='" + purid + '\'' +
                ", cid='" + cid + '\'' +
                ", eid='" + eid + '\'' +
                ", pid='" + pid + '\'' +
                ", qty=" + qty +
                ", ptime='" + ptime + '\'' +
                ", total_price=" + total_price +
                '}';
    }

    public String getPurid() {
        return purid;
    }

    public void setPurid(String purid) {
        this.purid = purid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getPtime() {
        return ptime;
    }

    public void setPtime(String ptime) {
        this.ptime = ptime;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }
}
