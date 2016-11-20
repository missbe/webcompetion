package cn.missbe.web.test;

import cn.missbe.web.competition.controller.WebGalleryController;
import cn.missbe.web.competition.model.GalleryImage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Administrator on 2016/11/17 0017.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "classpath:spring-beans.xml",
        "classpath:spring-mvc.xml"})
public class GalleryImageTest {
    @Autowired
    private WebGalleryController galleryController;

    @Test
    public void testImageList(){
        List<GalleryImage> list=galleryController.imageList();
        for(GalleryImage galleryImage:list){
            System.out.println(galleryImage.getId()+":"+galleryImage.getDate()+":"+galleryImage.getTitle());
            for(String s:galleryImage.getImage()){
                System.out.print(s);
            }
            System.out.println();
        }
    }
}
