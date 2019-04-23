package cn.mogao.mapper;

import cn.mogao.pojo.UserCourse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserCourseMapper {
    int deleteByPrimaryKey(Integer ucid);

    int insert(UserCourse record);

    int insertSelective(UserCourse record);

    UserCourse selectByPrimaryKey(Integer ucid);

    int updateByPrimaryKeySelective(UserCourse record);

    int updateByPrimaryKey(UserCourse record);

    UserCourse findUCByUidAndCid(@Param("uid") Integer uid, @Param("cid") Integer cid);

    List<UserCourse> selectByUid(@Param("uid") Integer uid);

    List<UserCourse> findAll();
}