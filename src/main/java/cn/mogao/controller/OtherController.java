package cn.mogao.controller;
/**
 *
 * @author yq
 * @Date  2019/03/12
 *
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/other")
public class OtherController {
	@RequestMapping("/other")
	public String other(){
		return "/other/other";
	}

}
