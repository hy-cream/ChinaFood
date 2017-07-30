package com.hy.web.controller;

import com.hy.bean.Food;
import com.hy.bean.FoodScene;
import com.hy.bean.FoodStyle;
import com.hy.bean.FoodTaste;
import com.hy.service.FoodService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.Set;
import java.util.TreeSet;



/**
 * Created by huyu on 2017/7/20.
 * 菜谱模块的控制器
 */
@Controller
@Scope("prototype")
@RequestMapping("/")
public class CaiPuController {

    @Autowired
    private FoodService foodService;

    @RequestMapping(value = "CaiPu",method = RequestMethod.GET)
    public String caipu(HttpServletRequest request){

        ServletContext context=request.getServletContext();
        if(context.getAttribute("allFood")==null){
            //放入所有的食物
            TreeSet<Food> treeF=new TreeSet<Food>();
            Set<Food> all=foodService.getAllFood();
            treeF.addAll(all);
            context.setAttribute("allFood",treeF);
        }
        return "CaiPu";
    }

    @ResponseBody
    @RequestMapping(value = "selectCaipu",method = RequestMethod.GET)
    public String selectCaipu(@RequestParam String name,@RequestParam long id,HttpServletRequest request){

        ServletContext context=request.getServletContext();
        TreeSet<Food> allFood= (TreeSet<Food>) context.getAttribute("allFood");

        JSONArray array=new JSONArray();//返回给ajax的json数据

        switch (name){
            case "category":

                for (Food f:allFood){
                    if(id==f.getCategory().getId()){
                       /* selectSet.add(f);*/
                        System.out.println(f.getCategory().getId()+"-------"+f.getCategory().getName());
                        array.add(f);
                        System.out.println("3333333"+f);
                    }
                }
                break;
            case  "style":
                for (Food f:allFood){
                    Set<FoodStyle> fs=f.getStyles();
                    for(FoodStyle s:fs){
                        if(id==s.getId()){
                         /*   selectSet.add(f);*/
                            array.add(f);
                            break;
                        }
                    }
                }
                break;
            case  "taste":
                for (Food f:allFood){
                    Set<FoodTaste> fs=f.getTastes();
                    for(FoodTaste s:fs){
                        if(id==s.getId()){
                          /*  selectSet.add(f);*/
                            array.add(f);
                            break;
                        }
                    }
                }
                break;
            case  "scene":
                for (Food f:allFood){
                    Set<FoodScene> fs=f.getScenes();
                    for(FoodScene s:fs){
                        if(id==s.getId()){
                            /*selectSet.add(f);*/
                            array.add(f);
                            break;
                        }
                    }
                }
                break;
            default:break;
        }

        return array.toString();
    }
}
