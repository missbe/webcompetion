package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.ContactDaoImpl;
import cn.missbe.web.competition.entity.Contact;
import cn.missbe.web.competition.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2016/11/14 0014.
 */
@Service
public class ContactServiceImpl implements BaseService<Contact> {
    @Autowired
    private ContactDaoImpl contactDao;
    @Override
    public Contact get(Class entiyClazz, Serializable id) {
        return contactDao.get(entiyClazz,id);
    }

    @Override
    public Serializable save(Contact entiy) {
        return contactDao.save(entiy);
    }

    @Override
    public void update(Contact entiy) {
        contactDao.update(entiy);
    }

    @Override
    public void delete(Contact entity) {
        contactDao.delete(entity);
    }

    @Override
    public void delete(Class entiyClazz, Serializable id) {
        contactDao.delete(entiyClazz,id);
    }

    @Override
    public List<Contact> findAll(Class<Contact> entiyClazz) {
        return contactDao.findAll(entiyClazz);
    }

    @Override
    public long findCount(Class<Contact> entiyClazz) {
        return contactDao.findCount(entiyClazz);
    }
}
