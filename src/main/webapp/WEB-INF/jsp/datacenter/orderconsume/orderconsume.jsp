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
    <title>消费总览数据分析</title>
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
        <form action="#" method="post" name="Form" id="Form">
            <table style="margin-top:25px; margin-left: 60px;">
                <tr>
                    <th class="center">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace" name="order_status" id="order_status_wc" value="7"  <c:if test="${pd.order_status == 7 and pd.order_status !=''}">checked="checked"</c:if>  /><span class="lbl">服务完成</span>
                        </label>
                    </th>
                    <th class="center">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace" name="order_status" id="order_status_yy" value="-1" <c:if test="${pd.order_status== '-1' and pd.order_status !=''}">checked="checked"</c:if> /><span class="lbl">预约订单</span>
                        </label>
                    </th>
                    <th class="center">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace" name="order_status" id="order_status_qx" value="0" <c:if test="${pd.order_status == 0 and pd.order_status !=''}">checked="checked"</c:if> /><span class="lbl">取消订单</span>
                        </label>
                    </th>
                    <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                    <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="currentAllOrderType();queryOrderAllDataReport();queryOrderDxDataReport();queryOrderzxDataReport();queryOrdertcDataReport();queryOrderdxzsDataReport();queryOrderzxzsDataReport();queryOrdertczsDataReport();queryOrdertStatuszsDataReport();orderStatusType();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                </tr>
            </table>
            <!-- 检索  -->
        </form>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    订单状态占比&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="订单状态(服务完成/预约订单/取消订单)"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="orderStatusData">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    订单状态走势图&nbsp;&nbsp;(截止到<span name="currentData"></span>)
                </div>
                <div class="content" id="orderStatusDatazs">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>


        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    商品分类&nbsp;&nbsp;[单项 专项 套餐]&nbsp;&nbsp;&nbsp;<a class="grey" style="text-decoration: none;" href="javascript:void(0);" title="订单分类组成"><i class="ace-icon fa fa-hand-o-right"></i></a>
                </div>
                <div class="content" id="currentAllOrderType">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    近期各商品分类下单走势&nbsp;&nbsp;(截止到<span name="currentData"></span>)
                </div>
                <div class="content" id="allOrderType">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    单项(分类)
                </div>
                <div class="content" id="dxData">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    近期单项订单走势图&nbsp;&nbsp;(截止到<span name="currentData"></span>)
                </div>
                <div class="content" id="dxzsData">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    专项(分类)
                </div>
                <div class="content" id="zxData">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    近期专项订单走势图&nbsp;&nbsp;(截止到<span name="currentData"></span>)
                </div>
                <div class="content" id="zxzsData">
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="margin-top: 30px;"></div>

        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="divtitle">
                    套餐(分类)
                </div>
                <div class="content" id="tcData">
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="divtitle">
                    近期套餐订单走势图&nbsp;&nbsp;(截止到<span name="currentData"></span>)
                </div>
                <div class="content" id="tczsData">
                </div>
            </div>
            <div style="clear:both;"></div>
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
    <%-- <script src="https://as.alipayobjects.com/g/datavis/g2/1.2.1/index.js"></script>--%>
    <!-- Ajax异步请求数据-->
    <script src="static/js/orderconsume/orderconsume.js"></script>



</body>

</html>
