<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/6/22
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>芝士焗青口做法</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
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
        <li>${sessionScope.resultMethod.food.name}</li>
        <li class="active">做法</li>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-8 column">
            <div class="zuo-bar">
                <img class="img200" src="${sessionScope.resultMethod.food.images}"/>
                <div class="bar-text">
                    <div>
                        <span class="tittle">${sessionScope.resultMethod.food.name}</span>
                        <a href="#" class="zf-shou"><img src="/static/img/shou.png" class="zf-shouimg"/> 收藏</a>
                    </div>

                    <dl class="zf-t2">
                        <dd>准备时间：<span>${sessionScope.resultMethod.prepare_time}</span></dd>
                        <dd>烹饪时间：<span>${sessionScope.resultMethod.cook_time}</span></dd>
                        <dd>发布时间：<span>${sessionScope.resultMethod.issue_time}</span></dd>
                    </dl>
                    <p class="zf-t3">
                        ${sessionScope.resultMethod.food.description}
                    </p>
                </div>
            </div>
            <div class="zf-liao">
                <h2>
                    主料
                </h2>
                <p class="zf-dis">
                    ${sessionScope.resultMethod.main_material}
                </p>
            </div>
            <div class="zf-liao">
                <h2>
                    辅料
                </h2>
                <p class="zf-dis">
                    ${sessionScope.resultMethod.other_material}
                </p>
            </div>
            <div class="zf-liao">
                <h2>
                    具体步骤
                </h2>
                <p class="zf-dis">
                    ${sessionScope.resultMethod.step}
                </p>
            </div>
        </div>
        <div class="col-md-4 column">
            <div class="f12 w100 mb20 mb20">
                小编推荐
            </div>
            <c:forEach items="${applicationScope.allFood}" var="food" begin="0" end="4">
                <li class="mb50">
                    <a href="javascript:void(0)" onclick="zuofa(${food.id})">
                        <div class="sr-img">
                            <img src="${food.images}"/>
                        </div>
                        <div class="sr-t">
                                ${food.name}
                        </div>
                        <p class="zf-r-text">${food.description}</p>
                    </a>
                </li>
            </c:forEach>
        </div>
    </div>
</div>
<%--这块以后放评论区，待扩展--%>
<%--<div class="container">
    <div id="zhuan-t">
        芝士焗青口的其他做法
    </div>
    <div class="row clearfix">
        <div class="col-md-3 column">
            <a href="Zuofa.html" class="zhuan-box">
                <div class="img-radius zhuan-img">
                    <img src="/static/img/64a7e42c42e84aa4baf315888c5004d0.jpg" class="blowup"/>
                </div>
            </a>
            <div class="zhuan-text">
                <h1 class="zhuan-h1">
                    <span>2017/6/12</span>
                    <a href="#">美味芝士焗青口</a>
                </h1>
            </div>
        </div>
    </div>
</div>--%>

</body>
</html>

