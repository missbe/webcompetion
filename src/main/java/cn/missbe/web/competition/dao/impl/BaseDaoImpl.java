package cn.missbe.web.competition.dao.impl;

import cn.missbe.web.competition.dao.BaseDao;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2016/11/11 0011.
 */
@Repository
@Transactional
public class BaseDaoImpl<T> implements BaseDao<T> {
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public T get(Class entiyClazz, Serializable id) {
        return (T)getSessionFactory()
                .getCurrentSession().get(entiyClazz,id);
    }

    @Override
    public Serializable save(T entiy) {
        return sessionFactory.getCurrentSession().save(entiy);
    }

    @Override
    public void update(T entiy) {
        getSessionFactory().getCurrentSession().saveOrUpdate(entiy);
    }

    @Override
    public void delete(T entity) {
        getSessionFactory().getCurrentSession().delete(entity);
    }

    @Override
    public void delete(Class entiyClazz, Serializable id) {
        getSessionFactory().getCurrentSession()
                .createQuery("delete "+entiyClazz.getSimpleName()+
                " en where en.id=?0")
                .setParameter("0",id)
                .executeUpdate();
    }

    @Override
    public List findAll(Class entiyClazz) {
        return find("select en from "+entiyClazz.getSimpleName()+" en");
    }

    @Override
    public long findCount(Class<T> entiyClazz) {
        List<?> l=find("select count(*) from "+
                   entiyClazz.getSimpleName());
        //返回查询得到的实体总数
        if(l!=null && l.size()==1){
            return (Long)l.get(0);
        }
        return 0;
    }
    ///根据HQL语句查询
    protected List<T> find(String hql){
        return (List<T>)getSessionFactory().getCurrentSession()
                .createQuery(hql)
                .list();
    }
    ///根据带占位符的HQL语句设置参数
    protected  List<T> find(String hql, Object... params){
        //创建查询
        Query query=getSessionFactory().getCurrentSession()
                .createQuery(hql);
        ///为占位符设置参数
        for(int i=0,len=params.length;i<len;i++){
            query.setParameter(i+"",params[i]);
        }
        return (List<T>)query.list();
    }

    /**
     * 使用HQL语句进行分页查询操作
     * @param hql 需要查询的HQL语句
     * @param pageNo 查询第几页的记录
     * @param pageSize 每页的大小
     * @return 当前页的所有记录
     */
    protected List<T> findByPage(String hql,int pageNo,int pageSize){
        ///创建查询
        return getSessionFactory().getCurrentSession()
                .createQuery(hql)
                //执行分页
                .setFirstResult((pageNo-1)*pageSize)
                .setMaxResults(pageSize)
                .list();
    }

    /**
     * 使用HQL语句进行分页查询操作
     * @param hql 需要查询的HQL语句
     * @param pageNo 查询第几页的记录
     * @param pageSize 每页的大小
     * @param params 如果HQL带占位符，params用于传入点位符的参数
     * @return 当前页的所有记录
     */
    protected  List<T> findByPage(String hql,int pageNo,int pageSize,Object... params){
        ///创建查询
        Query query=getSessionFactory().getCurrentSession()
                .createQuery(hql);
        ///为占位符设置参数
        for(int i=0,len=params.length;i<len;i++){
            query.setParameter(i+"",params[i]);
        }
        ///执行查询，返回分页结果
        return  query.setFirstResult((pageNo-1)*pageSize)
                .setMaxResults(pageSize)
                .list();
    }
}
