package com.hy.service;


import com.hy.bean.Food;
import com.hy.bean.FoodMethod;
import com.hy.bean.FoodScene;
import com.hy.commons.ImageUploadUtil;
import com.hy.dao.FoodMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Created by huyu on 2017/6/20.
 */
@Service
public class FoodService {

    @Autowired
    @Qualifier("foodMapper")
    private FoodMapper foodMapper;

    @Autowired
    private MethodService methodService;

    @Autowired
    private  CategoryService categoryService;

    @Autowired
    private ImageUploadUtil imageUploadUtil;

    public FoodService() {

    }
    public FoodService(FoodMapper foodMapper) {
        this.foodMapper=foodMapper;
    }

    public FoodMapper getFoodMapper() {
        return foodMapper;
    }

    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    public Set<Food> getAllFood(){
        Set<Food> set=null;
        set=foodMapper.findAllFood();
        return set;
    }

    //通过id查找目标食物
    public Food getResultFood(Set<Food> set,long id){
        Food result=null;
        for(Food f:set){
            if(f.getId()==id){
                result=f;
                break;
            }
        }
        return result;
    }

    //通过userId找到作品的集合
    public Set<Food> findFoodsByUser(long id){
        Set<Food> set=null;
        set=foodMapper.findFoodsByUser(id);
        return set;
    }

    //获取所有早(午，晚)餐的集合
    public Set<Food> findFoodByScene(String name){
        Set<Food> set=new TreeSet<Food>();
        Set<Food> all=getAllFood();
        for(Food f:all){
            Set<FoodScene> scenes=f.getScenes();
            for(FoodScene s:scenes){
                if(name.equals(s.getName())){
                    set.add(f);
                    break;
                }
            }
        }
        return set;
    }

   //发布新的食物
    public void upFood(List<MultipartFile> files, FoodMethod method,Food food,String[] styles,
                       String[] scenes,String[] tastes){
        //   1.上传图片到七牛云，获得图片路径
        String paths=imageUploadUtil.uploadImgs(files);
        food.setImages(paths);
        //    2.插入foodMethod表，并且获得method的id
        FoodMethod methodInsert=methodService.addMethod(method);
        food.setMethod(methodInsert);
        //  3.插入food表
        Food foodInsert=addFood(food);
        //  4.将菜系插入到各个桥表中
        System.out.print("foodService----------foodId======"+food.getId());
        for(String styleId:styles){
            categoryService.addStyles(food.getId(),Long.parseLong(styleId));
        }
        for(String sceneId:scenes){
            categoryService.addScenes(food.getId(),Long.parseLong(sceneId));
        }
        for(String tasteId:tastes){
            categoryService.addTaste(food.getId(),Long.parseLong(tasteId));
        }
    }


    public Food  addFood(Food food){
        int num=0;
        num=foodMapper.addFood(food);
        if(num==0){
            //抛出异常
        }
        return food;
    }

}
