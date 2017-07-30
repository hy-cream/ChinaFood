<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/6/20
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>中华美食网</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/unslider.min.js"></script>
    <script src="/static/js/banner.js"></script>
    <script src="/static/js/aclick.js"></script>

</head>
<body>
<!--顶端导航-->
<jsp:include page="head.jsp"/>

<div class="container location">
    <div id="logo">
        <div>
            <img id="icon2" src="/static/img/logo2.png"/>
        </div>
        <div id="logo-right">
            <ul id="right-bar">
                <li class="bar-li active">
                    <a href="#">每日推荐</a>
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
            <c:if test="${!empty sessionScope.user}">
                <a id="issue" href="/addFood">
                    <img class="f3" src="/static/img/add.png"/>
                    发布
                </a>
            </c:if>
        </div>
    </div>
    <div id="tittle">
        精挑细选只为一天的三餐
    </div>
    <!--轮播图-->
    <div id="banner" class="b04">
        <ul>
            <li>
                <img src="/static/img/01.jpg" alt="" width="100%" height="300" />
            </li>
            <li>
                <img src="/static/img/02.jpg" alt="" width="100%" height="300"/>

            </li>
            <li>
                <img src="/static/img/03.jpg" alt="" width="100%" height="300"/>
            </li>
        </ul>
        <a href="javascript:void(0);" class="unslider-arrow04 prev">
            <img class="arrow" id="al" src="/static/img/arrowl.png" alt="prev" width="15" height="25">
        </a>
        <a href="javascript:void(0);" class="unslider-arrow04 next">
            <img class="arrow" id="ar" src="/static/img/arrowr.png" alt="next" width="15" height="25">
        </a>
    </div>
    <div id="tab" style="margin-top: 50px">
				<span id="commend" >
					推荐菜谱
				</span>
        <ul class="tab_menu">
            <%--<li class="selected">今日推荐</li>--%>
            <li class="selected">美妙早餐</li>
            <li>绝佳午餐</li>
            <li>可口晚餐</li>
        </ul>
        <a href="/CaiPu" class="f4">全部菜谱</a>
        <div class="tab_box">
            <div class="selected">
                <div class="container">
                    <div class="row clearfix">
                        <c:forEach items="${applicationScope.breakfast}" var="b" begin="0" end="3">
                            <div class="col-md-3 column">
                                <div class="img-radius">
                                    <a href="javascript:void(0)" onclick="caipu(${b.id},${b.user.id})"><img src="${b.images}"/></a>
                                </div>
                                <a href="javascrip:void(0)" onclick="caipu(${b.id},${b.user.id})">${b.name}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="hided">
                <div class="container">
                    <div class=" row clearfix">
                        <c:forEach items="${applicationScope.lunch}" var="l" begin="0" end="3">
                            <div class="col-md-3 column">
                                <div class="img-radius">
                                    <a href="javascript:void(0)" onclick="caipu(${l.id},${l.user.id})"><img src="${l.images}"/></a>
                                </div>
                                <a href="javascript:void(0)" onclick="caipu(${l.id},${l.user.id})">${l.name}</a>
                            </div>
                        </c:forEach>
                    </div>


                </div>
            </div>
            <div class="hided">
                <div class="container">
                    <div class="row clearfix">
                        <c:forEach items="${applicationScope.dinner}" var="d" begin="0" end="3">
                            <div class="col-md-3 column">
                                <div class="img-radius">
                                    <a href="javascript:void(0)" onclick="caipu(${d.id},${d.user.id})"><img src="${d.images}"/></a>
                                </div>
                                <a href="javascript:void(0)" onclick="caipu(${d.id},${d.user.id})">${d.name}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--美食做法和动态-->
    <div id="board">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-8 column">
							<span class="board-t">
								美食做法
							</span>
                    <div class="row clearfix">
                        <div class="col-md-4 column" id="display">
                            <c:forEach items="${applicationScope.allMethod}" var="a" begin="0" end="0">
                                <div id="img-play">
                                    <img src="${a.food.images}" class="blowup">
                                </div>
                                <div id="board-play">
                                    <a href="javascript:void(0)" onclick="zuofa(${a.food.id})">${a.food.name}</a>
                                    <span>哎呀，美味死了</span>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="col-md-8 column">
                            <c:forEach begin="0" end="${(applicationScope.allMethod.size()-1)/3}"  step="1" varStatus="i">
                               <%-- ${i.count}--%>
                              <%--  <c:if test="${i.count<=3}">--%>
                                    <div class="row clearfix">
                                        <c:forEach items="${applicationScope.allMethod}" var="d" step="1" begin="${(i.count-1)*3+1}" end="${(i.count-1)*3+3}">
                                            <div class="col-md-4 column">
                                                <a href="javascript:void(0)" onclick="zuofa(${d.food.id})">
                                                    <div class="div-hidden">
                                                        <span>${d.food.name}</span>
                                                    </div>
                                                </a>
                                                <img class="f5" src="${d.food.images}"/>
                                            </div>
                                        </c:forEach>
                                    </div>
                               <%-- </c:if>--%>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 column">
                    <span class="board-t">最新动态</span>
                    <div id="all-board">
                        <ul>
                            <div class="board-show">
                                <div class="portrait">
                                    <img src="/static/img/t1.jpg"/>
                                </div>
                                <div class="name">
                                    <a href="#">慕容李大狗</a>
                                </div>
                                <div class="name">
                                    做了一道美味的“<a href="caipin.html">豆沙馅方糕</a>”
                                </div>
                                <div class="prior">10分钟前</div>
                                <div class="introduce">
                                    养生补血益气滋养茶，这是一道非常营养美味的饮品。红枣对人体非常有益，还有补血的功效。
                                    高丽参和当归都是营养价值非常高的药材，用来煲汤非常有益，用来煮茶也是非常健康的。
                                    所以这个茶是非常滋补的。还有益气补血的功效，特别是对女人特别好。
                                </div>
                                <div class="b-show">
                                    <img src="/static/img/ff10.png"/>
                                </div>
                            </div>
                            <div class="board-show">
                                <div class="portrait">
                                    <img src="/static/img/t1.jpg"/>
                                </div>
                                <div class="name">
                                    <a href="#">慕容李二狗</a>
                                </div>
                                <div class="name">
                                    做了一道美味的“<a href="caipin.html">豆沙馅方糕</a>”
                                </div>
                                <div class="prior">10分钟前</div>
                                <div class="introduce">
                                    养生补血益气滋养茶，这是一道非常营养美味的饮品。红枣对人体非常有益，还有补血的功效。
                                    高丽参和当归都是营养价值非常高的药材，用来煲汤非常有益，用来煮茶也是非常健康的。
                                    所以这个茶是非常滋补的。还有益气补血的功效，特别是对女人特别好。
                                </div>
                                <div class="b-show">
                                    <img src="/static/img/ff10.png"/>
                                </div>
                            </div>
                            <div class="board-show">
                                <div class="portrait">
                                    <img src="/static/img/t1.jpg"/>
                                </div>
                                <div class="name">
                                    <a href="#">慕容李三狗</a>
                                </div>
                                <div class="name">
                                    做了一道美味的“<a href="caipin.html">豆沙馅方糕</a>”
                                </div>
                                <div class="prior">10分钟前</div>
                                <div class="introduce">
                                    养生补血益气滋养茶，这是一道非常营养美味的饮品。红枣对人体非常有益，还有补血的功效。
                                    高丽参和当归都是营养价值非常高的药材，用来煲汤非常有益，用来煮茶也是非常健康的。
                                    所以这个茶是非常滋补的。还有益气补血的功效，特别是对女人特别好。
                                </div>
                                <div class="b-show">
                                    <img src="/static/img/ff10.png"/>
                                </div>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="subject">
    <div class="container">
        <div class="row clearfix">
            <span class="board-t"><a href="zhuanti.html">美食专题</a></span>
            <div class="col-md-4 column">
                <div class="sub-inner">
                    <div class="sub-play">
                        <img src="/static/img/ff8.png" class="blowup">
                    </div>
                    <div class="sub-text">
                        <a href="zhuanti-info.html">早餐吃什么好</a>
                        <p>生活在这样一个忙碌的大都市中，人们大部分时间都花在了工作上，很难有多余的时间来准
                            备早餐，或去考虑早餐吃什么，即使遇到周末，也宁愿睡懒觉。但大家可知道，早餐距离
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 column">
                <div class="sub-inner">
                    <div class="sub-play">
                        <img src="/static/img/ff8.png" class="blowup">
                    </div>
                    <div class="sub-text">
                        <a href="zhuanti-info.html">早餐吃什么好</a>
                        <p>生活在这样一个忙碌的大都市中，人们大部分时间都花在了工作上，很难有多余的时间来准
                            备早餐，或去考虑早餐吃什么，即使遇到周末，也宁愿睡懒觉。但大家可知道，早餐距离
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 column">
                <div class="sub-inner">
                    <div class="sub-play">
                        <img src="/static/img/ff8.png" class="blowup">
                    </div>
                    <div class="sub-text">
                        <a href="zhuanti-info.html">早餐吃什么好</a>
                        <p>生活在这样一个忙碌的大都市中，人们大部分时间都花在了工作上，很难有多余的时间来准
                            备早餐，或去考虑早餐吃什么，即使遇到周末，也宁愿睡懒觉。但大家可知道，早餐距离
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!--//底部链接与帮助-->
<div id="footer">
    <div id="bg1">
        <div class="container">
            <span id="bg-link">友情链接</span>
            <ul>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
                <li><a href="#">美食天下</a></li>
            </ul>
        </div>
    </div>
   <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>

