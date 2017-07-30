package com.hy.dao;


import com.hy.bean.FoodCategory;
import com.hy.bean.FoodScene;
import com.hy.bean.FoodStyle;
import com.hy.bean.FoodTaste;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Set;

/**
 * Created by huyu on 2017/6/20.
 */
@Repository
public interface CategoryMapper {

    @Select("select * from f_category")
    Set<FoodCategory> findAllCategory();

    @Select("select * from f_scene")
    Set<FoodScene> findAllScene();

    @Select("select * from f_style")
    Set<FoodStyle> findAllStyle();

    @Select("select * from f_taste")
    Set<FoodTaste> findAllTaste();
}
