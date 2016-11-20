package cn.missbe.web.competition.entity;

import javax.persistence.*;

/**
 * Created by feng on 2016/11/12.
 */
@Entity
@Table(name = "tb_tags")
public class Tags {
    //三个字段，博客id，博客tag

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tags_id")
    private int tagsId;

    @Column(name="tags_names")
    private String tagNames;

    public int getTagsId() {
        return tagsId;
    }

    public void setTagsId(int tagsId) {
        this.tagsId = tagsId;
    }

    public String getTagNames() {
        return tagNames;
    }

    public void setTagNames(String tagNames) {
        this.tagNames = tagNames;
    }


}
