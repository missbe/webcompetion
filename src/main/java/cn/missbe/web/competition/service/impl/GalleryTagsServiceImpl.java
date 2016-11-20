package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.GalleryTagsDaoImpl;
import cn.missbe.web.competition.entity.GalleryTags;
import cn.missbe.web.competition.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2016/11/14 0014.
 */
@Service
public class GalleryTagsServiceImpl implements BaseService<GalleryTags> {
   @Autowired
   private GalleryTagsDaoImpl tagsDao;
    @Override
    public GalleryTags get(Class entiyClazz, Serializable id) {
        return tagsDao.get(entiyClazz,id);
    }

    @Override
    public Serializable save(GalleryTags entiy) {
        return tagsDao.save(entiy);
    }

    @Override
    public void update(GalleryTags entiy) {
        tagsDao.update(entiy);
    }

    @Override
    public void delete(GalleryTags entity) {
        tagsDao.delete(entity);
    }

    @Override
    public void delete(Class entiyClazz, Serializable id) {
        tagsDao.delete(entiyClazz,id);
    }

    @Override
    public List<GalleryTags> findAll(Class<GalleryTags> entiyClazz) {
        return tagsDao.findAll(entiyClazz);
    }

    @Override
    public long findCount(Class<GalleryTags> entiyClazz) {
        return tagsDao.findCount(entiyClazz);
    }
}
