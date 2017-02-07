<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<html>
<head>
	<title>查询管理</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>网站概述</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
		name="viewport">
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="${path}/AdminLTE/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${path}/AdminLTE/dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
	       folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="${path}/AdminLTE/dist/css/skins/_all-skins.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="${path}/AdminLTE/plugins/iCheck/flat/blue.css">
	<!-- Morris chart -->
	<link rel="stylesheet" href="${path}/AdminLTE/plugins/morris/morris.css">
	<!-- jvectormap -->
	<link rel="stylesheet"
		href="${path}/AdminLTE/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="${path}/AdminLTE/plugins/datepicker/datepicker3.css">
	<!-- Daterange picker -->
	<link rel="stylesheet"
		href="${path}/AdminLTE/plugins/daterangepicker/daterangepicker.css">
	<!-- bootstrap wysihtml5 - text editor -->
	<link rel="stylesheet"
		href="${path}/AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	  <![endif]-->

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
 <body class="hold-transition skin-blue sidebar-mini">
  <div class="content-wrapper">
    <div class="container"  style="padding-top:20px;">   
      <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">站点与子目录</h3>
              
              
              
              <a href="/jeesite/src/main/webapp/AdminLTE/网站概述.html">能跳转吗？</a>
              <a href="${path}/AdminLTE/网站概述.html">能跳转吗？？</a>
              <p>${path}</p>
              
              
              
              
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
               <form:form id="searchForm" modelAttribute="siteOverview" action="${ctx}/test/siteOverview/" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                <table class="table no-margin" border="0" style="text-align:right">            
                  <tr style="color:gray;">
                    <td colspan="2"  style="text-align:left;">网站名称</td>
                    <td>浏览量(PV)</td>
                    <td>ip数</td>
                    <td>访客数</td>
                  </tr>
            	   <c:forEach items="${list}" var="site"> 
                  <tr  style="text-align:left;">
                    <td>
					<div style="padding-top:5px;">${site.name }</div>					
					<td>
						<div style="color:darkgray; ">
							<div style="padding-top:5px;">今日</div>
							<div style="padding-top:5px;">昨日</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.clicked }</div>
							<div style="padding-top:5px;">${site.clicked2 }</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.ip }</div>
							<div style="padding-top:5px;">${site.ip2 }</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.visitor }</div>
							<div style="padding-top:5px;">${site.visitor2 }</div>
						</div>
					</td>
                  </tr>
                 </c:forEach> 
                </table>         
