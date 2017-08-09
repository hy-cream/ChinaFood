package com.hy.dao;


import com.hy.bean.FoodCategory;
import com.hy.bean.FoodScene;
import com.hy.bean.FoodStyle;
import com.hy.bean.FoodTaste;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Set;

/**
 * Created by huyu on 2017/6/20.
 */
@Repository
public interface CategoryMapper {

    //获取菜系
    @Select("select * from f_category")
    Set<FoodCategory> findAllCategory();

    @Select("select * from f_scene")
    Set<FoodScene> findAllScene();

    @Select("select * from f_style")
    Set<FoodStyle> findAllStyle();

    @Select("select * from f_taste")
    Set<FoodTaste> findAllTaste();

    //添加菜系
    int addStyle(@Param("foodId") Long foodId,@Param("styleId") Long styleId);

    int addScene(@Param("foodId") Long foodId,@Param("sceneId") Long sceneId);

    int addTaste(@Param("foodId") Long foodId,@Param("tasteId") Long tasteId);


}
