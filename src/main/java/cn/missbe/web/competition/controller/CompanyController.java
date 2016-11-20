package cn.missbe.web.competition.controller;

import cn.missbe.web.competition.App;
import cn.missbe.web.competition.entity.Webinfo;
import cn.missbe.web.competition.service.impl.WebinfoServiceImpl;
import com.alibaba.druid.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.OutputStream;
@Controller
@RequestMapping(value = "/admin")
public class CompanyController {
	@Autowired
    private WebinfoServiceImpl webinfoservice;
  //上传网站的logo图标并保存到指定的目录
    @RequestMapping(value = "company/uploadImg",method = RequestMethod.POST)
    public String uploadImg(HttpServletRequest request, Model model){
    	
        String base64codeimg=request.getParameter("base64");
        Base64 base64=new Base64();
        //获取base64解密后的图片流
        byte []bytes=base64.base64ToByteArray(base64codeimg);
        //System.out.println(base64codeimg);
        //如果获取到的有数据的话
        if(base64codeimg!=null||base64codeimg!=null)
        {
        	//获取绝对路径
        	String rootPath=request.getServletContext().getRealPath("/");
        	//获取上传的文件的名字
        	String filename=request.getParameter("name");
        	filename=filename.substring(filename.lastIndexOf('.'));
        	String allFileName=rootPath+ App.WEB_ICONX+"/"+"logo.png";
        	System.out.print(allFileName);
        	//新建一个文件
        	try{  
        	OutputStream outputStream =new FileOutputStream(allFileName);
        	outputStream.write(bytes);
        	outputStream.flush();
        	outputStream.close();
                  
        	}
        	catch (Exception e) {
				// TODO: handle exception
        		model.addAttribute("message","--上传异常--");
        		return "admin/message";
			}
        	System.out.print(rootPath);
        	
        }
//        return "redirect:/admin/manager/list?pageNo=1";
        model.addAttribute("message","--修改成功--");
        return "admin/message";
    }
    //获取上传的表单的值，并将其中的内容保存到数据库中
    @RequestMapping(value="/company/uploadForm")
    public String uploadform(HttpServletRequest request, Model model)
    {
    	MultipartHttpServletRequest   multipartRequest   =   (MultipartHttpServletRequest)   request;
    	
    	Webinfo webinfo=(Webinfo) webinfoservice.findAll(Webinfo.class).get(0);
    	if(webinfo!=null)
    	{
    	webinfo.setDomain(request.getParameter("surl"));
    	webinfo.setAddress(request.getParameter("s_address"));
    	webinfo.setDescription(request.getParameter("sdescription"));
    	webinfo.setEmail(request.getParameter("s_email"));
    	webinfo.setFooter_info(request.getParameter("scopyright"));
    	webinfo.setKeywords(request.getParameter("skeywords"));
    	webinfo.setPerson(request.getParameter("s_name"));
    	webinfo.setPhone(request.getParameter("s_tel"));
    	webinfo.setTitle(request.getParameter("stitle"));
    	webinfo.setphone_400(request.getParameter("s_tel"));
    	webinfo.setfax(request.getParameter("s_fax"));
    	webinfo.setQq(request.getParameter("s_qq"));
    	webinfoservice.save(webinfo);
    	
    	model.addAttribute("message","--修改成功--");
   	    return "admin/message";
    	}
    	else{
    	    	//System.out.print(request.getParameter("slogo"));
    	//System.out.print(request.getParameter("scopyright"));
    	
    	model.addAttribute("message","--修改失败--");
    	 return "admin/message";
    	}
    	 
    }
    //admin/websiteinfo.jsp
    @RequestMapping(value="/company/websiteinfo")
    public String Shwowebsiteinfo(Model model)
    {
    	Webinfo webinfo=(Webinfo) webinfoservice.findAll(Webinfo.class).get(0);
        model.addAttribute("webinfo",webinfo);
    	return "admin/websiteinfo";
    	
    	
    }
}