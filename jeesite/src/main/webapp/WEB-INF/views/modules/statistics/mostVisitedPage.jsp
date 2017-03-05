<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/vue.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>受访页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script>
        window.onload=function(){
            Vue.filter('filterPercent',function(input){
                var str=Number(input*100).toFixed(1);
                str+="%";
                return str;
            });
            new Vue({
                el:'#box',
                data:{
                    myList:[],//[]是数组, {}是对象; 在本案例中,数组myList中的项为对象[{}, {}, ...]
                    total:0,
                    name:'',
                    inputDay:1
                },
                methods:{
                    get:function(n,name){
                        this.$http.get("/jeesite/a/statistics/mostVisitedPage/vue",{
                            day:n,
                            siteId:'65DE653CD3AA400083E5C5B213B66486'
                        }).then(function(res){
                            var list=res.data;
                            this.myList=[];
                            this.total=0;
                            this.name=name;
                            for(var i=0; i<list.length; i++){
                                this.myList.push({
                                    url:list[i].url,
                                    num:list[i].num,
                                });
                                this.total+=list[i].num;
                            }
                        },function(res){
                            alert(res.status);
                        });
                    }
                }
            });
        };
    </script>
</head>
<body>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>网站名称</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="site" items="${list}">
                    <tr>
                        <td>
                            <div style="padding-top:15px"><a href="${site.url }">${site.url }</a></div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!--按照今天 昨天 最近一周 最近一月显示-->
<div id="box">
    <div style="width:400px; margin:0 auto;">
        <input type="button" class="btn btn-primary" value="今天" @click="get(1,'今天')" />
        <input type="button" class="btn btn-primary" value="最近两天" @click="get(2,'最近两天')" />
        <input type="button" class="btn btn-primary" value="最近一周" @click="get(7,'最近一周')" />
        <input type="number" v-model="inputDay" @keydown.enter="get(inputDay,'最近'+inputDay+'天')" />
    </div>

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h2>Top10入口页面 {{name}}</h2>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>页面入口</th>
                        <th>浏览量</th>
                        <th>占比</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="item in myList">
                        <td>{{item.url}}</td>
                        <td>{{item.num}}</td>
                        <td>{{item.num/total | filterPercent}}</td>
                    </tr>
                    <tr v-show="myList.length==0">
                        <td colspan="3" class="text-center text-muted">
                            <p>暂无数据....</p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
