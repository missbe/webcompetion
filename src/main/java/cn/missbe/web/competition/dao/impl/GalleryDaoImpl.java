package cn.missbe.web.competition.dao.impl;

import cn.missbe.web.competition.entity.Gallery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
@Repository
public class GalleryDaoImpl extends BaseDaoImpl<Gallery> {
    public List findAll(Class entiyClazz) {
        return super.findAll(entiyClazz);
    }
    ///根据带占位符的HQL语句设置参数
    public  List<Gallery> find(String hql, Object... params){
        return super.find(hql,params);
    }

    public int findGalleryCount(int id){
       return super.find(" from Gallery g where g.adminId=?0",id).size();
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
        return super.findByPage(hql,pageNo,pageSize);
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

        return  super.findByPage(hql,pageNo,pageSize,params);
    }
    public int deleteBySQL(String sql){
       return super.getSessionFactory().getCurrentSession().createSQLQuery(sql)
               .executeUpdate();
    }
}
