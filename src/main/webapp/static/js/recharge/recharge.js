/**
 * Created by tankun on 2016/6/14.
 */
$(top.hangge());//关闭加载状态
$(function() {
    //日期框
    var currentDate = "";
    var compareDate ="";
    //初始化时 查询月数据
    $('.date-picker').datepicker({
        format: "yyyy-mm",
        minViewMode: 1,
        autoclose: true,
        todayHighlight: true
    });
    $("select").each(function(i,n){
        var options = "";
        $(n).find("option").each(function(j,m){
        if(options.indexOf($(m)[0].outerHTML) == -1){
        options += $(m)[0].outerHTML;
    }});
        $(n).html(options);
    });
    queryCity();
    queryConsum();
});

function queryConsum(){
    var city = $('#cityStr option:selected').val();
    if (city==undefined){
        city="";
    }
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
        async: true,//异步
        type: "POST",
        url: "rechargeReportData/queryCityConsum",
        dataType: "json",
        data: "lastLoginStart=" + lastLoginStart + "&lastLoginEnd=" + lastLoginEnd + "&cityType=" + city,
        success: function (data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                $("#dataInfoxfsh").empty();
                $("#dataInfoxfsz").empty();
                $("#dataInfoxfhz").empty();
                $("#contentczDiv").hide();
                if(result.SHData.length > 0 ){
                    $("#dataInfoxfsh").show();
                    $('<div style="position: absolute;width: 100px;top: 250px;left: 450px;text-align: center;color: #999;"><p style="font-size:14px;font-weight:bold;">上海消费数据</p>').appendTo('#dataInfoxfsh');
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dataInfoxfsh',
                        width: 400,
                        height: 300,
                        plotCfg: {
                            margin: [20, 100, 80, 80]
                        }
                    });
                    var defs = {
                        'use_channel': {
                            alias: '消费渠道'
                        }
                    };
                    chart.source(result.SHData,defs, {
                        '..percent': {max: 1,min: 0}
                    });
                    chart.coord('polar').transpose();
                    chart.intervalStack().position(Stat.summary.percent('dayinfo*xfje')).color('use_channel');
                    chart.render();
                    var data = result.SHData ;
                    var html = '<table id="simple-table1" class="table table-striped table-bordered table-hover" style="width: 50%;overflow-y: scroll;"><thead><tr>'+
                        '<th class="center" style="width:80px;">日期</th>'+
                        '<th class="center" style="width:50px;">渠道</th>'+
                        '<th class="center">金额</th>'+
                        '</tr>'+
                        '</thead>';
                    html+= '<tbody style="overflow-y: scroll;">';
                    for(var i = 0 ;i<data.length ;i++){
                        html+='<tr>' +
                            '<td class="ceneter">'+data[i].dayinfo+'</td>' +
                            '<td class="ceneter">'+data[i].use_channel+'</td>' +
                            '<td class="ceneter">'+data[i].xfje+'</td></tr>';
                    }
                    html+='</tbody></table>';
                    $('<div style="position: absolute;width: 600px;top: 1px;left: 600px;text-align: center;color: #999;">' +
                        '<p style="font-size:10px;font-weight:bold;">'+html+'</p>').appendTo('#dataInfoxfsh');
                }

                if(result.SZData.length > 0 ){
                    $("#dataInfoxfsz").show();
                    $('<div style="position: absolute;width: 100px;top: 540px;left: 450px;text-align: center;color: #999;"><p style="font-size:14px;font-weight:bold;">深圳消费数据</p>').appendTo('#dataInfoxfsz');
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dataInfoxfsz',
                        width: 400,
                        height: 300,
                        plotCfg: {
                            margin: [20, 100, 80, 80]
                        }
                    });
                    var defs = {
                        'use_channel': {
                            alias: '消费渠道'
                        }
                    };
                    chart.source(result.SZData,defs, {
                        '..percent': {max: 1,min: 0}
                    });
                    chart.coord('polar').transpose();
                    chart.intervalStack().position(Stat.summary.percent('dayinfo*xfje')).color('use_channel');
                    chart.render();
                    var data = result.SZData ;
                    var html = '<table id="simple-table1" class="table table-striped table-bordered table-hover" style="width: 50%"><thead><tr>'+
                        '<th class="center" style="width:80px;">日期</th>'+
                        '<th class="center" style="width:50px;">渠道</th>'+
                        '<th class="center">金额</th>'+
                        '</tr>'+
                        '</thead>';
                    html+= '<tbody style="overflow-y: scroll;">';
                    for(var i = 0 ;i<data.length ;i++){
                        html+='<tr>' +
                            '<td class="ceneter">'+data[i].dayinfo+'</td>' +
                            '<td class="ceneter">'+data[i].use_channel+'</td>' +
                            '<td class="ceneter">'+data[i].xfje+'</td></tr>';
                    }
                    html+='</tbody></table>';
                    $('<div style="position: absolute;width: 600px;top: 330px;left: 600px;text-align: center;color: #999;">' +
                        '<p style="font-size:10px;font-weight:bold;">'+html+'</p>').appendTo('#dataInfoxfsz');
                }
                if(result.HZData.length > 0 ){
                    $("#dataInfoxfhz").show();
                    $('<div style="position: absolute;width: 100px;top: 840px;left: 450px;text-align: center;color: #999;"><p style="font-size:14px;font-weight:bold;">杭州消费数据</p>').appendTo('#dataInfoxfhz');
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dataInfoxfhz',
                        width: 400,
                        height: 300,
                        plotCfg: {
                            margin: [20, 100, 80, 80]
                        }
                    });
                    var defs = {
                        'use_channel': {
                            alias: '消费渠道'
                        }
                    };
                    chart.source(result.HZData,defs, {
                        '..percent': {max: 1,min: 0}
                    });
                    chart.coord('polar').transpose();
                    chart.intervalStack().position(Stat.summary.percent('dayinfo*xfje')).color('use_channel');
                    chart.render();
                    var data = result.HZData ;
                    var html = '<table id="simple-table1" class="table table-striped table-bordered table-hover" style="width: 50%"><thead><tr>'+
                        '<th class="center" style="width:80px;">日期</th>'+
                        '<th class="center" style="width:50px;">渠道</th>'+
                        '<th class="center">金额</th>'+
                        '</tr>'+
                        '</thead>';
                    html+= '<tbody style="overflow-y: scroll;">';
                    for(var i = 0 ;i<data.length ;i++){
                        html+='<tr>' +
                            '<td class="ceneter">'+data[i].dayinfo+'</td>' +
                            '<td class="ceneter">'+data[i].use_channel+'</td>' +
                            '<td class="ceneter">'+data[i].xfje+'</td></tr>';
                    }
                    html+='</tbody></table>';
                    $('<div style="position: absolute;width: 600px;top: 630px;left: 600px;text-align: center;color: #999;">' +
                        '<p style="font-size:10px;font-weight:bold;">'+html+'</p>').appendTo('#dataInfoxfhz');
                }
            }
            else if (result.error_no == -1) {
                $("#dataInfoxfsh").show();
                $("#dataInfoxfsz").show();
                $("#dataInfoxfhz").show();
                $("#dataInfoxfsh").html(result.error_info);
                $("#dataInfoxfsz").html(result.error_info);
                $("#dataInfoxfhz").html(result.error_info);
            }
            else if (result.error_no == -3) {
                $("#dataInfoxfsh").show();
                $("#dataInfoxfsz").show();
                $("#dataInfoxfhz").show();
                $("#dataInfoxfsh").html(result.error_info);
                $("#dataInfoxfsz").html(result.error_info);
                $("#dataInfoxfhz").html(result.error_info);
            }
            else {
                $("#dataInfoxfsh").show();
                $("#dataInfoxfsz").show();
                $("#dataInfoxfhz").show();
                $("#dataInfoxfsh").html(result.error_info);
                $("#dataInfoxfsz").html(result.error_info);
                $("#dataInfoxfhz").html(result.error_info);
            }
        }
    });
}
/**
 * 点击搜索按钮点击查询
 */
