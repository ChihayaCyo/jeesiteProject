<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>网站统计-主页</title>
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
</head>

<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

  <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="../../index2.html" class="navbar-brand"><b>Admin</b>LTE</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
		  
		  <ul class="nav navbar-nav">
            <li><a href="/jeesite/a/statistics/home/index">主页 </a></li>
            <li><a href="">报告</a></li>
             <li><a href="网站列表.html">管理</a></li>
          </ul>
        </div>

        <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
				
		 <!--帮助中心 -->
		<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">帮助中心 </a></li>
          </ul>
        </div>

          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-fw  fa-list-ul"></i>
            </a>
            <ul class="dropdown-menu" style="width:120px; height:150px;">
              <li  style="text-indent:-40px;">
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <p style="font-size:10px;color:black;">官方贴吧</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li><!-- start message -->
                    <a href="#">
                      <p style="font-size:10px;color:black">联系我们</p>
                    </a>
                  </li>
				  
                  <li><!-- start message -->
                    <a href="#">
                      <p style="font-size:10px;color:black">帮助</p>
                    </a>
                  </li>
				  
                </ul>
              </li>
            </ul>
          </li>
          
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#"><i class="fa fa-fw fa-sign-out"></i></a>
          </li> 
        </ul>
      </div>        
       
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
  <!-- Full Width Column -->
  <div class="content-wrapper">
    <div class="container"  style="padding-top:20px;">
      
      <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">站点与子目录</h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin" border="0" style="text-align:right">
                 
                  <tr style="color:gray;">
                    <td colspan="2"  style="text-align:left;">网站名称</td>
                    <td colspan="2">浏览量(PV)</td>
                    <td>访客数</td>
                    <td>ip数</td>
                    <td>跳出率</td>
                    <td>平均访问时长</td>
                    <td style="text-align:center;">操作</td>
                  </tr>
            <c:forEach items="${list}" var="site"> 
                  <tr rowspan="3" style="text-align:left;">
                    <td>
					
					<div><a href="${site.domain }">${site.name }.com</a></div>
					<div style="padding-top:5px;">${site.name }</div>
					
					</td>
					<td> 
						<div class="col-md-3 col-sm-4" style="padding-top:30px;"><i class="fa fa-fw fa-heart-o"></i></div>
					</td>
					<td>
						<div style="color:darkgray; ">
							<div style="padding-top:5px;">今日</div>
							<div style="padding-top:5px;">昨日</div>
							<div style="padding-top:5px;">预计今日</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.clicked }</div>
							<div style="padding-top:5px;">${site.clicked2 }</div>
							<div style="padding-top:5px;">- -</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.visitor }</div>
							<div style="padding-top:5px;">${site.visitor2 }</div>
							<div style="padding-top:5px;">- -</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">${site.ip }</div>
							<div style="padding-top:5px;">${site.ip2 }</div>
							<div style="padding-top:5px;">- -</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">- -</div>
							<div style="padding-top:5px;">- -</div>
							<div style="padding-top:5px;">- -</div>
						</div>
					</td>
					<td>
						<div style="color:darkgray;">
							<div style="padding-top:5px;">- -</div>
							<div style="padding-top:5px;">- -</div>
							<div style="padding-top:5px;">- -</div>
						</div>
					</td>
					<td>
						<div style="padding-top:30px"><a href="/jeesite/a/statistics/sitesOverview/index">查看报告</a></div>
					</td>
                  </tr>
             </c:forEach>     
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            
            
            <!-- /.box-footer -->
          </div>

     
     
     
    </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="container">
      <div class="pull-right hidden-xs">
        <b>Version</b> 2.3.8
      </div>
      <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
      reserved.
    </div>
    <!-- /.container -->
  </footer>
</div>

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
