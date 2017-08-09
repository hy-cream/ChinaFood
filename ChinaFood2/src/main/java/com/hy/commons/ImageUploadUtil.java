package com.hy.commons;

import com.google.gson.Gson;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by huyu on 2017/8/8.
 * 图片上传到云
 */
public class ImageUploadUtil {

    public ImageUploadUtil() {
    }

    //上传图片的方法
    public String uploadImgs(List<MultipartFile> files){

        if(files.size()!=0){
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
            String com="http://ote9zf3oz.bkt.clouddn.com/";
            //进行七牛云的操作
            Auth auth=Auth.create(accessKey,secretKey);
            String upToken=auth.uploadToken(bucket);
            //默认上传接口回复对象
            DefaultPutRet putRet;

            InputStream is=null;
            ByteArrayOutputStream bos=null;
            String paths="";
            int count=0;//计数
            try {
                //循环上传
                    for(MultipartFile file:files) {
                        //将文件转化为流---》字节输出流--》字节数组
                        is=file.getInputStream();
                        bos=new ByteArrayOutputStream();
                        byte[] b=new byte[1024];
                        int len=-1;
                        while((len=is.read(b))!=-1){
                            bos.write(b,0,len);
                        }
                        //将字节输出流转化为字节数组
                        byte[] uploadBytes=bos.toByteArray();
                        //进行文件上传操作，传入文件的字节数组，文件名，上传空间，得到回复对象
                        Response responseQ=uploadManager.put(uploadBytes,key,upToken);
                        putRet=new Gson().fromJson(responseQ.bodyString(),DefaultPutRet.class);

                        System.out.println("返回的文件名--------------------"+putRet.key);//返回的文件名
                        //hash返回的文件的存储地址，可以使用这个地址加七牛云提供的前缀访问图片
                        /* eg:http://ote9zf3oz.bkt.clouddn.com/FtfuLOKPrNrfu_it3PzPe-bpCSXQ
                         * FtfuLOKPrNrfu_it3PzPe-bpCSXQ*/
                        System.out.println("返回的文件地址--------------------"+putRet.hash);

                        if(count==0){
                            paths+=com+putRet.hash;
                        }else{
                            paths=paths+"&"+com+putRet.hash;
                        }
                        count++;
                    }

                    System.out.println("all path-------------------------"+paths);
                    return paths;
                } catch (Exception e) {
                    e.printStackTrace();
                }finally {
                    //关闭流资源
                    try {
                        if(bos!=null) bos.close();
                        if (is!=null) is.close();
                    }catch (IOException e) {
                        e.printStackTrace();
                    }
            }
        }
        return "";
    }

}
