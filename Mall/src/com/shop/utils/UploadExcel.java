package com.shop.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shop.entity.Product;

public class UploadExcel {
    /**
     *上传强化request
     * */
    public static String doupload(HttpServletRequest request, HttpServletResponse response){

        //把上传的图片保存到images目录中，并把request中的请求参数封装到book中
        //Goods goods = new Goods();
    	String s=null;
    	String realName=null;
        try{
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
                if(item.isFormField()){//判断表单是否为文件上传类型表单
                 
                }else{
                    String filename = item.getName();
                    System.out.println("filename="+filename);
                    
                    if (!filename.equals("")) {
                        String savefilename = makeFileName(filename, request,response);//得到保存在硬盘的文件名
                        String savepath = request.getServletContext().getRealPath("/resource");
                        //若文件夹不存在则创建(编译器判断文件夹没有文件的话就不会在输出目录创建改文件夹，从而导致filenotfound异常)
                        if (!new File(savepath).exists()) {
                            File file = new File(savepath);
                            file.mkdir();
                        }
                        InputStream in = item.getInputStream();
                        FileOutputStream out = new FileOutputStream(savepath + "/" + savefilename);
                        int len = 0;
                        byte buffer[] = new byte[1024];
                        while ((len = in.read(buffer)) > 0) {
                            out.write(buffer, 0, len);
                        }
                        in.close();
                        out.close();
                        item.delete();
                        savefilename="resource/"+savefilename;
                        s=savefilename;
                       // product.setImgurl(savefilename);
                       // goods.setGoods_image(savefilename);
                    }
                }
            }
            //return goods;
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return s;
    }

    /**
     *  生成一个随机的文件名，防止文件名相同而覆盖
     */
    public static String makeFileName(String filename,HttpServletRequest request,HttpServletResponse response){
        String ext = filename.substring(filename.lastIndexOf("."));//截取扩展名
        System.out.println(ext);/*
        if (!ext.equals(".xls")||!ext.equals(".xlsx")){
            throw new RuntimeException();
        }*/
        return MakeIdUtil.makeID() + ext;
    }
}
