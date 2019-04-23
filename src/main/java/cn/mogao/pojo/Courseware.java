package cn.mogao.pojo;

public class Courseware {
    private Integer cwid;

    private String cwPath;

    private Integer cid;

    public Integer getCwid() {
        return cwid;
    }

    public void setCwid(Integer cwid) {
        this.cwid = cwid;
    }

    public String getCwPath() {
        return cwPath;
    }

    public void setCwPath(String cwPath) {
        this.cwPath = cwPath == null ? null : cwPath.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}