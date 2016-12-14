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
    <%@ include file="../../system/index/top.jsp"%>
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
                        <table id="simple-table1Report" class="table " style="margin-top:5px;">
                            <tr align="center">
                                <td><h4>每日概况</h4></td>
                            </tr>
                        </table>
						<!-- 检索  -->
						<form action="dailyProfile/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:1px;">
							<tr>
								<c:if test="${QX.cha == 1 }">
                                        <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.currentTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                        <td style="vertical-align:top;padding-left:2px">
                                        <a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                               <%-- <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icons" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>--%>
                                </c:if>
							</tr>
						</table>
						<!-- 检索  -->
                        <!-- 列表展示数据START -->
					    <div id="tableShow">
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center" rowspan="2">城市</th>
                                    <th class="center" rowspan="2">充值金额</th>
                                    <th class="center" rowspan="2">满意度占比<a class="green" id="show-option" href="javascript:void(0);" title="总计 = 城市满意度之和 / 城市评价总数之和"> <i class="ace-icon fa fa-hand-o-right"></i></a></th>
                                    <th class="center" colspan="4">服务数量</th>
                                </tr>
                                <tr>
                                    <th class="center">家政</th>
                                    <th class="center">跑腿</th>
                                    <th class="center">打车</th>
									<th class="center">洗衣</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varlist}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varlist}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'>${var.cityname}</td>
                                                    <td class='center'>${var.money}</td>
                                                    <td class='center'>
                                                        <c:if test="${vs.index ==0}">
                                                            ${var.mydzb}%&nbsp;|&nbsp;订单评价总数:${var.allmyd20091637}&nbsp;|&nbsp;满意评价数:${var.myd20091637}
                                                        </c:if>
                                                        <c:if test="${vs.index ==1}">
                                                            ${var.mydzb}%&nbsp;|&nbsp;订单评价总数:${var.allmyd27763424}&nbsp;|&nbsp;满意评价数:${var.myd27763424}
                                                        </c:if>
                                                        <c:if test="${vs.index ==2}">
                                                            ${var.mydzb}%&nbsp;|&nbsp;订单评价总数:${var.allmyd26213393}&nbsp;|&nbsp;满意评价数:${var.myd26213393}
                                                        </c:if>
                                                    </td>
                                                    <td class='center'>${var.a753737}</td>
                                                    <td class='center'>${var.a1158606}</td>
                                                    <td class='center'>${var.a817011}</td>
													<td class="center">${var.a900652}</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center' bgcolor="#6495ed">总计</td>
                                                <td class='center' bgcolor="#6495ed">${pd.totalMoney}</td>
                                                <td class='center' bgcolor="#6495ed">${pd.totalmyd}%</td>
                                                <td class='center' bgcolor="#6495ed">${pd.jzcount}</td>
                                                <td class='center' bgcolor="#6495ed">${pd.ptcount}</td>
                                                <td class='center' bgcolor="#6495ed">${pd.dccount}</td>
												<td class='center' bgcolor="#6495ed">${pd.xycount}</td>
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
                                            <td colspan="100" class="center" >
                                                    没有相关数据
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
						<%--<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>--%>
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
	<%@ include file="../../system/index/foot.jsp"%>
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
   <%-- <script src="static/js/siteOrderReport.js"></script>--%>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
            $("#Form").submit();
		}
		$(function() {
			//日期框
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