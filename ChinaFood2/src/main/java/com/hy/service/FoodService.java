package com.hy.service;


import com.hy.bean.Food;
import com.hy.bean.FoodScene;
import com.hy.dao.FoodMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

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

}
