package cn.missbe.web.competition.controller;

import cn.missbe.web.competition.App;
import cn.missbe.web.competition.entity.Manager;
import cn.missbe.web.competition.service.impl.BlogServiceImpl;
import cn.missbe.web.competition.service.impl.GalleryServiceImpl;
import cn.missbe.web.competition.service.impl.ManagerServiceImpl;
import cn.missbe.web.competition.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/11/7 0007.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminManagerController {
    @Autowired
    private ManagerServiceImpl managerService;
    @Autowired
    private BlogServiceImpl blogService;

    @Autowired
    private GalleryServiceImpl galleryService;

    private long pageCount=-1;
    private boolean flag;///持有是否是超级管理员
    @RequestMapping(value = " ")
    public String indexUI(HttpSession httpSession){
        refreshSession(httpSession);///刷新session
//        Manager manager=(Manager)httpSession.getAttribute("manager");
//        if(null==manager){
//            return "/admin/login";
//        }
//        if(!isLogin(httpSession)){
//            return "/admin/login";
//        }
        return "admin/index";
    }
//    //判断是否登录
//    private boolean isLogin(HttpSession httpsession){
//        if(null==httpsession.getAttribute("manager")){
//            return false;
//        }
//        return true;
//    }

    ////根据管理员ID刷新session范围的数据
    private void refreshSession(HttpSession httpSession){
        Manager manager=(Manager)httpSession.getAttribute("manager");

        if(manager!=null){
            Manager newManager=new Manager(managerService.get(manager,manager.getId()));///获取新的对象,创建副本

            if(null!=newManager){
                int count=blogService.findBlogCount(newManager.getId());

                //刷新需要处理前缀
                newManager.setImage(App.ADMIN_PREFIX+newManager.getImage());

                httpSession.setAttribute("manager", newManager);///保存session范围内，整个会话有效
                httpSession.setAttribute("blogCount", count);///保存session范围内，整个会话有效

                count=galleryService.findGalleryCount(newManager.getId());
                httpSession.setAttribute("galleryCount", count);///保存session范围内，整个会话有效
            }
            ////获取失败不操作
        }
        ////获取失败，保持原来数据，否则不刷新
    }

    ///封装请求参数
    private Manager convertManager(HttpServletRequest request){
        Manager manager=new Manager();
        if(null!=request.getParameter("id")){
            manager.setId(Integer.parseInt(request.getParameter("id")));
        }else{
            PrintUtil.print("Request--ID--为NULL，转化出错",Level.error);
        }
        manager.setName(request.getParameter("userName"));
        manager.setPassword(request.getParameter("userPass"));
        manager.setDescription(request.getParameter("userDescription"));
        manager.setNickName(request.getParameter("nickname"));
        if(null!=request.getParameter("userPermiss")){
            ///修改管理员权限类型
            ManagerType type=Integer.parseInt(request.getParameter("userPermiss"))==0
                    ? ManagerType.supervisor : ManagerType.general;
            manager.setPermission(ManagerType.typeToStr(type));
        }else{
            PrintUtil.print("Request--权限--请求为NULL，转化出错",Level.error);
        }

        return manager;
    }

    ///判断是否是超级管理员
    private  boolean isSuperManager(Manager manager){
        System.out.println(manager.getPermission());
        if(ManagerType.typeToInt(ManagerType.supervisor)==
                ManagerType.typeToInt(ManagerType.strToTypel(manager.getPermission()))){
            return true;
        }else{
            return false;
        }
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, HttpSession httpsession, Model model){
        String name=request.getParameter("userName");
        String pass=request.getParameter("userPass");
        System.out.println(name+"-------"+pass);

        if(null==name || pass==null){
            model.addAttribute("message","用户名和密码必填");
            return "admin/login";
        }

        List<Manager> managerList=managerService.find("from Manager m where m.name=?0",name);
        if(managerList.size()>0){
            for(Manager manager:managerList)
                if (manager.getPassword().equals(MD5Util.string2MD5(pass))) {
                    Manager newManager=new Manager(manager);///创建副本，不是持久化对象

                    flag=isSuperManager(newManager);////登录后即获取是否是超级管理员
                    System.out.println("是否为超级管理员:"+flag);

                    newManager.setImage(App.ADMIN_PREFIX+manager.getImage());///加上前缀
                    int count=blogService.findBlogCount(newManager.getId());

                    httpsession.setAttribute("manager", newManager);///保存session范围内，整个会话有效
                    httpsession.setAttribute("blogCount", count);///保存session范围内，整个会话有效

                    count=galleryService.findGalleryCount(newManager.getId());
                    httpsession.setAttribute("galleryCount", count);///保存session范围内，整个会话有效
//                    model.addAttribute("manager", manager);
                    return "admin/index";
                }
        }
        model.addAttribute("message","用户名或者密码不正确");
        return "admin/login";
    }

    @RequestMapping(value = "/manager/list")
    public  String managerList(int pageNo,HttpSession httpSession,Model model){
        if(!flag){
            ///如果不是超级管理员则无权限操作
            model.addAttribute("message","你没有权限进行此操作！");
            return "admin/message";
        }

        refreshSession(httpSession);///获取列表时刷新数据

        int pageSize=15;
        System.out.println(pageNo+":"+pageSize);
        List<Manager> managerList=managerService.findByPage("from Manager m",pageNo,pageSize);

        ///只查找一次
        if(-1==pageCount){
            long count=managerService.findCount(Manager.class);
            pageCount= (count/15==0) ?count/15:count/15+1;
        }

        pageCount=(0==pageCount) ? pageCount+1 : pageCount;

        model.addAttribute("managerList",managerList);
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("pageCurrent",pageNo);
        model.addAttribute("message","管理员获取成功！");
//
       return "admin/admin_manager_list";
    }

    @RequestMapping(value = "/manager/delete")
    public String managerDelete(int id,Model model)
    {
        if(!flag){
            ///如果不是超级管理员则无权限操作
            model.addAttribute("message","你没有权限进行此操作！");
            return "admin/message";
        }

        System.out.println("----你确定要删除ID--"+id);
        String message;
        if(id<=0){
            message="--管理员ID错误，删除失败----";
        }else{
            managerService.delete(new Manager(),id);
            message="----删除管理员成功----";
        }
        model.addAttribute("message",message);
        return "admin/message";
    }

    @RequestMapping(value = "/manager/add")
    public String managerAdd(Model model){
        if(!flag){
            ///如果不是超级管理员则无权限操作
            model.addAttribute("message","你没有权限进行此操作！");
            return "admin/message";
        }
        return "admin/admin_manager_add";
    }
    @RequestMapping(value = "/manager/edit")
    public String managerEdit(String id,Model model){
        if(!flag){
            ///如果不是超级管理员则无权限操作
            model.addAttribute("message","你没有权限进行此操作！");
            return "admin/message";
        }

        System.out.println("Manager ID:"+id);

        ///创建manager的副本
        Manager manager=new Manager(managerService.find(" from Manager m where m.id=?0", Integer.parseInt(id)).get(0));
        manager.setImage(App.ADMIN_PREFIX+manager.getImage());

        if(null != manager){
            System.out.println(manager.getId()+":"+manager.getName()+":"+manager.getImage());
            model.addAttribute("manager",manager);
        }
        return "admin/admin_manager_edit";
    }
    @RequestMapping(value = "/manager/addManager")
    public String addManager(@RequestParam("multipartFile") CommonsMultipartFile multipartFile,HttpServletRequest request, Model model){
        System.out.println(request.getParameter("userName")+request.getParameter("userPass"));
        System.out.println(request.getParameter("userPermiss")+request.getParameter("userDescription"));
        System.out.println(request.getParameter("id")+request.getParameter("userPermiss"));

        Manager manager=convertManager(request);///封装请求的rquest对象
        System.out.println("Manager:"+manager.getId()+":"+manager.getDescription());

        String rootPath=request.getServletContext().getRealPath("/");
        String dir= DateUtil.formateDateyyyyMM(new Date());
        ///保存文件的完整路径
        String allDirName=rootPath+ App.ADMIN_PREFIX+ dir;

        if(null!=multipartFile && !multipartFile.isEmpty()){
            System.out.println("Dir:"+dir);
            ///目录是否存在，不存在创建
            File dirFile=new File(allDirName);
            if(!dirFile.exists()){
                boolean flag= dirFile.mkdir();
                if(flag){
                    PrintUtil.print("文件夹:"+dir+"创建成功..", Level.info);
                    System.out.println("文件夹:"+dir+"创建成功..");
                }
            }
            ///获取上文件信息
            String originalFilename=multipartFile.getOriginalFilename();
            String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));
            ///保存的文件名
            String fileName= DateUtil.formateDateyyyyMMddHHmmss(new Date()).toString()+suffix;
            ///保存文件的完整路径
            String allFileName=rootPath+ App.ADMIN_PREFIX+ dir +"/"+fileName;
            ///写入数据的字符串
            String dataBaseFileName=dir+"/"+fileName;

            System.out.println("ContextPath:"+request.getServletContext().getRealPath("/")
                    +"------"+request.getContextPath()+" DataBase:"+dataBaseFileName);

            boolean fileFlag=FileUploadUtil.upload(allFileName,multipartFile);
            if(!fileFlag){
                model.addAttribute("message","--管理员添加出错了---");
            }else {
                model.addAttribute("message", "--管理员添加成功---");

                manager.setImage(dataBaseFileName);
                managerService.save(manager);///保存新创建的对象
            }
        }else{
            managerService.save(manager);///保存新创建的对象
        }
