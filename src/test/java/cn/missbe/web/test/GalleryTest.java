package cn.missbe.web.test;

import cn.missbe.web.competition.dao.impl.GalleryCategoryDaoImpl;
import cn.missbe.web.competition.dao.impl.GalleryTagsDaoImpl;
import cn.missbe.web.competition.entity.Gallery;
import cn.missbe.web.competition.entity.GalleryCategory;
import cn.missbe.web.competition.entity.GalleryTags;
import cn.missbe.web.competition.service.impl.GalleryServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2016/11/12 0012.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "classpath:spring-beans.xml"})
public class GalleryTest {
    @Autowired
    private GalleryTagsDaoImpl tagsDao;
    @Autowired
    private GalleryCategoryDaoImpl categoryDao;
    @Autowired
    private GalleryServiceImpl galleryService;

    @Test
    public void testTags(){
//        GalleryTags tags1=new GalleryTags();
//        tags1.setGalleryNames("时尚");
//
//        GalleryTags tags2=new GalleryTags();
//        tags2.setGalleryNames("生活");
//
//        GalleryTags tags3=new GalleryTags();
//        tags3.setGalleryNames("情感");

//        tagsDao.save(tags1);
//        tagsDao.save(tags2);
//        tagsDao.save(tags3);
//        tagsDao.delete(GalleryTags.class,6);
        GalleryTags tags=(GalleryTags)tagsDao.findAll(GalleryTags.class).get(0);
        tags.setGalleryNames("爱情");
        tagsDao.update(tags);
    }
    @Test
    public void testCatgory(){
//        GalleryCategory category1=new GalleryCategory();
//        category1.setGalleryCategoryName("编程语言");
//
//        GalleryCategory category2=new GalleryCategory();
//        category2.setGalleryCategoryName("时尚生活");
//
//        GalleryCategory category3=new GalleryCategory();
//        category3.setGalleryCategoryName("情感生活");
//
//        categoryDao .save(category1);
//        categoryDao.save(category2);
//        categoryDao.save(category3);
//        categoryDao.delete(GalleryCategory.class,6);
//        categoryDao.delete(GalleryCategory.class,5);

        GalleryCategory category=(GalleryCategory)categoryDao.findAll(GalleryCategory.class).get(0);
        category.setGalleryCategoryName("情感天地");
        categoryDao.update(category);

    }

    @Test
    public void testGallery(){
//        Gallery gallery1=new Gallery();
//        List<String> tagsList=new ArrayList<String>();
//        tagsList.add("时尚");
//        tagsList.add("生活");
//        tagsList.add("爱情");
//
//        gallery1.setAdminId(2);
//        gallery1.setCategory("情感天地");
//        gallery1.setGalleryImgage("logo.jpg,logo.jpg");
//        gallery1.setGalleryTitle("图文记事");
//        gallery1.setTags(tagsList);
//        gallery1.setGalleryTime(DateUtil.formateDateyyyy_MM_dd(new Date()));
//
//        Gallery gallery2=new Gallery();
//        tagsList.add("时尚");
//        tagsList.add("生活");
//        tagsList.add("爱情");
//
//        gallery2.setAdminId(2);
//        gallery2.setCategory("情感生活");
//        gallery2.setGalleryImgage("logo.jpg,logo.jpg");
//        gallery2.setGalleryTitle("图文记事");
//        gallery2.setTags(tagsList);
//        gallery2.setGalleryTime(DateUtil.formateDateyyyy_MM_dd(new Date()));
//
//        galleryService.save(gallery1);
//        galleryService.save(gallery2);

        Gallery gallery=(Gallery)galleryService.findAll(Gallery.class).get(0);
        gallery.setGalleryTitle("图文更改");
        galleryService.update(gallery);

    }
    @Test
    public void findCount(){
        System.out.println(galleryService.findGalleryCount(8));
    }
}
