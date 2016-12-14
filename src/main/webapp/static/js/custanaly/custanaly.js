/**
 * 用户行为习惯数据分析
 * add by tan.kun@niuhome.com*/
$(top.hangge());//关闭加载状态
//用户国籍数据分析
function searchForeign() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryforeignData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                function formatter(text,item){
                    var point = item.point; // 每个弧度对应的点
                    var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                    percent = (percent * 100).toFixed(2) + '%';
                    return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    /*percent = (percent * 100).toFixed(2) + '%';
                    return percent;*/
                }
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'foreignData',
                    width: 300,
                    height: 300,
                    plotCfg: {
                        margin: [10, 10]
                    }
                });
                chart.facet(['nation']);
                chart.source(result.result);
                chart.legend('bottom');
                chart.coord('theta', {
                    radius: 0.7,
                    inner: 0.6
                });
                chart.tooltip({
                    title: null
                });
                chart.intervalStack().position(Stat.summary.percent('datacount')).color('is_foreign').label('is_foreign', { custom: true,
                    renderer: formatter,
                    labelLine: false,
                    offset: 10});
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#foreignData").html("数据查询失败!");
            }
            else {
                $("#foreignData").html(result.error_info);
            }
        }
    });
}
searchForeign();

//宠物数据分析
function searchPet() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryPetData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                function formatter(text,item){
                    var point = item.point; // 每个弧度对应的点
                    var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                    percent = (percent * 100).toFixed(2) + '%';
                    return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                    /*percent = (percent * 100).toFixed(2) + '%';
                     return percent;*/
                }
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'petData',
                    width: 300,
                    height: 300,
                    plotCfg: {
                        margin: [10, 10]
                    }
                });
                //chart.facet(['nation']);
                chart.source(result.result);
                chart.legend('bottom');
                chart.coord('theta', {
                    radius: 0.7,
                    inner: 0.6
                });
                chart.tooltip({
                    title: null
                });
                chart.intervalStack().position(Stat.summary.percent('datacount')).color('pet').label('pet', { custom: true,
                    renderer: formatter,
                    labelLine: false,
                    offset: 20});
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#petData").html("数据查询失败!");
            }
            else {
                $("#petData").html(result.error_info);
            }
        }
    });
}
searchPet();

//用户年龄数据分析
function searchUserAge() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryUserAgeData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'userAgeData',
                    width: 500,
                    height: 300,
                    plotCfg: {
                        margin: [20, 100, 60, 80]
                    }
                });
                var defs = {
                    'age': {
                        alias: '年龄'
                    },
                    'datacount': {
                        alias: '数据量'
                    }
                };
                chart.source(result.result,defs);
                chart.interval().position(Stat.summary.mean('age*datacount')).color('age');
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#userAgeData").html("数据查询失败!");
            }
            else {
                $("#userAgeData").html(result.error_info);
            }
        }
    });
}
searchUserAge();


//用户家庭成员分析
function searchFamily() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryFamilyData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'familyData',
                    width: 500,
                    height: 300,
                    plotCfg: {
                        margin: [20, 100, 60, 80]
                    }
                });
                var defs = {
                    'family': {
                        alias: '成员年龄'
                    },
                    'datacount': {
                        alias: '数据量'
                    }
                };
                chart.source(result.result,defs);
                chart.interval().position(Stat.summary.mean('family*datacount')).color('family');
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#familyData").html("数据查询失败!");
            }
            else {
                $("#familyData").html(result.error_info);
            }
        }
    });
}
searchFamily();


//婚姻状况数据分析
function searchMarriaData() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryMariaData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                function formatter(text,item){
                    var point = item.point; // 每个弧度对应的点
                    var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                    percent = (percent * 100).toFixed(2) + '%';
                    return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                }
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'mariaData',
                    width: 300,
                    height: 300,
                    plotCfg: {
                        margin: [10, 10]
                    }
                });
                var defs = {
                    'marriage': {
                        alias: '婚姻'
                    },
                    'datacount': {
                        alias: '数据量'
                    }
                };
                chart.source(result.result,defs);
                chart.legend('bottom');
                chart.coord('theta', {
                    radius: 0.7,
                    inner: 0.6
                });
                chart.tooltip({
                    title: null
                });

                chart.intervalStack().position(Stat.summary.percent('datacount')).color('marriage').label('marriage', { custom: true,
                    renderer: formatter,
                    labelLine: false,
                    offset: 60});
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#mariaData").html("数据查询失败!");
            }
            else {
                $("#mariaData").html(result.error_info);
            }
        }
    });
}
searchMarriaData();



//户型组成分析常见
function searchHourseTypeData() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryhourseTypeData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                if(result.result.length > 0){
                    $("#commonHourseType").show();
                    var Stat = G2.Stat;
                    var chart = new G2.Chart({
                        id: 'hourseTypeData',
                        width: 1000,
                        height: 300,
                        plotCfg: {
                            margin: [20, 10, 60, 80]
                        }
                    });
                    var defs = {
                        'type': {
                            alias: '户型'
                        },
                        'datacount': {
                            alias: '数据量'
                        }
                    };
                    chart.source(result.result,defs);
                    chart.interval().position(Stat.summary.mean('type*datacount')).color('type');
                    chart.render();
                }
                else{
                    $("#commonHourseType").hide();
                }

            }
            else if (result.error_no == -1) {
                $("#commonHourseType").show();
                $("#hourseTypeData").html("数据查询失败!");
            }
            else {
                $("#commonHourseType").show();
                $("#hourseTypeData").html(result.error_info);
            }
        }
    });
}
searchHourseTypeData();



