<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					
					<form action="orderrefund/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ids" id="ids" value="${pd.id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单号:</td>
								<td><input type="text" name="order_sn" id="order_sn" value="${pd.order_sn}" maxlength="32" placeholder="这里输入订单号" title="订单号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">退款金额:</td>
								<td><input type="number" name="refund_money" id="refund_money" value="${pd.order_money}" maxlength="32" placeholder="这里输入退款金额" title="退款金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">退款原因:</td>
								<td><input type="text" name="refund_reason" id="refund_reason" value="${pd.refund_reason}" maxlength="255" placeholder="这里输入退款原因" title="退款原因" style="width:98%;"/></td>
							</tr>
                            <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单金额:</td>
								<td><input type="text" name="order_money" id="order_money" value="${pd.order_money}" maxlength="255" placeholder="订单金额" title="订单金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">申请时间:</td>
								<td><input class="span10 date-picker" name="apply_time" id="apply_time" value="${pd.apply_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="申请时间" title="申请时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">退款平台:</td>
								<td><input type="text" name="refund_platform" id="refund_platform" value="${pd.refund_platform}" maxlength="255" placeholder="这里输入退款平台" title="退款平台" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">退款编号:</td>
								<td><input type="text" name="refund_sn" id="refund_sn" value="${pd.refund_sn}" maxlength="255" placeholder="这里输入退款编号" title="退款编号" style="width:98%;"/></td>
							</tr>
                            <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">交易流水号:</td>
								<td><input type="text" name="trade_no" id="trade_no" value="${pd.trade_no}" maxlength="30" placeholder="交易流水号" title="交易流水号" style="width:98%;"/></td>
							</tr>

							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#order_sn").val()==""){
				$("#order_sn").tips({
					side:3,
		            msg:'请输入订单号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#order_sn").focus();
			return false;
			}
			if($("#refund_money").val()==""){
				$("#refund_money").tips({
					side:3,
		            msg:'请输入退款金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#refund_money").focus();
			return false;
			}
			if($("#refund_reason").val()==""){
				$("#refund_reason").tips({
					side:3,
		            msg:'请输入退款原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#refund_reason").focus();
			return false;
			}
			if($("#audit_time").val()==""){
				$("#audit_time").tips({
					side:3,
		            msg:'请输入退款时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#audit_time").focus();
			return false;
			}
			if($("#refund_status").val()==""){
				$("#refund_status").tips({
					side:3,
		            msg:'请输入退款状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#refund_status").focus();
			return false;
			}
			if($("#refund_status_string").val()==""){
				$("#refund_status_string").tips({
					side:3,
		            msg:'请输入退款状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#refund_status_string").focus();
			return false;
			}
			if($("#apply_time").val()==""){
				$("#apply_time").tips({
					side:3,
		            msg:'请输入申请时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#apply_time").focus();
			return false;
			}
			if($("#refund_platform").val()==""){
				$("#refund_platform").tips({
					side:3,
		            msg:'请输入退款平台',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#refund_platform").focus();
			return false;
			}
			if($("#apply_user_id").val()==""){
				$("#apply_user_id").tips({
					side:3,
		            msg:'请输入申请人id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#apply_user_id").focus();
			return false;
			}
			if($("#audit_user_id").val()==""){
				$("#audit_user_id").tips({
					side:3,
		            msg:'请输入审核人id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#audit_user_id").focus();
			return false;
			}
			if($("#refund_sn").val()==""){
				$("#refund_sn").tips({
					side:3,
		            msg:'请输入退款编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#refund_sn").focus();
			return false;
			}
			if($("#audit_user_name").val()==""){
				$("#audit_user_name").tips({
					side:3,
		            msg:'请输入审核人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#audit_user_name").focus();
			return false;
			}
			if($("#apply_user_name").val()==""){
				$("#apply_user_name").tips({
					side:3,
		            msg:'请输入申请人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#apply_user_name").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>