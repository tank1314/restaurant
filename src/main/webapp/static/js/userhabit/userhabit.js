/**
 * Created by tankun on 2016/5/26.
 */
$(top.hangge());//关闭加载状态
var status = '';
$(function() {
    //日期框
    $('.date-picker').datepicker({
        format: "yyyy-mm",
        minViewMode: 1,
        autoclose: true,
        todayHighlight: true
    });
    var myDate = new Date();
    var year = myDate.getFullYear();
    var month = myDate.getMonth();
    if (month<10){
        month = "0"+month;
    }
    var firstDay =year+"年"+month+"月";
    $("span[name='currentData']").each(function() {
        $(this).text(firstDay);
    });
    // checkbox单项控制
    $('input[name=order_status]').click(function(event){
        var tar=this;
        $('input[name=order_status]').each(function(index,item){
            if(tar!=item)
                $(item).prop('checked',false);
        });
        status = $(this).val();
    });
});

function sexPercent(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/sexPercent",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                //$("#sexPercent").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'sexPercent',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('userNum')).color('sex').label('sex', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 10});
                    chart.render();
                }
                else{
                    $("#sexPercent").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#sexPercent").html("数据查询失败!");
            }
            else {
                $("#sexPercent").html(result.error_info);
            }
        }
    });
}
sexPercent();


function cityPercent(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/cityPercent",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                //$("#sexPercent").empty();
                if(result.result.length > 0){
                    console.log(111111);
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'cityPercent',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('cityNum')).color('cityName').label('cityName', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 10});
                    chart.render();
                }
                else{
                    $("#cityPercent").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#cityPercent").html("数据查询失败!");
            }
            else {
                $("#cityPercent").html(result.error_info);
            }
        }
    });
}
cityPercent();


function payPercent(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/payPercent",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                //$("#sexPercent").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'payPercent',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('payNum')).color('paySource').label('paySource', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 10});
                    chart.render();
                }
                else{
                    $("#payPercent").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#payPercent").html("数据查询失败!");
            }
            else {
                $("#payPercent").html(result.error_info);
            }
        }
    });
}
payPercent();


function terminalPercent(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/terminalPercent",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                //$("#sexPercent").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'terminalPercent',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('terminalNum')).color('orderSource').label('orderSource', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 10});
                    chart.render();
                }
                else{
                    $("#terminalPercent").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#terminalPercent").html("数据查询失败!");
            }
            else {
                $("#terminalPercent").html(result.error_info);
            }
        }
    });
}
terminalPercent();

function orderTypePercent(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/orderTypePercent",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                //$("#sexPercent").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'orderTypePercent',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('userNum')).color('orderType').label('orderType', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 10});
                    chart.render();
                }
                else{
                    $("#orderTypePercent").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#orderTypePercent").html("数据查询失败!");
            }
            else {
                $("#orderTypePercent").html(result.error_info);
            }
        }
    });
}
orderTypePercent();

function useFrequency(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    /*$.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/useFrequency",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            console.info(2222222222222);
            if (result.error_no == 0) {
                //$("#sexPercent").empty();
                if(result.result.length > 0){
                    console.log(111111);
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'useFrequency',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('ordercount')).color('totalPerson').label('totalPerson', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 10});
                    chart.render();
                }
                else{
                    $("#useFrequency").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#useFrequency").html("数据查询失败!");
            }
            else {
                $("#useFrequency").html(result.error_info);
            }
        }
    });*/
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/useFrequency",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                //var data = [{"ordercount":"1","totalPerson":"2"},{"ordercount":">=15","totalPerson":"2"}];
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'useFrequency',
                    width: 500,
                    height: 300,
                    plotCfg: {
                        margin: [20, 100, 60, 80]
                    }
                });
                var defs = {
                    'ordercount': {
                        alias: '订单数量'
                    },
                    'totalPerson': {
                        alias: '人数'
                    }
                };
                chart.source(result.result,defs);
                //chart.source(data,defs);
                chart.interval().position(Stat.summary.mean('ordercount*totalPerson')).color('ordercount');
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#useFrequency").html("数据查询失败!");
            }
            else {
                $("#useFrequency").html(result.error_info);
            }
        }
    });

}
useFrequency();

function addressCount(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    /*$.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/addressCount",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            console.info(2222222222222);
            if (result.error_no == 0) {
                //$("#sexPercent").empty();
                if(result.result.length > 0){
                    console.log(111111);
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'addressCount',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('addressCount')).color('addressPerson').label('addressPerson', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 10});
                    chart.render();
                }
                else{
                    $("#addressCount").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#addressCount").html("数据查询失败!");
            }
            else {
                $("#addressCount").html(result.error_info);
            }
        }
    });*/


    $.ajax({
        async : true,//异步
        type: "POST",
        url: "userHabit/addressCount",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'addressCount',
                    width: 500,
                    height: 300,
                    plotCfg: {
                        margin: [20, 100, 60, 80]
                    }
                });
                var defs = {
                    'addressCount': {
                        alias: '地址个数'
                    },
                    'addressPerson': {
                        alias: '人数'
                    }
                };
                chart.source(result.result,defs);
                chart.interval().position(Stat.summary.mean('addressCount*addressPerson')).color('addressCount');
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#addressCount").html("数据查询失败!");
            }
            else {
                $("#addressCount").html(result.error_info);
            }
        }
    });
}
addressCount();


