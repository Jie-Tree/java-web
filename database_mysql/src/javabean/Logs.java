package javabean;

public class Logs {
    int logid;
    String who;
    String time;
    String table_name;
    String operation;
    String key_value;

    public Logs(){}

    public Logs(int logid, String who, String time, String table_name, String operation, String key_value) {
        this.logid = logid;
        this.who = who;
        this.time = time;
        this.table_name = table_name;
        this.operation = operation;
        this.key_value = key_value;
    }

    @Override
    public String toString() {
        return "Customers [ " +
                "logid=" + logid +
                ", who=" + who +
                ", time=" + time +
                ", table_name=" + table_name +
                ", operation=" + operation +
                ", key_value=" + key_value +
                " ]";
    }

    public int getLogid() {
        return logid;
    }

    public void setLogid(int logid) {
        this.logid = logid;
    }

    public String getWho() {
        return who;
    }

    public void setWho(String who) {
        this.who = who;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTable_name() {
        return table_name;
    }

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getKey_value() {
        return key_value;
    }

    public void setKey_value(String key_value) {
        this.key_value = key_value;
    }
}
