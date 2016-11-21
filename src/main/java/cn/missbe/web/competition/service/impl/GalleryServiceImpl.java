package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.GalleryDaoImpl;
import cn.missbe.web.competition.entity.Gallery;
import cn.missbe.web.competition.service.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
@Service
public class GalleryServiceImpl implements GalleryService {
    @Autowired
    private GalleryDaoImpl galleryDao;

    public List findAll(Class entiyClazz) {
        return galleryDao.findAll(entiyClazz);
    }
    ///根据带占位符的HQL语句设置参数
    public  List<Gallery> find(String hql, Object... params){
        return galleryDao.find(hql,params);
    }
    ///查询图文数目
    public int findGalleryCount(int id){
        return galleryDao.findGalleryCount(id);
    }
    @Override
    public Gallery get(Class entiyClazz, Serializable id) {
        return galleryDao.get(entiyClazz,id);
    }

    @Override
    public Serializable save(Gallery entiy) {
        return galleryDao.save(entiy);
    }

    @Override
    public void update(Gallery entiy) {
        galleryDao.update(entiy);
    }

    @Override
    public void delete(Gallery entity) {
        galleryDao.delete(entity);
    }

    @Override
    public void delete(Class entiyClazz, Serializable id) {
        galleryDao.delete(entiyClazz,id);
    }

    @Override
    public long findCount(Class<Gallery> entiyClazz) {
        return galleryDao.findCount(entiyClazz);
    }

    public List<Gallery> findByPage(String hql,int pageNo,int pageSize){
        ///创建查询
        return galleryDao.findByPage(hql,pageNo,pageSize);
    }

    public  List<Gallery> findByPage(String hql,int pageNo,int pageSize,Object... params){
        return  galleryDao.findByPage(hql,pageNo,pageSize,params);
    }

    public int deleteBySQL(String sql){
        return galleryDao.deleteBySQL(sql);
    }
}
