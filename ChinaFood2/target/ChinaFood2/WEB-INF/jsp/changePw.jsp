<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/7/25
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的作品</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/jquery.pagination.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/select.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/changemsg.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<!--顶部导航栏-->
<jsp:include page="head.jsp"/>
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
                    <a href="CaiPu">菜谱</a>
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
            <a id="issue" href="#">
                <img class="f3" src="/static/img/add.png"/>
                发布
            </a>
        </div>
    </div>
    <div class="bread-crumb breadcrumb">
        <li>首页</li>
        <li class="active">我的作品</li>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-2 mt20">
            <div class="myz-l">
                <div class="userbar pt20 mb50">
                    <div class="userphoto">
                        <img src="/static/img/t1.jpg" class="mb20"/>
                        <p>${sessionScope.user.province}${sessionScope.user.city}</p>
                        <p>${sessionScope.user.name}</p>
                    </div>

                </div>
                <ul>
                    <li class="mt20 mb20"><a href="Myzuopin.html">我的作品</a></li>
                    <li class="mt20 mb20"><a href="Myshoucang.html">我的收藏</a></li>
                    <li class="mt20 mb20 active"><a href="changeZiliao.html">修改资料</a></li>
                    <li class="mt20 mb20"><a href="ChangePassword.html">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 mt20">
            <ul class="myz-RT mb50">
                <li class="myz-rt1">修改密码</li>
            </ul>
            <form action="" method="" onsubmit="return changmsg();">
                <div class="w100 center">
                    <p class="Ch-input">
                        <input type="password" name="ID" id="old-pwd"  placeholder="请输入旧密码"/><span id="operror"></span>
                    </p>
                    <p class="Ch-input">
                        <input type="password" name="email" id="new-pwd"  placeholder="请输入新密码"/><span id="nperror"></span>
                    </p>
                    <p class="Ch-input">
                        <input type="password" name="email" id="ch-pwd" placeholder="确认密码" /><span id="cherror"></span>
                    </p>
                    <div class="cz-button mb50">
                        <%--<button type="submit" id="cz-button" class="save">保存</button>--%>
                    <div>
                        <input id="save" type="submit" value="保存">
                    </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="footer"class="mt80">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>

