package cn.mogao.controller;

import cn.mogao.pojo.Log;
import cn.mogao.service.LogService;
import cn.mogao.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author yq
 * @Date  2019/04/18
 *
 */
@Controller
@RequestMapping("/log")
public class LogController {
    @Autowired
    private LogService logService;
 @RequestMapping("/findAll")
    public String findAll(Model model,Integer page,Integer size){
     if(page==null){
         page=1;
     }
     if(size==null){
         size=10;
     }
    PageUtil<Log> logList=logService.findAll(page ,size);
     model.addAttribute("pageBean",logList);
     return "/log/log_list";
 }

}
