package cn.missbe.web.competition.controller;

import cn.missbe.web.competition.App;
import cn.missbe.web.competition.entity.Blog;
import cn.missbe.web.competition.entity.Category;
import cn.missbe.web.competition.entity.Manager;
import cn.missbe.web.competition.entity.Tags;
import cn.missbe.web.competition.service.impl.BlogServiceImpl;
import cn.missbe.web.competition.service.impl.CategoryServiceImpl;
import cn.missbe.web.competition.service.impl.ManagerServiceImpl;
import cn.missbe.web.competition.service.impl.TagsServiceImpl;
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
@RequestMapping(value = "/admin/blog")
public class AdminBlogController {
    @Autowired
    private BlogServiceImpl blogServiceImpl;
    @Autowired
    private TagsServiceImpl tagsServiceImpl;
    @Autowired
    private CategoryServiceImpl categoryServiceImpl;
    @Autowired
    private ManagerServiceImpl managerServiceImpl;

    private   List<Manager> managerList;///选取所有管理员
    List<Category> categorList;//选取所有分类

    private long pageCount=-1;

    @RequestMapping(value = "/delete")
    public String blogDelete(int id,HttpServletRequest request,Model model)
    {
//        System.out.println("----你确定要删除Blog--ID--"+id);
        String message;
        List<Blog> galleryList=blogServiceImpl.findAll(Blog.class);
        boolean flag=false;
        Blog temp=null;///删除博客图片的临时对象
        for(Blog blog:galleryList){
            if(blog.getId()==id){
                flag=true;
                temp=new Blog(blog);///创建博客副本
                break;
            }///判断是否存在
        }
        if(!flag){
            message="--博客ID错误，删除失败----";
        }else{
            String sql="delete from blog_tags where blog_id="+id;
            blogServiceImpl.deleteBySQL(sql);///预先执行SQL语句，删除外键约束
            blogServiceImpl.delete(Blog.class,id);
            ////删除干博客对应的图片
            String rootPath=request.getServletContext().getRealPath("/");//获取项目根目录
            FileUploadUtil.delete(rootPath+App.BLOG_PREFIX+temp.getBlogImage());///进行删除
            message="----删除博客成功----";
        }
        model.addAttribute("message",message);
        return "admin/message";
    }

