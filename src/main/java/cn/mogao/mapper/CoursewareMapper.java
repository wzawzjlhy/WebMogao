package cn.mogao.mapper;

import cn.mogao.pojo.Courseware;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CoursewareMapper {
    int deleteByPrimaryKey(Integer cwid);

    int insert(Courseware record);

    int insertSelective(Courseware record);

    Courseware selectByPrimaryKey(Integer cwid);

    int updateByPrimaryKeySelective(Courseware record);

    int updateByPrimaryKey(Courseware record);

    List<Courseware> selectByCid(@Param("cid") Integer cid);
}