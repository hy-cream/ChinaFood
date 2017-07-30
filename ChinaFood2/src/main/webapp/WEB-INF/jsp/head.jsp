<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/6/20
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="top">
    <ul id="top-menu">
        <li>
            <a href="/index">
                <img id="icon1" src="/static/img/logo.png"/>
                首页
            </a>
        </li>
        <li>
            <a href="/CaiPu">
                菜谱
            </a>
        </li>
        <li>
            <a href="/zhuanti">
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
        <c:if test="${empty sessionScope.user}">
            <a href="/user/login">
                登录
            </a>
        </c:if>
        <c:if test="${! empty sessionScope.user}">
            <b>欢迎，${sessionScope.user.name}</b>
            <a href="/user/outlogin" style="margin-left: 10px;background-color: #eeeeee">
                退出登录
            </a>
        </c:if>

    </div>
</div>
