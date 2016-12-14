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
    <title>员工在离职状态数据分析</title>
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp"%>
    <!-- 日期框 -->
    <link rel="stylesheet" href="/static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
    <div class="main-container" id="main-container" style="padding: 5px;">
        <div style="margin-bottom: 10px">

        <form action="employeeReport/list" method="post" name="Form" id="Form">
            <table style="margin-top:5px; margin-left: 60px;">
                <tr>
                    <td style="vertical-align:top;padding-left:2px;">
                        <select class="chosen-select form-control" name="cityStr" id="cityStr" data-placeholder="城市选择分类" style="vertical-align:top;width: 90px;">
                            <option value="">全部</option>
                            <c:forEach items="${cityList}" var="city">
                                <option value="${city.city_id}">
                                    <c:if test="${city.city_id == 1}">上海市</c:if>
                                    <c:if test="${city.city_id == 2}">深圳市</c:if>
                                    <c:if test="${city.city_id == 3}">杭州市</c:if>
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                    <td style="padding-left:6px;">
                    <input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="日期" title="日期"/>
                    &nbsp;&nbsp;<font color="red">VS</font>&nbsp;&nbsp;    <input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="比对日期" title="比对日期"/>
                    </td>
                <td style="vertical-align:top;padding-left:6px"><a class="btn btn-light btn-xs" onclick="queryEmployee();"  title="查询"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                </tr>
            </table>
            <!-- 检索  -->
        </form>
        </div>
        <div class="col-sm-6_zdy">
            <div class="widget-box transparent" id="recent-box">
                <div class="widget-header">
                    <h4 class="widget-title lighter smaller">
                        <i class="ace-icon fa fa-rss orange"></i>员工在离职数据分析
                    </h4>

                    <div class="widget-toolbar no-border">
                        <ul class="nav nav-tabs" id="recent-tab">
                            <li class="active">
                                <a data-toggle="tab" href="#task-tab" aria-expanded="true">在职数据分析</a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" href="#member-tab" aria-expanded="false">离职数据分析</a>
                            </li>
                            <%--<li class="">
                                <a data-toggle="tab" href="#comment-tab" aria-expanded="false">消费占比</a>
                            </li>--%>
                        </ul>
                    </div>
                </div>

                <div class="widget-body">
                    <div class="widget-main padding-4">
                        <div class="tab-content padding-8">
                            <div id="task-tab" class="tab-pane active">
                                <%--<h4 class="smaller lighter green">
                                    <i class="ace-icon fa fa-list"></i>
                                    城市
                                </h4>--%>
                                <!-- #section:pages/dashboard.tasks -->
                                <ul id="tasks" class="item-list_zdy ui-sortable">
                                    <span id="daysh" ></span>
                                    <div id="dataInfojoinsh" style="display: none;"></div>
                                    <span id="daysz" ></span>
                                    <div id="dataInfojoinsz" style="display: none;"></div>
                                    <span id="dayhz" ></span>
                                    <div id="dataInfojoinhz" style="display: none;"></div>
                                </ul>
                                <!-- /section:pages/dashboard.tasks -->
                            </div>

                            <div id="member-tab" class="tab-pane">
                                <!-- #section:pages/dashboard.members -->
                                <%--<h4 class="smaller lighter green">
                                    <i class="ace-icon fa fa-list"></i>
                                    城市
                                </h4>--%>
                                <div class="clearfix">
                                    <div class="itemdiv zdy">
                                        <span id="day1sh"></span>
                                        <div id="dataInfoleavesh" style="display: none;"></div>
                                        <span id="day1sz"></span>
                                        <div id="dataInfoleavesz" style="display: none;"></div>
                                        <span id="day1hz"></span>
                                        <div id="dataInfoleavehz" style="display: none;"></div>
                                    </div>
                                </div>
                                <div class="hr hr8"></div>
                                <!-- /section:pages/dashboard.members -->
                            </div><!-- /.#member-tab -->
                            <div id="comment-tab" class="tab-pane">
                                    <%--<div class="itemdivzdy commentdiv">--%>
                                    <div class="itemdiv zdy">

                                        <div id="dataInfoxfsh" style="display: none;"></div>

                                        <div id="dataInfoxfsz" style="display: none;"></div>

                                        <div id="dataInfoxfhz" style="display: none;"><span></span></div>
                                    </div>
                                <div class="hr hr8"></div>
                                <!-- /section:pages/dashboard.comments -->
                            </div>
                        </div>
                    </div><!-- /.widget-main -->
                </div><!-- /.widget-body -->
            </div><!-- /.widget-box -->
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
    <script src="static/js/g2/index.js"></script>
    <%-- <script src="https://as.alipayobjects.com/g/datavis/g2/1.2.1/index.js"></script>--%>
    <!-- Ajax异步请求数据-->
    <script src="static/js/employystaff/employystaffReport.js"></script>
    <!-- Ajax异步请求数据-->

</body>

</html>
