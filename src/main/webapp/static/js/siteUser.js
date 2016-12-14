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
var userChart = echarts.init(document.getElementById('userData'));
function tosearch(init_start_day) {
    var start_day="";
    if ($("#start_day").val()==undefined){
        start_day="";
    }else {
        start_day=$("#start_day").val();
    }
    if (init_start_day!=undefined){
        start_day=init_start_day;
    }
    $.ajax({
        type: "GET",
        url: "siteUser/querySiteUser",
        dataType: "json",
        data: "start_day="+start_day,
        success: function(msg){
            userChart.setOption({
                title: {
                    text: '站点员工统计',
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
                    data: msg.site_name
                },
                yAxis: {},
                series: [{
                    name: '员工数量',
                    type: 'bar',
                    data: msg.userCount
                }]
            });
            $("#siteUser").html(msg.userTotal);
        }
    });
}
//初始化加载数据
tosearch(firstDay,lastDay);