<%--                 <table width="400" border="1">
                  <tr>
                    <td colspan="2">网站名称</td>
                    <td>浏览量</td>
                    <td>ip数</td>
                    <td>访客数</td>
                  </tr>
                  <c:forEach items="${list}" var="site"> 
                  <tr>
                    <td>${site.name }</td>
					<td>
							<div style="padding-top:5px;">今日</div>
							<div style="padding-top:5px;">昨日</div>
					</td>
					<td>
							<div style="padding-top:5px;">${site.clicked }</div>
							<div style="padding-top:5px;">${site.clicked2 }</div>
					</td>
					<td>
							<div style="padding-top:5px;">${site.ip }</div>
							<div style="padding-top:5px;">${site.ip2 }</div>
					</td>
					<td>
							<div style="padding-top:5px;">${site.visitor }</div>
							<div style="padding-top:5px;">${site.visitor2 }</div>
					</td>
                  </tr>
                 </c:forEach> 
                </table> --%>
                </form:form>
              </div>
            </div>
 
   <div class="col-md-6">
          <!-- DIRECT CHAT SUCCESS -->
          <div class="box  direct-chat direct-chat-success">
            <div class="box-header with-border">
              <h3 class="box-title">Top10受访页面</h3>	   
              <div class="box-tools pull-right">
				<i class="fa fa-fw fa-chevron-circle-right" style="color:#DCDCDC;"></i>  
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="height:440px;">
              <table class="table">
                <tr>
                  <th width="68%%">受访页面</th>
                  <th width="16%">浏览量(PV)</th>
                  <th width="16%">占比</th>
                </tr>
                <c:forEach  items="${list2}" var="x" begin="0" end="9" step="1">
                	<c:set var="total" value="${total+x.num}" />
                </c:forEach>
				<tr>
                  <td>${list2[0].url}</td>
                  <td>${list2[0].num}</td>
                  <td><fmt:formatNumber value="${list2[0].num/total}" type="percent"/></td>
                </tr>
				<tr>
                  <td>${list2[1].url}</td>
                  <td>${list2[1].num}</td>
                  <td><fmt:formatNumber value="${list2[1].num/total}" type="percent"/></td>
                </tr><tr>
                  <td>${list2[2].url}</td>
                  <td>${list2[2].num}</td>
                  <td><fmt:formatNumber value="${list2[2].num/total}" type="percent"/></td>
                </tr><tr>
                  <td>${list2[3].url}</td>
                  <td>${list2[3].num}</td>
                  <td><fmt:formatNumber value="${list2[3].num/total}" type="percent"/></td>
                </tr><tr>
                  <td>${list2[4].url}</td>
                  <td>${list2[4].num}</td>
                  <td><fmt:formatNumber value="${list2[4].num/total}" type="percent"/></td>
                </tr><tr>
                  <td>${list2[5].url}</td>
                  <td>${list2[5].num}</td>
                  <td><fmt:formatNumber value="${list2[5].num/total}" type="percent"/></td>
                </tr><tr>
                  <td>${list2[6].url}</td>
                  <td >${list2[6].num}</td>
                  <td><fmt:formatNumber value="${list2[6].num/total}" type="percent"/></td>
                </tr><tr>
                  <td>${list2[7].url}</td>
                  <td>${list2[7].num}</td>
                  <td><fmt:formatNumber value="${list2[7].num/total}" type="percent"/></td>
                </tr>
                <tr>
                  <td>${list2[8].url}</td>
                  <td>${list2[8].num}</td>
            	  <td><fmt:formatNumber value="${list2[8].num/total}" type="percent"/></td>
                </tr>
                <tr>
                  <td>${list2[9].url}</td>
                  <td>${list2[9].num}</td>
              	  <td><fmt:formatNumber value="${list2[9].num/total}" type="percent"/></td>
                </tr>
			</table>
            </div>
          </div>
          <!--/.direct-chat -->
        </div>
        <!-- /.col -->
        
           <div class="col-md-6">
          <!-- DIRECT CHAT SUCCESS -->
          <div class="box  direct-chat direct-chat-success">
            <div class="box-header with-border">
              <h3 class="box-title">地域分布</h3>	   
              <div class="box-tools pull-right">
				<i class="fa fa-fw fa-chevron-circle-right" style="color:#DCDCDC;"></i>  
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="height:440px;">
              <table class="table">
                <tr>
                  <th width="68%%">省份</th>
                  <th width="16%">访问次数</th>
                  <th width="16%">占比</th>
                </tr>
                <c:forEach  items="${list3}" var="x2" begin="0" end="9" step="1">
                	<c:set var="total2" value="${total2+x2.num}" />
                </c:forEach>
				<tr>
                  <td>${list3[0].area}</td>
                  <td>${list3[0].num}</td>
                  <td><fmt:formatNumber value="${list3[0].num/total2}" type="percent"/></td>
                </tr>
				<tr>
                  <td>${list3[1].area}</td>
                  <td>${list3[1].num}</td>
                  <td><fmt:formatNumber value="${list3[1].num/total2}" type="percent"/></td>
                </tr><tr>
                  <td>${list3[2].area}</td>
                  <td>${list3[2].num}</td>
                  <td><fmt:formatNumber value="${list3[2].num/total2}" type="percent"/></td>
                </tr><tr>
                  <td>${list3[3].area}</td>
                  <td>${list3[3].num}</td>
                  <td><fmt:formatNumber value="${list3[3].num/total2}" type="percent"/></td>
                </tr><tr>
                  <td>${list3[4].area}</td>
                  <td>${list3[4].num}</td>
                  <td><fmt:formatNumber value="${list3[4].num/total2}" type="percent"/></td>
                </tr><tr>
                  <td>${list3[5].area}</td>
                  <td>${list3[5].num}</td>
                  <td><fmt:formatNumber value="${list3[5].num/total2}" type="percent"/></td>
                </tr><tr>
                  <td>${list3[6].area}</td>
                  <td>${list3[6].num}</td>
                  <td><fmt:formatNumber value="${list3[6].num/total2}" type="percent"/></td>
                </tr><tr>
                  <td>${list3[7].area}</td>
                  <td>${list3[7].num}</td>
                  <td><fmt:formatNumber value="${list3[7].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>${list3[8].area}</td>
                  <td>${list3[8].num}</td>
            	  <td><fmt:formatNumber value="${list3[8].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>${list3[9].area}</td>
                  <td>${list3[9].num}</td>
              	  <td><fmt:formatNumber value="${list3[9].num/total2}" type="percent"/></td>
                </tr>
			</table>
            </div>
          </div>
          <!--/.direct-chat -->
        </div>
        <!-- /.col -->
        
<!--============================ -->

       <div class="col-md-6">
          <!-- DIRECT CHAT SUCCESS -->
          <div class="box direct-chat direct-chat-success">
            <div class="box-header with-border">
              <h3 class="box-title">趋势图</h3>
              <div class="box-tools pull-right">
				<i class="fa fa-fw fa-chevron-circle-right" style="color:#DCDCDC;"></i>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="height:380px;padding:10px 10px 10px 10px">
              <div class="btn-group">
                      <button type="button" class="btn btn-default">浏览量（PV）</button>
                      <button type="button" class="btn btn-default">访客数（UV）</button>
                     <label style="font-size:20px;padding-left:120px;">
                      <input type="checkbox">
                   		 前一日
                    </label>
               </div>
					<div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
            </div>           
          </div>
          </div>












































































<!-- ===================================================================================================================================== -->
 
 


<!-- ./wrapper -->       
<!-- jQuery 2.2.3 -->
<script src="${path}/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="${path}/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="${path}/AdminLTE/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="${path}/AdminLTE/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${path}/AdminLTE/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${path}/AdminLTE/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="${path}/AdminLTE/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="${path}/AdminLTE/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="${path}/AdminLTE/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${path}/AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="${path}/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${path}/AdminLTE/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${path}/AdminLTE/dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${path}/AdminLTE/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${path}/AdminLTE/dist/js/demo.js"></script>        
</body>
</html>