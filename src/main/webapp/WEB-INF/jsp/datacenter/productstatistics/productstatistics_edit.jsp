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
					
					<form action="productstatistics/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ProductStatistics_ID" id="ProductStatistics_ID" value="${pd.ProductStatistics_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品名称:</td>
								<td><input type="text" name="productName" id="productName" value="${pd.productName}" maxlength="255" placeholder="这里输入商品名称" title="商品名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单数量:</td>
								<td><input type="number" name="orderNumber" id="orderNumber" value="${pd.orderNumber}" maxlength="32" placeholder="这里输入订单数量" title="订单数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">占比:</td>
								<td><input type="text" name="numberOccupiesCompared" id="numberOccupiesCompared" value="${pd.numberOccupiesCompared}" maxlength="255" placeholder="这里输入占比" title="占比" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单金额:</td>
								<td><input type="number" name="orderMoney" id="orderMoney" value="${pd.orderMoney}" maxlength="32" placeholder="这里输入订单金额" title="订单金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">金额占比:</td>
								<td><input type="number" name="MoneyOccupiesCompared" id="MoneyOccupiesCompared" value="${pd.MoneyOccupiesCompared}" maxlength="32" placeholder="这里输入金额占比" title="金额占比" style="width:98%;"/></td>
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
	<%@ include file="../../system/index/foot.jsp"%>
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
			if($("#productName").val()==""){
				$("#productName").tips({
					side:3,
		            msg:'请输入商品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#productName").focus();
			return false;
			}
			if($("#orderNumber").val()==""){
				$("#orderNumber").tips({
					side:3,
		            msg:'请输入订单数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#orderNumber").focus();
			return false;
			}
			if($("#numberOccupiesCompared").val()==""){
				$("#numberOccupiesCompared").tips({
					side:3,
		            msg:'请输入占比',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#numberOccupiesCompared").focus();
			return false;
			}
			if($("#orderMoney").val()==""){
				$("#orderMoney").tips({
					side:3,
		            msg:'请输入订单金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#orderMoney").focus();
			return false;
			}
			if($("#MoneyOccupiesCompared").val()==""){
				$("#MoneyOccupiesCompared").tips({
					side:3,
		            msg:'请输入金额占比',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MoneyOccupiesCompared").focus();
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