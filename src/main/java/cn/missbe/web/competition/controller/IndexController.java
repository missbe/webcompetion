package cn.missbe.web.competition.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.tools.internal.ws.processor.model.Request;

import cn.missbe.web.competition.App;
import cn.missbe.web.competition.dao.impl.WebinfoDaoImpl;
import cn.missbe.web.competition.entity.Gallery;
import cn.missbe.web.competition.entity.Manager;
import cn.missbe.web.competition.entity.Webinfo;
import cn.missbe.web.competition.model.GalleryImage;
import cn.missbe.web.competition.service.ManagerService;
import cn.missbe.web.competition.service.impl.GalleryServiceImpl;
import cn.missbe.web.competition.service.impl.ManagerServiceImpl;
import cn.missbe.web.competition.service.impl.WebinfoServiceImpl;

@Controller
public class IndexController {
	@Autowired
    private WebinfoServiceImpl webinfoservice;
	@Autowired
	private ManagerServiceImpl managerService;
	@Autowired
    private GalleryServiceImpl galleryService;
	@RequestMapping(value = "/")
	
    public String TurnToIndex(Model model)
    {
		Webinfo webinfo=(Webinfo) webinfoservice.findAll(Webinfo.class).get(0);
		List<GalleryImage> imagelist=imageList();
		if(webinfo!=null)
		{
		model.addAttribute("webinfo",webinfo );
		model.addAttribute("imagelist",imagelist);
		//获取画廊图片list的长度
		model.addAttribute("size", imagelist.size());
		}
		
    	return "index";
    	
    }
	@RequestMapping(value = "/webgallery")
	public String TurnToWebGallery(Model model,HttpServletRequest request)
	{
		Webinfo webinfo=(Webinfo) webinfoservice.findAll(Webinfo.class).get(0);
		List<GalleryImage> imagelist=imageList();
		if(webinfo!=null)
		{
		model.addAttribute("webinfo",webinfo );
		model.addAttribute("imagelist",imagelist);
		model.addAttribute("id", Integer.parseInt(request.getParameter("id")));
		model.addAttribute("size", imagelist.size());
		model.addAttribute("imagecount", imagelist.get(Integer.parseInt(request.getParameter("id"))).getImage().toString().split(App.GALLERY_SEPARATOR).length);
		}
		return "webgallery";
		
	}
	
     private List<GalleryImage> imageList(){
        List<GalleryImage> imageList=new ArrayList<GalleryImage>();
        List<Gallery> galleryList=galleryService.findAll(Gallery.class);
        ///处理画廊的图像
        if(null!=galleryList){
            for(Gallery gallery:galleryList){
                ///进行赋值操作
                GalleryImage galleryImage=new GalleryImage();
                //获取图片的ID
                galleryImage.setId(gallery.getId());
                //获取图片的标题
                galleryImage.setTitle(gallery.getGalleryTitle());
                //获取图片的路径
                galleryImage.setDate(gallery.getGalleryTime());
                //获取图片内容
                galleryImage.setContent(gallery.getContent());
                if(null!=gallery.getGalleryImgage()){
                    ///处理画廊图像路径以分隔符分隔
                    for(String s:gallery.getGalleryImgage().split(App.GALLERY_SEPARATOR)){
                        galleryImage.getImage().add(App.GALLERY_PREFIX+s);
                    }//end
                }else{
                    galleryImage.getImage().add(App.ADMIN_PREFIX+"logo2.jpg");
                }
                imageList.add(galleryImage);
            }
        }
        return imageList;///返回处理过后的lis
	}
}