//        return "redirect:/admin/manager/list?pageNo=1";
        return "admin/message";
    }
    @RequestMapping(value = "/manager/saveManager")
    public String saveManager(@RequestParam("multipartFile") CommonsMultipartFile multipartFile,HttpServletRequest request, Model model){

        System.out.println(request.getParameter("userName")+request.getParameter("userPass"));
        System.out.println(request.getParameter("userPermiss")+request.getParameter("userDescription"));
        System.out.println(request.getParameter("id")+request.getParameter("userPermiss"));

        Manager manager=convertManager(request);
        System.out.println("Manager:"+manager.getId()+":"+manager.getDescription());
        ///未提交文件直接更新信息
        if(null != multipartFile && !multipartFile.isEmpty()){
            String rootPath=request.getServletContext().getRealPath("/");
            String dir= DateUtil.formateDateyyyyMM(new Date());
            ///保存文件的完整路径
            String allDirName=rootPath+ App.ADMIN_PREFIX+ dir;
            System.out.println("AllDirName:"+allDirName);


            System.out.println("Dir:"+dir);
            ///目录是否存在，不存在创建
            File dirFile=new File(allDirName);
            if(!dirFile.exists()){
                boolean flag= dirFile.mkdir();
                if(flag){
                    PrintUtil.print("文件夹:"+dir+"创建成功..", Level.info);
                    System.out.println("文件夹:"+dir+"创建成功..");
                }
            }
            ///获取上文件信息
            String originalFilename=multipartFile.getOriginalFilename();
            String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));
            ///保存的文件名
            String fileName= DateUtil.formateDateyyyyMMddHHmmss(new Date()).toString()+suffix;
            ///保存文件的完整路径
            String allFileName=rootPath+ App.ADMIN_PREFIX+ dir +"/"+fileName;
            ///写入数据的字符串
            String dataBaseFileName=dir+"/"+fileName;

            System.out.println("ContextPath:"+request.getServletContext().getRealPath("/")
                    +"--"+request.getContextPath()+" DataBase:"+dataBaseFileName);

            boolean fileFlag=FileUploadUtil.upload(allFileName,multipartFile);
            if(!fileFlag){
                model.addAttribute("message","--文件保存出错了---");
            }else {
                manager.setImage(dataBaseFileName);
                managerService.update(manager);
            }
        }else{
            managerService.update(manager);
        }
        model.addAttribute("message", "--管理员信息更新成功---");
//        return "redirect:/admin/manager/list?pageNo=1";
        return "admin/message";
    }

    @RequestMapping(value = "/manager/setting")
    public String managerSetting(HttpSession httpsession,Model model){
        System.out.println("/manager/setting被调用---");
        Manager manager=(Manager)httpsession.getAttribute("manager");
        if(null == manager){
            return "admin/login";
        }
        int id=manager.getId();
        System.out.println("Manager ID:"+id);

        Manager newManager=new Manager(managerService.find(" from Manager m where m.id=?0", id).get(0));

        newManager.setImage(App.ADMIN_PREFIX+manager.getImage());

        if(null != manager){
            System.out.println(newManager.getId()+":"+newManager.getName()+":"+newManager.getImage());
             model.addAttribute("manager",newManager);
        }
        return "admin/admin_manager_setting";
    }

    @RequestMapping(value = "/exit")
    public String exit(HttpSession httpsession){
        httpsession.invalidate();
        return "admin/login";
    }

}
