<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>受访页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>网站名称</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="site" items="${list}">
                    <tr>
                        <td>
                            <div style="padding-top:15px"><a href="${site.url }">${site.url }</a></div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!--按照今天 昨天 最近一周 最近一月显示-->
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>Top10入口页面</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>页面入口</th>
                    <th>浏览量</th>
                    <th>占比</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${topTenPageList}" var="x" begin="0" end="9" step="1">
                    <c:set var="total" value="${total + x.num}"/>
                </c:forEach>
                <c:forEach items="${topTenPageList}" var="item" begin="0" end="9" step="1">
                    <tr>
                        <td>${item.url}</td>
                        <td>${item.num}</td>
                        <td><fmt:formatNumber value="${item.num/total}" type="percent"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
