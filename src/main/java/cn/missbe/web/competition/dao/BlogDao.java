package cn.missbe.web.competition.dao;

import cn.missbe.web.competition.entity.Blog;

import java.io.Serializable;
import java.util.List;

/**
 * Created by feng on 2016/11/11.
 */
public interface BlogDao{
    //保存博客
    Serializable save(Blog blog);
    //删除博客
    void deleteBlog(Blog blog);
    //根据ID加载博客
    Blog get(Class blogClazz, Serializable id);
    //根据ID删除博客
    void delete(Class blogClazz, Serializable id);
    //获取所有实体记录
    List<Blog> findAll(Class entiyClazz);
}
