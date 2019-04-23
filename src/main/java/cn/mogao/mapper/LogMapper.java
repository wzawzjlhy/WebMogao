package cn.mogao.mapper;

import cn.mogao.pojo.Log;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 *
 * @author yq
 * @Date  2019/04/18
 *
 */
@Mapper
public interface LogMapper {
    int deleteByPrimaryKey(Integer logId);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

    List<Log> selectAll(@Param("page") int page, @Param("size") int size);

    Long countAllLong();
}