package cn.missbe.web.competition.entity;

import javax.persistence.*;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;


/**
 * Created by feng on 2016/11/11.
 */
@Entity
@Table(name = "website_config")
public class Webinfo {
    //网站标题
    @Column(name = "title",length=40)
    private String Title;
    //主键ID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    //网站域名
    @Column(name = "domain",length=50)
    private String Domain;
    //网站关键词
    @Column(name="keywords")
    private String Keywords;
    //网站描述
    @Column(name="description",length=200)
    private String Description;
    //联系人名字
    @Column(name="person",length=40)
    private String Person;
    //手机号码
    @Column(name="phone",length=50)
    private String Phone;
    //400电话号码
    @Column(name="phone_400",length=30)
    private String phone_400;
    //QQ
    @Column(name="qq",length=30)
    private String Qq;
    //电子邮件
    @Column(name="email",length=100)
    private String Email;
    //公司地址
    @Column(name="address",length=200)
    private String Address;
    //底部版权信息
    @Column(name="footer_info",length=400)
    private String Footer_info;
    //公司传真
    @Column(name="fax",length=40)
    private String fax;
    

    public Webinfo()
    {
    	
    	
    }
    public Webinfo(Webinfo web) {
        this.Title=web.getTitle();
        this.Domain=web.getDomain();
        this.Keywords=web.getKeywords();
        this.Description=web.getDescription();
        this.Person=web.getPerson();
        this.Phone=web.getPerson();
        this.Qq=web.getQq();
        this.Email=web.getEmail();
        this.Address=web.getAddress();
        this.Footer_info=web.getFooter_info();
        this.fax=web.getfax();
        this.phone_400=web.getphone_400();
    }
    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }
   
    public String getfax() {
        return fax;
    }

    public void setfax(String fax) {
        this.fax = fax;
    }


    public void setphone_400(String phone_400) {
        this.phone_400 = phone_400;
    }
    public String getphone_400() {
        return phone_400;
    }


    public String getDomain() {
        return Domain;
    }

    public void setDomain(String Domain) {
        this.Domain = Domain;
    }

    public void setKeywords(String Keywords) {
        this.Keywords = Keywords;
    }

    public String getKeywords() {
        return Keywords;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getDescription() {
        return Description;
    }

    public void setPerson(String Person) {
        this.Person = Person;
    }

    public String getPerson() {
        return Person;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getPhone() {
        return Phone;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    public String  getEmail()
    { 
    	return Email;
    }
    public void setAddress(String Address) {
        this.Address = Address;
    }
    public String  getAddress()
    { 
    	return Address;
    }
    public void setQq(String Qq) {
        this.Qq = Qq;
    }
    public String  getQq()
    { 
    	return Qq;
    }



    public String getFooter_info() {
        return Footer_info;
    }

    public void setFooter_info(String Footer_info) {
        this.Footer_info = Footer_info;
    }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
