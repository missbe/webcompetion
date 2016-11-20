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

    /**
     * 使用HQL语句进行分页查询操作
     * @param hql 需要查询的HQL语句
     * @param pageNo 查询第几页的记录
     * @param pageSize 每页的大小
     * @return 当前页的所有记录
     */
    public List<Gallery> findByPage(String hql,int pageNo,int pageSize){
        ///创建查询
        return galleryDao.findByPage(hql,pageNo,pageSize);
    }

    /**
     * 使用HQL语句进行分页查询操作
     * @param hql 需要查询的HQL语句
     * @param pageNo 查询第几页的记录
     * @param pageSize 每页的大小
     * @param params 如果HQL带占位符，params用于传入点位符的参数
     * @return 当前页的所有记录
     */
    public  List<Gallery> findByPage(String hql,int pageNo,int pageSize,Object... params){
        ///创建查询

        return  galleryDao.findByPage(hql,pageNo,pageSize,params);
    }
}
