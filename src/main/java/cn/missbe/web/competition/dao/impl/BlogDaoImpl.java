package cn.missbe.web.competition.dao.impl;

import cn.missbe.web.competition.dao.BlogDao;
import cn.missbe.web.competition.entity.Blog;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * Created by feng on 2016/11/11.
 */
@Repository
public class BlogDaoImpl extends BaseDaoImpl<Blog> implements BlogDao {
    @Override
   public Serializable save(Blog blog){
        return super.save(blog);
    }

    @Override
    public void deleteBlog(Blog blog) {
        super.delete(blog);
    }

    @Override
    public Blog get(Class blogClazz,Serializable id){
        return (Blog)super.get(blogClazz,id);
    }

    @Override
    public void delete(Class blogClazz,Serializable id){
        super.delete(blogClazz,id);
    }
    @Override
    public List findAll(Class entiyClazz){
        return (List<Blog>)super.findAll(Blog.class);
    }

    public int findCount(int id){

        return super.find(" from Blog b where b.adminId=?0",id).size();
    }
    ///根据HQL语句查询
    public List<Blog> find(String hql){
        return super.find(hql);
    }
    ///根据带占位符的HQL语句设置参数
    public  List<Blog> find(String hql, Object... params){
        //创建查询
        return  super.find(hql,params);
    }
    /**
     * 使用HQL语句进行分页查询操作
     * @param hql 需要查询的HQL语句
     * @param pageNo 查询第几页的记录
     * @param pageSize 每页的大小
     * @return 当前页的所有记录
     */
    public List<Blog> findByPage(String hql,int pageNo,int pageSize){
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
    public  List<Blog> findByPage(String hql,int pageNo,int pageSize,Object... params){
        ///创建查询

        return super.findByPage(hql,pageNo,pageSize,params);
    }
}
