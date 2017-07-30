package com.hy.service;


import com.hy.bean.User;
import com.hy.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huyu on 2017/6/25.
 */
@Service
@Scope("prototype")
public class UserService {

    @Autowired
    @Qualifier("userMapper")
    private UserMapper usermapper;

    public UserService(){}

    public UserMapper getUserapper() {
        return usermapper;
    }

    public void setUserapper(UserMapper usermapper) {
        this.usermapper = usermapper;
    }

    public List<User> getAllUser(){
        List<User> list=null;
       list=usermapper.findAllUser();
        return list;
    }

    public User findUserByName(String name){
        User u=null;
        u=usermapper.findUserByName(name);
        return u;
    }

    //这里是要加事务的
    public void register(User user){
        usermapper.insertUser(user);
    }

    //修改密码
    public void changePw(User user){
        usermapper.changePw(user);
    }
}
