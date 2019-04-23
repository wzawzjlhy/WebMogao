package cn.mogao.vo;

import cn.mogao.pojo.Course;

public class CourseSqVo {
    private Course course;
    //是否能够申请，前端判断，0表示不可申请，1表示可申请,2表示以前申请过，无法申请
    private Integer isSq;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getIsSq() {
        return isSq;
    }

    public void setIsSq(Integer isSq) {
        this.isSq = isSq;
    }
}
