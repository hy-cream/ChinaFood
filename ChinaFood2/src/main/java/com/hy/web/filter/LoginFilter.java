package com.hy.web.filter;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by huyu on 2017/7/24.
 */
public class LoginFilter extends HandlerInterceptorAdapter{
    //预处理
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("----------------login拦截器");
        System.out.println("ServletPath----" + request.getServletPath());
        System.out.println("pathStartWith----" + request.getServletPath().startsWith("/ChinaFood/user/login"));

        //在用户访问login.jsp时，是否已登陆
        HttpSession session = request.getSession();
        if (request.getServletPath().contains("/login")) {
            //如果特已经登入
            if (session.getAttribute("user") != null) {
                //取消登陆
                session.setAttribute("user", null);
            }
            return true;
        }

        //在用户点击发布之前，判断用户是否登录 在修改密码和资料时，检查登陆
        if (request.getServletPath().contains("/addFood") || request.getServletPath().contains("/changepw")) {
            if (session.getAttribute("user") != null) {
                return true;
            } else {
                return false;
            }
        }

        return true;
    }

}
