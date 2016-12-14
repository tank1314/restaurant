<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css"/>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp" %>
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/ace/css/datepicker.css"/>
</head>
<body class="no-skin" onload="showData();">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- 检索  -->
                        <form action="adminAttendance/list.do" style="overflow: scroll;" method="post" name="Form" id="Form">
                            <table style="margin-top:5px;">
                                <tr>
                                    <td>
                                        <div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入订单编号、员工姓名、站点名称" class="nav-search-input"
                                                   id="nav-search-input" autocomplete="off" name="keywords"
                                                   value="${pd.keywords }" placeholder="这里输入关键词"
                                                   style="vertical-align:top;width: 200px;"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
                                        </div>
                                    </td>

                                    <td style="vertical-align:top;padding-left:2px;">
                                        <select class="chosen-select form-control" onchange="chooseBus();" name="bus_id" id="bus_id" data-placeholder="请选择商户列表" style="vertical-align:top;width: 140px;">
                                            <option value=""></option>
                                            <option value="">全部</option>
                                            <c:forEach items="${busList}" var="bus">
                                                <option value="${bus.bus_id }" <c:if test="${bus.bus_id ==pd.bus_id}">selected</c:if>>${bus.bus_name }</option>
                                            </c:forEach>
                                        </select>
                                    </td>

                                    <div id="hidden_site" style="display: none;">
                                        <select class="chosen-select form-control" name="hidden_sid" id="hidden_sid" data-placeholder="请选择站点列表" style="vertical-align:top;width: 140px;">
                                            <c:forEach items="${siteList}" var="site">
                                                <option value="${site.site_sid}" bus_id = "${site.bus_id}">${site.site_name }</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <c:if test="${pd.isSelct eq '1'}">
                                        <td style="vertical-align:top;padding-left:2px;">
                                            <select class="chosen-select form-control" name="site_sid" id="site_sid" data-placeholder="请选择站点列表" style="vertical-align:top;width: 140px;">
                                                <option value=""></option>
                                                <option value="">--请选择--</option>
                                            </select>
                                        </td>
                                    </c:if>

                                    <td style="padding-left:2px;"><input class="span10 date-picker"
                                                                         name="lastLoginStart" id="lastLoginStart"
                                                                         value="${pd.lastLoginStart}" type="text"
                                                                         data-date-format="yyyy-mm-dd"
                                                                         readonly="readonly" style="width:98px;"
                                                                         placeholder="开始日期" title="开始日期"/></td>
                                    <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd"
                                                                         name="lastLoginEnd" value="${pd.lastLoginEnd}"
                                                                         type="text" data-date-format="yyyy-mm-dd"
                                                                         readonly="readonly" style="width:98px;"
                                                                         placeholder="结束日期" title="结束日期"/></td>
                                    <c:if test="${QX.cha == 1 }">
                                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs"
                                                                                           onclick="tosearch();"
                                                                                           title="检索"><i
                                                id="nav-search-icon"
                                                class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
                                        </td>
                                    </c:if>
                                </tr>
                            </table>
                            <!-- 检索  -->

                            <table id="simple-table"  class="table table-striped table-bordered table-hover"
                                   style="margin-top:5px;width: 100%">
                                <thead>
                                <tr>
                                    <th class="center" style="width:4%;">员工信息</th>
                                    <th class="center" style="width:3%;">08:00</th>
                                    <th class="center" style="width:3%;">08:30</th>
                                    <th class="center" style="width:3%;">09:00</th>
                                    <th class="center" style="width:3%;">09:30</th>
                                    <th class="center" style="width:3%;">10:00</th>
                                    <th class="center" style="width:3%;">10:30</th>
                                    <th class="center" style="width:3%;">11:00</th>
                                    <th class="center" style="width:3%;">11:30</th>
                                    <th class="center" style="width:3%;">12:00</th>
                                    <th class="center" style="width:3%;">12:30</th>
                                    <th class="center" style="width:3%;">13:00</th>
                                    <th class="center" style="width:3%;">13:30</th>
                                    <th class="center" style="width:3%;">14:00</th>
                                    <th class="center" style="width:3%;">14:30</th>
                                    <th class="center" style="width:3%;">15:00</th>
                                    <th class="center" style="width:3%;">15:30</th>
                                    <th class="center" style="width:3%;">16:00</th>
                                    <th class="center" style="width:3%;">16:30</th>
                                    <th class="center" style="width:3%;">17:00</th>
                                    <th class="center" style="width:3%;">17:30</th>
                                    <th class="center" style="width:3%;">18:00</th>
                                    <th class="center" style="width:3%;">18:30</th>
                                    <th class="center" style="width:3%;">19:00</th>
                                    <th class="center" style="width:3%;">19:30</th>
                                    <th class="center" style="width:3%;">20:00</th>
                                    <th class="center" style="width:3%;">20:30</th>
                                    <th class="center" style="width:3%;">21:00</th>
                                    <th class="center" style="width:3%;">21:30</th>
                                </tr>
                                </thead>

                                <tbody id="dataShow">
                                <!-- 开始循环 -->
                                <c:if test="${QX.cha == 1 }">

                                </c:if>
                                <c:if test="${QX.cha == 0 }">
                                    <tr>
                                        <td colspan="100" class="center">您无权查看</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                            <div class="page-header position-relative">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="vertical-align:top;">
                                            <div class="pagination"
                                                 style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->

    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>

