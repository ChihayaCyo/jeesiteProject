<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>网站列表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test/counts/">网站列表列表</a></li>
		<shiro:hasPermission name="test:counts:edit"><li><a href="${ctx}/test/counts/form">网站列表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="counts" action="${ctx}/test/counts/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="id" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>站点：</label>
				<form:input path="siteid" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>IP：</label>
				<form:input path="ip" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="beginTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${counts.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${counts.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>地址：</label>
				<form:input path="url" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>用户IP：</label>
				<form:input path="xRealIp" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>浏览器：</label>
				<form:input path="userAgent" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>站点</th>
				<th>IP</th>
				<th>时间</th>
				<th>地址</th>
				<th>用户IP</th>
				<th>浏览器</th>
				<shiro:hasPermission name="test:counts:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="counts">
			<tr>
				<td><a href="${ctx}/test/counts/form?id=${counts.id}">
					${counts.id}
				</a></td>
				<td>
					${counts.siteid}
				</td>
				<td>
					${counts.ip}
				</td>
				<td>
					<fmt:formatDate value="${counts.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${counts.url}
				</td>
				<td>
					${counts.xRealIp}
				</td>
				<td>
					${counts.userAgent}
				</td>
				<shiro:hasPermission name="test:counts:edit"><td>
    				<a href="${ctx}/test/counts/form?id=${counts.id}">修改</a>
					<a href="${ctx}/test/counts/delete?id=${counts.id}" onclick="return confirmx('确认要删除该网站列表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>