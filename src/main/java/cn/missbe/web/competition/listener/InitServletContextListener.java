package cn.missbe.web.competition.listener;

import cn.missbe.web.competition.entity.*;
import cn.missbe.web.competition.service.impl.*;
import cn.missbe.web.competition.util.Level;
import cn.missbe.web.competition.util.PrintUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

/**
 * Created by Administrator on 2016/11/17 0017.
 */
public class InitServletContextListener implements ServletContextListener {
    /**
     * 保存的Spring applicationContext实例.
     */
    private static ApplicationContext applicationContext;
    /**
     * Receives notification that the web application initialization
     * process is starting.
     * <p>
     * <p>All ServletContextListeners are notified of context
     * initialization before any filters or servlets in the web
     * application are initialized.
     *
     * @param sce the ServletContextEvent containing the ServletContext
     *            that is being initialized
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(application);
        setApplicationContext(ac);
        WebinfoServiceImpl webinfoService=ac.getBean(WebinfoServiceImpl.class);
        Webinfo webinfo=webinfoService.get(Webinfo.class,1);
        if(null==webinfo){
            webinfo=new Webinfo();
            webinfo.setFooter_info("Copyright  2016 by 盐都科技. All rights reserved.");
            webinfoService.save(webinfo);
        }else{
            webinfo.setFooter_info("Copyright  2016 by 盐都科技. All rights reserved.");
            webinfoService.update(webinfo);
        }

        TagsServiceImpl tagsService=ac.getBean(TagsServiceImpl.class);
        List<Tags> tagsList=tagsService.getTags(new Tags());
        if(null==tagsList || tagsList.isEmpty()){
            Tags tags_one=new Tags();
            tags_one.setTagNames("公司项目");

            Tags tags_two=new Tags();
            tags_two.setTagNames("技术交流");

            Tags tags_three=new Tags();
            tags_three.setTagNames("程序语言");
            tagsService.save(tags_one);
            tagsService.save(tags_two);
            tagsService.save(tags_three);
            PrintUtil.print("--Tags初始化完成---", Level.error);
        }else{
            PrintUtil.print("--Tags不为空---", Level.error);
        }

        CategoryServiceImpl categoryService=ac.getBean(CategoryServiceImpl.class);
        List<Category> categoriesList=categoryService.getCategory(new Category());
        if(null==categoriesList || categoriesList.isEmpty()){
            Category category_one = new Category();
            Category category_two = new Category();

            category_one.setBlogCategoryName("语言设计");
            category_two.setBlogCategoryName("项目相关");

            categoryService.save(category_one);
            categoryService.save(category_two);
            PrintUtil.print("--Category初始化完成---", Level.error);
        }else{
            PrintUtil.print("--Category不为空---", Level.error);
        }

        GalleryTagsServiceImpl galleryTagsService=ac.getBean(GalleryTagsServiceImpl.class);
        List<GalleryTags> galleryTagses=galleryTagsService.findAll(GalleryTags.class);
        if(null==galleryTagses ||galleryTagses.isEmpty()){
            GalleryTags tags1=new GalleryTags();
            tags1.setGalleryNames("语言");

            GalleryTags tags2=new GalleryTags();
            tags2.setGalleryNames("生活");

            GalleryTags tags3=new GalleryTags();
            tags3.setGalleryNames("情感");

            galleryTagsService.save(tags1);
            galleryTagsService.save(tags2);
            galleryTagsService.save(tags3);
            PrintUtil.print("--GalleryTags初始化完成---", Level.error);
        }else{
            PrintUtil.print("--GalleryTags不为空---", Level.error);
        }

        GalleryCategoryServiceImpl galleryCategoryService=ac.getBean(GalleryCategoryServiceImpl.class);
        List<GalleryCategory> galleryCategories=galleryCategoryService.findAll(GalleryCategory.class);
        if(null==galleryCategories || galleryCategories.isEmpty()){
            GalleryCategory category1=new GalleryCategory();
            category1.setGalleryCategoryName("编程语言");

           GalleryCategory category2=new GalleryCategory();
           category2.setGalleryCategoryName("时尚生活");

           GalleryCategory category3=new GalleryCategory();
           category3.setGalleryCategoryName("情感生活");

            galleryCategoryService.save(category1);
            galleryCategoryService.save(category2);
            galleryCategoryService.save(category3);
           PrintUtil.print("--GalleryCategory初始化完成---", Level.error);
        }else{
            PrintUtil.print("--GalleryCategory不为空---", Level.error);
        }
    }

    /**
     * Receives notification that the ServletContext is about to be
     * shut down.
     * <p>
     * <p>All servlets and filters will have been destroyed before any
     * ServletContextListeners are notified of context
     * destruction.
     *
     * @param sce the ServletContextEvent containing the ServletContext
     *            that is being destroyed
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static void setApplicationContext(ApplicationContext applicationContext) {
        InitServletContextListener.applicationContext = applicationContext;
    }

}
