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
					
					<form action="createrechargecard/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CreateRechargeCard_ID" id="CreateRechargeCard_ID" value="${pd.CreateRechargeCard_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">充值金额:</td>
								<td><input type="number" name="recharge_money" id="recharge_money" value="${pd.recharge_money}" maxlength="32" placeholder="这里输入充值金额(单位:分)" title="充值金额(单位:分)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">充值卡名称:</td>
								<td><input type="text" name="name" id="name" value="${pd.name}" maxlength="255" placeholder="这里输入充值卡名称" title="充值卡名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">赠送金额:</td>
								<td><input type="number" name="give_money" id="give_money" value="${pd.give_money}" maxlength="32" placeholder="这里输入赠送金额" title="赠送金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">截止兑换时间:</td>
								<td><input class="span10 date-picker" name="end_time" id="end_time" value="${pd.end_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="截止兑换时间" title="截止兑换时间" style="width:98%;"/></td>
							</tr>
                            <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生成数量:</td>
                                <td>
                                    <input type="number" name="number" id="number" value="${pd.number}" maxlength="32" placeholder="生成数量" title="生成数量" style="width:98%;"/>
                                </td>


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

			if($("#recharge_money").val()==""){
				$("#recharge_money").tips({
					side:3,
		            msg:'请输入充值金额(单位:分)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#recharge_money").focus();
			return false;
			}
			if($("#name").val()==""){
				$("#name").tips({
					side:3,
		            msg:'请输入充值卡名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#name").focus();
			return false;
			}
			if($("#give_money").val()==""){
				$("#give_money").tips({
					side:3,
		            msg:'请输入赠送金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#give_money").focus();
			return false;
			}
			if($("#end_time").val()==""){
				$("#end_time").tips({
					side:3,
		            msg:'请输入截止兑换时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#end_time").focus();
			return false;
			}
			if($("#beach_id").val()==""){
				$("#beach_id").tips({
					side:3,
		            msg:'请输入所属批次',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#beach_id").focus();
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