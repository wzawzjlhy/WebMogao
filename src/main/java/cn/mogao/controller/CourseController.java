package cn.mogao.controller;

import cn.mogao.pojo.Course;
import cn.mogao.pojo.Courseware;
import cn.mogao.pojo.User;
import cn.mogao.service.CourseService;
import cn.mogao.service.CoursewareService;
import cn.mogao.service.UserCourseService;
import cn.mogao.vo.AdminSLVo;
import cn.mogao.vo.CourseSqVo;
import cn.mogao.vo.KJVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *
 * @author yq
 * @Date  2019/04/18
 *
 */

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private UserCourseService userCourseService;

    @Autowired
    private CoursewareService coursewareService;
    @RequestMapping("/tofindcourse")
    public String tofindcourse(Model model){

model.addAttribute("cList",this.courseService.queryAll());


        return "course/findcourse";
    }
    @RequestMapping("/query")
    public String query(String cname, String cdate, Model model){
        List<Course> course= this.courseService.query(cname,cdate);
        model.addAttribute("course",course);
return "/course/query";
    }
    @RequestMapping("/tosq")
    public String tosql(Model model, HttpSession session){
        List<Course> course= this.courseService.queryAll();

        List<CourseSqVo> courseSqVos=new ArrayList<>();
        Date now=new Date();
        if(course!=null&&course.size()>0){
            for(Course co:course){
                CourseSqVo courseSqVo=new CourseSqVo();
                courseSqVo.setCourse(co);
                Integer isSq=0;
                String time = co.getCdate().split(" ")[0];
                Date parse = null;
                try {
                    parse = new SimpleDateFormat("yyyy-MM-dd").parse(time);
                } catch (ParseException e) {
                    e.printStackTrace();
                }


                User user=      (User)session.getAttribute("login_user");
                Boolean isNotSq=         this.userCourseService.findUCByUidAndCid(user.getId(),co.getCid());
                if(isNotSq){
                    if(parse.getTime()<now.getTime()){
                        //开课时间已过，无法申请
                        isSq=0;
                    }else {
                        //可以申请
                        isSq = 1;
                    }
                }else{
                    //已经申请过，无法申请
                    isSq=2;
                }




                courseSqVo.setIsSq(isSq);
                courseSqVos.add(courseSqVo);

            }
        }
        model.addAttribute("courseVos",courseSqVos);
        return "/course/sq";
    }
    @RequestMapping("/userSq")
    public String userSq(Model model, HttpSession session,Integer cid){
        User user=      (User)session.getAttribute("login_user");
        this.userCourseService.userSq(user.getId(),cid);
        return "redirect:tosq";
    }


    @RequestMapping("/adminSLCourse")
    public String adminSLCourse(Model model, HttpSession session){
 List<AdminSLVo> adminSLVoList=this.userCourseService.getAdminSLVO();
 model.addAttribute("adminSLVoList",adminSLVoList);
        return "/course/adminSLCourse";

    }
    @RequestMapping("/adminToAccess")
    public String adminToAccess(Model model, HttpSession session,Integer ucid,Integer state){
this.userCourseService.update(ucid,state);

        return "redirect:adminSLCourse";
    }





    @RequestMapping("/toAddCourse")
    public String toAddCourse(){
        return "/course/toAddCourse";
    }
    @RequestMapping("/uploadKJ")
    public String uploadKJ(@RequestParam("file") MultipartFile file,Integer cid,Model model){


        if (file.isEmpty()) {
            return "上传失败，请选择文件";
        }

        String fileName = file.getOriginalFilename();
        String filePath = "F:\\test\\";
        String UUID= java.util.UUID.randomUUID().toString();
        String realPath=filePath +UUID+ fileName;
        File dest = new File(realPath);
        try {
            file.transferTo(dest);
            Courseware courseware=new Courseware();
            courseware.setCwPath(realPath);
            courseware.setCid(cid);
            this.coursewareService.save(courseware);
            model.addAttribute("message","上传视频成功，课件添加成功");
            return "redirect:tokjupload";
        } catch (IOException e) {

        }
        model.addAttribute("message","上传视频失败，课件添加失败");
















        return "redirect:tokjupload";

    }
    @RequestMapping("/addcourse")
    public String addcourse(@RequestParam("file") MultipartFile file,Course course,Model model){


        if (file.isEmpty()) {
            return "上传失败，请选择文件";
        }

        String fileName = file.getOriginalFilename();
        String filePath = "F:\\test\\";
        String UUID= java.util.UUID.randomUUID().toString();
        String realPath=filePath +UUID+ fileName;
        File dest = new File(realPath);
        try {
            file.transferTo(dest);
            course.setCpath(realPath);
            this.courseService.save(course);
model.addAttribute("message","上传视频成功，课程添加成功");
            return "/course/toAddCourse";
        } catch (IOException e) {

        }
        model.addAttribute("message","上传视频失败，课程添加失败");
        return "/course/toAddCourse";


    }
    @RequestMapping("/tokjupload")
    public String tokjupload(Model model){
List<KJVo> kjVoList=this.courseService.getKJVO();
model.addAttribute("kjVoList",kjVoList);
        return "/course/tokjupload";
    }

}
