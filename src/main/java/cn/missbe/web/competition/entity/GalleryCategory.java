package cn.missbe.web.competition.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
@Entity
@Table(name = "tb_gallery_category")
public class GalleryCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="gallery_category_id",nullable = false)
    private int galleryCategoryId;

    @Column(name="gallery_catagory_name",nullable = false,length=20)
    private String galleryCategoryName;

    public int getGalleryCategoryId() {
        return galleryCategoryId;
    }

    public void setGalleryCategoryId(int galleryCategoryId) {
        this.galleryCategoryId = galleryCategoryId;
    }

    public String getGalleryCategoryName() {
        return galleryCategoryName;
    }

    public void setGalleryCategoryName(String galleryCategoryName) {
        this.galleryCategoryName = galleryCategoryName;
    }
}

