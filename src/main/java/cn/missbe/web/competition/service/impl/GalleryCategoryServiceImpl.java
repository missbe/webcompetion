package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.GalleryCategoryDaoImpl;
import cn.missbe.web.competition.entity.GalleryCategory;
import cn.missbe.web.competition.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2016/11/14 0014.
 */
@Service
public class GalleryCategoryServiceImpl implements BaseService<GalleryCategory> {

    @Autowired
    private GalleryCategoryDaoImpl categoryDao;
    @Override
    public GalleryCategory get(Class entiyClazz, Serializable id) {
        return categoryDao.get(entiyClazz,id);
    }

    @Override
    public Serializable save(GalleryCategory entiy) {
        return categoryDao.save(entiy);
    }

    @Override
    public void update(GalleryCategory entiy) {
        categoryDao.update(entiy);
    }

    @Override
    public void delete(GalleryCategory entity) {
        categoryDao.delete(entity);
    }

    @Override
    public void delete(Class entiyClazz, Serializable id) {
        categoryDao.delete(entiyClazz,id);
    }

    @Override
    public List<GalleryCategory> findAll(Class entiyClazz) {
        return categoryDao.findAll(entiyClazz);
    }

    @Override
    public long findCount(Class<GalleryCategory> entiyClazz) {
        return categoryDao.findCount(entiyClazz);
    }
}
