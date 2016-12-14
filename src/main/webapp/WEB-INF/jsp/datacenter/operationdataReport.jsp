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
                                <td><h5>最近两月运营数据分析</h5></td>
                            </tr>
                        </table>
						<!-- 检索  -->
						<form action="operationDataReport/list.do" method="post" name="Form" id="Form">
						<!-- 检索  -->
                        <!-- 列表展示数据START -->
					    <div id="tableShow">
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center" rowspan="2">运营时间</th>
                                    <th class="center" rowspan="2">累计服务家庭</th>
                                    <th class="center" colspan="2">月订单总数</th>
                                    <th class="center" colspan="3">已服务订单</th>
                                    <th class="center" colspan="4">复购</th>
                                    <th class="center" colspan="2">用户</th>
                                </tr>
                                <tr>
                                    <th class="center">预约</th>
                                    <th class="center">服务订单</th>
                                    <th class="center">杭州</th>
                                    <th class="center">深圳</th>
                                    <th class="center">上海</th>
                                    <th class="center">当月复购用户</th>
                                    <th class="center">当月复购率</th>
                                    <th class="center">复购用户总数</th>
                                    <th class="center">总复购率</th>
                                    <th class="center">新用户</th>
                                    <th class="center">使用用户</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varList}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'>${var.month}</td>
                                                    <td class='center'>${var.total_user}</td>
                                                    <td class='center'>${var.book_order}</td>
                                                    <td class='center'>${var.service_order}</td>
                                                    <td class='center'>${var.hz_service_order}</td>
                                                    <td class='center'>${var.sz_service_order}</td>
                                                    <td class='center'>${var.sh_service_order}</td>
                                                    <td class='center'>${var.month_repeat_user}</td>
                                                    <td class='center'>${var.month_repeat_rate}</td>
                                                    <td class="center">${var.total_repeat_user}</td>
                                                    <td class="center">${var.total_repeat_rate}</td>
                                                    <td class="center">${var.month_new_user}</td>
                                                    <td class="center">${var.month_user_user}</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center'>环比增长值</td>
                                                <td class='center' >${total_user_zz}</td>
                                                <td class='center' >${booker_order_zz}</td>
                                                <td class='center' >${service_order_zz}</td>
                                                <td class='center' >${hz_service_order_zz}</td>
                                                <td class='center' >${sz_service_order_zz}</td>
                                                <td class='center' >${sh_service_order_zz}</td>
                                                <td class='center' >${month_repeat_user_zz}</td>
                                                <td class="center" >${month_repeat_rate_zz}</td>
                                                <td class="center" >${total_repeat_user_zz}</td>
                                                <td class="center" >${total_repeat_rate_zz}</td>
                                                <td class="center" >${month_new_user_zz}</td>
                                                <td class="center" >${month_user_user_zz}</td>
                                            </tr>
                                            <tr>
                                                <td class='center'>环比增长率</td>
                                                <td class='center' >${total_user_zzl}%</td>
                                                <td class='center' >${booker_order_zzl}%</td>
                                                <td class='center' >${service_order_zzl}%</td>
                                                <td class='center' >${hz_service_order_zzl}%</td>
                                                <td class='center' >${sz_service_order_zzl}%</td>
                                                <td class='center' >${sh_service_order_zzl}%</td>
                                                <td class='center' >${month_repeat_user_zzl}%</td>
                                                <td class="center" >${month_repeat_rate_zzl}%</td>
                                                <td class="center" >${total_repeat_user_zzl}%</td>
                                                <td class="center" >${total_repeat_rate_zzl}%</td>
                                                <td class="center" >${month_new_user_zzl}%</td>
                                                <td class="center" >${month_user_user_zzl}%</td>
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