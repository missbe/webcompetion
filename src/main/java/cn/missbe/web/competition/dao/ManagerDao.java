package cn.missbe.web.competition.dao;

import cn.missbe.web.competition.entity.Manager;

/**
 * Created by Administrator on 2016/11/9 0009.
 */
public interface ManagerDao {
    //重新实现删除管理员的方法
    void deleteManager(Manager entity);
}
