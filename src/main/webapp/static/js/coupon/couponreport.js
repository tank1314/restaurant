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
    queryCoupon();
});

/**
 * 点击搜索按钮点击查询
 */
function queryCoupon(){
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
        url: "couponReport/queryCouponReport",
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
                $("#daysh").text('');
                $("#daysz").text('');
                $("#dayhz").text('');
                //月数据分析
                if(result.resultdaysh.length > 0){
                    $("#daysh").text('上海优惠券使用金额(元):【当月:'+result.currentSHMoney+'　比较月:'+result.preSHMoney+'】');
                    $("#dataInfosh").show();
                    var chart = new G2.Chart({
                        id: 'dataInfosh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'dayInfo': {
                            alias: '时间',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                        },
                        'day': {
                            alias: '日期'
                        },
                        'summoney': {
                            alias: '优惠券金额(上海)'
                        }
                    };
                    chart.source(result.resultdaysh[0],defs);
                    chart.line().position('dayInfo*summoney').color('day',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //深圳充值
                if(result.resultdaysz.length > 0){
                    $("#daysz").text('深圳优惠券使用金额(元):【当月:'+result.currentSZMoney+'　比较月:'+result.preSZMoney+'】');
                    $("#dataInfosz").show();

                    var chart = new G2.Chart({
                        id: 'dataInfosz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'dayInfo': {
                            alias: '时间',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                        },
                        'day': {
                            alias: '日期'
                        },
                        'summoney': {
                            alias: '优惠券金额(深圳)'
                        }
                    };

                    chart.source(result.resultdaysz[0], defs);
                    chart.line().position('dayInfo*summoney').color('day',['#FA9575','#F4E1AE']).size(2);
                    chart.render();
                }
                //充值杭州
                if(result.resultdayhz.length > 0){
                    $("#dayhz").text('杭州优惠券使用金额(元):【当月:'+result.currentHZMoney+'　比较月:'+result.preHZMoney+'】');
                    $("#dataInfohz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfohz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'dayInfo': {
                            alias: '时间',
                            type: 'cat',
                            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                        },
                        'day': {
                            alias: '日期'
                        },
                        'summoney': {
                            alias: '优惠券金额(杭州)'
                        }
                    };
                    chart.source(result.resultdayhz[0], defs);
                    chart.line().position('dayInfo*summoney').color('day',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
            }
            else if (result.error_no == -1) {
                $("#dataInfosh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);

            }
            else if (result.error_no == -3) {
                $("#dataInfosh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
            }
            else {
                $("#dataInfosh").show();
                $("#dataInfosh").html(result.error_info);
                $("#dataInfosz").html(result.error_info);
                $("#dataInfohz").html(result.error_info);
            }
        }
    });
}
