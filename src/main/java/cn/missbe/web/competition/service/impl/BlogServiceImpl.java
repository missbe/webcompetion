package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.BlogDaoImpl;
import cn.missbe.web.competition.entity.Blog;
import cn.missbe.web.competition.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by feng on 2016/11/12.
 */
@Service
public class BlogServiceImpl  implements BlogService{
    @Autowired
    private BlogDaoImpl blogDao;
    @Override
    public Serializable save(Blog blog){
        return blogDao.save(blog);
    }
    @Override
    public void deleteBlog(Blog blog) {
        blogDao.deleteBlog(blog);
    }

    public void update(Blog blog) {
        blogDao.update(blog);
    }

    @Override
    public Blog get(Class blogClazz,Serializable id){
        return (Blog)blogDao.get(blogClazz,id);
    }
    @Override
    public void delete(Class blogClazz,Serializable id){
        blogDao.delete(blogClazz,id);
    }
    @Override
    public List findAll(Class entiyClazz){
        return blogDao.findAll(Blog.class);
    }

    @Override
    public int findBlogCount(int id) {
        return blogDao.findCount(id);
    }

    ///根据HQL语句查询
    public List<Blog> find(String hql){
        return blogDao.find(hql);
    }
    ///根据带占位符的HQL语句设置参数
    public  List<Blog> find(String hql, Object... params){
        //创建查询
        return  blogDao.find(hql,params);
    }
    public List<Blog> findByPage(String hql,int pageNo,int pageSize){
        ///创建查询
        return blogDao.findByPage(hql,pageNo,pageSize);
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

        return blogDao.findByPage(hql,pageNo,pageSize,params);
    }
}
