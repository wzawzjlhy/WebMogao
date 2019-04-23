package cn.mogao.service;

import cn.mogao.pojo.Course;
import cn.mogao.vo.KJVo;

import java.util.List;

public interface CourseService {
    List<Course> query(String cname, String cdate);

    List<Course> queryAll();

    void save(Course course);

    List<KJVo> getKJVO();

    Course getByCid(Integer cid);
}
