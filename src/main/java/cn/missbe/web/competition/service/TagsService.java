package cn.missbe.web.competition.service;

import cn.missbe.web.competition.entity.Tags;

import java.io.Serializable;
import java.util.List;

/**
 * Created by feng on 2016/11/12.
 */
public interface TagsService {
    //保存tags
    Serializable save(Tags tags);
    //删除tags
    void delete(Tags tags);
    //更新tags
    void update(Tags tags);
    //查询所有的tags
    List<Tags> getTags(Tags tags);
}
