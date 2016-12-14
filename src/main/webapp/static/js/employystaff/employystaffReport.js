/**
 * @param 员工在离职分析
 * Created by tankun on 2016/6/23.
 */
$(top.hangge());//关闭加载状态
$(function() {
    //日期框
    var currentDate = "";
    var compareDate ="";
    //初始化时 查询月数据
    $('.date-picker').datepicker({
        autoclose: true,
        forceParse: false,
        format:"yyyy",
        startView: 2,
        maxViewMode: 2,
        minViewMode:2,
        changeYear: true
    });
    $("select").each(function(i,n){
        var options = "";
        $(n).find("option").each(function(j,m){
            if(options.indexOf($(m)[0].outerHTML) == -1){
                options += $(m)[0].outerHTML;
            }});
        $(n).html(options);
    });
    queryEmployee();
});

function queryEmployee(){
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
        url: "employeeReport/queryEmployeeStatus",
        dataType: "json",
        data: "lastLoginStart=" + lastLoginStart + "&lastLoginEnd=" + lastLoginEnd + "&cityType=" + city,
        success: function (data) {
            var result = data.resultVo;
            currentDate = result.currentDate;
            compareDate = result.compareDate;
            $("#lastLoginStart").val(currentDate);
            $("#lastLoginEnd").val(compareDate);
            if (result.error_no == 0) {
                $("#dataInfojoinsh").empty();
                $("#dataInfojoinsz").empty();
                $("#dataInfojoinhz").empty();

                $("#dataInfoleavesh").empty();
                $("#dataInfoleavesz").empty();
                $("#dataInfoleavehz").empty();
                $("#daysh").text('');
                $("#daysz").text('');
                $("#dayhz").text('');
                $("#day1sh").text('');
                $("#day1sz").text('');
                $("#day1hz").text('');
                //在职
                if (result.resultjoinsh.length > 0) {
                    $("#daysh").text('上海在职人数:(当前年:'+result.joinshnum+'　比较日期:'+result.prejoinshnum+')');
                    $("#dataInfojoinsh").show();
                    var chart = new G2.Chart({
                        id: 'dataInfojoinsh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'rule': {
                            alias: '日期(月)',
                            type: 'cat',
                            values: ['01','02','03','04','05','06','07','08','09','10','11','12']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'dataCountInt': {
                            alias: '上海在职人数(人)'
                        }
                    };
                    chart.source(result.resultjoinsh[0], defs);
                    chart.line().position('rule*dataCountInt').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //深圳
                if (result.resultjoinsz.length > 0) {
                    $("#daysz").text('深圳在职人数:(当前年:'+result.joinsznum+'　比较日期:'+result.prejoinsznum+')');
                    $("#dataInfojoinsz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfojoinsz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'rule': {
                            alias: '日期(月)',
                            type: 'cat',
                            values: ['01','02','03','04','05','06','07','08','09','10','11','12']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'dataCountInt': {
                            alias: '深圳在职人数人)'
                        }
                    };
                    chart.source(result.resultjoinsz[0], defs);
                    chart.line().position('rule*dataCountInt').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //杭州
                if (result.resultjoinhz.length > 0) {
                    $("#dayhz").text('杭州在职人数:(当前年:'+result.joinhznum+'　比较日期:'+result.prejoinhznum+')');
                    $("#dataInfojoinhz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfojoinhz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'rule': {
                            alias: '日期(月)',
                            type: 'cat',
                            values: ['01','02','03','04','05','06','07','08','09','10','11','12']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'dataCountInt': {
                            alias: '杭州在职人数(人)'
                        }
                    };
                    chart.source(result.resultjoinhz[0], defs);
                    chart.line().position('rule*dataCountInt').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }

                //离职
                if (result.resultleavesh.length > 0) {
                    $("#day1sh").text('上海在职人数:(当前年:'+result.leaveshnum+'　比较日期:'+result.preleaveshnum+')');
                    $("#dataInfoleavesh").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoleavesh',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'rule': {
                            alias: '日期(月)',
                            type: 'cat',
                            values: ['01','02','03','04','05','06','07','08','09','10','11','12']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'dataCountInt': {
                            alias: '上海离职人数(人)'
                        }
                    };
                    chart.source(result.resultleavesh[0], defs);
                    chart.line().position('rule*dataCountInt').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //深圳
                if (result.resultleavesz.length > 0) {
                    $("#day1sz").text('深圳在职人数:(当前年:'+result.leavesznum+'　比较日期:'+result.preleavesznum+')');
                    $("#dataInfoleavesz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoleavesz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'rule': {
                            alias: '日期(月)',
                            type: 'cat',
                            values: ['01','02','03','04','05','06','07','08','09','10','11','12']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'dataCountInt': {
                            alias: '深圳离职人数(人)'
                        }
                    };
                    chart.source(result.resultleavesz[0], defs);
                    chart.line().position('rule*dataCountInt').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
                //杭州
                if (result.resultleavehz.length > 0) {
                    $("#day1hz").text('杭州在职人数:(当前年:'+result.leavehznum+'　比较日期:'+result.preleavehznum+')');
                    $("#dataInfoleavehz").show();
                    var chart = new G2.Chart({
                        id: 'dataInfoleavehz',
                        width: 1000,
                        height: 300
                    });
                    var defs = {
                        'rule': {
                            alias: '日期(月)',
                            type: 'cat',
                            values: ['01','02','03','04','05','06','07','08','09','10','11','12']
                        },
                        'dayInfo': {
                            alias: '日期'
                        },
                        'dataCountInt': {
                            alias: '杭州离职人数(人)'
                        }
                    };
                    chart.source(result.resultleavehz[0], defs);
                    chart.line().position('rule*dataCountInt').color('dayInfo',['#5ed470','#43b5d8']).size(2);
                    chart.render();
                }
            }
            else if (result.error_no == -1) {
                $("#dataInfojoinsh").show();
                $("#dataInfoleavesh").show();
                $("#dataInfojoinsh").html(result.error_info);
                $("#dataInfoleavesh").html(result.error_info);
            }
            else if (result.error_no == -3) {
                $("#dataInfojoinsh").show();
                $("#dataInfoleavesh").show();
                $("#dataInfojoinsh").html(result.error_info);
                $("#dataInfoleavesh").html(result.error_info);
            }
            else {
                $("#dataInfojoinsh").show();
                $("#dataInfoleavesh").show();
                $("#dataInfojoinsh").html(result.error_info);
                $("#dataInfoleavesh").html(result.error_info);
            }
        }
    });
}
