package cn.mogao.service;


import cn.mogao.pojo.Courseware;
import cn.mogao.pojo.User;
import cn.mogao.vo.CWVo;
import cn.mogao.vo.CsVo;
import cn.mogao.vo.JdVo;

import java.util.List;

public interface CoursewareService {
    List<CWVo> getCWVOList(User user);

    List<JdVo> getJdVo(User user);

    List<CsVo> getCsList(User user);

    void save(Courseware courseware);

    Courseware getByCWId(Integer cwid);
}
