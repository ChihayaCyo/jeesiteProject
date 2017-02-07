<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>站点管理管理</title>
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
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

  
      <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">站点与子目录</h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
         <form:form id="searchForm" modelAttribute="sites" action="${ctx}/test/sites/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                <table class="table no-margin" border="0" style="text-align:right">
                 
                  <tr style="color:gray;">
                    <td colspan="2"  style="text-align:left;">网站名称</td>
                    <td colspan="2">浏览(PV)</td>
                    <td>访客数</td>
                    <td>ip数</td>
                    <td style="text-align:center;">操作</td>
                  </tr>${list}
            	<c:forEach items="${list}" var="site">
                  <tr rowspan="3" style="text-align:left;">
                    <td>
					
					<div><a href="#">${site.domian }</a></div>
					
					</td>
					<td> 
						<div class="col-md-3 col-sm-4" style="padding-top:30px;"><i class="fa fa-fw fa-heart-o"></i></div>
					</td>
					<td>
						<div style="color:darkgray; ">
							<div style="padding-top:5px;">今日</div>
							<div style="padding-top:5px;">昨日</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.views }</div>
							<div style="padding-top:5px;">${site.views2 }</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.custom }</div>
							<div style="padding-top:5px;">${site.custom2 }</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.ip }</div>
							<div style="padding-top:5px;">${site.ip2 }</div>
						</div>
					</td>
					<td>
						<div style="padding-top:30px"><a href="#">查看报告</a></div>
					</td>
                  </tr>
                 </c:forEach>
                </table>
                </form:form>
              </div>
              <!-- /.table-responsive -->
            </div>
            
            
            <!-- /.box-footer -->
          </div>

     
     
     
    </div>
   

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>