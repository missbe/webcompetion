package cn.missbe.web.test;

import cn.missbe.web.competition.dao.impl.ManagerDaoImpl;
import cn.missbe.web.competition.entity.Manager;
import cn.missbe.web.competition.service.ManagerService;
import cn.missbe.web.competition.util.ManagerType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2016/10/29 0029.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "classpath:spring-beans.xml"})
public class HibernateTest {
    @Autowired
    private ManagerService service;
    @Autowired
    private ManagerDaoImpl managerDao;
    @Test
    public void testManager() {
        Manager manager_one=new Manager();
//        Manager manager_two=new Manager();
        Manager manager_three=new Manager();

        manager_one.setPassword("admin");
        manager_three.setPassword("root");


        manager_one.setName("admin");
        manager_three.setName("root");
//        manager_two.setName("张柯");

        manager_one.setNickName("依然慢节奏");
        manager_three.setNickName("依然范特西");
//        manager_two.setNickName("依然范特西");

        manager_one.setDescription("听你的赶时间");
        manager_three.setDescription("你是在搞基了");
//        manager_two.setDescription("这是什么问题");

        manager_one.setPermission(ManagerType.typeToStr(ManagerType.supervisor));
        manager_three.setPermission(ManagerType.typeToStr(ManagerType.general));
//        manager_two.setPermission(ManagerType.typeToStr(ManagerType.general));

        System.out.println(manager_one.getPassword());

        service.save(manager_one);
//        service.save(manager_two);
        service.save(manager_three);

//        service.delete(manager_one);
//        List<Manager> managerList=managerDao.find("from Manager m where m.name=?0","admin");
//        if(managerList.size()>0){
//            for (Manager manager:managerList) {
//                System.out.println(manager.getId()+":"+manager.getName()+":"+manager.getPassword());
//            }
//        }else{
//            System.out.println(managerList.size());
//        }

//        manager_three.setName("黄--峰");
//        service.update(manager_three);


    }
}
