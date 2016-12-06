package cn.missbe.web.competition.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
@Entity
@Table(name = "tb_gallery")
public class Gallery {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "gallery_id")
    private int id;

    @Column(name = "gallery_title",nullable = false,length=60)
    private String galleryTitle;

    @Column(name="gallery_time",nullable = false)
    private String galleryTime;

    @Column(name="admin_id",length=20)
    private int adminId;

    @Column(name="gallery_image",columnDefinition ="text")
    private String galleryImgage;

    @ElementCollection(targetClass = String.class)
    @CollectionTable(name = "gallery_tags",joinColumns = @JoinColumn(name = "gallery_id",nullable = true))
    @Column(name="gallery_tags_id")
    @OrderColumn(name = "tags_id")
    private List<String> tags=new ArrayList<String>();

    @Column(name="gallery_category",length=80)
    private String category;

    @Column(name="gallery_content",columnDefinition ="text")
    private String content;

    public Gallery(){
    }

    public Gallery(Gallery gallery){
        this.id=gallery.getId();
        this.galleryImgage=gallery.getGalleryImgage();
        this.galleryTime=gallery.getGalleryTime();
        this.adminId=gallery.getAdminId();
        this.category=gallery.getCategory();
        this.tags=gallery.getTags();
        this.galleryTitle=gallery.getGalleryTitle();
        this.content=gallery.getContent();
    }
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGalleryTitle() {
        return galleryTitle;
    }

    public void setGalleryTitle(String galleryTitle) {
        this.galleryTitle = galleryTitle;
    }

    public void setGalleryTime(String galleryTime) {
        this.galleryTime = galleryTime;
    }
    public String getGalleryTime() {
        return galleryTime;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getGalleryImgage() {
        return galleryImgage;
    }

    public void setGalleryImgage(String galleryImgage) {
        this.galleryImgage = galleryImgage;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
