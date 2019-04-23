package cn.mogao.controller;

import cn.mogao.pojo.User;
import cn.mogao.service.UserService;
import cn.mogao.utils.MD5;
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
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login(User user, String verify, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("code");
		if(null!=session.getAttribute("login_user")){
			session.removeAttribute("admin_login");
			return "/user/index";
		}
		if (!code.equalsIgnoreCase(verify)) {
			request.setAttribute("error", "登录失败，验证码错误");
			return "/user/login";
		}
		User login_user = this.userService.login(user);
		if (login_user == null) {
			request.setAttribute("error", "登录失败，用户名或密码错误");
			return "/user/login";
		}
		if (login_user.getStatus() == 1) {
			request.setAttribute("error", "登录失败，你的账号已被禁止登录，请联系管理员！");
			return "/user/login";
		}
		session.removeAttribute("admin_login");
		session.setAttribute("login_user", login_user);
		return "/user/index";
	}
	@RequestMapping("toupdatepassword")
	public String updateuserPassword(){
		
		return "/user/user_updatepassword";

	}
	@RequestMapping("updatepassword")
	public String toupdatepassword(HttpServletRequest request,Model m,String oldpassword,String newpassword,String new2password){
		HttpSession session = request.getSession();
		User login_user = (User) session.getAttribute("login_user");
		if(login_user!=null){
			if(!MD5.encodeByMD5(oldpassword).equalsIgnoreCase(login_user.getPassword())){
				System.out.println(MD5.encodeByMD5(oldpassword));
				System.out.println(login_user.getPassword());
				request.setAttribute("message", "<script>alert('修改密码失败，原始密码不正确');</script>");
				return "/user/user_updatepassword";
			}
			if(!newpassword.equals(new2password)){
				request.setAttribute("message", "<script>alert('修改密码失败，确认密码和新的密码不一致');</script>");

				return "/user/user_updatepassword";
			}
			if(oldpassword.equals(newpassword)){
				request.setAttribute("message", "<script>alert('修改密码失败，新密码和旧的密码相同');</script>");

				return "/user/user_updatepassword";
			}
			login_user.setPassword(MD5.encodeByMD5(newpassword));
			this.userService.update(login_user);
			request.setAttribute("message", "<script>alert('密码修改成功！');</script>");
			session.removeAttribute("login_user");
			session.invalidate();

			return "/user/user_updatepassword";
			
		}
	return "/user/login";
	}
	@RequestMapping("/updateuser")
	public String updateuser(HttpServletRequest  request,Model m,String telephone ,String position){
		HttpSession session = request.getSession();
		User login_user = (User) session.getAttribute("login_user");
		if(login_user!=null){
			login_user.setTelephone(telephone);
			login_user.setPosition(position);
			this.userService.update(login_user);
			session.setAttribute("login_user", login_user);
		}
		m.addAttribute("message","<script>alert('账号资料修改成功！')</script>");
		return "/user/user_update";

	}
	@RequestMapping("/toupdateuser")
	public String toupdateuser(){
		return "/user/user_update";
	}
	@RequestMapping("/quit")
	public String quit(HttpServletRequest  request){
		HttpSession session = request.getSession();
		session.removeAttribute("login_user");
		session.invalidate();
		return "/user/login";
	}
	@RequestMapping("/toRegister")
	public String toRegister(){
		return "/user/register";
	}
	@RequestMapping("/register")
	public String register(String name,String account,String password1,String password2,Model m){
		User user = userService.findUserByAccount(account);
		if (user != null) {
			m.addAttribute("message", "注册失败，该用户名已存在，请更换用户名注册！");
			return "/user/register";
		}
		if (!password1.equals(password2)) {
			m.addAttribute("message", "注册账号失败，两次密码不一致！");
			return "/user/register";
		}
		this.userService.insertUser(account, password1, name);
		m.addAttribute("message",
				"注册成功");
		return "/user/register";

	}
}
