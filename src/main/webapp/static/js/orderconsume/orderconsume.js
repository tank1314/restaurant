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
        if($(this).is(':checked')){
            status = $(this).val();
        }
        else{
            status = "";
        }
    });
});

function currentAllOrderType(){
    var lastLoginEnd="";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/queryCurrentAllTypeData",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#currentAllOrderType").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'currentAllOrderType',
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
                    chart.intervalStack().position(Stat.summary.percent('datacount')).color('pclass1').label('pclass1', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 50});
                    chart.render();
                }
                else{
                    $("#currentAllOrderType").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#currentAllOrderType").html("数据查询失败!");
            }
            else {
                $("#currentAllOrderType").html(result.error_info);
            }
        }
    });
}
currentAllOrderType();

function queryOrderAllDataReport(){
    var lastLoginEnd="";
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
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status+"&pclass1="+'02',
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#dxData").empty();
                if(result.result.length > 0){
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
        data: "lastLoginEnd="+lastLoginEnd+"&order_status="+order_status+"&pclass1="+'03',
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


/**
 * 单项订单走势图
 */
function queryOrderdxzsDataReport(){
    var lastLoginEnd="";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDetailDataReport",
        dataType: "json",
        data: "order_status="+order_status+"&pclass1="+'02',
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

/**
 * 专项订单走势图
 */
function queryOrderzxzsDataReport(){
    var lastLoginEnd="";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
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

/**
 * 套餐订单走势图
 */
function queryOrdertczsDataReport(){
    var lastLoginEnd="";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/orderTypeDetailDataReport",
        dataType: "json",
        data: "order_status="+order_status+"&pclass1="+'01',
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
queryOrdertczsDataReport();








/**
 * 套餐订单走势图
 */
function queryOrdertStatuszsDataReport(){
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/queryOrderZsData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#orderStatusDatazs").empty();
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'orderStatusDatazs',
                    width: 500,
                    height: 300
                });
                var defs = {
                    'time': {
                        alias: '日期'
                    },
                    'remark': {
                        alias: '订单状态'
                    },
                    'datacount': {
                        alias: '订单数量'
                    }
                };
                chart.source(result.result,defs);
                chart.line().position('time*datacount').color('remark').size(2);
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#orderStatusDatazs").html("数据查询失败!");
            }
            else {
                $("#orderStatusDatazs").html(result.error_info);
            }
        }
    });
}
queryOrdertStatuszsDataReport();

//当月订单状态占比
function orderStatusType(){
    var lastLoginEnd="";
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    var order_status = status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "orderConsumeData/queryOrderByStatus",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#orderStatusData").empty();
                if(result.result.length > 0){
                    function formatter(text,item){
                        var point = item.point; // 每个弧度对应的点
                        var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                        percent = (percent * 100).toFixed(2) + '%';
                        return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    }
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'orderStatusData',
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
                    chart.intervalStack().position(Stat.summary.percent('datacount')).color('remark').label('remark', { custom: true,
                        renderer: formatter,
                        labelLine: false,
                        offset: 50});
                    chart.render();
                }
                else{
                    $("#orderStatusData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#orderStatusData").html("数据查询失败!");
            }
            else {
                $("#orderStatusData").html(result.error_info);
            }
        }
    });
}
orderStatusType();