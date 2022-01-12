<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/7 0007
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<c:choose>
    <c:when test="${sessionScope.map.u_isadmin == 1}">
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('管理员列表','admin-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('会员列表','member-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>会员列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="用户消费管理">&#xe723;</i>
                            <cite>用户消费管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('用户消费查询','admin-consume.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>用户消费查询</cite></a>
                            </li>
                        </ul>
                    </li>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>--%>
                            <%--<cite>系统统计</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('拆线图','echarts1.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>拆线图</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="个人资料">&#xe6b8;</i>
                            <cite>个人资料</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('个人资料管理','member-user-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>个人资料管理</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="家庭成员管理">&#xe726;</i>
                            <cite>家庭成员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('家庭成员管理','member-family-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>家庭成员管理</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="家庭收入管理">&#xe6a2;</i>
                            <cite>家庭收入管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('家庭收入管理','member-family-income-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>家庭收入管理</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="家庭消费管理">&#xe6fc;</i>
                            <cite>家庭消费管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('消费上限设置','member-family-consume-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>消费上限设置</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('添加成员消费','member-family-personal-consume-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>添加成员消费</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="消费汇总统计">&#xe69e;</i>
                            <cite>消费汇总统计</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('日消费汇总','member-family-personal-consume-daily-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>日消费汇总</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('月消费汇总','member-family-personal-consume-month-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>月消费汇总</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('年消费汇总','member-family-personal-consume-year-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>年消费汇总</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('消费统计图','member-family-personal-consume-statistics.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>消费统计图</cite></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </c:otherwise>
</c:choose>
</body>
</html>
