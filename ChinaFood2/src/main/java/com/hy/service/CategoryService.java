package com.hy.service;


import com.hy.bean.FoodCategory;
import com.hy.bean.FoodScene;
import com.hy.bean.FoodStyle;
import com.hy.bean.FoodTaste;
import com.hy.dao.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.TreeSet;

/**
 * Created by huyu on 2017/6/20.
 */
@Service
public class CategoryService {

    @Autowired
    @Qualifier("categoryMapper")
    private CategoryMapper categoryMapper;

    public CategoryService() {
    }
    public CategoryService(CategoryMapper mapper) {
        this.categoryMapper=mapper;
    }

    public CategoryMapper getCategoryMapper() {
        return categoryMapper;
    }

    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

//    @Cacheable(value="myCache", key="allCate")
    public TreeSet<FoodCategory> getAllCate(){

        System.out.println("------do getAllCate()");
        TreeSet<FoodCategory> treeC=new TreeSet<FoodCategory>();
        treeC.addAll(categoryMapper.findAllCategory());
        return treeC;
    }

//    @Cacheable(value="myCache", key="allTaste")
    public TreeSet<FoodTaste> getAllTaste(){
        System.out.println("------do getAllTaste()");

        TreeSet<FoodTaste> treeT=new TreeSet<FoodTaste>();
        treeT.addAll(categoryMapper.findAllTaste());

        return treeT;
    }


//    @Cacheable(value="myCache", key="allScene")
    public TreeSet<FoodScene> getAllScene(){
        System.out.println("------do getAllScene()");

        TreeSet<FoodScene> treeS=new TreeSet<FoodScene>();
        treeS.addAll(categoryMapper.findAllScene());
        return treeS;
    }

//    @Cacheable(value="myCache", key="allStyle")
    public TreeSet<FoodStyle> getAllStyle(){
        System.out.println("------do getAllStyle()");

        TreeSet<FoodStyle> treeY=new TreeSet<FoodStyle>();
        treeY.addAll(categoryMapper.findAllStyle());
        return treeY;
    }



}
