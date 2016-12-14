/**
 * Created by tankun on 2016/5/26.
 */
$(top.hangge());//关闭加载状态
var status = '';
var resultstatus = '7';//返回结果状态
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

function currentAllPlatfromType(){
    var lastLoginEnd="";
    var order_status = status;
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "platformBusData/queryallmonethData",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&orderstatus="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                resultstatus = result.orderstatus;
                if('7'==resultstatus){
                    $("#order_status_wc").attr('checked',true);
                }
                if('-1'==resultstatus){
                    $("#order_status_yy").attr('checked',true);
                }
                if('8'==resultstatus){
                    $("#order_status_qx").attr('checked',true);
                }
                $("#currentAllPlatfromData").empty();
                if(result.result.length > 0){
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'currentAllPlatfromData',
                        width: 500,
                        height: 300
                    });
                    chart.source(result.result);
                    // 重要：绘制饼图时，必须声明 theta 坐标系
                    chart.coord('theta', {
                        radius: 0.8 // 设置饼图的大小
                    });
                    chart.legend('bottom');
                    chart.intervalStack()
                        .position(Stat.summary.percent('datacount'))
                        .color('ptname')
                        .label('ptname*..percent',function(name, percent){
                            percent = (percent * 100).toFixed(2) + '%';
                            return name + ' ' + percent;
                        });
                    chart.render();
                    // 设置默认选中
                    var geom = chart.getGeoms()[0]; // 获取所有的图形
                    var items = geom.getData(); // 获取图形对应的数据
                    geom.setSelected(items[0]); // 设置选中
                }
                else{
                    $("#currentAllPlatfromData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#currentAllPlatfromData").html("数据查询失败!");
            }
            else {
                $("#currentAllPlatfromData").html(result.error_info);
            }
        }
    });
}
currentAllPlatfromType();

//汇总走势图
function queryPlatFormAllDataReport(){
    var order_status =status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "platformBusData/queryPlatBuszsData",
        dataType: "json",
        data: "orderstatus="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                if(result.result.length > 0){
                    $("#allPlatForm").empty();
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'allPlatForm',
                        width: 500,
                        height: 300
                    });
                    var defs = {
                        'create_time': {
                            alias: '日期'
                        },
                        'ptname': {
                            alias: '业务分类'
                        },
                        'datacount': {
                            alias: '订单数量'
                        }
                    };
                    chart.source(result.result,defs);
                    chart.line().position('create_time*datacount').color('ptname').size(2);
                    chart.render();
                }
                else{
                    $("#allPlatForm").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#allPlatForm").html("数据查询失败!");
            }
            else {
                $("#allPlatForm").html(result.error_info);
            }
        }
    });
}
queryPlatFormAllDataReport();

//打车数据查询
function queryOrderDcDataReport(){
    var lastLoginEnd="";
    var order_status = status;
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "platformBusData/queryMydata",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&orderstatus="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#dcData").empty();
                if(result.result.length > 0){
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dcData',
                        width: 500,
                        height: 300
                    });
                    chart.source(result.result);
                    // 重要：绘制饼图时，必须声明 theta 坐标系
                    chart.coord('theta', {
                        radius: 0.8 // 设置饼图的大小
                    });
                    chart.legend('bottom');
                    chart.intervalStack()
                        .position(Stat.summary.percent('datacount'))
                        .color('type')
                        .label('type*..percent',function(name, percent){
                            percent = (percent * 100).toFixed(2) + '%';
                            return name + ' ' + percent;
                        });
                    chart.render();
                    // 设置默认选中
                    var geom = chart.getGeoms()[0]; // 获取所有的图形
                    var items = geom.getData(); // 获取图形对应的数据
                    geom.setSelected(items[0]); // 设置选中
                }
                else{
                    $("#dcData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#dcData").html("数据查询失败!");
            }
            else {
                $("#dcData").html(result.error_info);
            }
        }
    });
}
queryOrderDcDataReport();

//出行数据查询
function queryOrdercxDataReport(){
    var lastLoginEnd="";
    var order_status= status ;
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "platformBusData/queryLqdata",
        dataType: "json",
        data: "lastLoginEnd="+lastLoginEnd+"&orderstatus="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#cxData").empty();
                if(result.result.length > 0){
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'cxData',
                        width: 500,
                        height: 300
                    });
                    chart.source(result.result);
                    // 重要：绘制饼图时，必须声明 theta 坐标系
                    chart.coord('theta', {
                        radius: 0.8 // 设置饼图的大小
                    });
                    chart.legend('bottom');
                    chart.intervalStack()
                        .position(Stat.summary.percent('datacount'))
                        .color('type')
                        .label('type*..percent',function(name, percent){
                            percent = (percent * 100).toFixed(2) + '%';
                            return name + ' ' + percent;
                        });
                    chart.render();
                    // 设置默认选中
                    var geom = chart.getGeoms()[0]; // 获取所有的图形
                    var items = geom.getData(); // 获取图形对应的数据
                    geom.setSelected(items[0]); // 设置选中
                }
                else{
                    $("#cxData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#cxData").html("数据查询失败!");
            }
            else {
                $("#cxData").html(result.error_info);
            }
        }
    });
}
queryOrdercxDataReport();


/**
 * 打车订单走势图
 */
function queryOrderdczsDataReport(){
    var order_status= status;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "platformBusData/quereyMyzsData",
        dataType: "json",
        data: "orderstatus="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#dczsData").empty();
                if(result.result.length > 0){
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dczsData',
                        width: 500,
                        height: 300
                    });
                    var defs = {
                        'create_time': {
                            alias: '日期'
                        },
                        'ptname': {
                            alias: '业务分类'
                        },
                        'datacount': {
                            alias: '订单数量'
                        }
                    };
                    chart.source(result.result,defs);
                    chart.line().position('create_time*datacount').color('ptname').size(2);
                    chart.render();
                }
                else{
                    $("#dczsData").html("暂无数据...");
                }

            }
            else if (result.error_no == -1) {
                $("#dczsData").html("数据查询失败!");
            }
            else {
                $("#dczsData").html(result.error_info);
            }
        }
    });
}
queryOrderdczsDataReport();

/**
 * 出行订单走势图
 */
function queryOrdercxzsDataReport(){
    var order_status =status ;
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "platformBusData/quereylqzsData",
        dataType: "json",
        data: "orderstatus="+order_status,
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#cxzsData").empty();
                if(result.result.length > 0 ){
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'cxzsData',
                        width: 500,
                        height: 300
                    });
                    var defs = {
                        'create_time': {
                            alias: '日期'
                        },
                        'ptname': {
                            alias: '业务分类'
                        },
                        'datacount': {
                            alias: '订单数量'
                        }
                    };
                    chart.source(result.result,defs);
                    chart.line().position('create_time*datacount').color('ptname').size(2);
                    chart.render();
                }
                else{
                    $("#cxzsData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#cxzsData").html("数据查询失败!");
            }
            else {
                $("#cxzsData").html(result.error_info);
            }
        }
    });
}
queryOrdercxzsDataReport();