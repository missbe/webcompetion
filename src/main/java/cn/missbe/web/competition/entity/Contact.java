package cn.missbe.web.competition.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/11/14 0014.
 */
@Entity
@Table(name = "tb_contact")
public class Contact {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contact_id")
    private int id;

    @Column(name = "contact_name",nullable = false,length=50)
    private String contactName;

    @Column(name="contact_time",nullable = false)
    private String contactTime;

    @Column(name="contact_items",length=60)
    private String contactItems;

    @Column(name="contact_message",columnDefinition = "text")
    private String contactMessage;

    @Column(name="contact_email",length=60)
    private String contactEmail;

    @Column(name="contact_flag",columnDefinition = "text")
    private String flag;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactTitle) {
        this.contactName = contactTitle;
    }

    public String getContactTime() {
        return contactTime;
    }

    public void setContactTime(String contactTime) {
        this.contactTime = contactTime;
    }

    public String getContactItems() {
        return contactItems;
    }

    public void setContactItems(String contactItems) {
        this.contactItems = contactItems;
    }
    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }
    public String getContactMessage() {
        return contactMessage;
    }

    public void setContactMessage(String contactMessage) {
        this.contactMessage = contactMessage;
    }

}
