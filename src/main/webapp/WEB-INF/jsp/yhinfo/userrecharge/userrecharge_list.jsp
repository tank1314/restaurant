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
							
						<!-- 检索  -->
						<form action="userrecharge/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="输入用户姓名" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>

								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="recharge_money" id="recharge_money" data-placeholder="请选择充值金额" style="vertical-align:top;width: 160px;">
									<option value=""></option>
									<option value="">全部</option>
									<option value="100" <c:if test="${pd.recharge_money =='100'}">selected</c:if>>1</option>
									<option value="10000" <c:if test="${pd.recharge_money =='10000'}">selected</c:if>>100</option>
                                    <option value="30000" <c:if test="${pd.recharge_money =='30000'}">selected</c:if>>300</option>
                                    <option value="50000" <c:if test="${pd.recharge_money =='50000'}">selected</c:if>>500</option>
                                    <option value="100000" <c:if test="${pd.recharge_money =='100000'}">selected</c:if>>1000</option>
                                    <option value="300000" <c:if test="${pd.recharge_money =='300000'}">selected</c:if>>3000</option>
                                    <option value="500000" <c:if test="${pd.recharge_money =='500000'}">selected</c:if>>5000</option>
                                    <option value="qt" <c:if test="${pd.recharge_money =='qt'}">selected</c:if>>其他</option>
								  	</select>
								</td>

                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="pay_platform" id="pay_platform" data-placeholder="请选择支付平台" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="wxAndzfb" <c:if test="${pd.pay_platform =='wxAndzfb'}">selected</c:if>>充值</option>
                                        <option value="activity" <c:if test="${pd.pay_platform =='activity'}">selected</c:if>>活动</option>
                                        <option value="linqu_refund" <c:if test="${pd.pay_platform =='linqu_refund'}">selected</c:if>>邻趣退款</option>
                                        <option value="longconvert" <c:if test="${pd.pay_platform =='longconvert'}">selected</c:if>>长期订转充值</option>
                                        <option value="month_benefit" <c:if test="${pd.pay_platform =='month_benefit'}">selected</c:if>>内部福利</option>
                                        <option value="refund" <c:if test="${pd.pay_platform =='refund'}">selected</c:if>>家政退款</option>
                                        <option value="miu_refund" <c:if test="${pd.pay_platform =='miu_refund'}">selected</c:if>> 出行退款</option>
                                    </select>
                                </td>
                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="recommend_no" id="recommend_no" data-placeholder="是否有推广人员" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="0" <c:if test="${pd.recommend_no == 0 and pd.recommend_no != ''}">selected</c:if>>否</option>
                                        <option value="1" <c:if test="${pd.recommend_no == 1}">selected</c:if>>是</option>
                                    </select>
                                </td>

                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="支付开始日期" title="支付开始日期"/></td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="支付结束日期" title="支付结束日期"/></td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                    <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icons" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
                                </c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">充值序号</th>
									<th class="center">用户姓名</th>
                                    <th class="center">充值金额</th>
                                    <th class="center">充值剩余金额</th>
                                    <th class="center">赠送金额</th>
                                    <th class="center">赠送剩余金额</th>
                                    <th class="center">充值城市</th>
                                    <th class="center">支付平台</th>
                                    <th class="center">推广人工号</th>
                                    <th class="center">充值终端</th>
                                    <th class="center">支付时间</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>

											<td class='center' style="width: 30px;">${var.id}</td>
											<td class='center'>${var.realname}</td>
                                            <td class='center'>${var.recharge_money}</td>
                                            <td class='center'>${var.remain_recharge_money}</td>
                                            <td class='center'>${var.give_money}</td>
                                            <td class='center'>${var.remain_give_money}</td>
                                            <td class='center'>${var.recharge_city_name}</td>
                                            <td class='center'>
                                                ${var.pay_platform}
                                                <%--<c:if test="${var.pay_platform =='微信' || var.pay_platform == '支付宝' }">充值</c:if>
                                                <c:if test="${var.pay_platform  != '微信' && var.pay_platform != '支付宝' }">${var.pay_platform}</c:if>--%>
                                            </td>
                                            <td class='center'>${var.recommend_no}</td>
                                            <td class='center'>${var.recharge_terminal}</td>
                                            <td class='center'>${var.pay_time}</td>
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
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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


        //导出excel
        function toExcel(){
            //top.jzts();
            var keywords = $("#nav-search-input").val();
            var lastLoginStart = $("#lastLoginStart").val();
            var lastLoginEnd = $("#lastLoginEnd").val();
            var recharge_money = $("#recharge_money").val();
            var pay_platform = $("#pay_platform").val();
            var recommend_no = $("#recommend_no").val();
            window.location.href='<%=basePath%>userrecharge/excel.do?keywords='+keywords+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd+'&recharge_money='+recharge_money+'&pay_platform='+pay_platform+'&recommend_no='+recommend_no;
        }
	</script>


</body>
</html>