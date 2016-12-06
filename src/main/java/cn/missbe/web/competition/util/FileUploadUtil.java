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
    ///删除指定目录下的文件
    public static boolean delete(String path){
        boolean flag=false;
        File file=new File(path);
        if(file.exists()){///如果文件存在
           flag=file.delete();///删除文件，并且返回标识
            deleteDirectory(file);
        }
        return flag;
    }
    ///删除目录
    private static void deleteDirectory(File file){
        File fileDirectory=file.getParentFile();///得到父级目录
        if(fileDirectory.exists() && fileDirectory.isDirectory()){
           String[] files=fileDirectory.list();
            if(files.length==0){
                fileDirectory.delete();///删除目录
            }
        }
    }
}
