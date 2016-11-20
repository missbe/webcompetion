package cn.missbe.web.competition.controller;

import cn.missbe.web.competition.entity.Contact;
import cn.missbe.web.competition.service.impl.ContactServiceImpl;
import cn.missbe.web.competition.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Administrator on 2016/11/8 0008.
 */
@Controller
public class WebContactController {
    @Autowired
    private ContactServiceImpl contactService;
    @RequestMapping(value = "/contact")
    public String contactUs(){
        return "contact";
    }

    @RequestMapping(value = "/contact/save")
    public String contactSave(HttpServletRequest request, Model model){
        String retUrl = request.getHeader("Referer");
        model.addAttribute("url",retUrl);///访问前一页面
        Contact contact=convertContact(request);
        System.out.println(contact.getContactEmail()+":"+contact.getContactMessage());

        contactService.save(contact);

        model.addAttribute("message","----反馈信息提交成功，你可以进行以下两个操作----");


        return "message";
    }
    private Contact convertContact(HttpServletRequest request){
        Contact contact=new Contact();
        contact.setContactItems(request.getParameter("items")!=null ? request.getParameter("items") : "木有条目");
        contact.setContactEmail(request.getParameter("email") !=null ? request.getParameter("email") : "未留下email");
        contact.setContactMessage(request.getParameter("comments"));
        contact.setContactName(request.getParameter("name") !=null ? request.getParameter("name") : "未留名");

        contact.setContactTime(DateUtil.formateDateyyyy_MM_ddHHmmss(new Date()));
        return contact;
    }
}
