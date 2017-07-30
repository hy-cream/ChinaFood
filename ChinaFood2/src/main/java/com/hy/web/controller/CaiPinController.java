package com.hy.web.controller;

import com.hy.bean.Food;
import com.hy.bean.FoodMethod;
import com.hy.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Set;
import java.util.TreeSet;

/**
 * Created by huyu on 2017/7/23.
 * 菜品的控制器
 */
@Controller
@Scope("prototype")
@RequestMapping("/")
public class CaiPinController {

    @Autowired
    private FoodService foodService;

    @RequestMapping(value = "caipin",method = RequestMethod.GET)
    public String view(){
        return "caipin";
    }

    @RequestMapping(value = "zuofa",method = RequestMethod.GET)
    public String method(){
        return "zuofa";
    }

    //菜品详情右边的其他菜品，是该用户的其他菜品
    @RequestMapping(value = "foodView",method = RequestMethod.GET)
    public String view(HttpServletRequest request, @RequestParam long id,@RequestParam long userid){

        ServletContext context=request.getServletContext();
        Set<Food> set= (Set<Food>) context.getAttribute("allFood");

        Food result=foodService.getResultFood(set,id);

        HttpSession session=request.getSession();
        session.setAttribute("resultFood",result);

        //将该用户的其他几个更新作品进来
        Set<Food> userFoods=foodService.findFoodsByUser(userid);
        session.setAttribute("userFood",userFoods);

        return "redirect:/caipin?id="+id+"&userid="+userid;
    }

    @RequestMapping(value = "foodMethod",method = RequestMethod.GET)
    public String method(HttpServletRequest request,@RequestParam long id){

        ServletContext context=request.getServletContext();
        TreeSet<FoodMethod> set= (TreeSet<FoodMethod>) context.getAttribute("allMethod");

        FoodMethod result=null;
        for(FoodMethod f:set){
            if(id==f.getFood().getId()){
                result=f;
                break;
            }
        }
        HttpSession session=request.getSession();
        session.setAttribute("resultMethod",result);
        return "redirect:/zuofa?id="+id;
    }


}
