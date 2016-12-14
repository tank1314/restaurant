<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>折线、多边形、圆</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://webapi.amap.com/maps?v=1.3&key=您申请的key值"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <base href="<%=basePath%>">
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp"%>
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/ace/css/datepicker.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp"%>
</head>
<body>
<div id="container"></div>
<!-- 页面底部js¨ -->
<%@ include file="../system/index/foot.jsp"%>
<script>

    $(top.hangge());//关闭加载状态

    var map = new AMap.Map('container', {
        resizeEnable: true,
        center: ["121.4460751171","31.3238081400"],
        zoom: 10
    });


    map.plugin(['AMap.ToolBar'], function () {
        //设置地位标记为自定义标记
        var toolBar = new AMap.ToolBar();
        map.addControl(toolBar);
    });
    infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});

    function tosearch() {
        map.clearMap();
        $.ajax({
            url:"siteDistribution/querySiteDistributionList",
            type:'post',
            dataType:'json',
            success:function(data) {
                for(var k in data){
                    if (data[k].distribute_type==1){
                        var circle = new AMap.Circle({
                            center: new AMap.LngLat(data[k].LOG, data[k].LOT),// 圆心位置
                            radius: data[k].service_distance, //半径
                            strokeColor: "#F33", //线颜色
                            strokeOpacity:1, //线透明度
                            strokeWeight: 1, //线粗细度
                            fillColor: "#1791fc", //填充颜色
                            fillOpacity: 0.35//填充透明度
                        });
                        circle.setMap(map);
                    }else{
                        var polygonArr = new Array();//多边形覆盖物节点坐标数组
                        var polygon_array=data[k].polygon.split(";");
                        console.log(polygon_array);
                        for(var i=0; i<polygon_array.length; i++){

                            polygonArr.push(polygon_array[i].split(","));
                        }
                        var  polygon = new AMap.Polygon({
                            path: polygonArr,//设置多边形边界路径
                            strokeColor: "#F33", //线颜色
                            strokeOpacity: 1, //线透明度
                            strokeWeight: 1,    //线宽
                            fillColor: "#1791fc", //填充色
                            fillOpacity: 0.35//填充透明度
                        });
                        polygon.setMap(map);
                    }

                    var marker = new AMap.Marker({
                        position: [data[k].LOG, data[k].LOT],
                        map: map
                    });
                    marker.content = ' <div>站点名称:  ' + data[k].SITE_NAME + '</div><div>联系方式:  ' + data[k].SITE_PHONE + '</div><div>门店地址:  ' + data[k].SITEADDRESS + '</div>';
                    marker.on('click', markerClick);
                    marker.emit('click', {target: marker});

                }


            },
            error:function(){
                alert(2);
            }
        });
    }
    //初始化的时候使用
    tosearch();


    function markerClick(e){
        infoWindow.setContent(e.target.content);
        infoWindow.open(map, e.target.getPosition());
    }


</script>
</body>
</html>