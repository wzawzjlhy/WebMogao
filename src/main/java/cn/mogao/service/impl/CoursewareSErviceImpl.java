package cn.mogao.service.impl;

import cn.mogao.mapper.CourseMapper;
import cn.mogao.mapper.CoursewareMapper;
import cn.mogao.mapper.UserCourseMapper;
import cn.mogao.pojo.Course;
import cn.mogao.pojo.Courseware;
import cn.mogao.pojo.User;
import cn.mogao.pojo.UserCourse;
import cn.mogao.service.CoursewareService;
import cn.mogao.vo.CWVo;
import cn.mogao.vo.CsVo;
import cn.mogao.vo.JdVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
@Service
public class CoursewareSErviceImpl implements CoursewareService {
    @Autowired
    private CoursewareMapper coursewareMapper;
    @Autowired
    private UserCourseMapper userCourseMapper;
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<CWVo> getCWVOList(User user) {
        List<CWVo> cwVos=new ArrayList();
        //根据用户id查询用户报名的课程
      List<UserCourse> userCourses=  userCourseMapper.selectByUid(user.getId());
      if(userCourses!=null&&userCourses.size()>0){
          for(UserCourse uc:userCourses){
//根据课程id查询课程名称
              Integer cid = uc.getCid();
              Course course = courseMapper.selectByPrimaryKey(cid);
              CWVo cwVo=new CWVo();
              cwVo.setName(course.getCname());
              //根据课程id查询课程的相关课程文档
              List<Courseware> coursewareList=this.coursewareMapper.selectByCid(cid);
              List<String> pathList=new ArrayList<>();
              for(Courseware  courseware:coursewareList){
                  pathList.add(courseware.getCwid().toString());
              }
              cwVo.setPath(pathList);
              cwVos.add(cwVo);
          }
      }
        return cwVos;
    }

    @Override
    public List<JdVo> getJdVo(User user) {
        List<JdVo> jdVoList=new ArrayList<>();
        //根据用户id查询用户报名的课程
        List<UserCourse> userCourses=  userCourseMapper.selectByUid(user.getId());
        if(userCourses!=null&&userCourses.size()>0){
            for(UserCourse uc:userCourses){
//根据课程id查询课程名称
                Integer cid = uc.getCid();
                Course course = courseMapper.selectByPrimaryKey(cid);
                JdVo jdVo=new JdVo();
                jdVo.setName(course.getCname());
                //根据课程id查询课程的进度信息
                List<Courseware> coursewareList=this.coursewareMapper.selectByCid(cid);
                List<String> pathList=new ArrayList<>();
                for(Courseware  courseware:coursewareList){
                    pathList.add(courseware.getCwPath());
                }
                jdVo.setJd(uc.getSchedule());
                jdVoList.add(jdVo);
            }
        }
        return jdVoList;
    }

    @Override
    public List<CsVo> getCsList(User user) {
        List<CsVo> jdVoList=new ArrayList<>();
        //根据用户id查询用户报名的课程
        List<UserCourse> userCourses=  userCourseMapper.selectByUid(user.getId());
        if(userCourses!=null&&userCourses.size()>0){
            for(UserCourse uc:userCourses){
//根据课程id查询课程名称
                Integer cid = uc.getCid();
                Course course = courseMapper.selectByPrimaryKey(cid);

                CsVo csVo=new CsVo();
                csVo.setCid(cid);
                csVo.setCname(course.getCname());

                csVo.setKg(uc.getUcscore()==null?0:1);
                csVo.setCscore(uc.getUcscore()==null?0:uc.getUcscore());
                jdVoList.add(csVo);

            }
        }
        return jdVoList;
    }

    @Override
    public void save(Courseware courseware) {
        this.coursewareMapper.insertSelective(courseware);
    }

    @Override
    public Courseware getByCWId(Integer cwid) {
        return this.coursewareMapper.selectByPrimaryKey(cwid);
    }
}
