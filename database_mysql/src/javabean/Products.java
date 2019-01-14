package javabean;

public class Products {
    String pid;
    String pname;
    int qoh;
    int qoh_threshold;
    double original_price;
    double discnt_rate;
    String sid;

    public Products(){}

    public Products(String pid, String pname, int qoh, int qoh_threshold, double original_price, double discnt_rate, String sid) {
        this.pid = pid;
        this.pname = pname;
        this.qoh = qoh;
        this.qoh_threshold = qoh_threshold;
        this.original_price = original_price;
        this.discnt_rate = discnt_rate;
        this.sid = sid;
    }

    @Override
    public String toString() {
        return "Products{" +
                "pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", qoh=" + qoh +
                ", qoh_threshold=" + qoh_threshold +
                ", original_price=" + original_price +
                ", discnt_rate=" + discnt_rate +
                ", sid='" + sid + '\'' +
                '}';
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getQoh() {
        return qoh;
    }

    public void setQoh(int qoh) {
        this.qoh = qoh;
    }

    public int getQoh_threshold() {
        return qoh_threshold;
    }

    public void setQoh_threshold(int qoh_threshold) {
        this.qoh_threshold = qoh_threshold;
    }

    public double getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(double original_price) {
        this.original_price = original_price;
    }

    public double getDiscnt_rate() {
        return discnt_rate;
    }

    public void setDiscnt_rate(double discnt_rate) {
        this.discnt_rate = discnt_rate;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }
}
