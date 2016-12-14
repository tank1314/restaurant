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
    <title>加盟商各个城市数据分析</title>
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
        <table id="simple-table1Report" class="table">
            <tr align="center">
                <td><h4>城市数据分析</h4></td>
            </tr>
        </table>
        <form action="busorderreportData/list" method="post" name="Form" id="Form">
            <table style="margin-top:5px; margin-left: 60px;">
                <tr>
                    <td style="vertical-align:top;padding-left:2px;">
                        <select class="chosen-select form-control" onchange="checkTime();" name="choosetime" id="choosetime" data-placeholder="日期选择分类" style="vertical-align:top;width: 90px;">
                            <option value="1">日</option>
                            <option value="2" selected>月</option>
                            <option value="3">年</option>
                        </select>
                    </td>
                    <td style="padding-left:6px;">
                    <input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="日期" title="日期"/>
                    &nbsp;&nbsp;<font color="red">VS</font>&nbsp;&nbsp;    <input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="比对日期" title="比对日期"/>
                    </td>
                    &nbsp;&nbsp;&nbsp;
                    <td style="vertical-align:top;padding-left:2px;">
                        <select class="chosen-select form-control" onchange="chooseBus();" name="city_id" id="city_id" data-placeholder="请选择查询城市" style="vertical-align:top;width: 140px;">
                            <option value=""></option>
                            <option value="">全部</option>
                            <c:forEach items="${cityList}" var="city">
                                <option value="${city.city_id}" <c:if test="${city.city_id == pd.city_id}">selected</c:if>>
                                    <c:if test="${city.city_id == 1}">上海</c:if>
                                    <c:if test="${city.city_id == 2}">深圳</c:if>
                                    <c:if test="${city.city_id == 3}">杭州</c:if>
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                    <div id="hidden_site" style="display: none;">
                        <select class="chosen-select form-control" name="hidden_sid" id="hidden_sid" data-placeholder="请选择查询区域" style="vertical-align:top;width: 140px;">
                            <c:forEach items="${districtList}" var="dis">
                                <option value="${dis.distractid}" cityids = "${dis.city}">${dis.disname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <td style="vertical-align:top;padding-left:2px;">
                        <select class="chosen-select form-control" name="distractid" id="distractid" data-placeholder="请选择查询区域" style="vertical-align:top;width: 140px;">
                            <option value=""></option>
                            <option value="">--请选择区域--</option>
                            <%--<c:forEach items="${districtList}" var="dis">
                                <option value="${dis.distractid}" <c:if test="${dis.distractid ==pd.distractid}">selected</c:if>>${dis.disname}</option>
                            </c:forEach>--%>
                        </select>
                    </td>



                <td style="vertical-align:top;padding-left:6px"><a class="btn btn-light btn-xs" onclick="queryYMD();"  title="查询"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                </tr>
            </table>
            <!-- 检索  -->
        </form>
        </div>
        <div class="col-sm-6_zdy">
            <div class="widget-box transparent" id="recent-box">
                <div class="widget-header">
                    <h4 class="widget-title lighter smaller">
                        <i class="ace-icon fa fa-rss orange"></i>城市运营数据分析
                        <span style="display: none;color: orangered;font-family: cursive; padding: 10px;" id="contentfwwcDiv"></span>
                        <span style="display: none; color: orangered;font-family: cursive; padding: 10px;" id="contentyyDiv"></span>
                        <span style="display: none; color: orangered;font-family: cursive; padding: 10px;" id="contentcancelDiv"></span>
                    </h4>

                    <div class="widget-toolbar no-border">
                        <ul class="nav nav-tabs" id="recent-tab">
                            <li class="active" id="fwwcDiv">
                                <a data-toggle="tab" href="#task-tab" aria-expanded="true">服务完成</a>
                            </li>

                            <li class="" id="yyDiv">
                                <a data-toggle="tab" href="#member-tab" aria-expanded="false">预约订单</a>
                            </li>

                            <li class="" id="cancelDiv">
                                <a data-toggle="tab" href="#comment-tab" aria-expanded="false">取消订单</a>
                            </li>
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
                                    <div id="dataInfo" style="">
                                        <center><img src="/static/images/loading_data.gif" width="300px"></center>
                                    </div>
                                    <span id="fwwcsh" ></span>
                                    <div id="dataInfosh" style="display: none;">
                                    </div>
                                    <span id="fwwcsz" ></span>
                                    <div id="dataInfosz" style="display: none;"></div>
                                    <span id="fwwchz" ></span>
                                    <div id="dataInfohz" style="display: none;"></div>
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
                                        <div id="dataInfoyy" style="display: none;"></div>
                                        <span id="yysh" ></span>
                                        <div id="dataInfoyysh" style="display: none;"></div>
                                        <span id="yysz" ></span>
                                        <div id="dataInfoyysz" style="display: none;"></div>
                                        <span id="yyhz" ></span>
                                        <div id="dataInfoyyhz" style="display: none;"></div>
                                    </div>
                                </div>
                                <div class="hr hr8"></div>
                                <!-- /section:pages/dashboard.members -->
                            </div><!-- /.#member-tab -->

                            <div id="comment-tab" class="tab-pane">
                                        <div class="itemdivzdy commentdiv">
                                            <div id="dataInfoqx" style="display: none;"></div>
                                            <span id="qxsh" ></span>
                                            <div id="dataInfoqxsh" style="display: none;"></div>
                                            <span id="qxsz" ></span>
                                            <div id="dataInfoqxsz" style="display: none;"></div>
                                            <span id="qxhz" ></span>
                                            <div id="dataInfoqxhz" style="display: none;"><span>杭州</span></div>
                                        </div>
                                    <%--</div>--%>
                                <%--</div>--%>
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
    <script src="static/js/busorder/busorder.js"></script>
    <!-- Ajax异步请求数据-->
    <script type="text/javascript">
        $(function() {
            $(" #recent-tab li").bind("click", function() {
                var id = $(this).attr("id");
                $("span[id^='content']").hide();
                $("#content" + id).show();
            });

            //下拉去从
            $("select").each(function(i,n){
                var options = "";
                $(n).find("option").each(function(j,m){
                    if(options.indexOf($(m)[0].outerHTML) == -1){
                        options += $(m)[0].outerHTML;
                    }});
                $(n).html(options);
            });

            //下拉框
            if(!ace.vars['touch']) {
                $('.chosen-select').chosen({allow_single_deselect:true});
                $(window)
                        .off('resize.chosen')
                        .on('resize.chosen', function() {
                            $('.chosen-select').each(function() {
                                var $this = $(this);
                                $this.next().css({'width': $this.parent().width()});
                            });
                        }).trigger('resize.chosen');
                $(document).on('settings.ace.chosen', function(e, event_name, event_val) {
                    if(event_name != 'sidebar_collapsed') return;
                    $('.chosen-select').each(function() {
                        var $this = $(this);
                        $this.next().css({'width': $this.parent().width()});
                    });
                });
                $('#chosen-multiple-style .btn').on('click', function(e){
                    var target = $(this).find('input[type=radio]');
                    var which = parseInt(target.val());
                    if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
                    else $('#form-field-select-4').removeClass('tag-input-style');
                });
            }
        });

        //商户下拉选择
        function chooseBus(){
            //首先需要对站点清空
            $("#distractid").html("");
            $("#distractid").chosen("destroy");
            var city_id = $("#city_id").val();//当前商户id
            var sitehtml = '<option value="">请选择查询区域</option>';
            var select=document.getElementById('hidden_sid');//将当前用户所有的站点列出
            for(var i=0;i<select.length;i++) {
                if(select.options[i].getAttribute("cityids")==city_id){
                    sitehtml+='<option value='+select.options[i].value+'>'+select.options[i].text+'</option>';
                }
            }
            $("#distractid").html(sitehtml);
            $("#distractid").trigger("liszt:updated");
            $("#distractid").chosen();
        }

    </script>

</body>

</html>
