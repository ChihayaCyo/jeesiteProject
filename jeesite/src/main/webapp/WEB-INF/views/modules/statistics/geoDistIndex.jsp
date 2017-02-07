<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>地域分布</title>
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
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
     
		<ul class="nav navbar-nav">
            <li><a href="/jeesite/a/statistics/home/index">主页 </a></li>
            <li><a href="#">报告</a></li>
             <li><a href="#">管理</a></li>
        </ul>
		<ul class="nav navbar-nav" style="color:#FFFFFF;font-size:18px;padding:15px 15px 10px 600px;">
            <li>welcome&nbsp&nbsp123456</li>
        </ul>
		 <select  style="width:20%;height:30px;margin-top:13px;">
                  <option selected="selected">baidu.com</option>
                  <option>google.com</option>
                  <option>sougou.com</option>
         </select>
		
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
	 

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
	  
      <ul class="sidebar-menu">
        <li class="active treeview">
		<li><a href="#"><i class="fa fa-heart-o text-gray"></i> <span>常用报告</span></a></li>
		<li><a href="/jeesite/a/statistics/sitesOverview/index"><i class="fa fa-fw fa-cc-amex text-gray"></i> <span>网站概述</span></a></li>
          
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-desktop"></i>
            <span>流量分析</span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/layout/top-nav.html">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp实时访客</a></li>
            <li><a href="/jeesite/a/statistics/trendAnalysis/index"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp趋势分析</a></li>
          </ul>
        </li>
		<li><a href="#"><i class="fa fa-fw fa-object-group text-gray"></i> <span>访问分析</span></a></li>
		<li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-users"></i>
            <span>访客分析</span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/jeesite/a/statistics/geoDist/index"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp地域分布</a></li>
            <li><a href="/jeesite/a/statistics/sysEnvironment/index">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 系统环境</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <div class="content-wrapper">
    <div style="font-size:30px;">&nbsp&nbsp地域分布(2016/12/16)</div>
    <!-- Main content -->
    <section class="content">
    <div>时间：
	<span class="btn-group" style="padding-left:10px;">
                      <button type="button" class="btn btn-default">今天</button>
                      <button type="button" class="btn btn-default">昨天</button>
					   <button type="button" class="btn btn-default">最近七天</button>
                      <button type="button" class="btn btn-default">最近30天</button>
					  </span>
					  
					 
                <select style="width:9%;height:32px;margin-left:50px;">
                  <option selected="selected">2016/12/15</option>
                  <option>Alaska</option>
                  <option>Delaware</option>
                  <option>Tennessee</option>
                  <option>Texas</option>
                  <option>Washington</option>
                </select>
             
				 
					 <span style="font-size:15px;padding-top:10px;padding-left:50px;">
                      <input type="checkbox" >
                   对比时间段
                    </span>
					   </div>
					   <div style="padding-top:10px;padding-bottom:10px;">
					 来源：
                <select  style="width:9%;height:30px;">
                  <option selected="selected">全部</option>
                  <option>百度</option>
                  <option>google</option>
                </select>
				&nbsp&nbsp&nbsp&nbsp访客：
			  <span class="btn-group" style="padding-left:5px;">
                      <button type="button" class="btn btn-default">全部</button>
                      <button type="button" class="btn btn-default">新访客</button>
					   <button type="button" class="btn btn-default">老访客</button> 
			  </span>
					   </div>
			<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">按省</a></li>
               <li><a href="#tab_1" data-toggle="tab">按国家</a></li>
            </ul>
            <!-- /.box-header -->
            <div class="box-body table-responsive ">
              <table class="table">
                <tr style="font-size:15px;">
                  <th width="16%">浏览量（PV）<i class="fa fa-fw fa-question-circle" style="color:green"></th>
                  <th width="16%">浏览量占比<i class="fa fa-fw fa-question-circle" style="color:green"></th>
				  <th width="16%">访问次数<i class="fa fa-fw fa-question-circle" style="color:green"></th>
                  <th width="16%">访客数(UY)<i class="fa fa-fw fa-question-circle" style="color:green"></th>
				  <th width="16%">新访客数<i class="fa fa-fw fa-question-circle" style="color:green"></th>
				  <th width="16%">平均访问页数<i class="fa fa-fw fa-question-circle" style="color:green"></th>
                </tr>
                <tr style="font-size:30px;">
                  <td >555</td>
                  <td >80%</td>
                  <td>181</td>
                  <td>184</td>
                  <td>45</td>
				  <td>3</td>
                </tr>
               
				<tr>
                  <td align="center" colspan="6"><i class="fa fa-fw fa-angle-double-down"></i></td>

                </tr>
              </table>
			  <div class="form-group" style="padding-left:10px;">
                <select class="form-control select2" style="width: 18%;">
                  <option selected="selected">指标：访问次数</option>
                  <option>访客数（UV）</option>
                  <option>IP数</option>
                  <option>平均访问时长</option>
                </select>
              </div>
			  
			  
            <div class="box-body">
              <div id="world-map" style="height: 300px; width: 30%;"></div>
            </div>
            
			  
			
           <div style="margin-left:600px;margin-top:-350px;">
            <div class="box-header with-border" style=" text-align:center">
            </div>

			<div  style="position: relative; height: 300px;">
              <table  border="0" style="border:1px solid #000000;" cellpadding="0"cellspacing="1" class="table">
                <tr>
                  <th></th>
				  <th>省份</th>
                  <th>访问次数</th>
				  <th>占比</th>
                </tr>
             	<c:forEach  items="${list3}" var="x2" begin="0" end="9" step="1">
                	<c:set var="total2" value="${total2+x2.num}" />
                </c:forEach>
				<tr>
				  <td>1</td>
                  <td>${list3[0].area}</td>
                  <td>${list3[0].num}</td>
                  <td><fmt:formatNumber value="${list3[0].num/total2}" type="percent"/></td>
                </tr>
				<tr>
				  <td>2</td>
                  <td>${list3[1].area}</td>
                  <td>${list3[1].num}</td>
                  <td><fmt:formatNumber value="${list3[1].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>${list3[2].area}</td>
                  <td>${list3[2].num}</td>
                  <td><fmt:formatNumber value="${list3[2].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>${list3[3].area}</td>
                  <td>${list3[3].num}</td>
                  <td><fmt:formatNumber value="${list3[3].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>${list3[4].area}</td>
                  <td>${list3[4].num}</td>
                  <td><fmt:formatNumber value="${list3[4].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>${list3[5].area}</td>
                  <td>${list3[5].num}</td>
                  <td><fmt:formatNumber value="${list3[5].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>7</td>
                  <td>${list3[6].area}</td>
                  <td>${list3[6].num}</td>
                  <td><fmt:formatNumber value="${list3[6].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>8</td>
                  <td>${list3[7].area}</td>
                  <td>${list3[7].num}</td>
                  <td><fmt:formatNumber value="${list3[7].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>9</td>
                  <td>${list3[8].area}</td>
                  <td>${list3[8].num}</td>
            	  <td><fmt:formatNumber value="${list3[8].num/total2}" type="percent"/></td>
                </tr>
                <tr>
                  <td>10</td>
                  <td>${list3[9].area}</td>
                  <td>${list3[9].num}</td>
              	  <td><fmt:formatNumber value="${list3[9].num/total2}" type="percent"/></td>
                </tr>
				</table>
				</div>
			  </div>
			  
			  <div style="padding-top:80px;font-size:20px;">&nbsp&nbsp&nbsp&nbsp展开内容&nbsp&nbsp
			  <select  style="width:9%;height:28px;">
                  <option selected="selected">按地级市</option>
                  <option>按地级市</option>
                  <option>按网络设备商</option>
                </select>
			  </div>
			  
			  
			  <div class="box-body table-responsive " style="padding-top:10px;">
              <table class="table">
			  <tr>
							  <th rowspan="2">地域</th>
							  <th colspan="5">网站基础指标(UV)</th>
							  <th colspan="1">流量质量指标</th>							
							</tr>
                <tr>
				  <th>浏览量（PV）</th>
                  <th>浏览量占比</th>
				  <th>访问次数</th>
				  <th>访客数（UV）</th>
				  <th>新访客数</th>
				  <th>平均访问页数</th>
                </tr>
                <tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp1&nbsp&nbsp&nbsp&nbsp广东&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>236</td>
                  <td>20%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
               
			   <tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp2&nbsp&nbsp&nbsp&nbsp北京&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>220</td>
                  <td>18%</td>
                  <td>180</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
			   
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp3&nbsp&nbsp&nbsp&nbsp山东&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>210</td>
                  <td>15%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp4&nbsp&nbsp&nbsp&nbsp江苏&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>190</td>
                  <td>13%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp5&nbsp&nbsp&nbsp&nbsp上海&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>170</td>
                  <td>11%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp6&nbsp&nbsp&nbsp&nbsp四川&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>130</td>
                  <td>9%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp7&nbsp&nbsp&nbsp&nbsp河南&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>90</td>
                  <td>9%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp8&nbsp&nbsp&nbsp&nbsp河北&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>70</td>
                  <td>7%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp9&nbsp&nbsp&nbsp&nbsp浙江&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>50</td>
                  <td>6%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
				<tr>
                  <td>+&nbsp&nbsp&nbsp&nbsp10&nbsp&nbsp湖北&nbsp&nbsp&nbsp&nbsp<i class="fa fa-fw fa-info-circle" style="color:green"></td>
                  <td>40</td>
                  <td>4%</td>
                  <td>184</td>
                  <td>67</td>
				  <td>67</td>
				  <td>4</td>
                </tr>
              </table>
			  </div>
			  
			  
			  
                </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
      
	
	  
    </section>
    <!-- /.content -->
  </div>
  
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
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
