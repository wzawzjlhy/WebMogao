package cn.mogao.service;

import cn.mogao.pojo.Log;
import cn.mogao.utils.PageUtil;
import org.aspectj.lang.JoinPoint;
/**
 *
 * @author yq
 * @Date  2019/04/17
 *
 */
public interface LogService {
    void put(JoinPoint joinPoint, String methodName, String module, String description);

    PageUtil<Log> findAll(int page, int size);
}
