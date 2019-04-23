package cn.mogao.service.impl;

import cn.mogao.mapper.LogMapper;
import cn.mogao.pojo.*;
import cn.mogao.service.LogService;
import cn.mogao.utils.IpUtils;
import cn.mogao.utils.PageUtil;
import cn.mogao.utils.TimeUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.javassist.*;
import org.apache.ibatis.javassist.bytecode.CodeAttribute;
import org.apache.ibatis.javassist.bytecode.LocalVariableAttribute;
import org.apache.ibatis.javassist.bytecode.MethodInfo;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/**
 *
 * @author yq
 * @Date  2019/04/14
 *
 */
@Service
public class LogServiceImpl implements LogService {
    private static final String LOG_CONTENT = "[类名]:%s,[方法]:%s,[参数]:%s,[IP]:%s";
private String username;
    @Autowired
    private LogMapper logMapper;

    public String initUsername(String username) {
        if(!StringUtils.isEmpty(username)){
            this.username = username;
        }
        return this.username;
    }

    @Override
    public void put(JoinPoint joinPoint, String methodName, String module, String description) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Log log = new Log();


     Admin admin=   (Admin)request.getSession().getAttribute("admin_login");
        User login_user = (User) request.getSession().getAttribute("login_user");
        if(admin!=null){
            username ="管理员："+admin.getUsername();
        }
        if(login_user!=null){
            username="用户："+login_user.getAccount();
        }

        String ip = IpUtils.getIpAddr(request);
        log.setLogUsername(username);
        log.setLogModule(module);
        log.setLogDescription(description);
        log.setLogTime(TimeUtil.getNowTime());
        log.setLogIp(ip);
        try {
            log.setLogContent(operateContent(joinPoint, methodName, ip, request));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NotFoundException e) {
            e.printStackTrace();
        }
        log.setLogAble(1);
        //insert(log);
        logMapper.insert(log);

    }
    public String operateContent(JoinPoint joinPoint, String methodName, String ip, HttpServletRequest request) throws ClassNotFoundException, NotFoundException {
        String className = joinPoint.getTarget().getClass().getName();
        Object[] params = joinPoint.getArgs();
        String classType = joinPoint.getTarget().getClass().getName();
        Class<?> clazz = Class.forName(classType);
        String clazzName = clazz.getName();
        Map<String,Object > nameAndArgs = getFieldsName(this.getClass(), clazzName, methodName,params);
        StringBuffer bf = new StringBuffer();
        if (!CollectionUtils.isEmpty(nameAndArgs)){
            Iterator it = nameAndArgs.entrySet().iterator();
            while (it.hasNext()){
                Map.Entry entry = (Map.Entry) it.next();
                String key = (String) entry.getKey();
                String value = JSONObject.toJSONString(entry.getValue());
                bf.append(key).append("=");
                bf.append(value).append("&");
            }
        }
        if (StringUtils.isEmpty(bf.toString())){
            bf.append(request.getQueryString());
        }
        return String.format(LOG_CONTENT, className, methodName, bf.toString(), ip);
    }
    private Map<String,Object> getFieldsName(Class cls, String clazzName, String methodName, Object[] args) throws NotFoundException {
        Map<String,Object > map=new HashMap<String,Object>();

        ClassPool pool = ClassPool.getDefault();
        ClassClassPath classPath = new ClassClassPath(cls);
        pool.insertClassPath(classPath);

        CtClass cc = pool.get(clazzName);
        CtMethod cm = cc.getDeclaredMethod(methodName);
        MethodInfo methodInfo = cm.getMethodInfo();
        CodeAttribute codeAttribute = methodInfo.getCodeAttribute();
        LocalVariableAttribute attr = (LocalVariableAttribute) codeAttribute.getAttribute(LocalVariableAttribute.tag);
        if (attr == null) {
            // exception
            return map;
        }
        int pos = Modifier.isStatic(cm.getModifiers()) ? 0 : 1;
        for (int i = 0; i < cm.getParameterTypes().length; i++){
            map.put( attr.variableName(i + pos),args[i]);//paramNames即参数名
        }
        return map;
    }

    @Override
    public PageUtil<Log> findAll(int page, int size) {

        PageUtil<Log> pageUtil = new PageUtil<Log>();
        pageUtil.setPage_current(page);
        pageUtil.setPage_size(size);


        long Garagetotal = this.logMapper.countAllLong();
        pageUtil.setPage_total((Garagetotal % size) == 0 ? (Garagetotal / size) : (Garagetotal / size) + 1);
        List<Log> list = this.logMapper.selectAll((page - 1) * size,
                size);

        pageUtil.setPage_list(list);
        return pageUtil;
    }
}
