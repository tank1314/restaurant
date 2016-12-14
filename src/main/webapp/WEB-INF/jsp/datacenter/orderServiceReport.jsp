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
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp"%>
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">

						<!-- 检索  -->
                        <h5><strong>服务时长数据分析</strong></h5>
                        <form action="orderServiceReport/list.do" method="post" name="Form" id="Form">
                            <table style="margin-top:1px;">
                                <tr>
                                    <td style="vertical-align:top;padding-left:2px;">
                                        <select class="chosen-select form-control" name="order_status" id="order_status" data-placeholder="请选择服务状态" style="vertical-align:top;width: 140px;">
                                            <option value=""></option>
                                            <option value="">全部</option>
                                            <option value="0" <c:if test="${pd.order_status=='0'}">selected</c:if>>服务未完成</option>
                                            <option value="1" <c:if test="${pd.order_status=='1'}">selected</c:if>>服务完成</option>
                                        </select>
                                    </td>
                                    &nbsp;
                                    <td style="padding-left:2px;">
                                        <input class="span10 date-picker" name="months1" id="month1"  value="${pd.months1}" type="text" data-date-format="yyyy-mm" readonly="readonly" style="width:88px;" placeholder="月份" title="月份"/>
                                    </td>
                                    <c:if test="${QX.cha == 1 }">
                                    <td style="vertical-align:top;padding-left:2px">
                                        <a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                        <%-- <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icons" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>--%>
                                    </c:if>
                            </table>
                            <table id="simple-table2" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center">服务时间分布</th>
                                    <th class="center">订单数量</th>
                                    <th class="center">占比%</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList2}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varList2}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'>${var.timename}</td>
                                                    <td class='center'>${var.serviceCount}</td>
                                                    <td class='center'>${var.servicePoint}%</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center' bgcolor="#6495ed" >TOTAL</td>
                                                <td class='center' bgcolor="#6495ed">${totalCount}</td>
                                                <td class='center' bgcolor="#6495ed" >${servicePointbl}%</td>
                                            </tr>
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
                            <%--<div class="page-header position-relative">
                            <table style="width:100%;">
                                <tr>
                                    <td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
                                </tr>
                            </table>
                            </div>--%>

                        <!-- 列表展示数据START 1-->
                            <h5><strong>[<font color="red"> ${pd.months} </font>]预约订单时间段数据分析</strong></h5>
                            <table style="margin-top:1px;">
                                <tr>
                                    <td style="vertical-align:top;padding-left:2px;">
                                        <td style="padding-left:2px;">
                                            <input class="span10 date-picker" name="months" id="months"  value="${pd.months}" type="text" data-date-format="yyyy-mm" readonly="readonly" style="width:88px;" placeholder="月份" title="月份"/>
                                        </td>
                                    </td>
                                    <c:if test="${QX.cha == 1 }">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    <td style="vertical-align:top;padding-left:2px">
                                        <a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon1" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                        <%-- <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icons" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>--%>
                                    </c:if>
                                </tr>
                            </table>
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center">下单时间分布</th>
                                    <th class="center">订单数量</th>
                                    <th class="center">占比%</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varList}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'>${var.timename}</td>
                                                    <td class='center'>${var.appcount}</td>
                                                    <td class='center'>${var.appointPoint}%</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center' bgcolor="#6495ed" >TOTAL</td>
                                                <td class='center' bgcolor="#6495ed">${allCount}</td>
                                                <td class='center' bgcolor="#6495ed">${appointPointbl}%</td>
                                            </tr>
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
	<%@ include file="../system/index/foot.jsp"%>
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
    <script src="static/js/echarts.min.js"></script>
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
                format: "yyyy-mm",
                minViewMode: 1,
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