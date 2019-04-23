package cn.mogao.controller;


import cn.mogao.pojo.Courseware;
import cn.mogao.service.CoursewareService;
import cn.mogao.utils.DownloadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/dw")
public class DwController {
    @Autowired
    private CoursewareService coursewareService;

   /**
     * 下载课件
     * @return 返回excel模板
     */
    @RequestMapping(value = "/downloadWhpModel", method = RequestMethod.GET)
    @ResponseBody

    public Object downloadModel(Integer cwid){

       Courseware courseware= coursewareService.getByCWId(cwid);
        ResponseEntity<InputStreamResource> response = null;
        try {

            System.out.println("执行了");
            response = DownloadFileUtil.download(courseware.getCwPath(), "课件资料");
        } catch (Exception e) {

        }
        return response;
    }
}
