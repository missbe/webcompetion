package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.ManagerDaoImpl;
import cn.missbe.web.competition.entity.Manager;
import cn.missbe.web.competition.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2016/11/11 0011.
 */
@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDaoImpl managerDao;
    @Override
    public Manager get(Manager entiyClazz, Serializable id) {
        return managerDao.get(entiyClazz.getClass(),id);
    }

    @Override
    public Serializable save(Manager entiy) {
        return managerDao.save(entiy);
    }

    @Override
    public void update(Manager entiy) {
        managerDao.update(entiy);
    }

    @Override
    public void delete(Manager entity) {
        managerDao.delete(entity);
    }

    @Override
    public void delete(Manager entiyClazz, Serializable id) {
        managerDao.delete(entiyClazz.getClass(),id);
    }

    public List<Manager> findAll(Class entiyClazz ){
        return managerDao.findAll(entiyClazz);
    }
    public List<Manager> find(String hql){
        return managerDao.find(hql);
    }
    ///根据带占位符的HQL语句设置参数
    public  List<Manager> find(String hql, Object... params){
        return managerDao.find(hql,params);
    }

    /**
     * 使用HQL语句进行分页查询操作
     * @param hql 需要查询的HQL语句
     * @param pageNo 查询第几页的记录
     * @param pageSize 每页的大小
     * @return 当前页的所有记录
     */
    public List<Manager> findByPage(String hql,int pageNo,int pageSize){
        ///创建查询
        return managerDao.findByPage(hql,pageNo,pageSize);
    }

    /**
     * 使用HQL语句进行分页查询操作
     * @param hql 需要查询的HQL语句
     * @param pageNo 查询第几页的记录
     * @param pageSize 每页的大小
     * @param params 如果HQL带占位符，params用于传入点位符的参数
     * @return 当前页的所有记录
     */
    public  List<Manager> findByPage(String hql,int pageNo,int pageSize,Object... params){
        ///创建查询
        return managerDao.findByPage(hql,pageNo,pageSize,params);
    }
    public long findCount(Class entiyClazz) {

        return managerDao.findCount(entiyClazz);
    }

}
