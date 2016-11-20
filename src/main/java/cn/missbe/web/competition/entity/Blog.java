package cn.missbe.web.competition.entity;

import cn.missbe.web.competition.util.StringUtils;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by feng on 2016/11/11.
 */
@Entity
@Table(name = "tb_blog")
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "blog_id")
    private int id;

    @Column(name = "blog_title",nullable = false,length=20)
    private String blogTitle;

    @Column(name="blog_time",nullable = false)
    private String blogTime;

    @Column(name="admin_id",length=20)
    private int adminId;

    @Column(name="blog_image",length=100)
    private String blogImage;


//    @ManyToMany(targetEntity = Tags.class)
//    @JoinTable(name = "blog_tags",
//     joinColumns = @JoinColumn(name = "blog_id",referencedColumnName = "blog_id"),
//     inverseJoinColumns = @JoinColumn(name = "tags_id",referencedColumnName = "tags_id"))
    @ElementCollection(targetClass = String.class)
    @CollectionTable(name = "blog_tags",joinColumns = @JoinColumn(name = "blog_id",nullable = true))
    @Column(name="blog_tags_id",length=50)
    @OrderColumn(name = "tags_id")
    private List<String> tags=new ArrayList<String>();

      @Column(name="blog_category",length=50)
//    @ManyToOne(targetEntity = Category.class)
//    @JoinColumn(name = "blog_category_id",referencedColumnName = "blog_category_id")
    private String category;

    @Column(name="blog_hide",length=2)
    private int blogHide;

    @Column(name="blog_content",columnDefinition = "text")
    private String blogContent;

    // 简易摘要
    @Transient
    private String simpleContent;


    public Blog() { this.blogImage="logo.jpg";}

    public Blog(Blog blog) {
        this.id = blog.getId();
        this.blogTitle = blog.getBlogTitle();
        this.blogTime = blog.getBlogTime();
        this.adminId = blog.getAdminId();
        this.category = blog.getCategory();
        this.blogImage = blog.getBlogImage();
        this.tags = blog.getTags();
        this.blogContent = blog.getBlogContent();
    }
    public String getBlogTime() {
        return blogTime;
    }

    public void setBlogTime(String blogTime) {
        this.blogTime = blogTime;
    }
    public int getAdminId() {
        return adminId;
    }
    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    public int getBlogHide() {
        return blogHide;
    }

    public void setBlogHide(int blogHide) {
        this.blogHide = blogHide;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }



    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getSimpleContent() {
        String noTag = StringUtils.removeHtmlTag(this.getBlogContent());
        return noTag.length() > 240 ? noTag.substring(0, 140) + "..." : noTag;
    }

    public void setSimpleContent(String simpleContent) {
        this.simpleContent = simpleContent;
    }
}
