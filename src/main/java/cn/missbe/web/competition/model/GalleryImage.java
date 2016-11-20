package cn.missbe.web.competition.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/11/17 0017.
 */
public class GalleryImage {
    private int id;
    private  String title;
    private String date;
    private List<String> image=new ArrayList<String>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<String> getImage() {
        return image;
    }

    public void setImage(List<String> image) {
        this.image = image;
    }
}
