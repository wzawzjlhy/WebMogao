package cn.mogao.controller;

import cn.mogao.pojo.Admin;
import cn.mogao.pojo.User;
import cn.mogao.service.AdminService;
import cn.mogao.service.UserService;
import cn.mogao.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 
 * @author yq
 * @Date  2019/04/18
 *
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;

	@RequestMapping("/login")

	public String login(Admin admin, HttpServletRequest request, Model m) {
        HttpSession session = request.getSession();
	    if(session.getAttribute("admin_login")!=null){
	    	session.removeAttribute("login_user");
	        return "/admin/index";
        }
		Admin admin_login = this.adminService.login(admin);
		if (admin_login != null) {
			session.removeAttribute("login_user");
			session.setAttribute("admin_login", admin_login);
			return "/admin/index";
		}
		m.addAttribute("message", "<script>alert('登录失败，管理员用户名或密码错误');</script>");
		return "/admin/login";

	}

	@RequestMapping("/toadduser")
	public String toadduser() {
		return "/admin/adduser";
	}

	@RequestMapping("/adduser")
	public String adduser(String account, String password1, String password2, String name, HttpServletRequest request,
			Model m) {
		User user = userService.findUserByAccount(account);
		if (user != null) {
			m.addAttribute("message", "<script>alert('分配用户账号失败，该用户名已存在，请更换用户名分配！')</script>");
			return "/admin/adduser";
		}
		if (!password1.equals(password2)) {
			m.addAttribute("message", "<script>alert('分配用户账号失败，两次密码不一致！')</script>");
			return "/admin/adduser";
		}
		this.userService.insertUser(account, password1, name);
		m.addAttribute("message",
				"<script>if(confirm('分配用户账号成功，跳转到用户账号列表？')){window.location.href='http://localhost:8090/enterpriseprojecttracking/admin/userList?page=1&size=5'}</script>");
		return "/admin/adduser";
	}

	@RequestMapping("/userList")
	public String userList(Integer page, Integer size, Model m) {
		PageUtil<User> pageUtil = this.userService.listbyPage(page, size);
		m.addAttribute("pageBean", pageUtil);
		return "/admin/userList";
	}

	@RequestMapping("/deleteUser")
	public String deleteUser(Integer id) {
		this.userService.deleteUserbyId(id);
		return "redirect:/admin/userList?page=1&size=5";
	}

	@RequestMapping("/updateUser")
	public String updateUser(String account, Model m) {
		User findUserByAccount = this.userService.findUserByAccount(account);
		m.addAttribute("user", findUserByAccount);
		return "/admin/userUpdate";
	}

	@RequestMapping("/updateuser")
	public String updateuser(User user, Model m) {
		this.userService.update(user);

		return "redirect:/admin/userList?page=1&size=5";

	}


	@RequestMapping("/quit")
	public String quit(HttpServletRequest  request){
		request.getSession().removeAttribute("login_admin");
		return "/admin/login";
	}
	@RequestMapping("/tologin")
	public String toLogin(){
		return "/admin/login";
	}
}
