package com.hy.dao;


import com.hy.bean.Food;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Set;

/**
 * Created by huyu on 2017/6/20.
 */
@Repository
public interface FoodMapper {

    Set<Food> findAllFood();

    @Select("SELECT * FROM f_food WHERE user_id = #{id}")
    Set<Food> findFoodsByUser(@Param("id") long id);

    void addFood(Food food);

}
