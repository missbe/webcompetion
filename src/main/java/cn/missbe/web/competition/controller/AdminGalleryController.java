package cn.missbe.web.competition.controller;

/**
 * Created by Administrator on 2016/11/14 0014.
 */

import cn.missbe.web.competition.App;
import cn.missbe.web.competition.entity.Gallery;
import cn.missbe.web.competition.entity.GalleryCategory;
import cn.missbe.web.competition.entity.GalleryTags;
import cn.missbe.web.competition.entity.Manager;
import cn.missbe.web.competition.service.impl.GalleryCategoryServiceImpl;
import cn.missbe.web.competition.service.impl.GalleryServiceImpl;
import cn.missbe.web.competition.service.impl.GalleryTagsServiceImpl;
import cn.missbe.web.competition.service.impl.ManagerServiceImpl;
import cn.missbe.web.competition.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

/**
 * Created by Administrator on 2016/11/8 0008.
 */
@Controller
@RequestMapping(value = "/admin/gallery")
public class AdminGalleryController {
    @Autowired
    private GalleryServiceImpl galleryService;
    @Autowired
    private GalleryCategoryServiceImpl galleryCategoryService;
    @Autowired
    private  GalleryTagsServiceImpl galleryTagsService;
    @Autowired
    private ManagerServiceImpl managerServiceImpl;

    private List<Manager> managerList;///选取所有管理员
    List<GalleryCategory> categorList;//选取所有分类
    List<GalleryTags> tagsList;///选取所有标签

    private long pageCount=-1;

    @RequestMapping(value = "/delete")
    public String galleryDelete(int id,Model model)
    {
        System.out.println("----你确定要删除--Gallery--ID--"+id);
        String message;
        if(id<=0){
            message="---图文ID错误，删除失败----";
        }else{
//            galleryService.delete(Gallery.class,id);
            message="----删除-图文-成功----";
        }
        model.addAttribute("message",message);
        return "admin/message";
    }

    @RequestMapping(value = "/edit")
    public String galleryEdit(String id,Model model){

        System.out.println("----你确定要编辑-图文--ID--"+id);

        if(id != null && !id.isEmpty()){
            ///创建manager的副本
            Gallery gallery=new Gallery(galleryService.find(" from Gallery g where g.id=?0", Integer.parseInt(id)).get(0));

            gallery.setGalleryImgage(App.GALLERY_PREFIX+gallery.getGalleryImgage());

            if(null != gallery){
                System.out.println(gallery.getId()+":"+gallery.getGalleryTitle()+":"+gallery.getGalleryImgage());
                model.addAttribute("gallery",gallery);
            }
        }else{
            model.addAttribute("message","---未查找到该图文，出了一些问题---");
            return "admin/message";
        }

        return "admin/image_report";
    }

//    @RequestMapping(value = "/list")
//    public String blogList(int pageNo,Model model, HttpSession httpSession){
//        ////选取所有分类
//        List<Category> categorList=categoryServiceImpl.getCategory(new Category());
//        List<String> categorys=new ArrayList<>();////创建副本，避免更改数据
//        for(Category category:categorList){
//            categorys.add(category.getBlogCategoryName());
//        }
//        if(categorys.size()>0){
//            model.addAttribute("catgorys",categorys);////传递分类数据到前台
//        }
//
//        ///选取所有管理员
//        List<Manager> managerList=managerServiceImpl.findAll(Manager.class);
//        ///进行ID与用户名的映射
//        Map<Integer,String> mapping= new HashMap();
//        for(Manager manager:managerList){
//            mapping.put(manager.getId(),manager.getNickName());
//        }
//        model.addAttribute("managerList",mapping);///传递数据到前台
//
//        if(pageNo <= 0){
//            pageNo=1;///默认查询第一页
//        }
//
//        int pageSize=15;
//        Manager sessionManager=(Manager)httpSession.getAttribute("manager");
//        ///只查找一次
//        if(-1==pageCount){
//            long count=blogServiceImpl.findBlogCount(sessionManager.getId());
//            pageCount= (count/pageSize==0) ? count/pageSize : count/pageSize+1;
//        }
//        model.addAttribute("pageCurrent",pageNo);///当前页
//        model.addAttribute("pageCount",pageCount);///总的分页数目
//
//        ////博客分页条目
//        List<Blog> blogList=blogServiceImpl.findByPage("from Blog b where b.adminId=?0",pageNo,pageSize,sessionManager.getId());
//        List<Blog> blogListCopy=new ArrayList<>();////创建一个副本
//        ////处理博客条目
//        for(Blog blog:blogList){
//            Blog blogCopy=new Blog(blog);
//            blogCopy.setBlogImage(App.BLOG_PREFIX+blogCopy.getBlogImage());
//            ///添加到副本中
//            blogListCopy.add(blogCopy);
//        }
//        if(blogListCopy.size()>0){
//            model.addAttribute("blogList",blogListCopy);
//        }
//
//        return "admin/blog_list";
//    }

