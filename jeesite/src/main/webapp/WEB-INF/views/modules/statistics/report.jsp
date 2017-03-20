<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/vue2.jsp" %>
<%@ include file="/WEB-INF/views/include/AdminLTE.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>报告</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>

<body>
<div class="wrapper" id="box">

    <div style="font-size:30px;">&nbsp&nbsp报告</div>

    <section class="content">
        <div class="col-md-6">
            <span>时间：</span>
            <span class="btn-group" style="padding-left:10px;">
                    <input type="button" class="btn btn-default" value="今天"
                           @click="getPageData(1,'2017-03-20 00:00:00')"/>
                    <input type="button" class="btn btn-default" value="昨天"
                           @click="getPageData(-1,'2017-03-20 00:00:00')"/>
                    <input type="button" class="btn btn-default" value="最近7天"
                           @click="getPageData(7,'2017-03-20 00:00:00')"/>
                    <input type="button" class="btn btn-default" value="最近30天"
                           @click="getPageData(30,'2017-03-20 00:00:00')"/>
                </span>
        </div>
        <div class="input-group date col-xs-3" class="col-md-5">
            <div class="input-group-addon">
                <i class="fa fa-calendar"></i>
            </div>
            <input type="text" class="form-control pull-right" id="datepicker" value="2017-03-20">
        </div>
        <div style="position:fixed; right:100px; z-index:999; top:0;">
            <br/>
            <input type="button" class="btn btn-default btn-small" value="导出为EXCEL"
                   onclick="javascript:ExportToExcel('tb2Download')"/>
        </div>


        <br/>
        <div class="box">
            <div class="box-body table-responsive no-padding">
                <table class="table table-hover" border="0" id="tb2Download">

                    <tbody>
                    <tr>
                        <td colspan="2" align="center">日期</td>
                        <td>浏览量(PV)</td>
                        <td colspan="2" align="center">ip数</td>
                    </tr>
                    <tr v-for="item in dayList">
                        <td colspan="2" align="center">{{item.days}}</td>
                        <td>{{item.pv}}</td>
                        <td colspan="2" align="center">{{item.ip}}</td>
                    </tr>
                    </tbody>

                    <tbody>
                    <tr>
                        <td colspan="2">页面URL</td>
                        <td>浏览量(PV)</td>
                        <td>ip数</td>
                        <td>占比</td>
                    </tr>
                    <tr v-for="(item,index) in myList">
                        <td>{{index+1}}</td>
                        <td style="word-wrap:break-word;word-break:break-all;"><a href="#">{{item.url}}</a></td>
                        <td>{{item.num}}</td>
                        <td>{{item.ip}}</td>
                        <td>{{item.num/total | filterPercent}}</td>
                    </tr>
                    </tbody>

                </table>
            </div>
        </div>
    </section>
</div>


<div class="row" style="margin: 0 auto; width: 90%">
    <div class="box direct-chat direct-chat-success">
        <div class="box-header with-border">
            <h3 class="box-title">趋势图</h3>
            <div class="box-tools pull-right">
                <i class="fa fa-fw fa-chevron-circle-right" style="color:#DCDCDC;"></i>
            </div>
        </div>
        <div class="box-body" style="height:380px;padding:10px 10px 10px 10px">
            <div id="main" class="chart tab-pane active"
                 style="position: relative; height: 300px;"></div>
        </div>
    </div>
</div>

</body>

<script>
    Vue.filter('filterPercent', function (input) {
        var str = Number(input * 100).toFixed(1);
        str += "%";
        return str;
    });
    var vueTopPage = new Vue({
        el: '#box',
        data: {
            myList: [],//[]是数组, {}是对象; 在本案例中,数组myList中的项为对象[{}, {}, ...]
            total: 0,
            dayList: [] //todo
        },
        created(){//vue实例创建完成, 下一步就是mount-模板编译
            this.getPageData(1, '2017-03-20 00:00:00');
        },
        methods: {
            getPageData: function (n, pageTime) {
                this.$http({//dayList
                    method: 'GET',
                    url: '/jeesite/a/statistics/report/vue/dayList',
                    data: {
                        currentDate: pageTime,
                        day: n
                    }
                }).then(function (res) {
                    var list = res.data;
                    this.dayList = [];
                    for (var i = 0; i < list.length; i++) {
                        this.dayList.push({
                            days: list[i].days,
                            pv: list[i].pv,
                            ip: list[i].ip
                        });
                    }
                });
                this.$http({
                    method: 'GET',
                    url: '/jeesite/a/statistics/report/vue/topTenPageByDay',
                    data: {
                        currentDate: pageTime,
                        day: n
                    }
                }).then(function (res) {
                    var list = res.data;
                    this.myList = [];
                    this.total = 0;
                    for (var i = 0; i < list.length; i++) {
                        this.myList.push({
                            url: list[i].url,
                            num: list[i].num,
                            ip: list[i].ip
                        });
                        this.total += list[i].num;
                    }
                });
            }
        }
    });

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };

    //警告: 必须放在vue后面而不是前面!!!!!!!!!!!!!!!!!!
    $('#datepicker').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    }).on('changeDate', function (e) {
        var time = e.date.Format("yyyy-MM-dd hh:mm:ss");
        console.log(time);
        vueTopPage.getPageData(1, time);
    });

</script>


<script>

    //table2excel
    function ExportToExcel() {
        $("#tb2Download").table2excel({
            // 不被导出的表格行的CSS class类
            exclude: ".noExl",
            // 导出的Excel文档的名称
            name: "Excel Document Name",
            // Excel文件的名称
            filename: "myExcelTable"
        });
    }
</script>

<script>

    var myChart = echarts.init(document.getElementById('main'));
    myChart.setOption({
        /*        title: {
         text: '趋势图'
         },*/
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['浏览量', 'IP数']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: [1]
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '浏览量',
            type: 'line',
            data: [1]
        }, {
            name: 'IP数',
            type: 'line',
            data: [1]
        }]
    });

    var jeeProject = {
        iCategory: [],
        iPageviews: [],
        iIp: [],
        chartByDay: function (day) {
            $.ajax({
                url: '/jeesite/a/statistics/sitesOverview/vue/chartByDayAllSite?day=' + day,
                async: false,
                success: function (res) {
                    var list = res;
                    iCategory = [];
                    iPageviews = [];
                    iIp = [];
                    for (var i = 0; i < list.length; i++) {
                        iCategory[i] = list[i].timeDay;
                        iPageviews[i] = list[i].pageviews;
                        iIp[i] = list[i].ip;
                    }
                    myChart.setOption({
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: iCategory
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [{
                            name: '浏览量',
                            type: 'line',
                            data: iPageviews
                        }, {
                            name: 'IP数',
                            type: 'line',
                            data: iIp
                        }]
                    });
                }
            });
        }
    };

    jeeProject.chartByDay(7);//默认显示一周
</script>
</html>
