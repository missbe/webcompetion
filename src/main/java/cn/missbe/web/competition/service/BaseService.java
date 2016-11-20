package cn.missbe.web.competition.service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
public interface BaseService<T> {
    //根据ID加载实体
    T get(Class entiyClazz, Serializable id);
    //保存实体
    Serializable save(T entiy);
    //更新实体
    void update(T entiy);
    //删除实体
    void delete(T entity);
    //根据ID删除实体
    void delete(Class entiyClazz,Serializable id);

    List<T> findAll(Class<T> entiyClazz);
    //获取实体总数
    long findCount(Class<T> entiyClazz);
}
