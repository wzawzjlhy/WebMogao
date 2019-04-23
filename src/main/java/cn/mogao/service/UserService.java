package cn.mogao.service;

import cn.mogao.pojo.User;
import cn.mogao.utils.PageUtil;

/**
 *
 * @author yq
 * @Date  2019/04/17
 *
 */
public interface UserService {

	User login(User user);

	void update(User login_user);

	User findUserByAccount(String account);

	void insertUser(String account, String password1, String name);

	PageUtil<User> listbyPage(Integer page, Integer size);

	void deleteUserbyId(Integer id);

}