function queryCity(){
    var city = $('#cityStr option:selected').val();
    if (city==undefined){
        city="";
    }
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
        url: "rechargeReportData/queryRechargeData",
        dataType: "json",
        data: "lastLoginStart="+lastLoginStart+"&lastLoginEnd="+lastLoginEnd+"&cityType="+city,
        success: function(data) {
            var result = data.resultVo;
            currentDate = result.currentDate;
            compareDate = result.compareDate;
            $("#lastLoginStart").val(currentDate);
            $("#lastLoginEnd").val(compareDate);
            if (result.error_no == 0) {
                $("#dataInfosh").empty();
                $("#dataInfosz").empty();
                $("#dataInfohz").empty();
                $("#dataInfomoneysh").empty();
                $("#dataInfomoneysz").empty();
                $("#dataInfomoneyhz").empty();
                $("#daysh").text('');
                $("#daysz").text('');
                $("#dayhz").text('');
                $("#contentczDiv").hide();
                console.log(131421);
                //月数据分析
                if(result.resultdaysh.length > 0){
                    $("#contentczDiv").show();
                    $("#contentczDiv").text('【当前日期:'+result.currentMoneyData+' ; 比较日期:'+result.preMoneyData+'】');
                    $("#daysh").text('上海充值总金额:(当月:'+result.daySHData1+'　比较月:'+result.daySHData2+') | 充值剩余总金额: '+result.shrechargeMoney+' 元,赠送剩余总金额:'+result.shgiveMoney+' 元');
                    $("#dataInfosh").show();
                    var chart = new G2.Chart({
                        id: 'dataInfosh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'kd': {
                            alias: '时间',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'doubledata': {
                            alias: '充值金额(上海)'
                        }
                    };
                    chart.source(result.resultdaysh[0], defs);
                    chart.line().position('kd*doubledata').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //深圳充值
                if(result.resultdaysz.length > 0){
                    $("#daysz").text('深圳充值总金额:(当月:'+result.daySZData1+'　比较月:'+result.daySZData2+') | 充值剩余总金额: '+result.szrechargeMoney+' 元,赠送剩余总金额:'+result.szgiveMoney+' 元');
                    $("#dataInfosz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfosz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'kd': {
                            alias: '时间',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'doubledata': {
                            alias: '充值金额(深圳)'
                        }
                    };
                    chart.source(result.resultdaysz[0], defs);
                    chart.line().position('kd*doubledata').color('dayInfo',['#FA9575','#F4E1AE']).size(2);
                    chart.render();
                }
                //充值杭州
                if(result.resultdayhz.length > 0){
                    $("#dayhz").text('杭州充值总金额:(当月:'+result.dayHZData1+'　比较月:'+result.dayHZData2+') | 充值剩余总金额: '+result.hzrechargeMoney+' 元,赠送剩余总金额:'+result.hzgiveMoney+' 元');
                    $("#dataInfohz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfohz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'kd': {
                            alias: '时间',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'doubledata': {
                            alias: '充值金额(杭州)'
                        }
                    };
                    chart.source(result.resultdayhz[0], defs);
                    chart.line().position('kd*doubledata').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }

                //充值金额梯度
                if(result.resulttdsh.length > 0){
                    $("#dataInfomoneysh").show();
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dataInfomoneysh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'kd': {
                            alias: '充值金额梯度',
                            type: 'cat',
                            values: ['1', '2~99', '100~199', '200~299', '300~399', '400~499',
                                '500~599', '600~699', '700~999', '1000~1999', '2000~2999', '>=3000']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'intdata': {
                            alias: '数据量(上海)'
                        }
                    };
                    chart.source(result.resulttdsh[0],defs);
                    chart.intervalDodge().position(Stat.summary.mean('kd*intdata')).color('dayInfo');
                    chart.render();

                }
                //深圳
                if(result.resulttdsz.length > 0){
                    $("#dataInfomoneysz").show();
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dataInfomoneysz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'kd': {
                            alias: '充值金额梯度',
                            type: 'cat',
                            values: ['1', '2~99', '100~199', '200~299', '300~399', '400~499',
                                '500~599', '600~699', '700~999', '1000~1999', '2000~2999', '>=3000']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'intdata': {
                            alias: '数据量(深圳)'
                        }
                    };
                    chart.source(result.resulttdsz[0],defs);
                    chart.intervalDodge().position(Stat.summary.mean('kd*intdata')).color('dayInfo',['#FA9575','#F4E1AE']);
                    chart.render();
                    /*chart.source(result.resulttdsz[0], defs);
                    chart.line().position('kd*intdata').color('dayInfo',['#FA9575','#F4E1AE']).size(2);
                    chart.render();*/
                }
                //预约杭州
                if(result.resulttdhz.length > 0){
                    $("#dataInfomoneyhz").show();
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'dataInfomoneyhz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'kd': {
                            alias: '充值金额梯度',
                            type: 'cat',
                            values: ['1', '2~99', '100~199', '200~299', '300~399', '400~499',
                                '500~599', '600~699', '700~999', '1000~1999', '2000~2999', '>=3000']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'intdata': {
                            alias: '数据量(杭州)'
                        }
                    };
                    chart.source(result.resulttdhz[0],defs);
                    chart.intervalDodge().position(Stat.summary.mean('kd*intdata')).color('dayInfo',['#5ed470','#43b5d8']);
                    chart.render();
                    /*chart.source(result.resulttdhz[0], defs);
                    chart.line().position('kd*intdata').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();*/
                }
            }
            else if (result.error_no == -1) {
                $("#dataInfosh").show();
                $("#dataInfomoneysh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
                $("#dataInfomoneysh").html(result.error_info);
                $("#dataInfomoneysz").html(result.error_info);
                $("#dataInfomoneyhz").html(result.error_info);

            }
            else if (result.error_no == -3) {
                $("#dataInfosh").show();
                $("#dataInfomoneysh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
                $("#dataInfomoneysh").html(result.error_info);
                $("#dataInfomoneysz").html(result.error_info);
                $("#dataInfomoneyhz").html(result.error_info);
            }
            else {
                $("#dataInfosh").show();
                $("#dataInfomoneysh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
                $("#dataInfomoneysh").html(result.error_info);
                $("#dataInfomoneysz").html(result.error_info);
                $("#dataInfomoneyhz").html(result.error_info);
            }
        }
    });
}
