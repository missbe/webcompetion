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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/11/7 0007.
 */
@Controller
@RequestMapping(value = "/blog")
public class WebBlogController {
    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private CategoryServiceImpl categoryService;
    @Autowired
    private TagsServiceImpl tagsService;
    @Autowired
    private ManagerServiceImpl managerService;

    private List<Category> categorList;
    private List<Tags> tagsList;
    private Map<Integer,String>  mapping;
    private long pageCount=-1;

    private void setCategoryTags(Model model){
        ////选取所有分类,如果为NULL才进行查询
        if(null==categorList){
            categorList=categoryService.getCategory(new Category());
        }
        List<String> categorys=new ArrayList<>();////创建副本，避免更改数据
        for(Category category:categorList){
            categorys.add(category.getBlogCategoryName());
        }
        if(categorys.size()>0){
            model.addAttribute("categorys",categorys);////传递分类数据到前台
        }

        ////选取所有标签,如果为NULL才进行查询
        if(null==tagsList){
            tagsList=tagsService.getTags(new Tags());
        }
        List<String> tagsCopy=new ArrayList<>();////创建副本，避免更改数据
        for(Tags tag:tagsList){
            tagsCopy.add(tag.getTagNames());
        }
        if(tagsCopy.size()>0){
            model.addAttribute("tags",tagsCopy);////传递分类数据到前台
        }

    }
    @RequestMapping(value = "/list")
    public String blogList(String pageNo,String type,String paramCategory, Model model, HttpSession httpSession){

        setCategoryTags(model);///发送分类数据到前台

        // 进行ID与用户名的映射
        if(null==mapping){
            mapping= new HashMap();
            List<Manager> managerList=managerService.findAll(Manager.class);
            for(Manager manager:managerList){
                mapping.put(manager.getId(),manager.getNickName());
            }
        }
        int number,flag;///如果没有参数则初始化为第一页
        if( null==pageNo || !pageNo.isEmpty() ){
            number=1;///默认查询第一页
        }else{
            number=Integer.parseInt(pageNo);
        }

        if( null==type || !type.isEmpty() ){
            flag=0;///代表是否按category类别查询
        }else{
            flag=Integer.parseInt(type);
        }

        int pageSize=15;
        ///只查找一次
        if(-1==pageCount){
            long count=blogService.findAll(Blog.class).size();
            pageCount= (count/pageSize==0) ? count/pageSize : count/pageSize+1;
        }
        model.addAttribute("pageCurrent",pageNo);///当前页
        model.addAttribute("pageCount",pageCount);///总的分页数目

        List<Blog> blogList=null;
        ///判断分类是否为null或者为空，为空则查询所有
        if(null!=paramCategory && !paramCategory.isEmpty() && !paramCategory.trim().equals("all")){
            if(0 == flag){///0代表分类查询
                blogList=blogService.findByPage("from Blog b where  b.category=?0",
                        number,pageSize,paramCategory);
            }else{///其它代表标签查询
                blogList=blogService.findByPage("from Blog b where  b.tags=?0",
                        number,pageSize,paramCategory);
            }
            model.addAttribute("paramCategory",paramCategory);
        }else{
            ////博客分页条目
            blogList=blogService.findByPage("from Blog b ",
                    number,pageSize);
        }

        List<Blog> blogListCopy=new ArrayList<>();////创建一个副本
        List<Blog> newBlogCopy=new ArrayList<>();///创建新的副本
        int index=0;///查找最新五篇博客
        ////处理博客条目
        for(Blog blog:blogList){
            Blog blogCopy=new Blog(blog);
            blogCopy.setBlogImage(App.BLOG_PREFIX+blogCopy.getBlogImage());
            ///添加到副本中
            blogListCopy.add(blogCopy);
            index++;
            if(index<=5){
                newBlogCopy.add(blogCopy);
            }
        }
        if(blogListCopy.size()>0){
            model.addAttribute("blogList",blogListCopy);///发送数据到前台
        }
        if(newBlogCopy.size()>0){
            model.addAttribute("newList",newBlogCopy);///发送数据到前台
        }
        return "blog";
    }

    @RequestMapping(value = "/essay")
    public String blogEssay(Model moel){
        return "essay";
    }

    @RequestMapping(value = "/detail")
    public String blogDetail(String id, HttpServletRequest request,Model model){
        if(null==id || id.isEmpty()){
            model.addAttribute("message","--你所查找的文章丢失了----");
            model.addAttribute("url",request.getRequestURL());
            return "message";
        }
        setCategoryTags(model);///发送分类数据到前台
        Blog blog=blogService.find(" from Blog b where b.id=?0",Integer.parseInt(id)).get(0);
        model.addAttribute("blog",blog);
        return "detail";
    }

}
