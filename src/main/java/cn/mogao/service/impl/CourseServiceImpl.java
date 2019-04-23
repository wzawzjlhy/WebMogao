package cn.mogao.service.impl;

import cn.mogao.mapper.CourseMapper;
import cn.mogao.mapper.CoursewareMapper;
import cn.mogao.pojo.Course;
import cn.mogao.pojo.Courseware;
import cn.mogao.service.CourseService;
import cn.mogao.vo.KJVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private CoursewareMapper coursewareMapper;

    @Override
    public List<Course> query(String cname, String cdate) {
        if(cdate.equals("")){
           return courseMapper.queryByCname(cname);
        }else{
            return courseMapper.queryByCnameAndCdate(cname,cdate);
        }

    }

    @Override
    public List<Course> queryAll() {
        return this.courseMapper.queryAll();
    }

    @Override
    public void save(Course course) {
        this.courseMapper.insert(course);
    }

    @Override
    public List<KJVo> getKJVO() {
        List<KJVo> kjVoList=new ArrayList<>();
        List<Course> courses = this.courseMapper.queryAll();
        if(courses!=null&&courses.size()>0){
            for(Course course:courses){
                KJVo kjVo=new KJVo();
                kjVo.setCourse(course);
                List<Courseware> coursewareList = this.coursewareMapper.selectByCid(course.getCid());
                if(coursewareList!=null&&coursewareList.size()>0){
                    List<String> list=new ArrayList<>();
                    for(Courseware courseware:coursewareList){
                        list.add(courseware.getCwPath());
                    }
                    kjVo.setPaths(list);
                }

                kjVoList.add(kjVo);
            }
        }
        return kjVoList;
    }

    @Override
    public Course getByCid(Integer cid) {
        return this.courseMapper.selectByPrimaryKey(cid);
    }
}