    @RequestMapping(value = "/list")
    public String galleryCategoryList(int pageNo,String paramCategory, Model model, HttpSession httpSession){
        ////选取所有分类,如果为NULL才进行查询
        if(null==categorList){
            categorList=galleryCategoryService.findAll( GalleryCategory.class);
        }
        List<String> categorys=new ArrayList<>();////创建副本，避免更改数据
        for(GalleryCategory category:categorList){
            categorys.add(category.getGalleryCategoryName());
        }
        if(categorys.size()>0){
            model.addAttribute("catgorys",categorys);////传递分类数据到前台
        }

        ///选取所有管理员,如果为空才进行数据库查询
        if(null==managerList){
            managerList=managerServiceImpl.findAll(Manager.class);
        }
        ///进行ID与用户名的映射
        Map<Integer,String> mapping= new HashMap();
        for(Manager manager:managerList){
            mapping.put(manager.getId(),manager.getNickName());
        }
        model.addAttribute("managerList",mapping);///传递数据到前台

        if(pageNo <= 0){
            pageNo=1;///默认查询第一页
        }

        int pageSize=15;
        Manager sessionManager=(Manager)httpSession.getAttribute("manager");
        ///只查找一次
        if(-1==pageCount){
            long count=galleryService.findGalleryCount(sessionManager.getId());
            pageCount= (count/pageSize==0) ? count/pageSize : count/pageSize+1;
        }
        model.addAttribute("pageCurrent",pageNo);///当前页
        model.addAttribute("pageCount",pageCount);///总的分页数目

        List<Gallery> galleryList=null;
        ///判断分类是否为null或者为空，为空则查询所有
        if(null!=paramCategory && !paramCategory.isEmpty() && !paramCategory.trim().equals("all")){
            galleryList=galleryService.findByPage("from Gallery g where g.adminId=?0 and g.category=?1 ",
                    pageNo,pageSize,sessionManager.getId(),paramCategory);
            model.addAttribute("paramCategory",paramCategory);
        }else{
            ////博客分页条目
            galleryList=galleryService.findByPage("from Gallery g where g.adminId=?0 ",
                    pageNo,pageSize,sessionManager.getId());
        }

        List<Gallery> galleryListCopy=new ArrayList<>();////创建一个副本
        ////处理博客条目
        for(Gallery gallery:galleryList){
            Gallery galleryCopy=new Gallery(gallery);
            String[] tokens=galleryCopy.getGalleryImgage().split(App.GALLERY_SEPARATOR);
            for(int i=0;i<tokens.length;i++){
                ////这里要处理取得的图片路径，默认第一张为封面，只取封面
                galleryCopy.setGalleryImgage(App.GALLERY_PREFIX+tokens[i]);
            }
            ///添加到副本中
            galleryListCopy.add(galleryCopy);
        }
        if(galleryListCopy.size()>0){
            model.addAttribute("gallerys",galleryListCopy);
        }

        return "admin/gallery_list";
    }

    @RequestMapping(value = "/report")
    public String galleryReport(Model model, HttpSession httpSession){
        List<GalleryTags> tagsList=galleryTagsService.findAll(GalleryTags.class);
        List<String> tags=new ArrayList<>();
        for (GalleryTags tag:tagsList){
            tags.add(tag.getGalleryNames());
        }
        if(tags.size()>0){
            model.addAttribute("tags",tags);///发送标签数据到前台
        }

        List<GalleryCategory> categorList=galleryCategoryService.findAll(GalleryCategory.class);
        List<String> categorys=new ArrayList<>();
        for(GalleryCategory category:categorList){
            categorys.add(category.getGalleryCategoryName());
        }
        if(categorys.size()>0){
            model.addAttribute("catgorys",categorys);///发送分类信息到前台
        }
        return "admin/image_report";
    }

