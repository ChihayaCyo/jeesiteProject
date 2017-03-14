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

    <jsp:include page="commons/sidebar.jsp"/>

    <!-- 开始 -->
    <div class="content-wrapper">
        <div style="font-size:30px;">&nbsp&nbsp系统环境</div>
        <section class="content">
            <div>
                <span>时间：</span>
                <span class="btn-group" style="padding-left:10px;">
                    <input type="button" class="btn btn-default" value="今天" @click="getPageData(1)"/>
                    <input type="button" class="btn btn-default" value="昨天" @click="getPageData(-1)"/>
                    <input type="button" class="btn btn-default" value="最近7天" @click="getPageData(7)"/>
                    <input type="button" class="btn btn-default" value="最近30天" @click="getPageData(30)"/>
                </span>
            </div>

            <br/>
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">浏览器</a></li>
                    <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">操作系统</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_1">

                        <div class="box">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover" border="0">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" rowspan="2">浏览器</td>
                                        <td colspan="2">网站基础指标(UV)</td>
                                    </tr>
                                    <tr>
                                        <td>浏览量(PV)</td>
                                        <td>占比</td>
                                    </tr>
                                    <tr style="text-align:left;" v-for="(item,index) in showList">
                                        <td>&nbsp&nbsp{{index+1}}</td>
                                        <td>{{item.name}}</td>
                                        <td>{{item.num}}</td>
                                        <td>{{item.num/total | filterPercent}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover" border="0">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" rowspan="2">浏览器内核</td>
                                        <td colspan="2">网站基础指标(UV)</td>
                                    </tr>
                                    <tr>
                                        <td>浏览量(PV)</td>
                                        <td>占比</td>
                                    </tr>
                                    <tr style="text-align:left;" v-for="(item,index) in showList2">
                                        <td>&nbsp&nbsp{{index+1}}</td>
                                        <td>{{item.name}}</td>
                                        <td>{{item.num}}</td>
                                        <td>{{item.num/total2 | filterPercent}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>


                    <div class="tab-pane" id="tab_2">

                        <div class="box">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" rowspan="2">操作系统</td>
                                        <td colspan="2">网站基础指标(UV)</td>
                                    </tr>
                                    <tr>
                                        <td>浏览量(PV)</td>
                                        <td>占比</td>
                                    </tr>
                                    <tr style="text-align:left;" v-for="(item,index) in showList3">
                                        <td>&nbsp&nbsp{{index+1}}</td>
                                        <td>{{item.name}}</td>
                                        <td>{{item.num}}</td>
                                        <td>{{item.num/total3 | filterPercent}}</td>
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

    function compare(propertyName) {
        return function (object1, object2) {
            var value1 = object1[propertyName];
            var value2 = object2[propertyName];
            if (value2 < value1) {
                return -1;
            } else if (value2 > value1) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    Vue.filter('filterPercent', function (input) {
        var str = Number(input * 100).toFixed(1);
        str += "%";
        return str;
    });
    new Vue({
        el: '#box',
        data: {
            showList: [],
            showList2: [],
            showList3: [],
            total: 0,
            total2: 0,
            total3: 0
        },
        created(){//vue实例创建完成, 下一步就是mount-模板编译
            this.getPageData(1);
        },
        methods: {
            getPageData: function (n) {
                this.$http({
                    method: 'GET',
                    url: '/jeesite/a/statistics/sysEnv/vue/getBrowserData',
                    data: {
                        day: n,
                        siteId: '${list[0].site_id}'
                    }
                }).then(function (res) {
                    var browserData = res.data;
                    this.showList = [];
                    this.showList2 = [];
                    this.total = 0;
                    this.total2 = 0;
                    for (key in browserData) {
                        if (key.toString() == "trident" || key.toString() == "geckoWebKit") {
                            this.showList2.push({
                                name: key,
                                num: browserData[key]
                            });
                            this.total2 += browserData[key];
                        } else {
                            this.showList.push({
                                name: key,
                                num: browserData[key]
                            });
                            this.total += browserData[key];
                        }
                    }
                    this.showList.sort(compare("num"));
                    this.showList2.sort(compare("num"));
                });
                //这里应该可以再写一个ajax
                this.$http({
                    method: 'GET',
                    url: '/jeesite/a/statistics/sysEnv/vue/getOSData',
                    data: {
                        day: n,
                        siteId: '${list[0].site_id}'
                    }
                }).then(function (res) {
                    var OSData = res.data;
                    this.showList3 = [];
                    this.total3 = 0;
                    for (key in OSData) {
                            this.showList3.push({
                                name: key,
                                num: OSData[key]
                            });
                            this.total3 += OSData[key];
                    }
                    this.showList3.sort(compare("num"));
                });
            }
        }
    });

</script>

</html>
