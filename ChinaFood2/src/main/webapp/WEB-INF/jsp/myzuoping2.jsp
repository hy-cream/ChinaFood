<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/7/27
  Time: 20:04
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
                    <a href="CaiPu.jsp">菜谱</a>
                </li>
                <li class="bar-li">
                    <a href="#">美食专题</a>
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
                        <p>四川-成都</p>
                        <p>zhsm10411</p>
                    </div>

                </div>
                <ul>
                    <li class="mt20 mb20 active"><a href="#">我的作品</a></li>
                    <li class="mt20 mb20"><a href="#">我的收藏</a></li>
                    <li class="mt20 mb20"><a href="#">修改资料</a></li>
                    <li class="mt20 mb20"><a href="#">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 mt20">
            <ul class="myz-RT mb50">
                <li class="myz-rt1">我的作品</li>
                <li class="myz-rt2"><a href="Myzuopin.html">全部</a></li>
                <li class="myz-rt2 active"><a href="#">审核中</a></li>
                <li class="myz-rt2"><a href="Myzuopin3.html">未通过</a></li>
            </ul>
            <!--<div class="container">-->
            <div class="row clearfix clearf mb20">
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="row clearfix clearf mb20">
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
                <div class="col-md-3 column">
                    <a href="#" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text zhuan-text2">
                        <h1 class="zhuan-h1">
                            <span>2017/6/12</span>
                            <a href="#">莲藕香菇饺</a>
                            <p><a href="#">删除</a></p>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="wrapper mt80">
                <div class="center">
                    <div class="eg">
                        <div class="M-box2"></div>
                    </div>
                </div>
            </div>
            <!--</div>-->
        </div>
    </div>
</div>
<div id="footer"class="mt80">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
