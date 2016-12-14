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
    <title>数据中心</title>
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp"%>
    <!-- 日期框 -->
    <link rel="stylesheet" href="/static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
    <div class="main-container" id="main-container">
        <div style="margin-bottom: 70px">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="siteData" style="width: 1200px;height:500px;"></div>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid #555555;" />

        <%--<div style="margin-bottom: 70px">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="order_start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="order_end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="orderToSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="orderChangeData" style="width: 1200px;height:500px;"></div>
        </div>
        <hr style="height:1px;border:none;border-top:1px solid #555555;" />
--%>


        <div style="float:left">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="service_start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="service_end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="serviceSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="serviceData" style="width: 500px;height:500px;"></div>
        </div>

        <div style="float:left">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="simply_service_start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="simply_service_end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="simplyServiceSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="simplyServiceData" style="width: 500px;height:500px;"></div>
        </div>

        <div style="float:left">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="package_service_start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="package_service_end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="packageServiceSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="packageServiceData" style="width: 500px;height:500px;"></div>
        </div>

        <div style="float:left">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="terminal_service_start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="terminal_service_end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="terminalServiceSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="terminalServiceData" style="width: 500px;height:500px;"></div>
        </div>

        <div style="float:left">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="time_service_start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="time_service_end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="timeServiceSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="timeServiceData" style="width: 500px;height:500px;"></div>
        </div>
        <div style="float:left">
            <form action="#" method="post" name="Form" id="Form">
                <table style="margin-top:5px;">
                    <tr>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="create_day" id="rate_service_start_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                        <td style="padding-left:2px;"><input class="span10 date-picker" name="end_day" id="rate_service_end_day"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="rateServiceSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                    </tr>
                </table>
                <!-- 检索  -->
            </form>
            <div id="rateServiceData" style="width: 500px;height:500px;"></div>
        </div>

    </div>
    <!-- 页面底部js¨ -->
    <%@ include file="../system/index/foot.jsp"%>
    <script src="static/js/echarts.min.js"></script>
    <!-- ace scripts -->
    <script src="static/ace/js/ace/ace.js"></script>
    <!-- 下拉框 -->
    <script src="static/ace/js/chosen.jquery.js"></script>
    <!-- 日期框 -->
    <script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>

    <script src="static/js/dataCenter.js"></script>



</body>

</html>
