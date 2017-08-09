<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/7/24
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>发布菜品</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/imgup.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/imgUp.js" type="text/javascript" charset="utf-8"></script>

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
        </div>
    </div>
    <div class="bread-crumb breadcrumb">
        <li>首页</li>
        <li class="active">发布菜品</li>
    </div>
</div>
<form action="/addFood" method="POST" onsubmit="return upload()" enctype="multipart/form-data">
<div class="container mt40">

    <div class="img-box full">
        <section class=" img-section">
            <p class="up-p">作品图片：<span class="up-span">最多可以上传5张图片，马上上传</span></p>
            <div class="z_photo upimg-div clear" >
                <section class="z_file fl">
                    <img src="/static/img/a11.png" class="add-img">
                    <input type="file" name="file[]" id="file" class="file"
                           value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
                </section>
            </div>
        </section>
    </div>
    <aside class="mask works-mask">
        <div class="mask-content">
            <p class="del-p ">您确定要删除作品图片吗？</p>
            <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
        </div>
    </aside>
</div>
    <%--确定菜系--%>
    <div class="selectAll">
            <span>所属菜系:</span>
            <select name="cate" class="selectCate">
                <c:forEach items="${applicationScope.category}" var="cate" varStatus="status">
                    <%--<c:if test="${status.count==1}">
                        <option value="" selected="selected">${cate.name}</option>
                    </c:if>
                    <c:if test="${status.count!=1}">
                        <option value="" >${cate.name}</option>
                    </c:if>--%>
                    <option value="${cate.id}"  selected="">${cate.name}</option>
                </c:forEach>
            </select>

            <div>
                <span>所属菜品:</span>
                <c:forEach items="${applicationScope.style}" var="style">
                    <input type="checkbox" name="style" value="${style.id}" checked="">${style.name}
                </c:forEach>
            </div>

        <div>
            <span>所属口味:</span>
            <c:forEach items="${applicationScope.taste}" var="taste">
                <input type="checkbox" name="taste" value="${taste.id}" checked="">${taste.name}
            </c:forEach>
        </div>

        <div>
            <span>所属场景:</span>
            <c:forEach items="${applicationScope.scene}" var="scene">
                <input type="checkbox" name="scene" value="${scene.id}" checked="">${scene.name}
            </c:forEach>
        </div>

    </div>
<div class="container mt40 center">
    <h3 class="mb50">花了多少时间</h3>
    <ul class="mb50">
        <li class="fb-li">
            <span class="fb-in">准备时间：</span>
            <p class="fabu-input">
                <input type="text"  id="prepareTime" name="prepareTime" placeholder="如:90">
            </p>
            <span> 分钟&nbsp;&nbsp;</span><span class="checkUpload" id="prepareTimeError"></span>
        </li>
        <li class="fb-li">
            <span class="fb-in">烹饪时间：</span>
            <p class="fabu-input">
                <input type="text" name="cookingTime" id="cookingTime" placeholder="如:90">
            </p>
            <span> 分钟&nbsp;&nbsp;</span><span class="checkUpload" id="cookingTimeError"></span>
        </li>
    </ul>
    <h3 class="mb50">主料</h3>
    <textarea id="main" rows="3" cols="100" class="mb50 pd20" name="main"></textarea><br><span class="checkUpload" id="mainError"></span>
    <h3 class="mb50">配料</h3>
    <textarea id="other" rows="3" cols="100" class="mb50 pd20" name="other"></textarea><br><span class="checkUpload" id="otherError"></span>
    <h3 class="mb50">详细描述</h3>
    <textarea id="detail" rows="10" cols="100" class="mb50 pd20" name="detail"></textarea><br><span class="checkUpload" id="detailError"></span>
    <h3 class="mb50">给这道菜取个名字吧！</h3>
    <p class="fb-name mb50">
        <input type="text"  id="cookName" name="name" placeholder="如:红烧猪蹄"><span class="checkUpload" id="nameError"></span>
    </p>
    <h3 class="mb50">一句话描述这道菜吧~</h3>
    <textarea id="description" rows="10" cols="100" class="mb50 pd20" name="description"></textarea><br><span class="checkUpload" id="desError"></span>
    <div class="fb-button mb50">
        <%--<button type="button" id="bf-button">提交</button>--%>
        <input type="submit" value="提交">
    </div>
</div>
</form>

<div id="footer"class="mt80">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>

