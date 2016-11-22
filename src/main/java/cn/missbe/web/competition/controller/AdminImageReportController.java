package cn.missbe.web.competition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/11/7 0007.
 */
@Controller
@RequestMapping(value = "/admin/image")
public class AdminImageReportController {

    @RequestMapping(value = "/report")
    public String imageReport(){
        return "admin/image_report";
    }
}
