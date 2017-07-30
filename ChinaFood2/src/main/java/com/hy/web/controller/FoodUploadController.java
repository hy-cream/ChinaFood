package com.hy.web.controller;

import com.google.gson.Gson;
import com.hy.bean.User;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.List;

import static oracle.net.aso.C05.e;

/**
 * Created by huyu on 2017/7/24.
 */
@Controller
@RequestMapping("/")
public class FoodUploadController {

    @RequestMapping(value = "addFood",method = RequestMethod.GET)
    public String addFoodPage(){
        return "fabu";
    }

    //上传新的食物作品
    @RequestMapping(value = "addFood",method = RequestMethod.POST)
    public String foodUpload(HttpServletRequest request){
        MultipartHttpServletRequest multiRequest= (MultipartHttpServletRequest) request;
        String foodName=multiRequest.getParameter("name");
        List<MultipartFile> files=multiRequest.getFiles("file[]");
        String main=multiRequest.getParameter("main");
        String other=multiRequest.getParameter("other");
        String detail=multiRequest.getParameter("detail");
        String pretime=multiRequest.getParameter("prepareTime");
        String cookingTime=multiRequest.getParameter("cookingTime");


        System.out.println("----------upload"+foodName+"---"+foodName);
        System.out.println("---------main="+main+"-----------preparetime="+pretime);
        System.out.println("-----------files"+files.size());

        //先将图片上传，然后返回一个路径，将路径和参数组成food对象，再插入数据库中
     String paths=saveFile(request,files);
     System.out.println("finallpath---------------"+paths);
        return "myzuoping2";
    }

    private String saveFile(HttpServletRequest request, List<MultipartFile> files) {
        StringBuffer pathString=new StringBuffer();
        // 判断文件是否为空
           /* try {*/
                if (files.size()!=0) {
                    for (MultipartFile file : files) {
                        //保存的文件路径
                        //需要的话可以给文件名上加时间戳

                        String filePath = request.getServletContext().getRealPath("/") + "upload/"
                                + file.getOriginalFilename() + "/" + System.currentTimeMillis();

                        System.out.println("filepath-------------"+filePath);

                    /*    File newFile = new File(filePath);
                        //文件所在目录不存在就创建
                        if (!newFile.getParentFile().exists()) {
                            newFile.getParentFile().mkdirs();
                        }

                        // 转存文件
                        file.transferTo(newFile);*/
                        pathString.append("%").append(filePath);
                    }
                }
                return pathString.toString();

          /*  } catch (IOException e) {
                e.printStackTrace();
                return "";
            }*/
    }


    //多张图片同时上传
    @RequestMapping(value = "uploadtest",method = RequestMethod.GET)
    public String uploadTestg(){
        return "uploadtest";
    }

    @RequestMapping(value = {"upload"},method = RequestMethod.GET)
    public String upload(){
        return "uploaddemo2";
    }

    @RequestMapping(value = {"myzuoping2"},method = RequestMethod.GET)
    public String zuoping2(){
        return "myzuoping2";
    }


    @RequestMapping(value="/qiuniuupload",method=RequestMethod.POST)
    public void testQiuNiu(MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception{
        //构造一个带指定Zone对象的配置类 华南
        Configuration cfg=new Configuration(Zone.zone2());
        UploadManager uploadManager=new UploadManager(cfg);
        //生成上传凭证，然后准备上传
        String  accessKey="";
        String secretKey="";
        //上传到指定的七牛云空间
        String bucket="";
        //默认不指定key的情况下，以文件内容的hash值作为文件名（上传后的文件名）
        String key=null;

        //将文件转化为字节数组
        InputStream is=file.getInputStream();
        ByteArrayOutputStream bos=new ByteArrayOutputStream();
        byte[] b=new byte[1024];
        int len=-1;
        while((len=is.read(b))!=-1){
            bos.write(b,0,len);
        }
        byte[] uploadBytes=bos.toByteArray();

        //进行七牛云的操作
        Auth auth=Auth.create(accessKey,secretKey);
        String upToken=auth.uploadToken(bucket);

        //默认上传接口回复对象
        DefaultPutRet putRet;
        //进行文件上传操作，传入文件的字节数组，文件名，上传空间，得到回复对象
        Response responseQ=uploadManager.put(uploadBytes,key,upToken);
        putRet=new Gson().fromJson(responseQ.bodyString(),DefaultPutRet.class);
        System.out.println(putRet.key);//返回的文件名
        //hash返回的文件的存储地址，可以使用这个地址加七牛云提供的前缀访问图片
        System.out.println(putRet.hash);
    }

}
