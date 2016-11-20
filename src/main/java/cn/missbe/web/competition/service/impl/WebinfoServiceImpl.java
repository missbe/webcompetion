package cn.missbe.web.competition.service.impl;
import cn.missbe.web.competition.dao.impl.WebinfoDaoImpl;
import cn.missbe.web.competition.entity.Webinfo;
import cn.missbe.web.competition.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
@Service
public class WebinfoServiceImpl implements BaseService<Webinfo>
{
    @Autowired
    protected WebinfoDaoImpl daoImpl;

	public Webinfo get(Webinfo entiyClazz, Serializable id) {
		// TODO Auto-generated method stub
		return daoImpl.get(entiyClazz.getClass(), id);
	}

	@Override
	public Webinfo get(Class entiyClazz, Serializable id) {
		return daoImpl.get(entiyClazz,id);
	}

	@Override
	public Serializable save(Webinfo entiy) {
		// TODO Auto-generated method stub
		return daoImpl.save(entiy);
	}

	@Override
	public void update(Webinfo entiy) {
		// TODO Auto-generated method stub
		daoImpl.update(entiy);
	}

	@Override
	public void delete(Webinfo entity) {
		// TODO Auto-generated method stub
		daoImpl.delete(entity);
	}

	@Override
	public void delete(Class entiyClazz, Serializable id) {
		daoImpl.delete(entiyClazz,id);
	}

	@Override
	public long findCount(Class<Webinfo> entiyClazz) {
		return daoImpl.findCount(entiyClazz);
	}

	public void delete(Webinfo entiyClazz, Serializable id) {
		// TODO Auto-generated method stub
		daoImpl.delete(entiyClazz.getClass(),id);
	}
	
	public List findAll(Class entiyClazz) {
        return daoImpl.findAll(entiyClazz);
    }
	

}