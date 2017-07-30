package com.hy.web.controller;

import com.hy.bean.User;
import com.hy.service.UserService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Writer;

/**
 * Created by huyu on 2017/7/19.
 */
@Controller
@RequestMapping("/user/")
@Scope("prototype")
public class UserController {

    @Autowired
    private UserService service;

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String loginG(){
        return "login";
    }

    @RequestMapping(value = "login",method = RequestMethod.POST)
    public void loginP(@RequestParam("name") String userName, @RequestParam("password") String password,
                      HttpSession session, Writer writer){
        try {
            System.out.println("---------------login post method");
            System.out.println("---------------name:"+userName+"  password:"+password);

            //先查找该用户是否已存在，然后在比对密码是否正确
            User userSelect = service.findUserByName(userName);
            if (userSelect != null) {
                // System.out.println(userSelect.toString());
                //存在该用户
                if (userSelect.getPassword().equals(password)) {
                    //  System.out.println("密码正确");
                    //将用户信息保存在session里
                    session.setAttribute("user", userSelect);
                    //页面跳转
                    writer.write("success");
                } else {
                    //密码错误
                    //session.setAttribute("loginMsg", "用户名或密码错误");
                    /*return "redirect:login";*/
                    writer.write("error");
                }
            } else {
                //不存在该用户
                //session.setAttribute("loginMsg", "用户名或密码错误");
                /* return "redirect:login";*/
                writer.write("error");
            }
        }catch (IOException e) {
            e.printStackTrace();
        }


    }

    @RequestMapping(value = "register",method = RequestMethod.GET)
    public String registerG(){
        return "register";
    }

    //注册 @requestBody会报415错误
    //,@RequestParam String password,@RequestParam String gender,
    //@RequestParam String description,@RequestParam String province,@RequestParam String city
    @RequestMapping(value = "userRegister",method = RequestMethod.POST)
    public String registerP(@RequestParam String name,@RequestParam String password,@RequestParam String gender,
                            @RequestParam String description,@RequestParam String province,@RequestParam String city){

        User user=new User(name,password,province,city,description,gender);
//        System.out.println("------------------- register user"+user.toString());
      System.out.println("------name"+name+"---password"+password+"---gender"+gender);
        System.out.println("------descrition"+description+"---province"+province+"---city"+city);

        service.register(user);
        return "redirect:/user/login";
    }

    //ajax判断用户名是否存在
    @ResponseBody
    @RequestMapping(value = "checkUserName",method = RequestMethod.POST)
    public String checkName(String name){
        User u=service.findUserByName(name);
        if(u!=null){
            return "false";
        }else{
            return "true";
        }
    }

    //退出登录
    @RequestMapping(value = "outlogin",method = RequestMethod.GET)
    public String outlogin(HttpSession session){
        session.setAttribute("user",null);
        return "index";
    }


}
