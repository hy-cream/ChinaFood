<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/6/23
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/select.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/aclick.js" type="text/javascript"></script>
</head>
<body>
<div id="top">
    <ul id="top-menu">
        <li>
            <a href="index.html">
                <img id="icon1" src="/static//static/img/logo.png"/>
                首页
            </a>
        </li>
        <li>
            <a href="CaiPu.jsp">
                菜谱
            </a>
        </li>
        <li>
            <a href="zhuanti.html">
                专题
            </a>
        </li>
        <li>
            <a href="fabu.html">
                美食发布
            </a>
        </li>
    </ul>
    <div id="top-menu-right">
        <a href="/login.jsp">
            登录
        </a>
    </div>
</div>
<div class="container location">
    <div id="logo">
        <div>
            <img id="icon2" src="/static/img/logo2.png"/>
        </div>
        <div id="logo-right">
            <ul id="right-bar">
                <li class="bar-li">
                    <a href="index.html">每日推荐</a>
                </li>
                <li class="bar-li">
                    <a href="CaiPu.jsp">菜谱</a>
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

        </div>
    </div>
    <div class="bread-crumb breadcrumb">
        <li>首页</li>
        <li class="active">注册</li>
    </div>
</div>
<div class="container register">
    <form method="post" action="/user/userRegister" onsubmit="return register();">
        <ul>
            <li class="mt20 r-clear h50">
                <span class="regi-name">昵称：</span>
                <p class="regi-in">
                    <input type="text" name="name" id="name" class="regi-input">
                </p>
                <span id="spanN" class="result">fff</span>
            </li>
            <li class="mt20 r-clear h50">
                <span class="regi-name">性别：</span>
                <form class="regi-sex">
                    <label class="r-sex"><input type="radio" checked="checked" name="gender" value="男" />男</label>
                    <label class="r-sex"><input type="radio" name="gender" value="女"  />女</label>
                </form>
            </li>
            <li class="mt20 r-clear h50">
                <span class="regi-name">密码：</span>
                <p class="regi-in">
                    <input type="password" name="password" id="password"  class="regi-input">

                </p>
                <span id="spanP" class="result">fff</span>

            </li>
            <li class="mt20 r-clear h50">
                <span class="regi-name">确认密码：</span>
                <p class="regi-in">
                    <input type="password" id="password2" name="password2" class="regi-input">
                </p>
                <span id="spanP2" class="result">fff</span>
            </li>
            <li class="mt20 r-clear h50">
                <span class="regi-name">所在地：</span>
                <div class="regi-site">
                    <select id="selProvince" name="province" onchange="provinceChange();"></select> 省
                    <select id="selCity" name="city"></select> 市（区）
                </div>
            </li>
            <li class="mt20 r-clear">
                <span class="regi-name">个人简介：</span>
                <textarea class="regi-text" rows="8" cols="60" name="description"></textarea>
            </li>
            <li class="r-clear zhu">
                <div class="regi-button">
                    <%--<button>注册</button>--%>
                    <input type="submit" value="注册">
                </div>
            </li>
        </ul>
    </form>
</div>
<div id="footer"class="mt80">
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

