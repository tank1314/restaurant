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
                        <table id="simple-table1Report" class="table " style="margin-top:2px;">
                            <tr align="center">
                                <td><h5>第&nbsp;${weeks}&nbsp;周顾客满意度数据报告</h5></td>
                            </tr>
                        </table>
						<!-- 检索  -->
						<form action="custSatisfiedReport/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:0px;">
							<tr>
								<c:if test="${QX.cha == 1 }">
                                    <c:if test="${QX.to_month == 1 }">
                                        <td style="padding-left:2px;">服务时间:&nbsp;&nbsp;</td>
                                        <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                        <td style="vertical-align:top;padding-left:2px">
                                            &nbsp;&nbsp;<a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                    </c:if>
                                </c:if>
							</tr>
						</table>
						<!-- 检索  -->
                        <!-- 列表展示数据START -->
					    <div id="tableShow">
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center" rowspan="2" colspan="2" >日期</th>
                                    <th class="center" rowspan="2">当日订单数</th>
                                    <th class="center" rowspan="2">满意订单数</th>
                                    <th class="center" rowspan="2">占比%</th>
                                    <th class="center" rowspan="2">一般订单数</th>
                                    <th class="center" rowspan="2">占比%</th>
                                    <th class="center" rowspan="2">不满意订单数</th>
                                    <th class="center" rowspan="2">占比%</th>
                                    <th class="center" colspan="4">普通订单取消数</th>
                                    <th class="center" rowspan="2">周期定订单数</th>
                                </tr>
                                <tr>
                                    <th class="center">15分钟未付款自动取消</th>
                                    <th class="center">占比%</th>
                                    <th class="center">支付后取消</th>
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
                                                    <c:if test="${var.ischoose == 1}">
                                                        <td class='center' bgcolor="#7cfc00">${var.week}</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.date_time}</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.currentOrderCount}</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.myCount}</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.myzb}%</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.ybCount}</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.ybzb}%</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.bmyCount}</td>
                                                        <td class='center' bgcolor="#7cfc00">${var.bmyzb}%</td>
                                                        <td class="center" bgcolor="#7cfc00">${var.fifCount}</td>
                                                        <td class="center" bgcolor="#7cfc00">${var.fifzb}%</td>
                                                        <td class="center" bgcolor="#7cfc00">${var.payCount}</td>
                                                        <td class="center" bgcolor="#7cfc00">${var.payzb}%</td>
                                                        <td class="center" bgcolor="#7cfc00">${var.circleCount}</td>
                                                    </c:if>
                                                    <c:if test="${var.ischoose == 0}">
                                                        <td class='center'>${var.week}</td>
                                                        <td class='center'>${var.date_time}</td>
                                                        <td class='center'>${var.currentOrderCount}</td>
                                                        <td class='center'>${var.myCount}</td>
                                                        <td class='center'>${var.myzb}%</td>
                                                        <td class='center'>${var.ybCount}</td>
                                                        <td class='center'>${var.ybzb}%</td>
                                                        <td class='center'>${var.bmyCount}</td>
                                                        <td class='center'>${var.bmyzb}%</td>
                                                        <td class="center">${var.fifCount}</td>
                                                        <td class="center">${var.fifzb}%</td>
                                                        <td class="center">${var.payCount}</td>
                                                        <td class="center">${var.payzb}%</td>
                                                        <td class="center">${var.circleCount}</td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center' bgcolor="#6495ed" colspan="2">总计</td>
                                                <td class='center' bgcolor="#6495ed">${weekOrderData}</td>
                                                <td class='center' bgcolor="#6495ed">${fiveOrderData}</td>
                                                <td class='center' bgcolor="#6495ed">${myzzb}%</td>
                                                <td class='center' bgcolor="#6495ed">${threeOrderData}</td>
                                                <td class='center' bgcolor="#6495ed">${ybzzb}%</td>
                                                <td class='center' bgcolor="#6495ed">${oneOrderData}</td>
                                                <td class='center' bgcolor="#6495ed">${bmyzzb}%</td>
                                                <td class="center" bgcolor="#6495ed">${fifteenOrderData}</td>
                                                <td class="center" bgcolor="#6495ed">${fifzzb}%</td>
                                                <td class="center" bgcolor="#6495ed">${payOrderData}</td>
                                                <td class="center" bgcolor="#6495ed">${payzzb}%</td>
                                                <td class="center" bgcolor="#6495ed">${circleAllOrderData}</td>
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
   <%-- <script src="static/js/siteOrderReport.js"></script>--%>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			//top.jzts();
            if($("#lastLoginStart").val()=="" &&$("#lastLoginEnd").val()==""){
                $("#lastLoginStart").tips({
                    side:3,
                    msg:'请输入时间区间',
                    bg:'#AE81FF',
                    time:2
                });
                $("#lastLoginStart").focus();
                return false;
            }
			else{
                $("#Form").submit();
            }
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