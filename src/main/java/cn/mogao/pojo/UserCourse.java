package cn.mogao.pojo;

public class UserCourse {
    private Integer ucid;

    private Integer cid;

    private Integer ucstatu;

    private String schedule;

    private Integer ucscore;

    private Integer uid;

    public Integer getUcid() {
        return ucid;
    }

    public void setUcid(Integer ucid) {
        this.ucid = ucid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUcstatu() {
        return ucstatu;
    }

    public void setUcstatu(Integer ucstatu) {
        this.ucstatu = ucstatu;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule == null ? null : schedule.trim();
    }

    public Integer getUcscore() {
        return ucscore;
    }

    public void setUcscore(Integer ucscore) {
        this.ucscore = ucscore;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}