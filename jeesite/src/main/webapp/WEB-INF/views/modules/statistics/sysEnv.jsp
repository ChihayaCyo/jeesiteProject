<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/vue2.jsp" %>
<%@ include file="/WEB-INF/views/include/AdminLTE.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>系统环境</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper" id="box">

    <jsp:include page="commons/sidebar.jsp" />



    <!-- 开始 -->
    <div class="content-wrapper">
        <div style="font-size:30px;">&nbsp&nbsp系统环境</div>
        <section class="content">
            <div>
                <span>时间：</span>
                <span class="btn-group" style="padding-left:10px;">
                    <button type="button" class="btn btn-default">今天</button>
                    <button type="button" class="btn btn-default">昨天</button>
                    <button type="button" class="btn btn-default">最近七天</button>
                    <button type="button" class="btn btn-default">最近30天</button>
                </span>
            </div>

            <div class="row" style="padding-top:10px;">
                <div class="col-xs-12">
                    <div class="box">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab_1" data-toggle="tab">浏览器</a></li>
                            <li><a href="#tab_1" data-toggle="tab">网络设备类型</a></li>
                            <li><a href="#tab_1" data-toggle="tab">屏幕分辨率</a></li>
                            <li><a href="#tab_1" data-toggle="tab">屏幕颜色</a></li>
                            <li><a href="#tab_1" data-toggle="tab">flash版本</a></li>
                            <li><a href="#tab_1" data-toggle="tab">是否支持java</a></li>
                            <li><a href="#tab_1" data-toggle="tab">语言环境</a></li>
                            <li><a href="#tab_1" data-toggle="tab">是否支持cookie</a></li>
                            <li><a href="#tab_1" data-toggle="tab">网络提供商</a></li>
                        </ul>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive ">
                            <table class="table">
                                <tr style="font-size:15px;">
                                    <th width="20%">浏览量（PV）<i class="fa fa-fw fa-question-circle" style="color:green"></i></th>
                                    <th width="20%">访客数(UY)<i class="fa fa-fw fa-question-circle" style="color:green"></i></th>
                                    <th width="20%">IP数<i class="fa fa-fw fa-question-circle" style="color:green"></i></th>
                                    <th width="20%">跳出率<i class="fa fa-fw fa-question-circle" style="color:green"></i></th>
                                    <th width="20%">平均访问时长<i class="fa fa-fw fa-question-circle" style="color:green"></i></th>
                                </tr>
                                <tr style="font-size:30px;">
                                    <td>1456</td>
                                    <td>1086</td>
                                    <td>1053</td>
                                    <td>80.86%</td>
                                    <td>00:03:03</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="6"><i class="fa fa-fw fa-angle-double-down"></i></td>
                                </tr>
                            </table>

                            <%--<div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>--%>

                            <div class="box">
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover">
                                        <tbody>
                                        <tr>
                                            <td colspan="2" rowspan="2">浏览器<i class="fa fa-fw fa-question-circle" style="color:green"></i></td>
                                            <td colspan="2">网站基础指标(UV)</td>
                                            <td colspan="3">流量质量指标</td>
                                        </tr>
                                        <tr>
                                            <td>浏览量(PV)</td>
                                            <td>访客数(UV)</td>
                                            <td>IP数</td>
                                            <td>跳出率</td>
                                            <td>平均访问时长</td>
                                        </tr>
                                        <tr style="text-align:left;">
                                            <td>+&nbsp&nbsp1</td>
                                            <td>计算机端浏览器</td>
                                            <td>178</td>
                                            <td>133</td>
                                            <td>112</td>
                                            <td>20%</td>
                                            <td>00:02:30</td>
                                        </tr>
                                        <tr style="text-align:left;">
                                            <td>+&nbsp&nbsp2</td>
                                            <td>移动端浏览器</td>
                                            <td>178</td>
                                            <td>133</td>
                                            <td>112</td>
                                            <td>20%</td>
                                            <td>00:02:30</td>
                                        </tr>
                                        <tr style="text-align:left;">
                                            <td></td>
                                            <td>当前汇总</td>
                                            <td>178</td>
                                            <td>133</td>
                                            <td>112</td>
                                            <td>20%</td>
                                            <td>00:02:30</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


</div>
</body>

<script>

</script>
</html>
