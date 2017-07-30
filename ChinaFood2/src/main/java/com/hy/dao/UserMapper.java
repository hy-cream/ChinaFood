package com.hy.dao;


import com.hy.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by huyu on 2017/6/25.
 */
@Repository
public interface UserMapper {
    List<User> findAllUser();
    User findUserByName(String name);
    /*
    * private long id;
    private String name;
    private String password;
    private String province;
    private String city;
    private String description;
    private int ismanager;//0是普通用户，1是管理员
    private String gender;*/
    //@Insert("insert into f_user(id,name,password,province,city,description,gender) values(,#{user.name})")
   void insertUser(User user);

   void changePw(User user);
}
