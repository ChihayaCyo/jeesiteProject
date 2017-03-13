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
            <div>
                <span>时间：</span>
                <span class="btn-group" style="padding-left:10px;">
                    <input type="button" class="btn btn-default" value="今天" @click="getPageData(1,'今天')"/>
                    <input type="button" class="btn btn-default" value="昨天" @click="getPageData(-1,'昨天')"/>
                    <input type="button" class="btn btn-default" value="最近7天" @click="getPageData(7,'最近7天')"/>
                    <input type="button" class="btn btn-default" value="最近30天" @click="getPageData(30,'最近30天')"/>
                </span>
            </div>

            <%--<form>--%>
            <br/>
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">指标概览</a></li>
                    <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">页面价值分析</a></li>
                </ul>
                <div class="tab-content">

                    <div class="tab-pane active" id="tab_1">
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
                                        <td style="text-align:left;"><a href="#">{{item.url}}</a></td>
                                        <td>{{item.num}}</td>
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
                                <table class="table table-hover" border="0">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" rowspan="2">页面URL</td>
                                        <td colspan="2">网站基础指标(UV)</td>
                                    </tr>
                                    <tr>
                                        <td>浏览量(PV)</td>
                                        <td>ip数</td>
                                        <td>占比</td>
                                    </tr>
                                    <tr v-for="(item,index) in myList">
                                        <td>{{index+1}}</td>
                                        <td><a href="#">{{item.url}}</a></td>
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
            <%--</form>--%>
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
    new Vue({
        el: '#box',
        data: {
            myList: [],//[]是数组, {}是对象; 在本案例中,数组myList中的项为对象[{}, {}, ...]
            total: 0,
            totalIp: 0,
            name: '',
            inputDay: 1,
            siteUrl: '${list[0].url}'
        },
        created(){//vue实例创建完成, 下一步就是mount-模板编译
            this.getPageData(1, '今天');
        },
        methods: {
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
                    this.totalIp = 0;
                    this.name = name;
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
</script>
</html>
