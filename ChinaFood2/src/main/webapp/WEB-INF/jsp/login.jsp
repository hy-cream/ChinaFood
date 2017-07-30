<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/6/20
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/login.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="container location">
    <div id="logo">
        <div>
            <img id="icon2" src="/static/img/logo2.png"/>
        </div>
        <div id="logo-right">
            <ul id="right-bar">
                <li class="bar-li f1">
                    <a class="f1" href="#">每日推荐</a>
                </li>
                <li class="bar-li">
                    <a href="/CaiPu">菜谱</a>
                </li>
                <li class="bar-li">
                    <a href="zhuanti.html">美食专题</a>
                </li>
            </ul>
            <div id="search">
                <input type="text" name="searchKey" placeholder="搜索菜谱" class="sear-text">
                <button type="button" class="sear-btn btn-search">
                    <img class="f2" src="/static/img/search.png"/>
                </button>
            </div>
            <a id="issue" href="fabu.html">
                <img class="f3" src="/static/img/add.png"/>
                发布
            </a>
        </div>
    </div>
</div>
<div id="login">
    <div id="loginbox">
        <div class="f6">
            登录
        </div>
       <%-- <form onsubmit="return login();" method="post">--%>
        <ul class="mt20">
            <li class="lo-text">
                <i class="icon4"></i>
                <input id="name" name="name" data-validate="loginname" type="text" placeholder="注册邮箱/用户名" class="yh-fm-error">
                <span class="mess-error">邮箱/6-16位字母数字组合</span>
            </li>
            <li class="lo-text">
                <i class="icon5"></i>
                <input id="password" name="password" data-validate="minLength:6;maxLength:16;letter" data-error="6-16位字母数字组合" type="password" placeholder="请输入密码">
                <span class="mess-error">6-16位字母数字组合</span>
            </li>

            <li id="lo-check">
                <label for="remenber"><input type="checkbox" value="1" id="remenber" /> 记住用户名</label>
            </li>
           <%-- <a href="#">--%>
                <li id="lo-submit">
                    <input class="login" type="button" value="登录">
                </li>
           <%-- </a>--%>

            <li id="to-register">
                <a href="/user/register">没有账号，点此注册</a>
            </li>
        </ul>
        </form>
    </div>
</div>
<!--底部-->
<div id="footer">

    <div id="bg2">
        <div class="container">
            <div id="bg2-left">
                <div id="bg2-t">
                    <ul>
                        <li><img src="/static/img/TIM图片20170612215357.png"/></li>
                        <li><a href="#">关于我们</a></li>
                        <li><a href="#">联系我们</a></li>
                        <li><a href="#">使用帮助</a></li>
                        <li><a href="#">美食菜谱</a></li>
                        <a href="#">网站首页</a>
                    </ul>
                </div>
                <div id="bg22">
                    本站信息由网络收集及网友提供，中华美食网不负责信息内容的准确性和完整性，对此亦不承担任何保证责任。
                </div>
                <div id="bg23">
                    蜀ICP备10008552号 Copyright(©) 2005 - 2016 www.zhms.cn All rights reserved.
                </div>
            </div>
            <div id="bg2-right">
                <img src="/static/img/erweima.jpg"/>
                <div class="bg2-sao">
                    扫一扫加入我们
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

