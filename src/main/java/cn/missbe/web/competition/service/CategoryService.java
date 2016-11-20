package cn.missbe.web.competition.service;

import cn.missbe.web.competition.entity.Category;

import java.io.Serializable;
import java.util.List;

/**
 * Created by feng on 2016/11/12.
 */
public interface CategoryService {
    //增加分类
    Serializable save(Category category);
    //删除分类
    void delete(Category category);
    //更新分类
    void update(Category category);
    //获取所有分类
    List<Category> getCategory(Category category);
}
