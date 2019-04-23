package cn.mogao.controller;

import cn.mogao.pojo.Course;
import cn.mogao.pojo.User;
import cn.mogao.service.CourseService;
import cn.mogao.service.CoursewareService;
import cn.mogao.vo.CWVo;
import cn.mogao.vo.CsVo;
import cn.mogao.vo.JdVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/cw")
@Controller
public class CourseWareController {
    @Autowired
    private CoursewareService coursewareService;
    @Autowired
    private CourseService courseService;
    @RequestMapping("/find")
    public String find(Model model, HttpSession session){
        User user=      (User)session.getAttribute("login_user");
       List<CWVo> cwVoList=this.coursewareService.getCWVOList(user);
       model.addAttribute("cwVoList",cwVoList);
       return "/cw/cwList";
    }
    @RequestMapping("/jd")
    public String jd(Model model, HttpSession session){
        User user=      (User)session.getAttribute("login_user");
        List<JdVo> jdVos=this.coursewareService.getJdVo(user);
        model.addAttribute("jdVos",jdVos);
        return "/cw/jd";
    }
    @RequestMapping("/tocs")
    public String tocs(Model model, HttpSession session){
        User user=      (User)session.getAttribute("login_user");
        List<CsVo> ceList=this.coursewareService.getCsList(user);
        model.addAttribute("ceList",ceList);
        return "/cw/tocs";
    }
    @RequestMapping("/tomovie")
    public String tomovie(Model model, HttpSession session){
        User user=      (User)session.getAttribute("login_user");
        List<CsVo> ceList=this.coursewareService.getCsList(user);
        model.addAttribute("ceList",ceList);
        return "/cw/tomovie";
    }
    @RequestMapping("/kmovie")
    public String kmovie(Integer cid,Model model, HttpSession session){
       Course course= courseService.getByCid(cid);
       model.addAttribute("course",course);
       return "/cw/movie";
    }
    @RequestMapping("/csonline")
    public String csonline(Integer cid){

        return "/test/test";
    }


}
