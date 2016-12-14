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

<html>
<head>
    <base href="<%=basePath%>">
    <title>用户偏好分析</title>
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp"%>
    <!-- 日期框 -->
    <link rel="stylesheet" href="/static/ace/css/datepicker.css" />
    <style>
        .data .divtitle{
            width: 98.5%;
            border: thin solid chartreuse;
            height: 45px;
            padding-top: 10px;
            padding-left: 10px;
            font-size:18px;
            font-weight:bold;
            background-color: #B4D5AC;
        }
        .data .divtitle span{
            font-size:12px;
        }
        .data .content{
            border: thin solid mistyrose;
            width: 98.5%;
            height: 350px;
            padding-left: 10px;
            padding-top: 20px;
        }
    </style>
</head>
<body class="no-skin">
    <div class="main-container" id="main-container" style="padding: 5px;">
        <div style="margin-bottom: 10px">
        </div>
        <div style="margin-top: 30px;"></div>
        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    男女比例
                </div>
                <div class="content" id="sexPercent">
                </div>
            </div>
            <div style="width:49%;float:left;">
                <div class="divtitle">
                   单人拥有房屋数量
                </div>
                <div class="content" id="addressCount">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    所属城市
                </div>
                <div class="content" id="cityPercent">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    地址更换次数
                </div>
                <div class="content" id="">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    用户活跃度
                </div>
                <div class="content" id="orderTypePercent">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    2016年使用频次
                </div>
                <div class="content" id="useFrequency">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    支付方式喜好
                </div>
                <div class="content" id="payPercent">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    使用终端统计
                </div>
                <div class="content" id="terminalPercent">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

    </div>
    <!-- 页面底部js¨ -->
    <%@ include file="../system/index/foot.jsp"%>
    <!-- ace scripts -->
    <script src="static/ace/js/ace/ace.js"></script>
    <!-- 下拉框 -->
    <script src="static/ace/js/chosen.jquery.js"></script>
    <!-- 日期框 -->
    <script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
    <!--  引人G2js -->
    <%--<script src="https://a.alipayobjects.com/alipay-request/3.0.3/index.js"></script>--%>
    <script src="static/js/g2/index.js"></script>
    <%-- <script src="https://as.alipayobjects.com/g/datavis/g2/1.2.1/index.js"></script>--%>
    <!-- Ajax异步请求数据-->
    <script src="static/js/userhabit/userhabit.js"></script>



</body>

</html>
