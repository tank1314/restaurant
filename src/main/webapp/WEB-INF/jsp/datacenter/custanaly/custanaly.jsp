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
    <title>用户行为习惯分析</title>
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp"%>
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
        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    国籍分析&nbsp;&nbsp;&nbsp;<a class="grey" id="show-option" style="text-decoration: none;" href="javascript:void(0);" title="国籍数据分析(中国、外国)"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="foreignData">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    宠物分类&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="宠物分类"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="petData">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    用户年龄段分析&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="按年龄段分析牛家帮用户"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="userAgeData">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    其他成员组成&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="按牛家帮用户的家庭成员年龄段分析"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="familyData">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    婚姻情况&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="用户婚否统计"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="mariaData">
                </div>
            </div>
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    是否有孕妇&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="是否有孕妇统计"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="pregantData">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    是否有老人&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="老人数量统计"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="has_old_Data">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>


        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    房屋面积和预定时间对比&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="房屋面积与技师服务时长分析"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="areaAndTime">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    房屋面积&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="牛家帮用户房屋面积组成"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="hourseArea">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>
        <div class="data" style="width:90%;;margin:0 auto; display: none;" id="commonHourseType">
            <div style="width:100%;float:left;">
                <div class="divtitle">
                    户型(常见)组成分析&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="牛家帮用户房屋户型组成(>=10的为常见户型)"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="hourseTypeData">
                </div>
            </div>
        </div>
        <div style="margin-top: 30px;"></div>
        <div class="data" style="width:90%;;margin:0 auto; display: none;" id="lessHourseType">
            <div style="width:100%;float:left;">
                <div class="divtitle">
                    户型(其他)组成分析&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="牛家帮用户房屋户型组成(<10的为稀少户型)"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="hourseTypeLessData">
                </div>
            </div>
        </div>
        <div style="margin-top: 30px;"></div>


    </div>
    <!-- 页面底部js¨ -->
    <%@ include file="../../system/index/foot.jsp"%>
    <!-- ace scripts -->
    <script src="static/ace/js/ace/ace.js"></script>
    <!-- 下拉框 -->
    <script src="static/ace/js/chosen.jquery.js"></script>
    <!-- 日期框 -->
    <script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
    <!--  引人G2js -->
    <%--<script src="https://a.alipayobjects.com/alipay-request/3.0.3/index.js"></script>--%>
    <script src="static/js/g2/index.js"></script>
<%--    <script src="static/js/g2/jquery.js"></script>--%>
    <%-- <script src="https://as.alipayobjects.com/g/datavis/g2/1.2.1/index.js"></script>--%>
    <!-- Ajax异步请求数据-->
    <script src="static/js/custanaly/custanaly.js"></script>



</body>

</html>
