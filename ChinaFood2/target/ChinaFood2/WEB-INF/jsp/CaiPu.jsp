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
		<meta charset="UTF-8">
		<title>菜谱</title>
		<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
		<script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
		<script src="/static/js/jquery.pagination.js" type="text/javascript" charset="utf-8"></script>
		<script src="/static/js/aclick.js" type="text/javascript"></script>
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
							<a href="/ChinaFood/CaiPu.jsp">菜谱</a>
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
				<li class="active">菜谱</li>
			</div>
			<div id="categoriy">
				<div class="items">
					<img src="/static/img/i1.png" class="icon3"/>
					<li class="items-t">菜系类别</li>
					<c:forEach items="${applicationScope.category}" var="cate">
						<li>
							<a href="javascript:void(0)" onclick="aOnClick('category',${cate.id})">${cate.name}</a>
						</li>
					</c:forEach>

				</div>
				<div class="items">
					<img src="/static/img/i2.png" class="icon3"/>
					<li class="items-t">菜品菜式</li>
					<c:forEach items="${applicationScope.style}" var="style">
						<li>
							<a href="javascript:void(0)" onclick="aOnClick('style',${style.id})">${style.name}</a>
						</li>
					</c:forEach>

				</div>
				<div class="items">
					<img src="/static/img/i3.png" class="icon3"/>
					<li class="items-t">工艺口味</li>
					<c:forEach items="${applicationScope.taste}" var="taste">
						<li>
							<a href="javascript:void(0)" onclick="aOnClick('taste',${taste.id})">${taste.name}</a>
						</li>
					</c:forEach>

				</div>
				<div class="items">
					<img src="/static/img/i4.png" class="icon3"/>
					<li class="items-t">场景功效</li>
					<c:forEach items="${applicationScope.scene}" var="scene">
						<li>
							<a href="javascript:void(0)" onclick="aOnClick('scene',${scene.id})">${scene.name}</a>
						</li>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-L column">
					<div id="cai-t">
						<div class="f10">
							<span id="foodnum">${applicationScope.allFood.size()}</span>个菜谱
						</div>
						<div class="f11">
							排序方式: <a href="#">最新发布</a> | <a href="#">做法数量</a>
						</div>
					</div>
					<div id="replace">
					<c:forEach begin="0" end="${applicationScope.allFood.size()/4}" step="1" varStatus="i">
						<div class="row clearfix" style="height: 450px">
							<c:forEach items="${applicationScope.allFood}" var="f" begin="${(i.count-1)*4}" end="${(i.count-1)*4+3}">
								<div class="col-md-3 column">
									<div class="img-radius h215">
										<a href="javascript:void(0)" onclick="caipu(${f.id},${f.user.id})"><img class="blowup" src="${f.images}"/></a>
									</div>
									<div class="img-name">
											${f.name}
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				</div>
				<div class="col-md-R column" style="margin-top: 70px;">
					<%--<div id="cai-t">--%>
						<div class="f12">
							推荐菜谱
						</div>
					<%--</div>--%>
					<div id="caipu-r">
						<c:forEach items="${applicationScope.allFood}" var="food" begin="0" end="4">
							<div class="r-part">
								<div class="rp-img">
									<img src="${food.images}" onclick="caipu(${food.id},${food.user.id})"/>
								</div>
								<div class="f8">
									<a href="javascript:void(0)" onclick="caipu(${food.id},${food.user.id})">${food.name}</a>
										<%--<p><span>1 </span>种做法</p>--%>
								</div>
							</div>
						</c:forEach>

					</div>
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
