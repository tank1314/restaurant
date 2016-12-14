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
</head>
<body class="no-skin">
<div class="page-content">
    <!-- #section:settings.box -->
    <!-- /section:settings.box -->
    <div class="page-header">
        <form class="form-search" action="niuhome_data/list" method="post" name="Form" id="Form">
            <table style="margin-top:5px; margin-left: 60px;">
                <tr>
                    <td style="vertical-align:top;padding-left:2px;">
                        <select class="chosen-select form-control" name="choosetime" onchange="checkTime();" id="choosetime" data-placeholder="日期选择分类" style="vertical-align:top;width: 90px;">
                            <option value="2" <c:if test="${pd.choosetime == 2}">selected</c:if>>月</option>
                            <option value="3" <c:if test="${pd.choosetime == 3}">selected</c:if>>年</option>
                        </select>
                    </td>

                    <td style="padding-left:6px;">
                        <input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="日期" title="日期"/>
                    </td>
                    <td style="vertical-align:top;padding-left:2px;">
                        <select class="chosen-select form-control" name="cityStr" id="cityStr" data-placeholder="城市选择分类" style="vertical-align:top;width: 90px;">
                            <option value="">全部</option>
                            <c:forEach items="${cityList}" var="city">
                                <option value="${city.city_id}" <c:if test="${city.city_id == pd.cityStr}">selected</c:if>>
                                    <c:if test="${city.city_id == 1}">上海市</c:if>
                                    <c:if test="${city.city_id == 2}">深圳市</c:if>
                                    <c:if test="${city.city_id == 3}">杭州市</c:if>
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                    &nbsp;&nbsp;
                    <td style="vertical-align:top;padding-left:6px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="查询"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                </tr>
            </table>
        </form>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
                <div class="space-6"></div>

                <div class="col-sm-7 infobox-container">
                    <!-- #section:pages/dashboard.infobox -->
                    <div class="infobox infobox-green">
                        <div class="infobox-data">
                            <span class="infobox-data-number">服务完成订单数</span>
                            <div class="infobox-content">${pd.fwwcCount}</div>
                        </div>
                    </div>
                    <div class="infobox infobox-blue">
                        <div class="infobox-data">
                            <span class="infobox-data-number">预约订单数</span>
                            <div class="infobox-content">${pd.yyCount}</div>
                        </div>
                    </div>

                    <div class="infobox infobox-pink">
                        <div class="infobox-data">
                            <span class="infobox-data-number">充值金额</span>
                            <div class="infobox-content">${pd.czmoney}</div>
                        </div>
                    </div>

                    <div class="infobox infobox-red">
                        <div class="infobox-data">
                            <span class="infobox-data-number">销售额</span>
                            <div class="infobox-content">${pd.saleMoney}</div>
                        </div>
                    </div>
                    <div class="infobox infobox-red">
                        <div class="infobox-data">
                            <span class="infobox-data-number">GMV</span>
                            <div class="infobox-content">${pd.gmvMoney}</div>
                        </div>
                    </div>
                    <div class="infobox infobox-brown">
                        <div class="infobox-data">
                            <span class="infobox-data-number">使用用户数</span>
                            <div class="infobox-content">${pd.useUserCount}</div>
                        </div>
                    </div>

                    <%--<div class="infobox infobox-green">
                        <div class="infobox-data">
                            <span class="infobox-data-number">累计预约次数</span>
                            <div class="infobox-content">${ljyyOrderNum}</div>
                        </div>
                    </div>

                    <div class="infobox infobox-blue">
                        <div class="infobox-data">
                            <span class="infobox-data-number">累计技师人数</span>
                            <div class="infobox-content">${ljjsNum}</div>
                        </div>
                    </div>
                    <div class="infobox infobox-pink">
                        <div class="infobox-data">
                            <span class="infobox-data-number">累计注册用户数</span>
                            <div class="infobox-content">${resigerDataNum}</div>
                        </div>
                    </div>

                    <div class="infobox infobox-red">
                        <div class="infobox-data">
                            <span class="infobox-data-number">累计服务时长(h)</span>
                            <div class="infobox-content">${ljserviceTimeNum}</div>
                        </div>
                    </div>
                    <div class="infobox infobox-brown">
                        <div class="infobox-data">
                            <span class="infobox-data-number">累计服务用户</span>
                            <div class="infobox-content">${serviceCompleteUserDataNum}</div>
                        </div>
                    </div>--%>
                    <!-- modify by tankun-->
                    <!-- /section:pages/dashboard.infobox -->
                    <div class="space-6"></div>
                </div>

                <div class="vspace-12-sm"></div>
            </div><!-- /.row -->

            <!-- #section:custom/extra.hr -->
            <div class="hr hr32 hr-dotted"></div>

            <!-- /section:custom/extra.hr -->
            <div class="row">
                <div class="col-sm-5" style="width:100%">
                    <div class="widget-box transparent">
                        <div class="widget-header widget-header-flat">
                            <h4 class="widget-title lighter">
                                <i class="ace-icon fa fa-star orange"></i>
                                订单明细
                            </h4>
                        </div>
                        <div class="widget-body" style="display: block;">
                           <%-- style="overflow-x: auto; overflow-y: auto; height: 480px; width:100%;"--%>
                            <div class="widget-main no-padding" >
                                <table class="table table-bordered table-striped">
                                    <thead class="thin-border-bottom">
                                    <tr>
                                        <th>日期</th>
                                        <th>日均GMV(元)</th>
                                        <th>日均付费用户数</th>
                                        <th>服务完成</th>
                                        <th>日均订单</th>
                                        <th>预约订单</th>
                                        <th>销售额(万元)</th>
                                        <th>实收金额(万元)</th>
                                        <th>在线支付(万元)</th>
                                        <th>日均客单价</th>
                                        <th>充值金额(万元)</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty orderList}">
                                            <c:forEach items="${orderList}" var="var" varStatus="vs">
                                                <tr>
                                                    <td>${var.time}</td>
                                                    <td>${var.gmvData}</td>
                                                    <td>${var.rjff}</td>
                                                    <td>${var.fwwcData == null ?"--":var.fwwcData}</td>
                                                    <td>${var.avgCount == null ?"--":var.avgCount}</td>
                                                    <td>${var.yyData == null ?"--":var.yyData}</td>
                                                    <td>${var.xse == null ?"--":var.xse}</td>
                                                    <td><b>${var.suremy == null ?"--":var.suremy}</b></td>
                                                    <td><b style="color: red">${var.onlineMoney == null ?"--":var.onlineMoney}</b></td>
                                                    <td>${var.kdmoney == null ?"--":var.kdmoney}</td>
                                                    <td>${var.czmoney == null ?"--":var.czmoney}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="main_info">
                                                <td colspan="100" class="center" >没有相关数据</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div><!-- /.widget-main -->
                        </div><!-- /.widget-body -->
                    </div><!-- /.widget-box -->
                </div><!-- /.col -->
            </div><!-- /.row -->

            <div class="hr hr32 hr-dotted"></div>

            <!-- 用户家庭数据分析-->
            <div class="row">
                <div class="space-6"></div>
                <div class="widget-box transparent">
                    <div class="widget-header widget-header-flat">
                        <h4 class="widget-title lighter">
                            <i class="ace-icon fa fa-star orange"></i>
                            用户家庭数据分析
                        </h4>
                    </div>
                    <div class="col-sm-7 infobox-container">
                        <!-- #section:pages/dashboard.infobox -->
                        <div class="infobox infobox-green" style="width: 100%; height: 300px">
                            <div class="infobox-data">
                                <div class="infobox-content" id="userfamily"></div>
                            </div>
                        </div>
                        <!-- modify by tankun-->
                        <!-- /section:pages/dashboard.infobox -->
                        <div class="space-6"></div>
                        <div class="infobox infobox-blue" style="width: 100%;height: 300px">
                            <div class="infobox-data">
                                <div class="infobox-content" id="userfamilyHome"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vspace-12-sm"></div>
            </div><!-- /.row -->

            <!-- 订单数据分析 -->
            <div class="row">
                <div class="space-6"></div>
                <div class="widget-box transparent">
                    <div class="widget-header widget-header-flat">
                        <h4 class="widget-title lighter">
                            <i class="ace-icon fa fa-star orange"></i>
                           牛家帮统计分类
                        </h4>
                    </div>
                    <div class="col-sm-7 infobox-container">
                        <!-- #section:pages/dashboard.infobox -->
                        <div class="infobox infobox-green" style="width: 100%; height: 300px;align-content: center">
                            <div class="infobox-data">
                                <div class="infobox-content" id="allDataReport"></div>
                            </div>
                        </div>
                       <%-- <div class="infobox infobox-blue" style="width: 50%;height: 300px">
                            <div class="infobox-data">
                                <div class="infobox-content" id="userfamilyHome"></div>
                            </div>
                        </div>--%>
                        <!-- modify by tankun-->
                        <!-- /section:pages/dashboard.infobox -->
                        <div class="space-6"></div>
                    </div>
                </div>

                <div class="vspace-12-sm"></div>
            </div><!-- /.row -->

            <%--<div class="row">
                <div class="col-sm-6_zdy">
                    <div class="widget-box transparent" id="recent-box">
                        <div class="widget-header">
                            <h4 class="widget-title lighter smaller">
                                <i class="ace-icon fa fa-rss orange"></i>城市运营数据分析
                            </h4>

                            <div class="widget-toolbar no-border">
                                <ul class="nav nav-tabs" id="recent-tab">
                                    <li class="active">
                                        <a data-toggle="tab" href="#task-tab" aria-expanded="true">服务完成</a>
                                    </li>

                                    <li class="">
                                        <a data-toggle="tab" href="#member-tab" aria-expanded="false">预约订单</a>
                                    </li>

                                    <li class="">
                                        <a data-toggle="tab" href="#comment-tab" aria-expanded="false">取消订单</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main padding-4">
                                <div class="tab-content padding-8">
                                    <div id="task-tab" class="tab-pane active">
                                        &lt;%&ndash;<h4 class="smaller lighter green">
                                            <i class="ace-icon fa fa-list"></i>
                                            城市
                                        </h4>&ndash;%&gt;
                                        <!-- #section:pages/dashboard.tasks -->
                                        <ul id="tasks" class="item-list_zdy ui-sortable">
                                            <span id="fwwcsh" ></span>
                                            <div id="dataInfosh" style="display: none;"></div>
                                            <span id="fwwcsz" ></span>
                                            <div id="dataInfosz" style="display: none;"></div>
                                            <span id="fwwchz" ></span>
                                            <div id="dataInfohz" style="display: none;"></div>
                                        </ul>
                                        <!-- /section:pages/dashboard.tasks -->
                                    </div>

                                    <div id="member-tab" class="tab-pane">
                                        <!-- #section:pages/dashboard.members -->
                                        &lt;%&ndash;<h4 class="smaller lighter green">
                                            <i class="ace-icon fa fa-list"></i>
                                            城市
                                        </h4>&ndash;%&gt;
                                        <div class="clearfix">
                                            <div class="itemdiv zdy">
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
                                        &lt;%&ndash;<h4 class="smaller lighter green">
                                            <i class="ace-icon fa fa-list"></i>
                                            城市
                                        </h4>&ndash;%&gt;
                                        <!-- #section:pages/dashboard.comments -->
                                        &lt;%&ndash; <div class="comments ace-scroll" style="position: relative;">&ndash;%&gt;
                                        &lt;%&ndash; <div class="scroll-content" style="max-height: 300px;">&ndash;%&gt;
                                        <div class="itemdivzdy commentdiv">
                                            <span id="qxsh" ></span>
                                            <div id="dataInfoqxsh" style="display: none;"></div>
                                            <span id="qxsz" ></span>
                                            <div id="dataInfoqxsz" style="display: none;"></div>
                                            <span id="qxhz" ></span>
                                            <div id="dataInfoqxhz" style="display: none;"><span>杭州</span></div>
                                        </div>
                                        &lt;%&ndash;</div>&ndash;%&gt;
                                        &lt;%&ndash;</div>&ndash;%&gt;
                                        <div class="hr hr8"></div>
                                        <!-- /section:pages/dashboard.comments -->
                                    </div>
                                </div>
                            </div><!-- /.widget-main -->
                        </div><!-- /.widget-body -->
                    </div><!-- /.widget-box -->
                </div>
            </div><!-- /.row -->--%>

            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
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
<!-- Ajax异步请求数据-->
<%--<script src="static/js/niuhome/niuhomedata.js"></script>--%>
<script type="text/javascript">
    $(top.hangge());//关闭加载状态
    //检索
    function tosearch(){
        top.jzts();
        $("#Form").submit();
    }
    var choosetime = $('#choosetime option:selected').val();
    $(function() {
        if( 2 == choosetime){
            $('.date-picker').datepicker('remove');
            $('.date-picker').datepicker({
                format: "yyyy-mm",
                minViewMode: 1,
                autoclose: true,
                todayHighlight: true
            });
        }
        if( 3 == choosetime){
            $('.date-picker').datepicker('remove');
            $('.date-picker').datepicker({
                autoclose: true,
                forceParse: false,
                format:"yyyy",
                startView: 2,
                maxViewMode: 2,
                minViewMode:2,
                changeYear: true,
                yearRange:"2014:2017"
            });
        }
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
        /**
         * 下拉框去重
         */
        $("#cityStr").chosen("destroy");
        $("#cityStr").each(function(i,n){
            var options = "";
            $(n).find("option").each(function(j,m){
                if(options.indexOf($(m)[0].outerHTML) == -1){
                    options += $(m)[0].outerHTML;
                }});
            $(n).html(options);
            $("#cityStr").chosen();
        });

        //复选框全选控制
        var active_class = 'active';
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
            var th_checked = this.checked;//checkbox inside "TH" table header
            $(this).closest('table').find('tbody > tr').each(function(){
                var row = this;
                if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });

        /**
        * 绘制图形
         */
        $("#userfamily").empty();
        $("#userfamilyHome").empty();
        $("#allDataReport").empty();
        var data = ${userFamilyList};
        var homedata = ${userFamilyHomeList};
        var allDataJson = ${allDataJsonList};
        if(data.length > 0){
            intervalData(data,'userfamily')
        }
        else{
           $("#userfamily").html('用户家庭数据暂无收集...');
        }
        if(homedata.length > 0){
            interValColumnData(homedata,'userfamilyHome');
        }
        else{
            $("#userfamilyHome").html('暂无户型数据...');
        }
        if(allDataJson.length > 0){
            intervalSymmetric(allDataJson,'allDataReport');
        }
        else{
            $("#allDataReport").html('相关指标数据统计分析为空');
        }
    });
    function checkTime(){
        choosetime = $('#choosetime option:selected').val();
        $("#lastLoginStart").val("");
        if( 2 == choosetime){
            $('.date-picker').datepicker('remove');
            $('.date-picker').datepicker({
                format: "yyyy-mm",
                minViewMode: 1,
                autoclose: true,
                todayHighlight: true
            });
        }
        if( 3 == choosetime){
            $('.date-picker').datepicker('remove');
            $('.date-picker').datepicker({
                autoclose: true,
                forceParse: false,
                format:"yyyy",
                startView: 2,
                maxViewMode: 2,
                minViewMode:2,
                changeYear: true,
                yearRange:"2014:2017"
            });
        }
    }

    /**
    * G2图形展示
    * @param data
    */
    function intervalData(data,div){
        var Stat = G2.Stat;
        var Frame = G2.Frame;
        var frame = new Frame(data);
        frame = Frame.sort(frame, 'datacount'); // 将数据按照datacount 进行排序，由大到小
        var chart = new G2.Chart({
            id : div,
            width : 1000,
            height : 300,
            plotCfg: {
                margin: [10, 60, 90]
            }
        });
        var defs = {
            'type': {
                alias: '分类',
                type: 'cat'
            },
            'datacount': {
                alias: '人数'
            }
        };
        chart.source(frame,defs);
        chart.axis('type',{
            title: null
        });
        chart.coord('rect').transpose();
        chart.interval().position('type*datacount').color('type');
        // 使用 chart.guide() 展示文本
        frame.each(function(obj, index){
            chart.guide().text([index + 0.3, 12], '人数：' + obj.datacount, {
                'text-anchor' : 'start'
            });
        });
        chart.render();
    }

    /**
    *柱状图
    * @param data
    * @param div
     */
    function interValColumnData(data,div){
        var Stat = G2.Stat;
        var Frame = G2.Frame;
        var frame = new Frame(data);
        frame = Frame.sort(frame, 'type'); // 将数据按照datacount 进行排序，由大到小
        var chart = new G2.Chart({
            id: div,
            width: 1000,
            height: 300,
            plotCfg: {
                margin: [10, 60, 80, 80]
            }
        });
        // 配置列定义,设置y轴的最小值
        var defs = {
            'type': {
                alias: '户型',
                type: 'cat'
            },
            'datacount': {
                alias: '户数',
                min: 0
            }
        };

        chart.source(frame, defs);
        chart.interval().position(Stat.summary.mean('type*datacount')).color('type');
        chart.render();
    }

    /**
    * G2-漏斗图
    * @param data
    * @param div
     */
    function intervalSymmetric(data,div){
        var chart = new G2.Chart({
            id: div,
            width: 1000,
            height: 300
        });
        var defs = {
            'type': {
                alias: '操作',
                type: 'cat'
            },
            'datacount': {
                alias: '数据',
                min: 0
            }
        };
        chart.source(data,defs);
        chart.coord('rect').transpose().scale(1,-1);
        chart.axis(false);
        chart.intervalSymmetric()
                .position('type*datacount')
                .color('type')
                .shape('funnel')
                .label('type', {offset: 10, label: {fontSize: 14}});
        chart.render();
    }

</script>
</body>

</html>
