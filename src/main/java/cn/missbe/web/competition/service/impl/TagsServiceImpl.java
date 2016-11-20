package cn.missbe.web.competition.service.impl;

import cn.missbe.web.competition.dao.impl.TagsDaoImpl;
import cn.missbe.web.competition.entity.Tags;
import cn.missbe.web.competition.service.TagsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by feng on 2016/11/12.
 */
@Service
public class TagsServiceImpl implements TagsService {
    @Autowired
    private TagsDaoImpl tagsDao;
    @Override
    public Serializable save(Tags tags) {
        return tagsDao.save(tags);
    }

    @Override
    public void delete(Tags tags) {
        tagsDao.delete(tags);
    }

    @Override
    public void update(Tags tags) {
        tagsDao.update(tags);
    }

    @Override
    public List<Tags> getTags(Tags tags) {
        return tagsDao.findAll(Tags.class);
    }

}