/*

function queryOrderAllDataReport(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/queryOrderAllDataReport",
        dataType: "json",
        data: "order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#allOrderType").empty();
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'allOrderType',
                    width: 500,
                    height: 300
                });
                var defs = {
                    'start_day': {
                        alias: '日期'
                    },
                    'pclass1': {
                        alias: '商品分类'
                    },
                    'datacount': {
                        alias: '订单数量'
                    }
                };
                chart.source(result.result,defs);
                chart.line().position('start_day*datacount').color('pclass1').size(2);
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#allOrderType").html("数据查询失败!");
            }
            else {
                $("#allOrderType").html(result.error_info);
            }
        }
    });
}
queryOrderAllDataReport();

//单项数据查询
function queryOrderDxDataReport(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDataReport",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status+"&pclass1="+'01',
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#dxData").empty();
                if(result.result.lenght > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dxData',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('datacount')).color('product_name');
                    chart.render();
                }
                else{
                    $("#dxData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#dxData").html("数据查询失败!");
            }
            else {
                $("#dxData").html(result.error_info);
            }
        }
    });
}
queryOrderDxDataReport();

//转项数据查询
function queryOrderzxDataReport(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    if ($("#order_status").val()==undefined){
        order_status="";
    }else {
        order_status=$("#order_status").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDataReport",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status+"&pclass1="+'02',
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#zxData").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'zxData',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin:[10,20,20,30]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('datacount')).color('product_name');
                    chart.render();
                }
                else{
                    $("#zxData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#zxData").html("数据查询失败!");
            }
            else {
                $("#zxData").html(result.error_info);
            }
        }
    });
}
queryOrderzxDataReport();

//套餐数据查询
function queryOrdertcDataReport(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    if ($("#order_status").val()==undefined){
        order_status="";
    }else {
        order_status=$("#order_status").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDataReport",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status+"&pclass1="+'03',
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#tcData").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'tcData',
                        width: 500,
                        height: 300,
                        plotCfg: {
                            margin: [10, 10]
                        }
                    });
                    chart.source(result.result);
                    chart.legend('bottom');
                    chart.coord('theta', {
                        radius: 0.5,
                        inner: 0.5
                    });
                    chart.tooltip({
                        title: null
                    });
                    chart.intervalStack().position(Stat.summary.percent('datacount')).color('product_name');
                    chart.render();
                }
                else{
                    $("#tcData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#tcData").html("数据查询失败!");
            }
            else {
                $("#tcData").html(result.error_info);
            }
        }
    });
}
queryOrdertcDataReport();


*/
/**
 * 单项订单走势图
 *//*

function queryOrderdxzsDataReport(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    if ($("#order_status").val()==undefined){
        order_status="";
    }else {
        order_status=$("#order_status").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDetailDataReport",
        dataType: "json",
        data: "order_status="+order_status+"&pclass1="+'01',
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#dxzsData").html("");
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'dxzsData',
                    width: 500,
                    height: 300
                });
                var defs = {
                    'start_day': {
                        alias: '日期'
                    },
                    'pclass1': {
                        alias: '商品分类'
                    },
                    'datacount': {
                        alias: '订单数量'
                    }
                };
                chart.source(result.result,defs);
                chart.line().position('start_day*datacount').color('pclass1').size(2);
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#dxzsData").html("数据查询失败!");
            }
            else {
                $("#dxzsData").html(result.error_info);
            }
        }
    });
}
queryOrderdxzsDataReport();

*/
/**
 * 专项订单走势图
 *//*

function queryOrderzxzsDataReport(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    if ($("#order_status").val()==undefined){
        order_status="";
    }else {
        order_status=$("#order_status").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDetailDataReport",
        dataType: "json",
        data: "order_status="+order_status+"&pclass1="+'03',
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#zxzsData").html("");
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'zxzsData',
                    width: 500,
                    height: 300
                });
                var defs = {
                    'start_day': {
                        alias: '日期'
                    },
                    'pclass1': {
                        alias: '商品分类'
                    },
                    'datacount': {
                        alias: '订单数量'
                    }
                };
                chart.source(result.result,defs);
                chart.line().position('start_day*datacount').color('pclass1').size(2);
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#zxzsData").html("数据查询失败!");
            }
            else {
                $("#zxzsData").html(result.error_info);
            }
        }
    });
}
queryOrderzxzsDataReport();

*/
/**
 * 套餐订单走势图
 *//*

function queryOrdertczsDataReport(){
    var lastLoginEnd="";
    var order_status= "";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    if ($("#order_status").val()==undefined){
        order_status="";
    }else {
        order_status=$("#order_status").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDetailDataReport",
        dataType: "json",
        data: "order_status="+order_status+"&pclass1="+'02',
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#tczsData").html("");
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'tczsData',
                    width: 500,
                    height: 300
                });
                var defs = {
                    'start_day': {
                        alias: '日期'
                    },
                    'pclass1': {
                        alias: '商品分类'
                    },
                    'datacount': {
                        alias: '订单数量'
                    }
                };
                chart.source(result.result,defs);
                chart.line().position('start_day*datacount').color('pclass1').size(2);
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#tczsData").html("数据查询失败!");
            }
            else {
                $("#tczsData").html(result.error_info);
            }
        }
    });
}
queryOrdertczsDataReport();*/
