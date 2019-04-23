package cn.mogao.service;

import cn.mogao.vo.AdminSLVo;

import java.util.List;

public interface UserCourseService {
    Boolean findUCByUidAndCid(Integer id, Integer cid);

    void userSq(Integer id, Integer cid);

    List<AdminSLVo> getAdminSLVO();

    void update(Integer ucid, Integer state);
}