//户型组成分析稀少
function searchHourseTypeLessData() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryhourseTypeLessData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                if(result.result.length > 0){
                    $("#lessHourseType").show();
                    var data = result.result;
                    var html = '<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">' +
                        '<thead>' +
                        '<tr><th class="center">户型名称</th>' +
                        '<th class="center">数据</th></tr></thead>';
                    for(var i = 0 ;i<data.length;i++){
                        var dataRow = data[i];
                        html+='<tr><td class="center">'+dataRow["type"]+'</td><td class="center">'+dataRow["datacount"]+'</td></tr>';
                    }
                    $("#hourseTypeLessData").html(html+'<table>');
                }
                else{
                    $("#lessHourseType").hide();
                    $("#hourseTypeLessData").html("暂无数据...");
                }
            }
            else if (result.error_no == -1) {
                $("#lessHourseType").show();
                $("#hourseTypeLessData").html("数据查询失败!");
            }
            else {
                $("#lessHourseType").show();
                $("#hourseTypeLessData").html(result.error_info);
            }
        }
    });
}
searchHourseTypeLessData();


//房屋面积分析
function queryhourseAreaData() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryhourseAreaData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'hourseArea',
                    width: 500,
                    height: 300,
                    plotCfg: {
                        margin: [20, 100, 60, 80]
                    }
                });
                var defs = {
                    'area': {
                        alias: '房屋面积'
                    },
                    'datacount': {
                        alias: '数据量'
                    }
                };
                chart.source(result.result,defs);
                chart.interval().position(Stat.summary.mean('area*datacount')).color('area');
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#hourseArea").html("数据查询失败!");
            }
            else {
                $("#hourseArea").html(result.error_info);
            }
        }
    });
}
queryhourseAreaData();


//房屋面积与预定时间对比
function queryAreaAndTimeData() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryAreaAndTimeData",
        dataType: "json",
        data: "",
        success: function(data) {
            var result = data.resultVo;
            if (result.error_no == 0) {
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'areaAndTime',
                    width: 600,
                    height: 300,
                    plotCfg: {
                        margin: [20, 100, 60, 80]
                    }
                });
                var defs = {
                    'area': {
                        alias: '房屋面积'
                    },
                    'datacount': {
                        alias: '数据量'
                    },
                    'time': {
                        alias: '用时'
                    }
                };
                chart.source(result.result,defs);
                chart.intervalDodge().position(Stat.summary.mean('area*datacount')).color('time');
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#areaAndTime").html("数据查询失败!");
            }
            else {
                $("#areaAndTime").html(result.error_info);
            }
        }
    });
}
queryAreaAndTimeData();

//孕妇情况分析
function searchpregnatData() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryHasPregnant",
        dataType: "json",
        data: "",
        success: function(data) {
            //alert(data);
            var result = data.resultVo;
            if (result.error_no == 0) {
                function formatter(text,item){
                    var point = item.point; // 每个弧度对应的点
                    var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                    percent = (percent * 100).toFixed(2) + '%';
                    return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                }
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'pregantData',
                    width: 250,
                    height: 250,
                    plotCfg: {
                        margin: [10, 10]
                    }
                });
                var defs = {
                    'is_has_pregnant': {
                        alias: '是否有孕妇'
                    },
                    'datacount': {
                        alias: '数据量'
                    }
                };
                chart.source(result.result,defs);
                chart.legend('bottom');
                chart.coord('theta', {
                    radius: 0.7,
                    inner: 0.6
                });
                chart.tooltip({
                    title: null
                });

                chart.intervalStack().position(Stat.summary.percent('datacount')).color('is_has_pregnant').label('is_has_pregnant', { custom: true,
                    renderer: formatter,
                    labelLine: false,
                    offset: 60});
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#pregantData").html("数据查询失败!");
            }
            else {
                $("#pregantData").html(result.error_info);
            }
        }
    });
}
searchpregnatData();



//孕妇情况分析
function searchHasOldData() {
    $.ajax({
        async : true,//异步
        type: "POST",
        url: "custAnalyData/queryHasOlder",
        dataType: "json",
        data: "",
        success: function(data) {
            //alert(data);
            var result = data.resultVo;
            if (result.error_no == 0) {

                function formatter(text,item){
                    var point = item.point; // 每个弧度对应的点
                    var percent = point['..percent']; // ..proportion 字段由Stat.summary.proportion统计函数生成
                    percent = (percent * 100).toFixed(2) + '%';
                    return '<span class="title">' + text + '</span><br><span style="color:' + point.color + '">' + percent + '</span>';
                }
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'has_old_Data',
                    width: 250,
                    height: 250,
                    plotCfg: {
                        margin: [10, 10]
                    }
                });
                var defs = {
                    'is_has_older': {
                        alias: '是否有老人'
                    },
                    'datacount': {
                        alias: '数据量'
                    }
                };
                chart.source(result.result,defs);
                chart.legend('bottom');
                chart.coord('theta', {
                    radius: 0.7,
                    inner: 0.6
                });
                chart.tooltip({
                    title: null
                });

                chart.intervalStack().position(Stat.summary.percent('datacount')).color('is_has_older').label('is_has_older', { custom: true,
                    renderer: formatter,
                    labelLine: false,
                    offset: 60});
                chart.render();
            }
            else if (result.error_no == -1) {
                $("#pregantData").html("数据查询失败!");
            }
            else {
                $("#pregantData").html(result.error_info);
            }
        }
    });
}
searchHasOldData();



