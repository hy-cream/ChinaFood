package com.hy.web.controller;

import com.hy.bean.User;
import com.hy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by huyu on 2017/7/25.
 * 修改用户资料
 */
@Controller
@RequestMapping("/")
public class UserInfoController {

    @Autowired
    private UserService service;

    @RequestMapping(value = "changepw",method = RequestMethod.GET)
    public String changepw(){
        return "changePw";
    }

    @ResponseBody
    @RequestMapping(value = "changepw",method = RequestMethod.POST)
    public String changepwP(String oldpassword, String newpassword, HttpSession session){

        System.out.println("old----="+oldpassword);

        User user= (User) session.getAttribute("user");
        if(user.getPassword().equals(oldpassword)){
            user.setPassword(newpassword);
            //将user更新
            try {
                service.changePw(user);
                return "success";
            }catch (Exception e){
                e.printStackTrace();
                return "error";
            }

        }else {
            return "error";
        }
    }

    //修改其他的资料
}