</div>
<!-- /.main-container -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp" %>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!-- 时间工具类-->
<script src="static/js/util/DateUtils.js"></script>
<!-- 数组类-->
<script src="static/js/util/ArrayUtils.js"></script>
<script type="text/javascript">
    //全局变量声明
    var global_per = 30;//每30分钟一个刻度
    var global_start_time = '08:00';
    var global_end_time = '21:30';
    $(top.hangge());//关闭加载状态
    //检索
    function tosearch() {
        top.jzts();
        $("#Form").submit();
    }
    $(function () {
        //日期框
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        });

        //下拉框
        if (!ace.vars['touch']) {
            $('.chosen-select').chosen({allow_single_deselect: true});
            $(window)
                    .off('resize.chosen')
                    .on('resize.chosen', function () {
                        $('.chosen-select').each(function () {
                            var $this = $(this);
                            $this.next().css({'width': $this.parent().width()});
                        });
                    }).trigger('resize.chosen');
            $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                if (event_name != 'sidebar_collapsed') return;
                $('.chosen-select').each(function () {
                    var $this = $(this);
                    $this.next().css({'width': $this.parent().width()});
                });
            });
            $('#chosen-multiple-style .btn').on('click', function (e) {
                var target = $(this).find('input[type=radio]');
                var which = parseInt(target.val());
                if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
                else $('#form-field-select-4').removeClass('tag-input-style');
            });
        }

        /*初始化时加载站点下拉数据*/
        var bus_id = $("#bus_id").val();//当前商户id
        var sitehtml = '<option value="">请选择站点列表</option>';
        var select=document.getElementById('hidden_sid');//将当前用户所有的站点列出
        if(bus_id){
            for(var i=0;i<select.length;i++) {
                if(select.options[i].getAttribute("bus_id")==bus_id){
                    sitehtml+='<option value='+select.options[i].value+'>'+select.options[i].text+'</option>';
                }
            }
        }
        $("#site_sid").html("");
        $("#site_sid").chosen("destroy");
        $("#site_sid").html(sitehtml);
        $("#site_sid").chosen();

        //复选框全选控制
        var active_class = 'active';
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
            var th_checked = this.checked;//checkbox inside "TH" table header
            $(this).closest('table').find('tbody > tr').each(function () {
                var row = this;
                if (th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });
    });

    //商户下拉选择
    function chooseBus(){
        //首先需要对站点清空
        $("#site_sid").html("");
        $("#site_sid").chosen("destroy");
        var bus_id = $("#bus_id").val();//当前商户id
        var sitehtml = '<option value="">请选择站点列表</option>';
        var select=document.getElementById('hidden_sid');//将当前用户所有的站点列出
        for(var i=0;i<select.length;i++) {
            if(select.options[i].getAttribute("bus_id")==bus_id){
                sitehtml+='<option value='+select.options[i].value+'>'+select.options[i].text+'</option>';
            }
        }
        $("#site_sid").html(sitehtml);
        $("#site_sid").chosen();
    }

    //初始化
    var initTime = function (start, end, per, getTitle) {
        start = DateUtils.getMinutesFromTime(DateUtils.string2Date("HH:mm", start));
        end = DateUtils.getMinutesFromTime(DateUtils.string2Date("HH:mm", end));
        var data = [];
        for (var k = start; k <= end; k = k + per) {
            data.push({
                index: k,
                size: 1,//代表<td>个数
                per: per,
                title: typeof getTitle == 'function' ? getTitle(k, per) : '闲'
            });
        }
        return data;
    };
    <!-- 加载列表数据-->
    function Datashow() {
        var dataAll = new Array();//全局数据
        var jsonDataStr = ${varList};//得到结果集
        if (jsonDataStr) {
            <!-- 循环取第 i 条记录-->
            for (var i = 0; i < jsonDataStr.length; i++) {
                var all = initTime(global_start_time, global_end_time, global_per);//初始化所有列
                var jsonData = jsonDataStr[i];
                var key = jsonData.key;
                var value = jsonData.value;
                var pl = {
                    person: {
                        title: key
                        /*get name(){
                         return this.name.split();
                         }*/
                    },
                    datas: []
                }
                if (value.indexOf("&&") > -1) {
                    var strs = new Array(); //定义一数组
                    strs = value.split("&&"); //字符分割
                    if (strs != "") {
                        //=== 对 员工出勤数据拆分 =====
                        for (var j = 0; j < strs.length; j++) {
                            var str = strs[j];
                            if (str != "") {
                                var str = strs[j].split(",");//字符分割
                                var order_id = str[0];//订单id
                                var onstarttime = str[1];//开始时间
                                var onendtime = str[2];//结束时间
                                var onremark = str[3];//备注
                                var order_id2 = str[4];//订单号
                                var start = DateUtils.getMinutesFromTime(DateUtils.string2Date("HH:mm", onstarttime)) < 480 ? 480 : DateUtils.getMinutesFromTime(DateUtils.string2Date("HH:mm", onstarttime));
                                var end = DateUtils.getMinutesFromTime(DateUtils.string2Date("HH:mm", onendtime)) > 1290 ? 1290 : DateUtils.getMinutesFromTime(DateUtils.string2Date("HH:mm", onendtime));
                                var size = (end - start) / global_per;
                                var startElementByAttrs = all.getElementByAttr({index: start});
                                var endElementByAttrs = all.getElementByAttr({index: end - global_per});
                                //属于分工区间  则计算其工时段
                                if (startElementByAttrs.length > 0 && endElementByAttrs.length > 0 && order_id != "-1") {
                                    all.splice(startElementByAttrs[0].index, endElementByAttrs[0].index - startElementByAttrs[0].index + 1, {
                                        index: start,
                                        size: size,
                                        per: global_per,
                                        data: {
                                            order_id: order_id,
                                            order_status: onremark
                                        },
                                        title: order_id2 + "—" + onremark
                                    });
                                }
                                pl.datas = all;
                            }
                        }
                    }
                }
                //将所有数据封装到 dataAll集合中
                dataAll.push(pl);
            }
        }
        return dataAll;
    }

    /**
     *列表展示数据
     */
    function showData() {
        var dataS = Datashow();
        var html = '';
        if (dataS) {
            for (var i = 0; i < dataS.length; i++) {
                var data = dataS[i];
                var title = data.person.title;//员工姓名
                var timeDates = data.datas;//时间段
                html += '<tr><td class="center" style="width: 4%;">' + title + '</td>';
                //一天中各个时间段
                if (timeDates.length > 1) {
                    for (var j = 0; j < timeDates.length; j++) {
                        var size = 1;
                        var remark = "";
                        var order_id = "-1";
                        var time = timeDates[j];
                        size = time.size;
                        remark = time.title;
                        //根据订单id高亮显示背景
                        if (time.data) {
                            order_id = time.data.order_id;
                        }
                        if ("-1" != order_id) {
                            html += '<td bgcolor="#7fff00" class="center" colspan=' + size + '>' + remark + '</td>';
                        }
                        else {
                            html += '<td class="center" style="width:'+(3*size)+'%;word-break:break-all;" colspan=' + size + '>' + remark + '</td>';
                        }
                    }
                }
                html += "</tr>";
            }
        }
        else {
            html += '<tr class="main_info"><td colspan="100" class="center" >没有相关数据</td> </tr>';
        }
        $("#dataShow").html(html);
    }


    //导出excel
    function toExcel() {
        window.location.href = '<%=basePath%>alliancebusiness/excel.do';
    }
</script>


</body>
</html>