package cn.mogao.controller;

import cn.mogao.dict.FeedBackDict;
import cn.mogao.pojo.Feedback;
import cn.mogao.service.FeedbackService;
import cn.mogao.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author yq
 * @Date  2019/03/12
 *
 */
@Controller
@RequestMapping("/feedback")
public class FeedbackController {
	@Autowired
	private FeedbackService feedbackService;
	@RequestMapping("/tofeedback")
	public String tofeedback(){
		return "/feedback/feedback_add";
	}
	
	@RequestMapping("/add")
	public String add(Feedback feedback,HttpServletRequest request,Model m){
		this.feedbackService.insert(feedback);
		request.setAttribute("message", "<script>alert('反馈成功，谢谢你的热情反馈，反馈处理后，反馈结果将会以消息形式发送到你的手机哦！');</script>");
		return "/feedback/feedback_add";
	}
	@RequestMapping("/feedbackList")
	public String feedbackList(Model m,Integer page,Integer size) {
		PageUtil<FeedBackDict> pageUtil = this.feedbackService.listbyPage(page,size);
		
		
		
		
		m.addAttribute("pageBean", pageUtil);
return "/feedback/feedback_list";
	}

}
