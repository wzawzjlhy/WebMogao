package cn.mogao.vo;

import cn.mogao.pojo.Course;

import java.util.List;

public class KJVo {
    private Course course;
    private List<String> paths;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public List<String> getPaths() {
        return paths;
    }

    public void setPaths(List<String> paths) {
        this.paths = paths;
    }
}
