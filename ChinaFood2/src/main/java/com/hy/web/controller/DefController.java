package com.hy.web.controller;


import com.hy.bean.Food;
import com.hy.service.CategoryService;
import com.hy.service.FoodService;
import com.hy.service.MethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.TreeSet;


/**
 * Created by huyu on 2017/7/19.
 * 首页显示控制器
 */
@Controller
@Scope("prototype")
@RequestMapping("/")
public class DefController {

    @Autowired
    @Qualifier("categoryService")
    private CategoryService categoryService;
    @Autowired
    private FoodService foodService;
    @Autowired
    @Qualifier("methodService")
    private MethodService methodService;


    @RequestMapping(value = {"index",""},method = RequestMethod.GET)
    public String defaultCon(HttpServletRequest request){

        ServletContext context=request.getServletContext();
        //第一次加载将首页信息放进application的范围内
        if(context.getAttribute("dinner")==null){
            //放入所有的分类
            context.setAttribute("category",categoryService.getAllCate());
            context.setAttribute("style",categoryService.getAllStyle());
            context.setAttribute("taste",categoryService.getAllTaste());
            context.setAttribute("scene",categoryService.getAllScene());

            //放入所有食物的做法
           /* TreeSet<FoodMethod> treeM=new TreeSet<FoodMethod>();
            treeM.addAll(methodService.getAllMethod());*/
            context.setAttribute("allMethod",methodService.getAllMethod());

            //放入早餐，晚餐，午餐食物的集合
            context.setAttribute("breakfast",foodService.findFoodByScene("早餐"));
            context.setAttribute("lunch",foodService.findFoodByScene("午餐"));
            context.setAttribute("dinner",foodService.findFoodByScene("晚餐"));

            TreeSet<Food> fset=new TreeSet<>();
            fset.addAll(foodService.getAllFood());
            context.setAttribute("allFood",fset);
        }
        return "index";
    }
}
