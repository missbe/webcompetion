package cn.missbe.web.competition.entity;

import javax.persistence.*;

/**
 * Created by feng on 2016/11/12.
 */
@Entity
@Table(name = "tb_category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="blog_category_id",nullable = false)
    private int blogCategoryId;

    @Column(name="blog_catagory_name",length=20)
    private String blogCategoryName;



    public String getBlogCategoryName() {
        return blogCategoryName;
    }

    public void setBlogCategoryName(String blogCategoryName) {
        this.blogCategoryName = blogCategoryName;
    }

    public int getBlogCategoryId() {
        return blogCategoryId;
    }

    public void setBlogCategoryId(int blogCategoryId) {
        this.blogCategoryId = blogCategoryId;
    }
}
