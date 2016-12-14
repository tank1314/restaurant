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
    <title>排行榜</title>
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
            height: 450px;
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
                <td><h4 style="color: red">富豪榜数据</h4></td>
            </tr>
        </table>
        <form action="rechargeReportData/moneyTopT" method="post" name="Form" id="Form">
            <table style="margin-top:5px; margin-left: 60px;">
                <tr>
                    <td style="vertical-align:top;padding-left:2px;">
                        城市:&nbsp;&nbsp;<select class="chosen-select form-control" name="cityStr" id="cityStr" data-placeholder="城市选择分类" style="vertical-align:top;width: 90px;">
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
                    <td style="vertical-align:top;padding-left:6px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                </tr>
            </table>
            <!-- 检索  -->
        </form>
        </div>
        <div style="margin-top: 10px;"></div>
        <div class="data" style="width:90%;;margin:0 auto;">
            <div style="width:49%;float:left;">
                <div class="content" id="orderStatusData" style="overflow-x: auto; overflow-y: auto; height: 450px; width:100%;">
                    <table id="simple-table" class="table table-striped table-bordered table-hover" >
                        <thead>
                        <tr>
                            <th class="center" style="width:30px;">序号</th>
                            <th class="center" style="width:50px;">编号</th>
                            <th class="center">余额</th>
                            <th class="center">注册日期</th>
                            <th class="center">城市</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 开始循环 -->
                        <c:choose>
                            <c:when test="${not empty banlanceList}">
                                <c:if test="${QX.cha == 1 }">
                                    <c:forEach items="${banlanceList}" var="var" varStatus="vs">
                                        <tr>
                                            <c:if test="${vs.index+1 ==1}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;" bgcolor="#FBF072">${var.uid}</td>
                                                <td class='center' bgcolor="#FBF072">${var.money}</td>
                                                <td class='center' bgcolor="#FBF072">${var.dateinfo}</td>
                                                <td class='center' bgcolor="#FBF072">${var.city}</td>
                                            </c:if>
                                            <c:if test="${vs.index+1 ==2}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;" bgcolor="#DCE4E6">${var.uid}</td>
                                                <td class='center' bgcolor="#DCE4E6">${var.money}</td>
                                                <td class='center' bgcolor="#DCE4E6">${var.dateinfo}</td>
                                                <td class='center' bgcolor="#DCE4E6">${var.city}</td>
                                            </c:if>
                                            <c:if test="${vs.index+1 ==3}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;" bgcolor="#F0D3C4">${var.uid}</td>
                                                <td class='center' bgcolor="#F0D3C4">${var.money}</td>
                                                <td class='center' bgcolor="#F0D3C4">${var.dateinfo}</td>
                                                <td class='center' bgcolor="#F0D3C4">${var.city}</td>
                                            </c:if>
                                            <c:if test="${vs.index+1 > 3}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;">${var.uid}</td>
                                                <td class='center'>${var.money}</td>
                                                <td class='center'>${var.dateinfo}</td>
                                                <td class='center'>${var.city}</td>
                                            </c:if>

                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${QX.cha == 0 }">
                                    <tr>
                                        <td colspan="100" class="center">您无权查看</td>
                                    </tr>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <tr class="main_info">
                                    <td colspan="100" class="center" >没有相关数据</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
            <div style="width:49%;float:left; margin-left: 10px;" >
                <div class="content" style="overflow-x: auto; overflow-y: auto; height: 450px; width:100%;">
                    <table id="simple-table1" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center" style="width:30px;">序号</th>
                            <th class="center" style="width:50px;">编号</th>
                            <th class="center">消费金额</th>
                            <th class="center">注册日期</th>
                            <th class="center">城市</th>

                        </tr>
                        </thead>
                        <tbody style="overflow-y: scroll;">
                        <!-- 开始循环 -->
                        <c:choose>
                            <c:when test="${not empty consumList}">
                                <c:if test="${QX.cha == 1 }">
                                    <c:forEach items="${consumList}" var="var" varStatus="vs">
                                        <tr>
                                            <c:if test="${vs.index+1 ==1}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;" bgcolor="#FBF072">${var.id}</td>
                                                <td class='center' bgcolor="#FBF072">${var.xfje}</td>
                                                <td class='center' bgcolor="#FBF072">${var.dateinfo}</td>
                                                <td class='center' bgcolor="#FBF072">${var.city}</td>
                                            </c:if>
                                            <c:if test="${vs.index+1 ==2}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;" bgcolor="#DCE4E6">${var.id}</td>
                                                <td class='center'  bgcolor="#DCE4E6">${var.xfje}</td>
                                                <td class='center'  bgcolor="#DCE4E6">${var.dateinfo}</td>
                                                <td class='center'  bgcolor="#DCE4E6">${var.city}</td>
                                            </c:if>
                                            <c:if test="${vs.index+1 ==3}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;" bgcolor="#F0D3C4">${var.id}</td>
                                                <td class='center' bgcolor="#F0D3C4">${var.xfje}</td>
                                                <td class='center' bgcolor="#F0D3C4">${var.dateinfo}</td>
                                                <td class='center' bgcolor="#F0D3C4">${var.city}</td>
                                            </c:if>

                                            <c:if test="${vs.index+1 > 3}">
                                                <td class='center'>${vs.index+1}</td>
                                                <td class='center' style="width: 30px;">${var.id}</td>
                                                <td class='center'>${var.xfje}</td>
                                                <td class='center'>${var.dateinfo}</td>
                                                <td class='center'>${var.city}</td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${QX.cha == 0 }">
                                    <tr>
                                        <td colspan="100" class="center">您无权查看</td>
                                    </tr>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <tr class="main_info">
                                    <td colspan="100" class="center" >没有相关数据</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
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
    <script type="text/javascript">
        $(top.hangge());//关闭加载状态
        //检索
        function tosearch(){
        top.jzts();
        $("#Form").submit();
        }
        $(function() {

            //日期框
            $('.date-picker').datepicker({
                autoclose: true,
                todayHighlight: true
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

            /**
            * 下拉框去重
             */
            $("select").chosen("destroy");
            $("select").each(function(i,n){
                var options = "";
                $(n).find("option").each(function(j,m){
                    if(options.indexOf($(m)[0].outerHTML) == -1){
                        options += $(m)[0].outerHTML;
                    }});
                $(n).html(options);
                $("select").chosen();
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
        });
    </script>

</body>

</html>
