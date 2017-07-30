package com.hy.bean;



import java.io.Serializable;
import java.sql.Date;

/**
 * Created by huyu on 2017/6/20.
 */
public class FoodMethod implements Serializable,Comparable<FoodMethod>{
    private long id;
    private Food food;
    private String prepare_time;
    private String cook_time;
    private String main_material;
    private String other_material;
    private String step;
    private Date issue_time;

    public FoodMethod() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public String getPrepare_time() {
        return prepare_time;
    }

    public void setPrepare_time(String prepare_time) {
        this.prepare_time = prepare_time;
    }

    public String getCook_time() {
        return cook_time;
    }

    public void setCook_time(String cook_time) {
        this.cook_time = cook_time;
    }

    public String getMain_material() {
        return main_material;
    }

    public void setMain_material(String main_material) {
        this.main_material = main_material;
    }

    public String getOther_material() {
        return other_material;
    }

    public void setOther_material(String other_material) {
        this.other_material = other_material;
    }

    public String getStep() {
        return step;
    }

    public void setStep(String step) {
        this.step = step;
    }

    public Date getIssue_time() {
        return issue_time;
    }

    public void setIssue_time(Date issue_time) {
        this.issue_time = issue_time;
    }


    @Override
    public int compareTo(FoodMethod o) {
        return (int)(this.id-o.id);
    }
}
