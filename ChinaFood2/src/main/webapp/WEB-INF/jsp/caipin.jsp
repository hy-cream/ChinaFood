<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/6/22
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>西红柿白菜莲藕香菇饺</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/jquery.pagination.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/aclick.js"></script>
</head>
<body>
<!--顶部导航栏-->
<jsp:include page="head.jsp"/>
<div class="container location">
    <div id="logo">
        <div>
            <img id="icon2" src="/static/img/logo3.png"/>
        </div>
        <div id="logo-right">
            <ul id="right-bar">
                <li class="bar-li">
                    <a href="index.html">每日推荐</a>
                </li>
                <li class="bar-li active">
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
            <a id="issue" href="fabu.html">
                <img class="f3" src="/static/img/add.png"/>
                发布
            </a>
        </div>
    </div>
    <div class="bread-crumb breadcrumb">
        <li>首页</li>
        <li>菜谱</li>
        <li class="active">${sessionScope.resultFood.name}</li>
    </div>
</div>
<div class="container mt20 h310">
    <%--加上了一个用户的头像--%>
    <div class="userbar pt20 mm">
        <div class="userinfo">
            <img src="/static/img/t1.jpg" class="mb20"/><p>&nbsp;&nbsp;${sessionScope.resultFood.user.province}
            -${sessionScope.resultFood.user.city}&nbsp;&nbsp;${sessionScope.resultFood.user.name}</p>
        </div>
    </div>

    <div class="cp-img">
        <img src="${sessionScope.resultFood.images}"/>
    </div>
    <div class="cp-text">
        <h2>${sessionScope.resultFood.name}</h2>
        <p>${sessionScope.resultFood.description}</p>
        <ul>
            <li>
                <span>菜品：</span>
                <span class="biaoqian">${sessionScope.resultFood.category.name}</span>
            </li>
            <li>
                <span>菜系：</span>
                <c:forEach items="${sessionScope.resultFood.styles}" var="sty">
                    <span class="biaoqian">${sty.name}</span>
                </c:forEach>
            </li>
            <li>
                <span>场景：</span>
                <c:forEach items="${sessionScope.resultFood.scenes}" var="sce">
                    <span class="biaoqian">${sce.name}</span>
                </c:forEach>
            </li>
            <li>
                <span>工艺：</span>
                <c:forEach items="${sessionScope.resultFood.tastes}" var="tas">
                    <span class="biaoqian">${tas.name}</span>
                </c:forEach>
            </li>
        </ul>
    </div>
</div>
<div class="container">
    <div id="zhuan-t">
        ${sessionScope.resultFood.name}的做法
    </div>
    <div class="row clearfix">
        <div class="col-md-3 column">
            <a href="javascript:void(0)" onclick="zuofa(${sessionScope.resultFood.id})" class="zhuan-box">
                <div class="img-radius zhuan-img">
                    <img src="${sessionScope.resultFood.images}" class="blowup"/>
                </div>
            </a>
            <div class="zhuan-text">
                <h1 class="zhuan-h1">
                    <span>${sessionScope.resultFood.method.issue_time}</span>
                   <%-- <a  href="javascript:void(0)" onclick="zuofa(${sessionScope.resultFood.id})">${sessionScope.resultFood.name}</a>--%>
                    <a href="/ChinaFood/foodMethod?id=${sessionScope.resultFood.id}">${sessionScope.resultFood.name}</a>
                </h1>
            </div>
        </div>

    </div>
    <div class="wrapper mt80">
        <div class="container center">
            <div class="eg">
                <div class="M-box2"></div>
            </div>
        </div>
    </div>
    <div class="container">
        <div id="zhuan-t">
            该用户最近更新
        </div>
        <div class="row clearfix">
            <c:forEach items="${sessionScope.userFood}" var="uf" begin="0" end="3">
                <div class="col-md-3 column">
                    <a href="javascript:void(0)" onclick="zuofa(${uf.id})" class="zhuan-box">
                        <div class="img-radius zhuan-img">
                            <img src="${uf.images}" class="blowup"/>
                        </div>
                    </a>
                    <div class="zhuan-text">
                        <h1 class="zhuan-h1">
                            <%--<span></span>--%>
                            <a href="javascript:void(0)" onclick="zuofa(${uf.id})">${uf.name}</a>
                        </h1>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
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

