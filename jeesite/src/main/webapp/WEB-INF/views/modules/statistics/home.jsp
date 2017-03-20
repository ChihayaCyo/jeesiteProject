<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/AdminLTE.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>网站统计-主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2><a href="/jeesite/a/statistics/home/index">主页</a> - <a
                    href="/jeesite/a/statistics/report/index">下载报告</a></h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>网站名称</th>
                    <th style="visibility:hidden">日期</th>
                    <th>浏览量</th>
                    <th>ip数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="site" items="${list}">
                    <tr rowspan="2">
                        <td>
                            <div style="padding-top:15px">
                                <c:choose>
                                    <c:when test="${fn:length(site.url) < 30}">
                                        <a href="${site.url }">${site.url}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var='end' value="${fn:indexOf(site.url, '?')}" scope="page"/>
                                        <a href="${site.url }"><c:out value="${fn:substring(site.url, 0, end)}"/></a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                        <td>
                            <div style="color:darkgray; ">
                                <div style="padding-top:5px;">今日</div>
                                <div style="padding-top:5px;">昨日</div>
                            </div>
                        </td>
                        <td>
                            <div style="color:darkgray;">
                                <div style="padding-top:5px;">${site.pageviews1}</div>
                                <div style="padding-top:5px;">${site.pageviews2}</div>
                            </div>
                        </td>
                        <td>
                            <div style="color:darkgray;">
                                <div style="padding-top:5px;">${site.ip1}</div>
                                <div style="padding-top:5px;">${site.ip2}</div>
                            </div>
                        </td>
                        <td>
                            <div style="padding-top:15px"><a
                                    href="/jeesite/a/statistics/sitesOverview/index/${site.site_id}">查看报告</a></div>
                                <%--<div style="padding-top:15px"><a href="/jeesite/a/statistics/sitesRouter/index/${site.site_id}">查看报告</a></div>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>



</body>

</html>
