$(top.hangge());//关闭加载状态

$(function() {
    //日期框
    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    });
});

var myDate = new Date();
var year = myDate.getFullYear();
var month = myDate.getMonth()+1;
if (month<10){
    month = "0"+month;
}
var firstDay =year+"-"+month+"-01";

myDate = new Date(year,month,0);
var lastDay = year+"-"+month+"-"+myDate.getDate();


//站点服务订单统计
var siteChart = echarts.init(document.getElementById('siteData'));
function tosearch(init_start_day,init_end_day) {
    var start_day="";
    var end_day="";
    if ($("#start_day").val()==undefined){
        start_day="";
    }else {
        start_day=$("#start_day").val();
    }
    if ($("#end_day").val()==undefined){
        end_day="";
    }else {
        end_day=$("#end_day").val();
    }
    if (init_start_day!=undefined){
        start_day=init_start_day;
    }
    if (init_end_day!=undefined){
        end_day=init_end_day;
    }
    $.ajax({
        type: "GET",
        url: "dataCenter/querySiteData",
        dataType: "json",
        data: "start_day="+start_day+"&end_day="+end_day,
        success: function(msg){
            siteChart.setOption({
                title: {
                    text: '站点已服务订单',
                    x:'center'
                },
                tooltip: {},
                legend: {
                    data:[]
                },
                xAxis: {
                    type : 'category',
                    axisLabel:{
                        interval:0,
                        fontSize:120,
                        rotate:45,
                        margin:3,
                        textStyle:{
                            color:"#222"
                        }
                    },
                    data: msg.siteName
                },
                yAxis: {},
                series: [{
                    name: '订单量',
                    type: 'bar',
                    data: msg.orderCount
                }]
            });
        }
    });
}
//初始化加载数据
tosearch(firstDay,lastDay);


/*
//订单变化统计
var orderChangeChart = echarts.init(document.getElementById('orderChangeData'));
function orderToSearch(init_start_day,init_end_day) {
    var start_day="";
    var end_day="";
    if ($("#order_start_day").val()==undefined){
        start_day="";
    }else {
        start_day=$("#order_start_day").val();
    }
    if ($("#order_end_day").val()==undefined){
        end_day="";
    }else {
        end_day=$("#order_end_day").val();
    }
    if (init_start_day!=undefined){
        start_day=init_start_day;
    }
    if (init_end_day!=undefined){
        end_day=init_end_day;
    }
    $.ajax({
        type: "GET",
        url: "dataCenter/queryOrderChangeList",
        dataType: "json",
        data: "start_day="+start_day+"&end_day="+end_day,
        success: function(msg){
            orderChangeChart.setOption({
                title: {
                    text: '站点已服务订单',
                    x:'center'
                },
                tooltip: {},
                legend: {
                    data:[]
                },
                xAxis: {
                    type : 'category',
                    axisLabel:{
                        interval:0,
                        fontSize:120,
                        rotate:45,
                        margin:3,
                        textStyle:{
                            color:"#222"
                        }
                    },
                    data: msg.siteName
                },
                yAxis: {},
                series: [{
                    name: '订单量',
                    type: 'bar',
                    data: msg.orderCount
                }]
            });
        }
    });
}
//初始化加载数据
orderToSearch(firstDay,lastDay);
*/