    ////为发表博客界面添加分类和标签
    @RequestMapping(value = "/saveGallery")
    public String saveGallery(@RequestParam("file")CommonsMultipartFile[] multipartFile,String type, MultipartHttpServletRequest request, Model model){
        System.out.println(request.getParameter("title")+request.getParameter("date"));
        System.out.println(request.getParameter("tags")+request.getParameter("category"));
        System.out.println(request.getParameter("content"));

        StringBuilder builder=new StringBuilder();///存储字符串连接
        ///未提交文件直接更新信息
        if(null != multipartFile){
            System.out.println("SIZE:"+multipartFile.length);

            model.addAttribute("message", "--图文发表更新成功---");

            String rootPath=request.getServletContext().getRealPath("/");
            String dir= DateUtil.formateDateyyyyMM(new Date());
            ///保存文件的完整路径
            String allDirName=rootPath+ App.GALLERY_PREFIX+ dir;
            System.out.println("AllDirName:"+allDirName);


            System.out.println("Dir:"+dir);
            ///目录是否存在，不存在创建
            File dirFile=new File(allDirName);
            if(!dirFile.exists()){
                boolean flag= dirFile.mkdir();
                if(flag){
                    PrintUtil.print("文件夹:"+dir+"创建成功..", Level.info);
                    System.out.println("文件夹:"+dir+"创建成功..");
                }
            }

            boolean flag=false;
            for(int i=0;i<multipartFile.length;i++){
                ///获取上文件信息
                String name=multipartFile[i].getOriginalFilename();
                String suffix;
                if(name.contains(".")){
                    suffix=name.substring(name.lastIndexOf("."));
                }else{
                    suffix=".jpg";
                    System.out.println("文件名没有分隔后缀，默认JPG");
                }

                ///保存的文件名
                String fileName= DateUtil.formateDateyyyyMMddHHmmss(new Date()).toString()+suffix;
                ///保存文件的完整路径
                String allFileName=rootPath+ App.GALLERY_PREFIX+ dir +"/"+fileName;
                ///写入数据的字符串
                String dataBaseFileName=dir+"/"+fileName;
                builder.append(dataBaseFileName+App.GALLERY_SEPARATOR);///加入这个并且加入分隔符

                System.out.println("ContextPath:"+request.getServletContext().getRealPath("/")
                        +"--"+request.getContextPath()+" DataBase:"+dataBaseFileName);

                flag =  FileUploadUtil.upload(allFileName,multipartFile[i]);
                String message=flag ? "保存成功":"保存失败";
                System.out.println("Index:"+i+"--"+multipartFile[i].getOriginalFilename()+message);
            }

        }else{
            System.out.println("SIZE:--0---");
            model.addAttribute("message", "--图文发表更新成功---");
        }

//        Map<String,MultipartFile> fileMap=request.getFileMap();
//        if(null!=fileMap){
//            System.out.println("文件个数为："+fileMap.size());
//            Set<String> fileSet=fileMap.keySet();
//            Iterator<String> fileNameIterator=fileSet.iterator();
//            while (fileNameIterator.hasNext()){
//                String uploadName=fileNameIterator.next();
//                System.out.println("文件名:"+uploadName);
//                MultipartFile file=fileMap.get(uploadName);//获取文件；
//
//                boolean flag= FileUploadUtil.upload(App.GALLERY_PREFIX,request,file);
//                String message=flag ? "保存成功":"保存失败";
//                System.out.println(file.getOriginalFilename()+message);
//            }
//        }else{
//            System.out.println("request.getParameterfiles[]--no");
//        }


        ////@RequestParam("multipartFile") CommonsMultipartFile multipartFile,

        Gallery gallery=convertGallery(request);///封装图文对象
        gallery.setGalleryImgage( builder.substring(0,builder.lastIndexOf(App.GALLERY_SEPARATOR)));///设置图片路径

        Manager manager=null;
        if(request.getSession().getAttribute("manager") instanceof  Manager){
            manager=(Manager)request.getSession().getAttribute("manager");
        }
        ///设置画廊所有者，Session范围内没有则查找第一个超级管理员的ID
        if(null!=manager){
            gallery.setAdminId(manager.getId());
        }else{
            PrintUtil.print("博客管理员ID未获取到，查找超级管理员的ID", Level.error);
            manager=managerServiceImpl.find(" from Manager m where m.permission=?0",
                    ManagerType.typeToStr(ManagerType.supervisor)).get(0);
            gallery.setAdminId(manager.getId());
        }
        if(null!=type && type.trim().equals("update")){
            galleryService.update(gallery);
        }else{
            galleryService.save(gallery);
        }

        System.out.println("Gallery:"+gallery.getId()+":"+gallery.getGalleryTitle()+":"+gallery.getCategory());
        System.out.println("Gallery:"+gallery.getGalleryTime()+":"+gallery.getContent()+":"+gallery.getAdminId());

        return "admin/message";
    }

    private Gallery convertGallery(HttpServletRequest request) {
        Gallery gallery=new Gallery();
        if(null!=request.getParameter("id")){
            gallery.setId(Integer.parseInt(request.getParameter("id")));////获取ID,可以根据主键进行更新操作
        }
        gallery.setGalleryTitle(request.getParameter("title"));
        gallery.setContent(request.getParameter("content"));
        gallery.setGalleryTime(request.getParameter("date"));

        gallery.setCategory(request.getParameter("category"));
        List<String> tags=new ArrayList<String>();
        tags.add(request.getParameter("tags"));
        gallery.setTags(tags);

//        System.out.println(request.getParameter("title")+request.getParameter("date"));
//        System.out.println(request.getParameter("tags")+request.getParameter("category"));
//        System.out.println(request.getParameter("visible")+request.getParameter("content"));
        return  gallery;
    }

    @RequestMapping(value = "/essay")
    public String blogEssay(Model moel){
        return "essay";
    }
}

