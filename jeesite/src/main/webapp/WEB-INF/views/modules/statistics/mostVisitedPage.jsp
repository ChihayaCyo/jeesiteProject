<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/vue2.jsp" %>
<%@ include file="/WEB-INF/views/include/AdminLTE.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>受访页面</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper" id="box">

    <jsp:include page="commons/sidebar.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div style="font-size:30px;">&nbsp&nbsp受访页面</div>

        <section class="content">
            <div class="col-md-6">
                <span>时间：</span>
                <span class="btn-group" style="padding-left:10px;">
                    <input type="button" class="btn btn-default" value="今天" @click="getPageData(1,'2017-03-20 00:00:00')"/>
                    <input type="button" class="btn btn-default" value="昨天" @click="getPageData(-1,'2017-03-20 00:00:00')"/>
                    <input type="button" class="btn btn-default" value="最近7天" @click="getPageData(7,'2017-03-20 00:00:00')"/>
                    <input type="button" class="btn btn-default" value="最近30天" @click="getPageData(30,'2017-03-20 00:00:00')"/>
                </span>
            </div>
            <div class="input-group date col-xs-3" class="col-md-5">
                <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                </div>
                <input type="text" class="form-control pull-right" id="datepicker" value="2017-03-20">
            </div>

            <div style="position:fixed; right:50px; z-index:999; top:0;">
                <br/>
                <input type="button" class="btn btn-default btn-small" value="导出为EXCEL"
                       onclick="javascript:ExportToExcel('tb2Download')"/>
            </div>




            <br/>
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class=""><a href="#tab_1" data-toggle="tab" aria-expanded="false">指标概览</a></li>
                    <li class="active"><a href="#tab_2" data-toggle="tab" aria-expanded="true">页面价值分析</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane" id="tab_1">

                        <div class="box">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <td>浏览量(PV)</td>
                                    </tr>
                                    <tr>
                                        <td>{{total}}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover" border="0">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" rowspan="2">页面URL</td>
                                        <td>网站基础指标(UV)</td>
                                    </tr>
                                    <tr>
                                        <td>浏览量(PV)</td>
                                    </tr>
                                    <tr v-for="(item,index) in myList">
                                        <td>{{index+1}}</td>
                                        <td style="word-wrap:break-word;word-break:break-all;"><a href="#">{{item.url}}</a></td>
                                        <td>{{item.num}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane active" id="tab_2">
                        <div class="box">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tbody>
                                    <tr>
                                        <td>浏览量(PV)</td>
                                        <td>ip数</td>
                                    </tr>
                                    <tr>
                                        <td>{{total}}</td>
                                        <td>{{totalIp}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="box">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover" border="0" id="tb2Download">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" rowspan="2">页面URL</td>
                                        <td colspan="3">网站基础指标(UV)</td>
                                    </tr>
                                    <tr>
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
    var vueTopPage = new Vue({
        el: '#box',
        data: {
            myList: [],//[]是数组, {}是对象; 在本案例中,数组myList中的项为对象[{}, {}, ...]
            total: 0,
            totalIp: 0,
            inputDay: 1,
            siteUrl: '${list[0].url}'
        },
        created(){//vue实例创建完成, 下一步就是mount-模板编译
            this.getPageData(1,'2017-03-20 00:00:00');
        },
        methods: {
            getPageData: function (n,pageTime) {
                this.$http({
                    method: 'GET',
                    url: '/jeesite/a/statistics/mostVisitedPage/vue/topPage',
                    data: {
                        siteId: '${list[0].site_id}',
                        currentDate: pageTime,
                        day: n
                    }
                }).then(function (res) {
                    var list = res.data;
                    this.myList = [];
                    this.total = 0;
                    this.totalIp = 0;
                    for (var i = 0; i < list.length; i++) {
                        this.myList.push({
                            url: list[i].url,
                            num: list[i].num,
                            ip: list[i].ip
                        });
                        this.total += list[i].num;
                        this.totalIp += list[i].ip;
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

    //警告: 必须放在vue后面!!!!!!!!!!!!!!!!!!
    $('#datepicker').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    }).on('changeDate', function(e) {
        var time = e.date.Format("yyyy-MM-dd hh:mm:ss");
        console.log(time);
        vueTopPage.getPageData(1,time);
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
</html>