    @RequestMapping(value = "/edit")
    public String blogEdit(String id,Model model){

//        System.out.println("----你确定要编辑-Blog--ID--"+id);
        setCategoryTags(model);///发送数据到前台

        if(id != null && !id.isEmpty()){
            ///创建manager的副本
            Blog blog=new Blog(blogServiceImpl.find(" from Blog b where b.id=?0", Integer.parseInt(id)).get(0));

            blog.setBlogImage(App.BLOG_PREFIX+blog.getBlogImage());

            if(null != blog){
//                System.out.println(blog.getId()+":"+blog.getBlogTitle()+":"+blog.getBlogImage());
                model.addAttribute("blog",blog);
            }
        }else{
            model.addAttribute("message","---未查找到该博客，出了一些问题---");
            return "admin/message";
        }

        return "admin/blog_report";
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
    public String blogCategoryList(int pageNo,String paramCategory, Model model, HttpSession httpSession){
        ////选取所有分类,如果为NULL才进行查询
        if(null==categorList){
            categorList=categoryServiceImpl.getCategory(new Category());
        }
        List<String> categorys=new ArrayList<>();////创建副本，避免更改数据
        for(Category category:categorList){
            categorys.add(category.getBlogCategoryName());
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
            long count=blogServiceImpl.findBlogCount(sessionManager.getId());
            pageCount= (count/pageSize==0) ? count/pageSize : count/pageSize+1;
        }
        model.addAttribute("pageCurrent",pageNo);///当前页
        model.addAttribute("pageCount",pageCount);///总的分页数目

        List<Blog> blogList=null;
        ///判断分类是否为null或者为空，为空则查询所有
        if(null!=paramCategory && !paramCategory.isEmpty() && !paramCategory.trim().equals("all")){
            blogList=blogServiceImpl.findByPage("from Blog b where b.adminId=?0 and b.category=?1",
                    pageNo,pageSize,sessionManager.getId(),paramCategory);
            model.addAttribute("paramCategory",paramCategory);
        }else{
            ////博客分页条目
            blogList=blogServiceImpl.findByPage("from Blog b where b.adminId=?0",
                    pageNo,pageSize,sessionManager.getId());
        }

        List<Blog> blogListCopy=new ArrayList<>();////创建一个副本
        ////处理博客条目
        for(Blog blog:blogList){
            Blog blogCopy=new Blog(blog);
            blogCopy.setBlogImage(App.BLOG_PREFIX+blogCopy.getBlogImage());
            ///添加到副本中
            blogListCopy.add(blogCopy);
        }
        if(blogListCopy.size()>0){
            model.addAttribute("blogList",blogListCopy);
        }

        return "admin/blog_list";
    }
    @RequestMapping(value = "/report")
    public String reportBlog(Model model, HttpSession httpSession){
        setCategoryTags(model);///发送分类到前台
        return "admin/blog_report";
    }

    ////为发表博客界面添加分类和标签
    @RequestMapping(value = "/saveBlog")
    public String saveBlog(@RequestParam("multipartFile") CommonsMultipartFile multipartFile,String flagUpdate,HttpServletRequest request, Model model){
        MultipartHttpServletRequest multipartRequest   =   (MultipartHttpServletRequest)   request;
//        System.out.println(request.getParameter("content")+request.getParameter("date"));
//        System.out.println(request.getParameter("tags")+request.getParameter("category"));
//        System.out.println(request.getParameter("visible")+request.getParameter("content"));



        Blog blog=convertBlog(request);///封装博客对象
        ////清除上一次的图片文件
        if(flagUpdate!=null && flagUpdate.trim().equals("update")){

            blog.setId(Integer.parseInt(request.getParameter("id")));///进行更新，一定要带博客标识
        }
        Manager manager=null;
        if(request.getSession().getAttribute("manager") instanceof  Manager){
            manager=(Manager)request.getSession().getAttribute("manager");
        }
        ///设置博客所有者，Session范围内没有则查找第一个超级管理员的ID
        if(null!=manager){
            blog.setAdminId(manager.getId());
        }else{
            PrintUtil.print("博客管理员ID未获取到，查找超级管理员的ID", Level.error);
            manager=managerServiceImpl.find(" from Manager m where m.permission=?0",
                    ManagerType.typeToStr(ManagerType.supervisor)).get(0);
            blog.setAdminId(manager.getId());
        }

        ///未提交文件直接更新信息
        if(null != multipartFile && !multipartFile.isEmpty()){
            String rootPath=request.getServletContext().getRealPath("/");
            String dir= DateUtil.formateDateyyyyMM(new Date());
            ///保存文件的完整路径
            String allDirName=rootPath+ App.BLOG_PREFIX+ dir;
//            System.out.println("allDirName:"+allDirName);


//            System.out.println("Dir:"+dir);
            ///目录是否存在，不存在创建
            File dirFile=new File(allDirName);
            if(!dirFile.exists()){
                boolean flag= dirFile.mkdir();
                if(flag){
                    PrintUtil.print("文件夹:"+dir+"创建成功..", Level.info);
//                    System.out.println("文件夹:"+dir+"创建成功..");
                }
            }
            ///获取上文件信息
            String originalFilename=multipartFile.getOriginalFilename();
            String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));
            ///保存的文件名
            String fileName= DateUtil.formateDateyyyyMMddHHmmss(new Date()).toString()+suffix;
            ///保存文件的完整路径
            String allFileName=rootPath+ App.BLOG_PREFIX+ dir +"/"+fileName;

            ///写入数据的字符串
            String dataBaseFileName=dir+"/"+fileName;

//            System.out.println("ContextPath:"+request.getServletContext().getRealPath("/")
//                    +"--"+request.getContextPath()+" DataBase:"+dataBaseFileName);

            boolean fileFlag= FileUploadUtil.upload(allFileName,multipartFile);
            if(!fileFlag){
                model.addAttribute("message","--博客保存出错了---");
            }else {
                blog.setBlogImage(dataBaseFileName);
                ///判断是保存还是更新
                if(flagUpdate!=null && flagUpdate.trim().equals("update")){
                    blogServiceImpl.update(blog);
                    model.addAttribute("message", "--博客更新成功---");
                }else{
                    blogServiceImpl.save(blog);
                    model.addAttribute("message", "--博客添加成功---");
                }
//                System.out.println("----保存模拟-----");
            }
        }else{
            if(flagUpdate!=null && flagUpdate.trim().equals("update")){
                blogServiceImpl.update(blog);
                model.addAttribute("message", "--博客更新成功---");
            }else{
                blogServiceImpl.save(blog);
                model.addAttribute("message", "--博客添加成功---");
            }
//            System.out.println("----更新模拟-----");
        }
        return "admin/message";
    }

    private Blog convertBlog(HttpServletRequest request) {
        Blog blog=new Blog();
        blog.setBlogTitle(request.getParameter("title"));
        blog.setBlogContent(request.getParameter("content"));
        blog.setBlogTime(request.getParameter("date"));
        if(null!=request.getParameter("visible")){
            ///1表示可见 0表示不可见
            int  visible=request.getParameter("visible").trim().equals("on") ? 1 : 0;
            blog.setBlogHide(visible);
        }
        blog.setCategory(request.getParameter("category"));
        List<String> tags=new ArrayList<String>();
        tags.add(request.getParameter("tags"));
        blog.setTags(tags);

//        System.out.println(request.getParameter("title")+request.getParameter("date"));
//        System.out.println(request.getParameter("tags")+request.getParameter("category"));
//        System.out.println(request.getParameter("visible")+request.getParameter("content"));
        return  blog;
    }
    ///发送分类数据到前台
    private void setCategoryTags(Model model){
        List<Tags> tagsList=tagsServiceImpl.getTags(new Tags());
        List<String> tags=new ArrayList<>();
        for (Tags tag:tagsList){
            tags.add(tag.getTagNames());
        }
        if(tags.size()>0){
            model.addAttribute("tags",tags);
        }

        List<Category> categorList=categoryServiceImpl.getCategory(new Category());
        List<String> categorys=new ArrayList<>();
        for(Category category:categorList){
            categorys.add(category.getBlogCategoryName());
        }
        if(categorys.size()>0){
            model.addAttribute("catgorys",categorys);
        }
    }

    @RequestMapping(value = "/essay")
    public String blogEssay(Model moel){
        return "essay";
    }
}
