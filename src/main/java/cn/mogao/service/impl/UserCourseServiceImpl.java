package cn.mogao.service.impl;

import cn.mogao.enums.UserCourseEnum;
import cn.mogao.mapper.CourseMapper;
import cn.mogao.mapper.UserCourseMapper;
import cn.mogao.mapper.UserMapper;
import cn.mogao.pojo.Course;
import cn.mogao.pojo.User;
import cn.mogao.pojo.UserCourse;
import cn.mogao.service.UserCourseService;
import cn.mogao.vo.AdminSLVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
@Service
public class UserCourseServiceImpl implements UserCourseService {
    @Autowired
    private UserCourseMapper userCourseMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public Boolean findUCByUidAndCid(Integer uid, Integer cid) {
        UserCourse userCourse=this.userCourseMapper.findUCByUidAndCid(uid,cid);
        return userCourse==null;
    }

    @Override
    public void userSq(Integer id, Integer cid) {
        UserCourse us=this.userCourseMapper.findUCByUidAndCid(id,cid);
        if(us==null) {
            UserCourse userCourse = new UserCourse();
            userCourse.setUid(id);
            userCourse.setCid(cid);
            userCourse.setUcstatu(UserCourseEnum.INIT_SQ.getCode());
            this.userCourseMapper.insert(userCourse);

        }
    }

    @Override
    public List<AdminSLVo> getAdminSLVO() {
        List<AdminSLVo> adminSLVoList=new ArrayList<>();
       List<UserCourse> userCourseList=this.userCourseMapper.findAll();
       if(userCourseList!=null&&userCourseList.size()>0){

           for(UserCourse userCourse:userCourseList) {
               AdminSLVo adminSLVo = new AdminSLVo();
               adminSLVo.setUserCourse(userCourse);
               Integer uid = userCourse.getUid();
               User user = this.userMapper.selectByPrimaryKey(uid);
               adminSLVo.setUser(user);

               Integer cid = userCourse.getCid();
               Course course = courseMapper.selectByPrimaryKey(cid);
               adminSLVo.setCourse(course);
               adminSLVoList.add(adminSLVo);

           }

       }else{
           return null;
       }
       return adminSLVoList;
    }

    @Override
    public void update(Integer ucid, Integer state) {
        UserCourse userCourse = this.userCourseMapper.selectByPrimaryKey(ucid);
        userCourse.setUcstatu(state);
        this.userCourseMapper.updateByPrimaryKey(userCourse);
    }
}
