package cn.missbe.web.competition.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.missbe.web.competition.dao.impl.WebinfoDaoImpl;
import cn.missbe.web.competition.entity.Webinfo;
import cn.missbe.web.competition.service.impl.WebinfoServiceImpl;

@Controller
public class IndexController {
	@Autowired
    private WebinfoServiceImpl webinfoservice;
	@RequestMapping(value = "/")
	
    public String TrunToIndex(Model model)
    {
		Webinfo webinfo=(Webinfo) webinfoservice.findAll(Webinfo.class).get(0);
		if(webinfo!=null)
		{
		model.addAttribute("webinfo",webinfo );
		}
    	return "index";
    	
    }
}