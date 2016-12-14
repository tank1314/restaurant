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
					
					<form action="twoyear/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TWOYEAR_ID" id="TWOYEAR_ID" value="${pd.TWOYEAR_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户手机号:</td>
								<td><input type="text" name="mobile" id="mobile" value="${pd.mobile}" maxlength="15" placeholder="这里输入用户手机号" title="用户手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">兑换次数:</td>
								<td><input type="number" name="exchange_number" id="exchange_number" value="${pd.exchange_number}" maxlength="32" placeholder="这里输入兑换次数" title="兑换次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户的uid:</td>
								<td><input type="number" name="uid" id="uid" value="${pd.uid}" maxlength="32" placeholder="这里输入用户的uid" title="用户的uid" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" name="create_time" id="create_time" value="${pd.create_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动类型,1.两周年:</td>
								<td><input type="number" name="activity_type" id="activity_type" value="${pd.activity_type}" maxlength="32" placeholder="这里输入活动类型,1.两周年" title="活动类型,1.两周年" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动名称:</td>
								<td><input type="text" name="activity_type_title" id="activity_type_title" value="${pd.activity_type_title}" maxlength="50" placeholder="这里输入活动名称" title="活动名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动开始时间:</td>
								<td><input class="span10 date-picker" name="start_time" id="start_time" value="${pd.start_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="活动开始时间" title="活动开始时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">获得的商品名称:</td>
								<td><input type="text" name="product_name" id="product_name" value="${pd.product_name}" maxlength="50" placeholder="这里输入获得的商品名称" title="获得的商品名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">奖品id:</td>
								<td><input type="number" name="product_id" id="product_id" value="${pd.product_id}" maxlength="32" placeholder="这里输入奖品id" title="奖品id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">终端,ios,android:</td>
								<td><input type="text" name="terminal" id="terminal" value="${pd.terminal}" maxlength="20" placeholder="这里输入终端,ios,android" title="终端,ios,android" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">版本号:</td>
								<td><input type="text" name="version_code" id="version_code" value="${pd.version_code}" maxlength="20" placeholder="这里输入版本号" title="版本号" style="width:98%;"/></td>
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
			if($("#mobile").val()==""){
				$("#mobile").tips({
					side:3,
		            msg:'请输入用户手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#mobile").focus();
			return false;
			}
			if($("#exchange_number").val()==""){
				$("#exchange_number").tips({
					side:3,
		            msg:'请输入兑换次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#exchange_number").focus();
			return false;
			}
			if($("#uid").val()==""){
				$("#uid").tips({
					side:3,
		            msg:'请输入用户的uid',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#uid").focus();
			return false;
			}
			if($("#create_time").val()==""){
				$("#create_time").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#create_time").focus();
			return false;
			}
			if($("#activity_type").val()==""){
				$("#activity_type").tips({
					side:3,
		            msg:'请输入活动类型,1.两周年',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#activity_type").focus();
			return false;
			}
			if($("#activity_type_title").val()==""){
				$("#activity_type_title").tips({
					side:3,
		            msg:'请输入活动名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#activity_type_title").focus();
			return false;
			}
			if($("#start_time").val()==""){
				$("#start_time").tips({
					side:3,
		            msg:'请输入活动开始时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#start_time").focus();
			return false;
			}
			if($("#product_name").val()==""){
				$("#product_name").tips({
					side:3,
		            msg:'请输入获得的商品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#product_name").focus();
			return false;
			}
			if($("#product_id").val()==""){
				$("#product_id").tips({
					side:3,
		            msg:'请输入奖品id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#product_id").focus();
			return false;
			}
			if($("#terminal").val()==""){
				$("#terminal").tips({
					side:3,
		            msg:'请输入终端,ios,android',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#terminal").focus();
			return false;
			}
			if($("#version_code").val()==""){
				$("#version_code").tips({
					side:3,
		            msg:'请输入版本号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#version_code").focus();
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