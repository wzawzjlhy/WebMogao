package cn.mogao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author yq
 * @Date  2019/03/12
 *
 */
@Controller
public class IndexController {
 
    @RequestMapping(value="/index",method=RequestMethod.GET)
    public String index() {
        System.out.println("执行了");
        return "login";
    }
}