//专项服务饼图
var serviceChart = echarts.init(document.getElementById('serviceData'));
function serviceSearch(init_service_start_day,init_service_end_day) {

    var service_start_day="";
    var service_end_day="";
    if ($("#service_start_day").val()==undefined){
        service_start_day="";
    }else {
        service_start_day=$("#service_start_day").val();
    }
    if ($("#service_end_day").val()==undefined){
        service_end_day="";
    }else {
        service_end_day=$("#service_end_day").val();
    }
    if (init_service_start_day!=undefined){
        service_start_day=init_service_start_day;
    }
    if (init_service_end_day!=undefined){
        service_end_day=init_service_end_day;
    }
    $.ajax({
        type: "GET",
        url: "dataCenter/queryServiceData",
        dataType: "json",
        data: "start_day="+service_start_day+"&end_day="+service_end_day+"&pclass=03",
        success: function(msg){
            serviceChart.setOption({
                title : {
                    text: '专项订单已服务统计'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                series : [
                    {
                        name: '',
                        type: 'pie',
                        radius : '55%',
                        center: ['45%', '45%'],
                        data:msg,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });
        }
    });
}
//初始化加载数据
serviceSearch(firstDay,lastDay);


//单项服务饼图
var simplyServiceChart = echarts.init(document.getElementById('simplyServiceData'));
function simplyServiceSearch(init_simply_service_start_day,init_simply_service_end_day) {

    var simply_service_start_day="";
    var simply_service_end_day="";
    if ($("#simply_service_start_day").val()==undefined){
        simply_service_start_day="";
    }else {
        simply_service_start_day=$("#simply_service_start_day").val();
    }
    if ($("#simply_service_end_day").val()==undefined){
        simply_service_end_day="";
    }else {
        simply_service_end_day=$("#simply_service_end_day").val();
    }
    if (init_simply_service_start_day!=undefined){
        simply_service_start_day=init_simply_service_start_day;
    }
    if (init_simply_service_end_day!=undefined){
        simply_service_end_day=init_simply_service_end_day;
    }
    $.ajax({
        type: "GET",
        url: "dataCenter/queryServiceData",
        dataType: "json",
        data: "start_day="+simply_service_start_day+"&end_day="+simply_service_end_day+"&pclass=02",
        success: function(msg){
            simplyServiceChart.setOption({
                title : {
                    text: '单项已服务统计'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                series : [
                    {
                        name: '',
                        type: 'pie',
                        radius : '55%',
                        center: ['45%', '45%'],
                        data:msg,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });
        }
    });
}
//初始化加载数据
simplyServiceSearch(firstDay,lastDay);

//套餐服务饼图
var packageServiceChart = echarts.init(document.getElementById('packageServiceData'));
function packageServiceSearch(init_package_service_start_day,init_package_service_end_day) {

    var package_service_start_day="";
    var package_service_end_day="";
    if ($("#package_service_start_day").val()==undefined){
        package_service_start_day="";
    }else {
        package_service_start_day=$("#package_service_start_day").val();
    }
    if ($("#package_service_end_day").val()==undefined){
        package_service_end_day="";
    }else {
        package_service_end_day=$("#package_service_end_day").val();
    }
    if (init_package_service_start_day!=undefined){
        package_service_start_day=init_package_service_start_day;
    }
    if (init_package_service_end_day!=undefined){
        package_service_end_day=init_package_service_end_day;
    }
    $.ajax({
        type: "GET",
        url: "dataCenter/queryServiceData",
        dataType: "json",
        data: "start_day="+package_service_start_day+"&end_day="+package_service_end_day+"&pclass=01",
        success: function(msg){
            packageServiceChart.setOption({
                title : {
                    text: '套餐已服务统计'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                series : [
                    {
                        name: '',
                        type: 'pie',
                        radius : '55%',
                        center: ['45%', '45%'],
                        data:msg,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });
        }
    });
}
//初始化加载数据
packageServiceSearch(firstDay,lastDay);


//各终端下单饼图
var terminalServiceChart = echarts.init(document.getElementById('terminalServiceData'));
function terminalServiceSearch(init_terminal_service_start_day,init_terminal_service_end_day) {

    var terminal_service_start_day="";
    var terminal_service_end_day="";
    if ($("#terminal_service_start_day").val()==undefined){
        terminal_service_start_day="";
    }else {
        terminal_service_start_day=$("#terminal_service_start_day").val();
    }
    if ($("#terminal_service_end_day").val()==undefined){
        terminal_service_end_day="";
    }else {
        terminal_service_end_day=$("#terminal_service_end_day").val();
    }
    if (init_terminal_service_start_day!=undefined){
        terminal_service_start_day=init_terminal_service_start_day;
    }
    if (init_terminal_service_end_day!=undefined){
        terminal_service_end_day=init_terminal_service_end_day;
    }
    $.ajax({
        type: "GET",
        url: "dataCenter/queryTerminalServiceData",
        dataType: "json",
        data: "start_day="+terminal_service_start_day+"&end_day="+terminal_service_end_day,
        success: function(msg){
            terminalServiceChart.setOption({
                title : {
                    text: '各终端下单统计'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{b} : {c} ({d}%)"
                },
                series : [
                    {
                        name: '',
                        type: 'pie',
                        radius : '55%',
                        center: ['45%', '45%'],
                        data:msg,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });
        }
    });
}
//初始化加载数据
terminalServiceSearch(firstDay,lastDay);

//上午,下午,晚上服务饼图
var timeServiceChart = echarts.init(document.getElementById('timeServiceData'));
function timeServiceSearch(init_time_service_start_day,init_time_service_end_day) {

    var time_service_start_day="";
    var time_service_end_day="";
    if ($("#time_service_start_day").val()==undefined){
        time_service_start_day="";
    }else {
        time_service_start_day=$("#time_service_start_day").val();
    }
    if ($("#time_service_end_day").val()==undefined){
        time_service_end_day="";
    }else {
        time_service_end_day=$("#time_service_end_day").val();
    }
    if (init_time_service_start_day!=undefined){
        time_service_start_day=init_time_service_start_day;
    }
    if (init_time_service_end_day!=undefined){
        time_service_end_day=init_time_service_end_day;
    }
    $.ajax({
        type: "GET",
        url: "dataCenter/queryTimeServiceData",
        dataType: "json",
        data: "start_day="+time_service_start_day+"&end_day="+time_service_end_day,
        success: function(msg){
            timeServiceChart.setOption({
                title : {
                    text: '各时间段下单统计'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a}<br/>{b} : {c} ({d}%)"
                },
                series : [
                    {
                        name: '',
                        type: 'pie',
                        radius : '55%',
                        center: ['45%', '45%'],
                        data:msg,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });
        }
    });
}
timeServiceSearch(firstDay,lastDay);

//倍率服务饼图
var rateServiceChart = echarts.init(document.getElementById('rateServiceData'));
function rateServiceSearch(init_rate_service_start_day,init_rate_service_end_day) {
    var rate_service_start_day="";
    var rate_service_end_day="";
    if ($("#rate_service_start_day").val()==undefined || $("#rate_service_start_day").val()==""){
        rate_service_start_day="";
    }else {
        rate_service_start_day=$("#rate_service_start_day").val();

    }
    if ($("#rate_service_end_day").val()==undefined  || $("#rate_service_end_day").val()==""){
        rate_service_end_day="";
    }else {
        rate_service_end_day=$("#rate_service_end_day").val();
    }
    if (init_rate_service_start_day!=undefined){
        rate_service_start_day=init_rate_service_start_day;
    }
    if (init_rate_service_start_day!=undefined){
        rate_service_end_day=init_rate_service_end_day;
    }

    $.ajax({
        type: "GET",
        url: "dataCenter/queryRateServiceData",
        dataType: "json",
        data: "start_day="+rate_service_start_day+"&end_day="+rate_service_end_day,
        success: function(msg){
            rateServiceChart.setOption({
                title : {
                    text: '订单倍率统计'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a}<br/>{b} : {c} ({d}%)"
                },
                series : [
                    {
                        name: '',
                        type: 'pie',
                        radius : '55%',
                        center: ['45%', '45%'],
                        data:msg,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });
        }
    });
}
//初始化加载数据
rateServiceSearch(firstDay,lastDay);



