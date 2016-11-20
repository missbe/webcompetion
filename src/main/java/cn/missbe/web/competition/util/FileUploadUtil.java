package cn.missbe.web.competition.util;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/13 0013.
 */
public class FileUploadUtil {
    public static boolean upload(String filePath,CommonsMultipartFile multipartFile){
        if(null!=multipartFile){
            try {
                multipartFile.transferTo(new File(filePath));
            } catch (IOException e) {

                PrintUtil.print("文件"+filePath+"保存错误："+e.getMessage(), Level.error);
                e.printStackTrace();

            }
            System.out.println(filePath+"\n"+multipartFile.getContentType()+":"+multipartFile.getSize());
            return true;
        }else{
            return false;
        }
    }
//    public static boolean upload(String preffix, HttpServletRequest request,MultipartFile multipartFile){
//        ///未提交文件直接更新信息
//        if(null != multipartFile && !multipartFile.isEmpty()){
//            String rootPath=request.getServletContext().getRealPath("/");
//            String dir= DateUtil.formateDateyyyyMM(new Date());
//            ///保存文件的完整路径
//            String allDirName=rootPath+ preffix+ dir;
//            System.out.println("AllDirName:"+allDirName);
//
//
//            System.out.println("Dir:"+dir);
//            ///目录是否存在，不存在创建
//            File dirFile=new File(allDirName);
//            if(!dirFile.exists()){
//                boolean flag= dirFile.mkdir();
//                if(flag){
//                    PrintUtil.print("文件夹:"+dir+"创建成功..", Level.info);
//                    System.out.println("文件夹:"+dir+"创建成功..");
//                }
//            }
//            ///获取上文件信息
//            String originalFilename=multipartFile.getOriginalFilename();
//            String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));
//            ///保存的文件名
//            String fileName= DateUtil.formateDateyyyyMMddHHmmss(new Date()).toString()+suffix;
//            ///保存文件的完整路径
//            String allFileName=rootPath+ preffix+ dir +"/"+fileName;
//            ///写入数据的字符串
//            String dataBaseFileName=dir+"/"+fileName;
//
//            System.out.println("ContextPath:"+request.getServletContext().getRealPath("/")
//                    +"--"+request.getContextPath()+" DataBase:"+dataBaseFileName);
//
//            return  FileUploadUtil.upload(allFileName,(CommonsMultipartFile)multipartFile);
//
//        }else{
//           return false;
//        }
//    }
}
