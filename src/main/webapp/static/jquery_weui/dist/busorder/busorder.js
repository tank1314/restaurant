/**
 * Created by tankun on 2016/6/14.
 */
$(function() {
    //日期框
    var currentDate = "";
    var compareDate ="";
    queryMonth();
});

function checkTime(){
    var choosetime = $('#choosetime option:selected').val();
    $("#lastLoginStart").val("");
    $("#lastLoginEnd").val("");
    if(1 == choosetime){
        $('.date-picker').datepicker('remove');
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        });
    }
    if( 2 == choosetime){
        $('.date-picker').datepicker('remove');
        $('.date-picker').datepicker({
            format: "yyyy-mm",
            minViewMode: 1,
            autoclose: true,
            todayHighlight: true
        });
    }
    if( 3 == choosetime){
        $('.date-picker').datepicker('remove');
        $('.date-picker').datepicker({
            autoclose: true,
            forceParse: false,
            format:"yyyy",
            startView: 2,
            maxViewMode: 2,
            minViewMode:2,
            changeYear: true,
            yearRange:"2014:2017"
        });
    }
}

/**
 * 点击搜索按钮点击查询
 */
function queryYMD(){
    var choosetimes = $('#choosetime option:selected').val();
    if( 1 == choosetimes){
        queryTime();
    }
    if( 2 == choosetimes){
        queryMonth();
    }
    if( 3 == choosetimes){
        queryYear();
    }
}



/**
 * 月数据
 *
 */
