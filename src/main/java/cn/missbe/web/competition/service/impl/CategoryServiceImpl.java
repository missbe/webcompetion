package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.CategoryDaoImpl;
import cn.missbe.web.competition.entity.Category;
import cn.missbe.web.competition.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by feng on 2016/11/12.
 */
@Service
public class CategoryServiceImpl implements  CategoryService  {
    @Autowired
    private CategoryDaoImpl categoryDao;

    public Serializable save(Category category){
        return categoryDao.save(category);
    }


    public void delete(Category category) {
        categoryDao.delete(category);
    }


    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public List<Category> getCategory(Category category) {
        return categoryDao.findAll(Category.class);
    }

}
