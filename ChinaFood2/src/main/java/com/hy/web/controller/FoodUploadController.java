package com.hy.web.controller;


import com.hy.bean.Food;
import com.hy.bean.FoodCategory;
import com.hy.bean.FoodMethod;
import com.hy.bean.User;
import com.hy.dao.CategoryMapper;
import com.hy.service.FoodService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by huyu on 2017/7/24.
 */
@Controller
@RequestMapping("/")
public class FoodUploadController {

    @Autowired
    private FoodService foodService;

    @RequestMapping(value = "addFood",method = RequestMethod.GET)
    public String addFoodPage(){
        return "fabu";
    }

    //上传新的食物作品
    @RequestMapping(value = "addFood",method = RequestMethod.POST)
    public String foodUpload(HttpServletRequest request){

        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");

        //MultipartHttpServletRequest用来处理文件和图片一起上传
        MultipartHttpServletRequest multiRequest= (MultipartHttpServletRequest) request;
        //获得表单属性
        String foodName=multiRequest.getParameter("name");
        List<MultipartFile> files=multiRequest.getFiles("file[]");
        String main=multiRequest.getParameter("main");
        String other=multiRequest.getParameter("other");
        String detail=multiRequest.getParameter("detail");
        String pretime=multiRequest.getParameter("prepareTime");
        String cookingTime=multiRequest.getParameter("cookingTime");
        String description=multiRequest.getParameter("description");
        Long cateid= Long.valueOf(multiRequest.getParameter("cate"));
        String[] styleids=multiRequest.getParameterValues("style");
        String[] tasteids=multiRequest.getParameterValues("taste");
        String[] sceneids=multiRequest.getParameterValues("scene");

        //输出测试
        System.out.println("-----------cate----"+cateid);
        System.out.println("-----------style----"+styleids.length);
        System.out.println("----------upload"+foodName+"---"+foodName);
        System.out.println("---------main="+main+"-----------preparetime="+pretime);
        System.out.println("-----------files"+files.size());
        //参数装配
        FoodMethod method=new FoodMethod(pretime,cookingTime,main,other,detail,new Date());
        Food food=new Food(foodName,user,new FoodCategory(cateid),description,"待审核");

        //发布任务的服务
        foodService.upFood(files,method,food,styleids,sceneids,tasteids);

        return "myzuoping2";
    }





}
