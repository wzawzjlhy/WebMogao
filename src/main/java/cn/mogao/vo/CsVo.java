package cn.mogao.vo;

public class CsVo {
    /***
     * 课程id
     */
    private Integer cid;
    /***
     * 课程名称
     */
    private String cname;
    /**
     * 课程是否已经考过,0,未考，1考过
     */
    private Integer kg;
    /***
     * 课程分数
     *
     */
    private Integer cscore;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getKg() {
        return kg;
    }

    public void setKg(Integer kg) {
        this.kg = kg;
    }

    public Integer getCscore() {
        return cscore;
    }

    public void setCscore(Integer cscore) {
        this.cscore = cscore;
    }
}
