package cn.missbe.web.competition.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
@Entity
@Table(name = "tb_gallery_tags")
public class GalleryTags {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "gallery_id")
    private int galleryId;

    @Column(name="gallery_names")
    private String galleryNames;

    public int getGalleryId() {
        return galleryId;
    }

    public void setGalleryId(int galleryId) {
        this.galleryId = galleryId;
    }

    public String getGalleryNames() {
        return galleryNames;
    }

    public void setGalleryNames(String galleryNames) {
        this.galleryNames = galleryNames;
    }

}
