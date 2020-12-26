<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <script type="text/javascript" src="static/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="ECharts/echarts.min.js"></script>
    <title>Title</title>
    <base href="<%=basePath%>"/>
    <script type="text/javascript">
        $(function(){

            $.ajax({
                type:'get',
                url:"workbench/transaction/getChar.do",
                success:function (res) {
                    if(res.flag) {
/*
                        漏斗图长得比我还丑，算了算了
                        // 基于准备好的dom，初始化echarts实例
                        var myChart = echarts.init(document.getElementById('main'));
                        // 指定图表的配置项和数据
                        option = {
                            title: {
                                text: '交易统计图表',
                                subtext: '纯属虚构'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c}%"
                            },
                            toolbox: {
                                feature: {
                                    dataView: {readOnly: false},
                                    restore: {},
                                    saveAsImage: {}
                                }
                            },

                            series: [
                                {
                                    name: '漏斗图',
                                    type: 'funnel',
                                    left: '10%',
                                    top: 60,
                                    //x2: 80,
                                    bottom: 60,
                                    width: '80%',
                                    // height: {totalHeight} - y - y2,
                                    min: 0,
                                    max: res.list.length,
                                    minSize: '0%',
                                    maxSize: '100%',
                                    sort: 'descending',
                                    gap: 2,
                                    label: {
                                        show: true,
                                        position: 'inside'
                                    },
                                    labelLine: {
                                        length: 10,
                                        lineStyle: {
                                            width: 1,
                                            type: 'solid'
                                        }
                                    },
                                    itemStyle: {
                                        borderColor: '#fff',
                                        borderWidth: 1
                                    },
                                    emphasis: {
                                        label: {
                                            fontSize: 20
                                        }
                                    },
                                    data: res.list
                                }
                            ]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);*/

                        //换个柱图
                        // 基于准备好的dom，初始化echarts实例
                        var myChart = echarts.init(document.getElementById('main'));
                        option = {
                            xAxis: {
                                type: 'category',
                                data: res.name
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [{
                                data: res.value,
                                type: 'bar'
                            }]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);


                    }else{
                        $("#main").val("暂无数据");
                    }
                },
                error:function () {
                    alert("error");
                }
            })




        })
    </script>
</head>
<body>
<body>
    <h3>交易统计图表</h3>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 1100px;height:400px; margin-top: auto"></div>
    <div id="main2" style="width: 600px;height:400px; margin-top: auto"></div>
</body>
</body>
</html>
