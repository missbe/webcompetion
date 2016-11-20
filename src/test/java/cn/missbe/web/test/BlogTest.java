package cn.missbe.web.test;

import cn.missbe.web.competition.entity.Blog;
import cn.missbe.web.competition.entity.Category;
import cn.missbe.web.competition.entity.Tags;
import cn.missbe.web.competition.service.impl.BlogServiceImpl;
import cn.missbe.web.competition.service.impl.CategoryServiceImpl;
import cn.missbe.web.competition.service.impl.TagsServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "classpath:spring-beans.xml"})
public class BlogTest {
    @Autowired
    private TagsServiceImpl tagsService;
    @Autowired
    private CategoryServiceImpl categoryService;
    @Autowired
    private BlogServiceImpl blogService;

    @Test
    public void testTags() {
        Tags tags_one=new Tags();
        tags_one.setTagNames("计算机");

        Tags tags_two=new Tags();
        tags_two.setTagNames("面向对象");

        Tags tags_three=new Tags();
        tags_three.setTagNames("程序设计");

        tagsService.save(tags_one);
        tagsService.save(tags_two);

//        tagsService.delete(tags_one);
//        tagsService.delete(tags_two);
    }
    @Test
    public void testCategory(){
        //只有分类名一个字段
        Category category_one = new Category();
        Category category_two = new Category();

        category_one.setBlogCategoryName("计算机");
        category_two.setBlogCategoryName("数学");

        categoryService.save(category_one);
        categoryService.save(category_two);

//        categoryService.delete(category_one);
//        categoryService.delete(category_two);
    }
    @Test
    public void testBlog(){
//        Blog blog_one = new Blog();
//        Blog blog_two = new Blog();
//        List<String> tagsList=new ArrayList<String>();
//        tagsList.add("时尚");
//        tagsList.add("生活");
//        tagsList.add("爱情");
//
//        blog_one.setBlogTitle("写代码");
//        blog_one.setBlogTime(DateUtil.formateDateyyyy_MM_dd(new Date()));
//        blog_one.setBlogHide(1);
//        blog_one.setBlogContent("头昏眼花");
//        blog_one.setBlogImage("0");
//        blog_one.setAdminId(2);
//        blog_one.setCategory("情感生活");
//        blog_one.setTags(tagsList);
//
//        blog_two.setBlogTitle("wadc代码");
//        blog_two.setBlogTime(DateUtil.formateDateyyyy_MM_dd(new Date()));
//        blog_two.setBlogHide(1);
//        blog_two.setBlogContent("wadc头昏眼花");
//        blog_two.setBlogImage("0");
//        blog_two.setAdminId(2);
//        blog_two.setCategory("情感生活");
//        blog_two.setTags(tagsList);

//        blogService.save(blog_two);
//        blogService.save(blog_one);

        blogService.delete(Blog.class,1);
        blogService.delete(Blog.class,2);


    }
    @Test
    public void findCount(){
        System.out.println(blogService.findBlogCount(8));
    }

    @Test
    public void testBlogList(){
        int pageSize=15;
        int pageNo=1;
        List<Blog> blogList=blogService.findByPage("from Blog b where b.adminId=?0",pageNo,pageSize,4);
        List<Blog> blogListCopy=new ArrayList<>();////创建一个副本
        ////处理博客条目
        for(Blog blog:blogList){
//            Blog blogCopy=new Blog(blog);
//            blogCopy.setBlogImage(App.BLOG_PREFIX+blogCopy.getBlogImage());
//            ///添加到副本中
//            blogListCopy.add(blogCopy);
            System.out.println(blog.getAdminId()+":"+blog.getBlogTitle()+":"+blog.getId());
        }
    }
}
