package cn.mogao.vo;

import cn.mogao.pojo.Course;
import cn.mogao.pojo.User;
import cn.mogao.pojo.UserCourse;

public class AdminSLVo {
    private UserCourse userCourse;
    private Course course;
    private User user;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public UserCourse getUserCourse() {
        return userCourse;
    }

    public void setUserCourse(UserCourse userCourse) {
        this.userCourse = userCourse;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
