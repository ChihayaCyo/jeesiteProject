<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/vue2.jsp" %>
<%@ include file="/WEB-INF/views/include/AdminLTE.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>网站概述</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper" id="box">

    <jsp:include page="commons/sidebar.jsp" />


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div style="font-size:30px;">&nbsp&nbsp网站概述</div>
        <!-- Main content -->
        <section class="content">
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">今日流量</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table">
                                <tr>
                                    <th width="16%"></th>
                                    <th width="16%">浏览量(PV)</th>
                                    <th width="16%">IP数</th>
                                </tr>
                                <tr>
                                    <td>今日</td>
                                    <td>${list[0].pageviews1}</td>
                                    <td>${list[0].ip1}</td>
                                </tr>
                                <tr>
                                    <td>昨日</td>
                                    <td>${list[0].pageviews2}</td>
                                    <td>${list[0].ip2}</td>
                                </tr>
                                <tr style="background-color:#F5F5F5">
                                    <td>每日平均</td>
                                    <td>{{countPageviews/countDay | filterRound}}</td>
                                    <td>{{countIp/countDay | filterRound}}</td>
                                </tr>
                                <tr style="background-color:#F5F5F5">
                                    <td>历史峰值</td>
                                    <td>{{maxPageviews}}</td>
                                    <td>{{maxIp}}</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="6"><i class="fa fa-fw fa-angle-double-down"></i>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>

            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li @click="getPageData(1,'今天')" class="active"><a href="#tab_1-1" data-toggle="tab">今天</a></li>
                    <li @click="getPageData(-1,'昨天')"><a href="#tab_2-2" data-toggle="tab">昨天</a></li>
                    <li @click="getPageData(7,'最近7天')"><a href="#tab_3-2" data-toggle="tab">最近七天</a></li>
                    <li @click="getPageData(30,'最近30天')"><a href="#tab_2-2" data-toggle="tab">最近30天</a></li>
                </ul>
            </div>

            <!-- Direct -->
            <div class="row">
                <div class="col-md-6">
                    <div class="box direct-chat direct-chat-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">趋势图</h3>
                            <div class="box-tools pull-right">
                                <i class="fa fa-fw fa-chevron-circle-right" style="color:#DCDCDC;"></i>
                            </div>
                        </div>
                        <div class="box-body" style="height:380px;padding:10px 10px 10px 10px">
                            <div class="chart tab-pane active" id="revenue-chart"
                                 style="position: relative; height: 300px;"></div>
                        </div>
                    </div>
                </div>

                <!-- Direct -->
                <div class="row">
                    <div class="col-md-6">
                        <!-- DIRECT CHAT SUCCESS -->
                        <div class="box direct-chat direct-chat-success">
                            <div class="box-header with-border">
                                <h3 class="box-title">受访页面</h3>
                                <div class="box-tools pull-right">
                                    <i class="fa fa-fw fa-chevron-circle-right" style="color:#DCDCDC;"></i>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body" style="height:380px;">
                                <table class="table">
                                    <tr>
                                        <th width="68%%">受访页面</th>
                                        <th width="16%">浏览量(PV)</th>
                                        <th width="16%">占比</th>
                                    </tr>
                                    <tr v-for="item in myList">
                                        <td>{{item.url}}</td>
                                        <td>{{item.num}}</td>
                                        <td>{{item.num/total | filterPercent}}</td>
                                    </tr>
                                </table>
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

    Vue.filter('filterPercent', function (input) {
        var str = Number(input * 100).toFixed(1);
        str += "%";
        return str;
    });
    Vue.filter('filterRound', function (input) {
        var res = Math.round(input);
        return res;
    });

    var vue = new Vue({
        el: '#box',
        data: {
            name: 'welcome!!',
            myList: [],
            total: 1,//top10受访页面浏览量
            siteList: [],
            overviewList: [], //每日平均 历史峰值
            countDay: 0,
            countPageviews: 0, //总浏览量
            countIp: 0, //总ip数
            maxPageviews: 0,
            maxIp: 0
        },
        created(){//vue实例创建完成, 下一步就是mount-模板编译
            this.getSiteDetails();
            this.getPageData(1, '今天');
            this.overviewByDay();
        },
        methods: {
            getSiteDetails: function () {
                this.$http({
                    method: 'GET',
                    url: '/jeesite/a/statistics/sitesOverview/vue/siteDetails',
                    data: {
                        siteId: '${list[0].site_id}'
                    }
                }).then(function (res) {
                    var list = res.data;
                    this.siteList = [];
                    for (var i = 0; i < list.length; i++) {
                        this.siteList.push({
                            site_id: list[i].site_id,//可以用这个替换掉别的方法的el表达式 尽量减少el表达式
                            url: list[i].url,
                            pageviews1: list[i].pageviews1,
                            pageviews2: list[i].pageviews2,
                            ip1: list[i].ip1,
                            ip2: list[i].ip2
                        });
                    }
                });
            },
            getPageData: function (n, name) {
                this.$http({
                    method: 'GET',
                    url: '/jeesite/a/statistics/mostVisitedPage/vue/topPage',
                    data: {
                        day: n,
                        siteId: '${list[0].site_id}'
                    }
                }).then(function (res) {
                    var list = res.data;
                    this.myList = [];
                    this.total = 0;
                    this.name = name;
                    for (var i = 0; i < list.length; i++) {
                        this.myList.push({
                            url: list[i].url,
                            num: list[i].num
                        });
                        this.total += list[i].num;
                    }
                });
            },
            overviewByDay: function () {
                this.$http({
                    method: 'GET',
                    url: '/jeesite/a/statistics/sitesOverview/vue/overviewByDay',
                    data: {
                        siteId: '${list[0].site_id}'
                    }
                }).then(function (res) {
                    var list = res.data;
                    this.overviewList = [];
                    this.countDay = 0;
                    this.countPageviews = 0;
                    this.countIp = 0;
                    this.maxPageviews = 0;
                    this.maxIp = 0;
                    for (var i = 0; i < list.length; i++) {
                        this.overviewList.push({
                            timeDay: list[i].timeDay,
                            pageviews: list[i].pageviews,
                            ip: list[i].ip
                        });
                        this.countDay++;
                        this.countPageviews += list[i].pageviews;
                        this.countIp += list[i].ip;
                        if (this.maxPageviews < list[i].pageviews) {
                            this.maxPageviews = list[i].pageviews;
                        }
                        if (this.maxIp < list[i].ip) {
                            this.maxIp = list[i].ip;
                        }
                    }
//                    jeeProject.chartList = this.overviewList;
//                    console.log(jeeProject.chartList);//后执行
                });
            }
        }
    });


    //    console.log(jeeProject.chartList);//先执行 没有值

    var jeeProject = {
        chartList: [],
        overviewByDayJQ: function () {
            $.ajax({
                url: '/jeesite/a/statistics/sitesOverview/vue/overviewByDay?siteId=' + '${list[0].site_id}',
                async: false,
                success: function (res) {
                    var list = res;
                    var overviewList = [];
                    for (var i = 0; i < list.length; i++) {
                        overviewList.push({
                            y: list[i].timeDay,
                            item1: list[i].pageviews,
                            item2: list[i].ip
                        });
                    }
                    jeeProject.chartList = overviewList;
//                    console.log(jeeProject.chartList);
                }
            });
        }
    };

    jeeProject.overviewByDayJQ();
/*    console.log(jeeProject.chartList);*/


</script>
</html>
