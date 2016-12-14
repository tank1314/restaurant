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
<!DOCTYPE html>
<html lang="en">
<head>
  <base href="<%=basePath%>">
  <title>牛家帮订单数据分析</title>
  <meta charset="en">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="description" content="牛家帮、家政服务、家政、出行、洗衣、跑腿">
  <link rel="stylesheet" href="static/jquery_weui/dist/lib/weui.min.css">
  <link rel="stylesheet" href="static/jquery_weui/dist/css/jquery-weui.css">
  <link rel="stylesheet" href="static/jquery_weui/dist/demos/css/demos.css">
</head>

<body ontouchstart>
<header class="demos-header">
  <h1 class="demos-title">订单数据分析</h1>
</header>
<div class="weui_tab">
    <div class="weui_navbar">
        <a href="#tab1" class="weui_navbar_item weui_bar_item_on">
            服务完成
        </a>
        <a href="#tab2" class="weui_navbar_item">
            预约订单
        </a>
        <a href="#tab3" class="weui_navbar_item">
            取消订单
        </a>
    </div>
    <div class="weui_tab_bd">
        <div id="tab1" class="weui_tab_bd_item weui_tab_bd_item_active">
        <section>
            <h3>1.1 节标题</h3>
            <div class="widget-body">
                <div class="widget-main padding-4">
                    <div class="tab-content padding-8">
                        <ul id="tasks" class="item-list_zdy ui-sortable">
                            <span id="fwwcsh" ></span>
                            <div id="dataInfosh" style="display: none;"></div>
                            <span id="fwwcsz" ></span>
                            <div id="dataInfosz" style="display: none;"></div>
                            <span id="fwwchz" ></span>
                            <div id="dataInfohz" style="display: none;">33</div>
                        </ul>
                        </div>
                    </div>
                </div>
        </section>
        </div>
        <div id="tab2" class="weui_tab_bd_item">
            <section>
                <h3>预约订单</h3>
                <div class="itemdiv zdy">
                    <span id="yysh" ></span>
                    <div id="dataInfoyysh" style="display: none;"></div>
                    <span id="yysz" ></span>
                    <div id="dataInfoyysz" style="display: none;"></div>
                    <span id="yyhz" ></span>
                    <div id="dataInfoyyhz" style="display: none;"></div>
                </div>
            </section>
        </div>
        <div id="tab3" class="weui_tab_bd_item">
            <h3>取消订单</h3>
            <div class="itemdivzdy commentdiv">
                <span id="qxsh" ></span>
                <div id="dataInfoqxsh" style="display: none;"></div>
                <span id="qxsz" ></span>
                <div id="dataInfoqxsz" style="display: none;"></div>
                <span id="qxhz" ></span>
                <div id="dataInfoqxhz" style="display: none;"><span>杭州</span></div>
            </div>
        </div>
    </div>
</div>
<script src="static/jquery_weui/dist/lib/jquery-2.1.4.js"></script>
<script src="static/jquery_weui/dist/js/jquery-weui.js"></script>
<script src="static/js/g2/index.js"></script>
<%--<script src="static/jquery_weui/dist/busorder/busorder.js"></script>--%>
<script type="text/javascript">
    var a = ${pd.currentDate} ;
    alert(a);
    console.log(${pd.currentDate});
</script>
</body>
</html>