function queryMonth(){
    var lastLoginStart="";
    var lastLoginEnd ="";
    if ($("#lastLoginStart").val()==undefined){
        lastLoginStart="";
    }else {
        lastLoginStart=$("#lastLoginStart").val();
    }
    if ($("#lastLoginEnd").val()==undefined){
        lastLoginEnd="";
    }else {
        lastLoginEnd=$("#lastLoginEnd").val();
    }
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "app/queryCityData",
        dataType: "json",
        data: "lastLoginStart="+lastLoginStart+"&lastLoginEnd="+lastLoginEnd+"&dataType=2",
        success: function(data) {
            var result = data.resultVo;
            currentDate = result.currentDate;
            compareDate = result.compareDate;
            $("#lastLoginStart").val(currentDate);
            $("#lastLoginEnd").val(compareDate);
            if (result.error_no == 0) {
                console.log(1314224);
                $("#dataInfosh").empty();
                $("#dataInfosz").empty();
                $("#dataInfohz").empty();
                $("#dataInfoyysh").empty();
                $("#dataInfoyysz").empty();
                $("#dataInfoyyhz").empty();
                $("#dataInfoqxsh").empty();
                $("#dataInfoqxsz").empty();
                $("#dataInfoqxhz").empty();
                $("#fwwcsh").text('');
                $("#fwwcsz").text('');
                $("#fwwchz").text('');
                $("#yysh").text('');
                $("#yysz").text('');
                $("#yyhz").text('');
                $("#qxsh").text('');
                $("#qxsz").text('');
                $("#qxhz").text('');
                //服务完成 上海
                if(result.resultfwwcsh.length > 0){
                    $("#fwwcsh").text('上海订单量:(当前日期:'+result.fwwcSHData1+'　比较日期:'+result.fwwcSHData2);
                    $("#dataInfosh").show();
                    var chart = new G2.Chart({
                        id: 'dataInfosh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量（上海）'
                        }
                    };
                    var data = result.resultfwwcsh[0];
                    chart.source(data, defs);
                    chart.line().position('time*datacount').color('dayinfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //服务完成 深圳
                if(result.resultfwwcsz.length > 0){
                    $("#fwwcsz").text('深圳订单量:(当前日期:'+result.fwwcSZData1+'　比较日期:'+result.fwwcSZData2);
                    $("#dataInfosz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfosz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量（深圳）'
                        }
                    };
                    chart.source(result.resultfwwcsz[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#FA9575','#F4E1AE']).size(2);
                    chart.render();
                }
                //服务完成 杭州
                if(result.resultfwwchz.length > 0){
                    $("#fwwchz").text('杭州订单量:(当前日期:'+result.fwwcHZData1+'　比较日期:'+result.fwwcHZData2);
                    $("#dataInfohz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfohz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量(杭州)'
                        }
                    };
                    chart.source(result.resultfwwchz[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#A4E59C','#5A90F7']).size(2);
                    chart.render();
                }
                //预约订单 上海
                if(result.resultyysh.length > 0){
                    $("#yysh").text('上海订单量:(当前日期:'+result.yySHData1+'　比较日期:'+result.yySHData2);
                    $("#dataInfoyysh").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoyysh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量(上海)'
                        }
                    };
                    chart.source(result.resultyysh[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }

                //预约订单 深圳
                if(result.resultyysz.length > 0){
                    $("#yysz").text('深圳订单量:(当前日期:'+result.yySZData1+'　比较日期:'+result.yySZData2);
                    $("#dataInfoyysz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoyysz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量(深圳)'
                        }
                    };
                    chart.source(result.resultyysz[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#FA9575','#F4E1AE']).size(2);
                    chart.render();
                }
                //预约订单杭州
                if(result.resultyyhz.length > 0){
                    $("#yyhz").text('杭州订单量:(当前日期:'+result.yyHZData1+'　比较日期:'+result.yyHZData2);
                    $("#dataInfoyyhz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoyyhz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量(杭州)'
                        }
                    };
                    chart.source(result.resultyyhz[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#A4E59C','#5A90F7']).size(2);
                    chart.render();
                }
                /*else{
                    $("#yydataInfo").html("暂无数据...");
                }*/


                //取消订单 上海
                if(result.resultqxsh.length > 0){
                    $("#qxsh").text('上海订单量:(当前日期:'+result.qxSHData1+'　比较日期:'+result.qxSHData2);
                    $("#dataInfoqxsh").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoqxsh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量(上海)'
                        }
                    };
                    chart.source(result.resultqxsh[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //取消 深圳
                if(result.resultqxsz.length > 0){
                    $("#qxsz").text('深圳订单量:(当前日期:'+result.qxSZData1+'　比较日期:'+result.qxSZData2);
                    $("#dataInfoqxsz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoqxsz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量(深圳)'
                        }
                    };
                    chart.source(result.resultqxsz[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#FA9575','#F4E1AE']).size(2);
                    chart.render();
                }
                //取消 杭州
                if(result.resultqxhz.length > 0){
                    $("#qxhz").text('杭州订单量:(当前日期:'+result.qxHZData1+'　比较日期:'+result.qxHZData2);
                    $("#dataInfoqxhz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoqxhz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'time': {
                            alias: '日期(日)',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14','15','16','17','18','19','20',
                                '21','22','23','24','25','26','27','28','29','30','31']
                        },
                        'dayinfo': {
                            alias: '日期'
                        },
                        'datacount': {
                            alias: '订单量(杭州)'
                        }
                    };
                    chart.source(result.resultqxhz[0], defs);
                    chart.line().position('time*datacount').color('dayinfo',['#A4E59C','#5A90F7']).size(2);
                    chart.render();
                }
                /*else{
                    $("#qxdatainfo").html("暂无数据...");
                }*/
            }
            else if (result.error_no == -1) {
                $("#dataInfosh").show();
                $("#dataInfoyysh").show();
                $("#dataInfoqxsh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
                $("#dataInfoyysh").html(result.error_info);
                $("#dataInfoyysz").html(result.error_info);
                $("#dataInfoyyhz").html(result.error_info);
                $("#dataInfoqxsh").html(result.error_info);
                $("#dataInfoqxsz").html(result.error_info);
                $("#dataInfoqxhz").html(result.error_info);
            }
            else if (result.error_no == -3) {
                $("#dataInfosh").show();
                $("#dataInfoyysh").show();
                $("#dataInfoqxsh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
                $("#dataInfoyysh").html(result.error_info);
                $("#dataInfoyysz").html(result.error_info);
                $("#dataInfoyyhz").html(result.error_info);
                $("#dataInfoqxsh").html(result.error_info);
                $("#dataInfoqxsz").html(result.error_info);
                $("#dataInfoqxhz").html(result.error_info);
            }
            else {
                $("#dataInfosh").show();
                $("#dataInfoyysh").show();
                $("#dataInfoqxsh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
                $("#dataInfoyysh").html(result.error_info);
                $("#dataInfoyysz").html(result.error_info);
                $("#dataInfoyyhz").html(result.error_info);
                $("#dataInfoqxsh").html(result.error_info);
                $("#dataInfoqxsz").html(result.error_info);
                $("#dataInfoqxhz").html(result.error_info);
            }
        }
    });
}
