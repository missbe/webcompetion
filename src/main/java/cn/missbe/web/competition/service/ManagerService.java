package cn.missbe.web.competition.service;

import cn.missbe.web.competition.entity.Manager;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/11/11 0011.
 */
public interface ManagerService {
    //根据ID加载实体
    Manager get(Manager entiyClazz, Serializable id);
    //保存实体
    Serializable save(Manager entiy);
    //更新实体
    void update(Manager entiy);
    //删除实体
    void delete(Manager entity);
    //根据ID删除实体
    void delete(Manager entiyClazz,Serializable id);
}
