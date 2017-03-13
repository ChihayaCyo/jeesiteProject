<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="main-header">
    <a href="/jeesite/a/statistics/home/index" class="logo">
        <span class="logo-lg"><b>主页</b></span>
    </a>
</header>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <section class="sidebar">
        <ul class="sidebar-menu">
            <li class="active treeview">
            <li><a href="/jeesite/a/statistics/sitesOverview/index/${list[0].site_id}"><i
                    class="fa fa-fw fa-cc-amex text-gray"></i> <span>网站概述</span></a></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-fw fa-desktop"></i>
                    <span>访问分析</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/jeesite/a/statistics/mostVisitedPage/index/${list[0].site_id}">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp受访页面</a>
                    </li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-fw fa-users"></i>
                    <span>访客分析</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/jeesite/a/statistics/sysEnv/index/${list[0].site_id}">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp系统环境</a>
                    </li>
                </ul>
            </li>
        </ul>
    </section>
</aside>