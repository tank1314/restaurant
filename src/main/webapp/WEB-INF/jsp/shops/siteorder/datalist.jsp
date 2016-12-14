<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
						<form action="orderDataT/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入订单编号" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" style="vertical-align:top;width: 200px;"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>

								<td style="vertical-align:top;padding-left:2px;">
									<select class="chosen-select form-control" onchange="chooseBus();" name="city_id" id="city_id" data-placeholder="请选择查询城市" style="vertical-align:top;width: 140px;">
										<option value=""></option>
										<option value="">全部</option>
										<option value="1" <c:if test="${'1'== pd.city_id}">selected</c:if>>上海</option>
										<option value="2" <c:if test="${'2' == pd.city_id}">selected</c:if>>深圳</option>
										<option value="3" <c:if test="${'3' == pd.city_id}">selected</c:if>>杭州</option>
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
									</select>
								</td>

                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="order_status" id="order_status" data-placeholder="请选择订单状态" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">--请选择--</option>
                                        <option value="2" <c:if test="${pd.order_status == '2'}">selected="selected" </c:if>>待确认</option>
                                        <option value="3" <c:if test="${pd.order_status == '3'}">selected="selected" </c:if>>待接受</option>
                                        <option value="4" <c:if test="${pd.order_status == '4'}">selected="selected" </c:if>>待上门</option>
                                        <option value="5" <c:if test="${pd.order_status == '5'}">selected="selected" </c:if>>待服务</option>
                                        <option value="6" <c:if test="${pd.order_status == '6'}">selected="selected" </c:if>>服务中</option>
                                        <option value="7" <c:if test="${pd.order_status == '7'}">selected="selected" </c:if>>服务完成</option>
                                        <option value="8" <c:if test="${pd.order_status == '8'}">selected="selected" </c:if>>已取消</option>
                                    </select>
                                </td>

                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                <c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<div style="margin-left: 10px;margin: 10px;"><font color="red">订单总数(:单)</font>：<b>${orderCount}</b>&nbsp;|&nbsp;<font color="red">订单总额(:元)</font>：<b>${orderMoney}</b></div>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
                                    <th class="center" style="width:30px;">序号</th>
									<th class="center" style="width:50px;">订单号</th>
									<th class="center">用户编号</th>
									<th class="center">站点名称</th>
                                    <th class="center">服务内容</th>
                                    <th class="center">服务日期</th>
									<th class="center">服务时间</th>
									<%--<th class="center">订单状态</th>--%>
                                    <th class="center">联系人</th>
                                    <%--<th class="center">家庭地址</th>--%>
                                    <th class="center">服务员工</th>
                                    <%--<th class="center">工具金额(元)</th>
									<th class="center">优惠金额(元)</th>--%>
                                    <th class="center">订单金额(元)</th>
									<%--<th class="center">操作</th>--%>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty orderList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${orderList}" var="var" varStatus="vs">
										<tr>
											<%--<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.id}" class="ace" /><span class="lbl"></span></label>
											</td>--%>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center' style="width: 100px;">${var.id}</td>
                                            <td class='center'>${var.userid}</td>
											<td class='center'>${var.site_name}</td>
                                            <td class='center'>
                                                <c:if test="${fn:length(var.content) > 15}">
                                                    ${fn:substringBefore(var.content, ";")}
                                                    <a class="gray" id="show-option" href="javascript:void(0);" title="${var.content}"> <i class="ace-icon fa fa-hand-o-right"></i></a>
                                                </c:if>
                                                <c:if test="${fn:length(var.content) <= 15}">
                                                    ${var.content}
                                                </c:if>
                                            </td>
                                            <td class='center'>${var.start_day}</td>
											<td class='center'>${var.start_time}</td>
											<%--<td class='center'>${var.data_order_status}</td>--%>
                                            <td class='center'>${var.lxr}</td>
                                            <%--<td class='center'>${var.address}</td>--%>
                                            <td class='center'>${var.allot_no}</td>
                                           <%-- <td class='center'>${var.tools_money}</td>
                                            <td class='center'>${var.coupon_money}</td>--%>
                                            <td class='center'>${var.premium_money}</td>
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
								<%--<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									</c:if>
									&lt;%&ndash;<c:if test="${QX.del == 1 }">
									<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>&ndash;%&gt;
								</td>--%>
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

		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>alliancebusiness/excel.do';
		}
	</script>


</body>
</html>