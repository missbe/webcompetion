package cn.missbe.web.competition.entity;

import cn.missbe.web.competition.util.MD5Util;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/11/11 0011.
 */
@Entity
@Table(name = "tb_admin")
public class Manager {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_id")
    private int id;

    @Column(name = "admin_name",nullable = false,length=50)
    private String name;

    @Column(name = "admin_nick_name",nullable = false,length=50)
    private String nickName="未命名";///初始化

    @Column(name="admin_password",nullable = false,length=60)
    private String password;

    @Column(name="admin_description")
    private String description;

    @Column(name = "admin_permission",nullable = false)
    private String permission;

    @Column(name = "admin_image")
    private String image;

    public Manager(){
        this.image="logo.jpg";
    }
    public Manager(Manager manager){
        this.id=manager.getId();
        this.name=manager.getName();
        this.password=manager.getPassword();
        this.permission=manager.getPermission();
        this.image=manager.getImage();
        this.nickName=manager.getNickName();
    }
    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password= MD5Util.string2MD5(password);
      //  this.password = password;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
