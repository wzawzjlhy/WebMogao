package cn.mogao.mapper;

import cn.mogao.pojo.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> queryAll();

    List<Course> queryByCname(@Param("cname") String cname);

    List<Course> queryByCnameAndCdate(@Param("cname") String cname, @Param("cdate") String cdate);
}