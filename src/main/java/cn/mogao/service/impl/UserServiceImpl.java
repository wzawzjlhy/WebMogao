package cn.mogao.service.impl;

import cn.mogao.annotation.Log;
import cn.mogao.mapper.UserMapper;
import cn.mogao.pojo.User;
import cn.mogao.pojo.UserExample;
import cn.mogao.pojo.UserExample.Criteria;
import cn.mogao.service.UserService;
import cn.mogao.utils.MD5;
import cn.mogao.utils.PageUtil;
import cn.mogao.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 *
 * @author yq
 * @Date  2019/04/14
 *
 */

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Log(module = "用户操作",description = "用户登录")
    @Override
    public User login(User user) {
        // TODO Auto-generated method stub
        UserExample userExample = new UserExample();
        Criteria createCriteria = userExample.createCriteria();
        createCriteria.andAccountEqualTo(user.getAccount());
        createCriteria.andPasswordEqualTo(MD5.encodeByMD5(user.getPassword()));
        List<User> selectByExample = this.userMapper.selectByExample(userExample);
        if (selectByExample != null && selectByExample.size() > 0) {
            User user2 = selectByExample.get(0);
            user2.setLastlogintime(TimeUtil.getNowTime());
            this.userMapper.updateByPrimaryKey(user2);
            return user2;
        }
        return null;
    }
    @Log(module = "用户操作",description = "用户修改")
    @Override
    public void update(User login_user) {
        // TODO Auto-generated method stub
        this.userMapper.updateByPrimaryKey(login_user);
    }
    @Override
    public User findUserByAccount(String account) {
        // TODO Auto-generated method stub
        UserExample userExample = new UserExample();
        Criteria createCriteria = userExample.createCriteria();
        createCriteria.andAccountEqualTo(account);

        List<User> selectByExample = this.userMapper.selectByExample(userExample);
        if (selectByExample != null && selectByExample.size() > 0) {
            return selectByExample.get(0);
        }
        return null;
    }
    @Log(module = "用户管理",description = "添加用戶")
    @Override
    public void insertUser(String account, String password1, String name) {
        // TODO Auto-generated method stub
        User user = new User();
        user.setAccount(account);
        user.setName(name);
        user.setPassword(MD5.encodeByMD5(password1));
        user.setStatus(0);
        user.setDistributiontime(TimeUtil.getNowTime());
        this.userMapper.insert(user);
    }
    @Log(module = "用户操作",description = "分頁查詢用戶")
    @Override
    public PageUtil<User> listbyPage(Integer page, Integer size) {
        if (page == null) {
            page = 1;
        }
        if (size == null) {
            size = 5;
        }
        PageUtil<User> pageUtil = new PageUtil<User>();
        pageUtil.setPage_current(page);
        pageUtil.setPage_size(size);
        UserExample user = new UserExample();
        Criteria createCriteria = user.createCriteria();
        createCriteria.andIdIsNotNull();
        int countByExample = this.userMapper.countByExample(user);
        long Garagetotal = this.userMapper.countByExample(user);
        pageUtil.setPage_total((Garagetotal % size) == 0 ? (Garagetotal / size) : (Garagetotal / size) + 1);
        List<User> list = this.userMapper.findUserlimit((page - 1) * size,
                size);
        pageUtil.setPage_list(list);
        return pageUtil;
    }
    @Log(module = "用户管理",description = "刪除用戶")
    @Override
    public void deleteUserbyId(Integer id) {
        // TODO Auto-generated method stub
        this.userMapper.deleteByPrimaryKey(id);
    }

}
