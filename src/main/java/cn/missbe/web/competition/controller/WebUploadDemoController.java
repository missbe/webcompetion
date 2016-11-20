package cn.missbe.web.competition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by Administrator on 2016/11/15 0015.
 */
@Controller
@RequestMapping(value = "/upload")
public class WebUploadDemoController {

    @RequestMapping(value = "/save")
    public String save(InputStream stream ,HttpServletRequest request, Model model){
        model.addAttribute("message","这是一个上传文件的测试");
        try {
           InputStream inputStream= request.getInputStream();
            if(null != inputStream){
                System.out.println("获取成功");
            }else{
                System.out.println("获取没有成功:");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(null != stream){
            System.out.println("stream获取成功");
        }else{
            System.out.println("stream获取没有成功:");
        }
        return "message";
    }

    @RequestMapping(value = "/demo")
    public String demo(Model model){
//        model.addAttribute("message","这是一个上传文件的测试");
        return "upload_demo";
    }
}
