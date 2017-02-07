<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>教师管理</title>
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
		<li class="active"><a href="${ctx}/test/testTeacher/">教师列表</a></li>
		<shiro:hasPermission name="test:testTeacher:edit"><li><a href="${ctx}/test/testTeacher/form">教师添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testTeacher" action="${ctx}/test/testTeacher/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>职称：</label>
				<form:select path="position" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('position')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>授课：</label>
				<form:input path="teaching" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>职称</th>
				<th>授课</th>
				<shiro:hasPermission name="test:testTeacher:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="testTeacher">
			<tr>
				<td><a href="${ctx}/test/testTeacher/form?id=${testTeacher.id}">
					${testTeacher.name}
				</a></td>
				<td>
					${fns:getDictLabel(testTeacher.position, 'position', '')}
				</td>
				<td>
					${testTeacher.teaching}
				</td>
				<shiro:hasPermission name="test:testTeacher:edit"><td>
    				<a href="${ctx}/test/testTeacher/form?id=${testTeacher.id}">修改</a>
					<a href="${ctx}/test/testTeacher/delete?id=${testTeacher.id}" onclick="return confirmx('确认要删除该教师吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>