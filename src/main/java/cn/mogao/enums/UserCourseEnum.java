package cn.mogao.enums;

public enum  UserCourseEnum {
    INIT_SQ("INIT_SQ",0),
    SQ_NOT_PASS("SQ_NOT_PASS",1),
    SQ_PASS("SQ_PASS",2);
    private String msg;
    private Integer code;
    UserCourseEnum(String msg, Integer code) {
        this.msg = msg;
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
