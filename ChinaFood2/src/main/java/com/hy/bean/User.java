package com.hy.bean;





import java.io.Serializable;
import java.util.Set;




/**
 * Created by huyu on 2017/6/20.
 */
public class User implements Serializable{
    private long id;

    private String name;
    private String password;
    private String province;
    private String city;
    private String description;
    private int ismanager;//0是普通用户，1是管理员
    private String gender;
    private Set<Food> foods;//所发表的菜谱

    public User() {
    }

    public User(String name, String password, String province, String city, String description, String gender) {
        this.name = name;
        this.password = password;
        this.province = province;
        this.city = city;
        this.description = description;
        this.gender = gender;
    }

    public User(long id, String name, String password, String province, String city,
                String description, int ismanager, String gender, Set<Food> foods) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.province = province;
        this.city = city;
        this.description = description;
        this.ismanager = ismanager;
        this.gender = gender;
        this.foods = foods;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIsmanager() {
        return ismanager;
    }

    public void setIsmanager(int ismanager) {
        this.ismanager = ismanager;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Set<Food> getFoods() {
        return foods;
    }

    public void setFoods(Set<Food> foods) {
        this.foods = foods;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", description='" + description + '\'' +
                ", ismanager=" + ismanager +
                ", gender='" + gender + '\'' +
                ", foods=" + foods +
                '}';
    }
}
