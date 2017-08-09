package com.hy.bean;




import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by huyu on 2017/6/20.
 */

public class Food implements Serializable,Comparable<Food>{
    private long id;
    private String name;
    private User user;
    private FoodCategory category;
    private Set<FoodStyle> styles;
    private Set<FoodScene> scenes;
    private Set<FoodTaste> tastes;
    private String description;
    private String images;
    private String state;//当前发布的状态
    private FoodMethod method;//做法

    public Food() {
    }

    public Food(String name, User user, FoodCategory category,
                String description, String state) {
        this.name = name;
        this.user = user;
        this.category = category;
        this.description = description;
        this.state = state;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public FoodCategory getCategory() {
        return category;
    }

    public void setCategory(FoodCategory category) {
        this.category = category;
    }

    public Set<FoodStyle> getStyles() {
        return styles;
    }

    public void setStyles(Set<FoodStyle> styles) {
        this.styles = styles;
    }

    public Set<FoodScene> getScenes() {
        return scenes;
    }

    public void setScenes(Set<FoodScene> scenes) {
        this.scenes = scenes;
    }

    public Set<FoodTaste> getTastes() {
        return tastes;
    }

    public void setTastes(Set<FoodTaste> tastes) {
        this.tastes = tastes;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public FoodMethod getMethod() {
        return method;
    }

    public void setMethod(FoodMethod method) {
        this.method = method;
    }

    //按照发布时间顺序排序
    @Override
    public int compareTo(Food o) {

          return (int)(this.id-o.id);
    }
}
