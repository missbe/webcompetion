package cn.missbe.web.competition.controller;

import cn.missbe.web.competition.App;
import cn.missbe.web.competition.entity.Blog;
import cn.missbe.web.competition.entity.Gallery;
import cn.missbe.web.competition.entity.Manager;
import cn.missbe.web.competition.model.GalleryImage;
import cn.missbe.web.competition.service.impl.BlogServiceImpl;
import cn.missbe.web.competition.service.impl.GalleryServiceImpl;
import cn.missbe.web.competition.service.impl.ManagerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/11/16 0016.
 */
@Controller
@RequestMapping(value = "/gallery")
public class WebGalleryController {

    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private GalleryServiceImpl galleryService;
    @Autowired
    private ManagerServiceImpl managerService;

    @RequestMapping(value = "/list")
    public String listImage(Model model){
        List<String> list=new ArrayList<String>();//存储图片的路径

        List<Manager> managerList=managerService.findAll(Manager.class);
        ///处理管理员的图像
        if(null!=managerList){
            for (Manager manager:managerList) {
                list.add(App.ADMIN_PREFIX+manager.getImage());
            }
        }
        List<Gallery> galleryList=galleryService.findAll(Gallery.class);
        ///处理画廊的图像
        if(null!=galleryList){
            for(Gallery gallery:galleryList){
                ///处理画廊图像路径以分隔符分隔
                if(null!=gallery.getGalleryImgage()){
                    ///处理画廊图像路径以分隔符分隔
                    for(String s:gallery.getGalleryImgage().split(App.GALLERY_SEPARATOR)){
                        list.add(App.GALLERY_PREFIX+s);
                    }//end
                }else{
                    list.add(App.ADMIN_PREFIX+"logo2.jpg");
                }
            }
        }
        List<Blog> blogList=blogService.findAll(Blog.class);
        ///处理博客的图像
        if(null!=blogList){
            for(Blog blog:blogList){
                list.add(App.BLOG_PREFIX+blog.getBlogImage());
            }
        }
        model.addAttribute("list",list);
        model.addAttribute("size",list.size());
        return "gallery";
    }
    ////返回处理过后的画廊数据
    public List<GalleryImage> imageList(){
        List<GalleryImage> imageList=new ArrayList<GalleryImage>();
        List<Gallery> galleryList=galleryService.findAll(Gallery.class);
        ///处理画廊的图像
        if(null!=galleryList){
            for(Gallery gallery:galleryList){
                ///进行赋值操作
                GalleryImage galleryImage=new GalleryImage();
                galleryImage.setId(gallery.getId());
                galleryImage.setTitle(gallery.getGalleryTitle());
                galleryImage.setDate(gallery.getGalleryTime());
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
        return imageList;///返回处理过后的list
    }
}
