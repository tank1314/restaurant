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
					
					<form action="consumfoodlog/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="consumfoodlog_id" id="consumfoodlog_id" value="${pd.consumfoodlog_id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">id:</td>
								<td><input type="number" name="id" id="id" value="${pd.id}" maxlength="32" placeholder="这里输入id" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消费id:</td>
								<td><input type="number" name="consum_id" id="consum_id" value="${pd.consum_id}" maxlength="32" placeholder="这里输入消费id" title="消费id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">食物id:</td>
								<td><input type="number" name="food_id" id="food_id" value="${pd.food_id}" maxlength="32" placeholder="这里输入食物id" title="食物id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">食物名称:</td>
								<td><input type="text" name="food_name" id="food_name" value="${pd.food_name}" maxlength="255" placeholder="这里输入食物名称" title="食物名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜类:</td>
								<td><input type="text" name="food_type_name" id="food_type_name" value="${pd.food_type_name}" maxlength="255" placeholder="这里输入菜类" title="菜类" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜系:</td>
								<td><input type="text" name="cuisine_name" id="cuisine_name" value="${pd.cuisine_name}" maxlength="255" placeholder="这里输入菜系" title="菜系" style="width:98%;"/></td>
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
			if($("#id").val()==""){
				$("#id").tips({
					side:3,
		            msg:'请输入id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#id").focus();
			return false;
			}
			if($("#consum_id").val()==""){
				$("#consum_id").tips({
					side:3,
		            msg:'请输入消费id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#consum_id").focus();
			return false;
			}
			if($("#food_id").val()==""){
				$("#food_id").tips({
					side:3,
		            msg:'请输入食物id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#food_id").focus();
			return false;
			}
			if($("#food_name").val()==""){
				$("#food_name").tips({
					side:3,
		            msg:'请输入食物名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#food_name").focus();
			return false;
			}
			if($("#food_type_name").val()==""){
				$("#food_type_name").tips({
					side:3,
		            msg:'请输入菜类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#food_type_name").focus();
			return false;
			}
			if($("#cuisine_name").val()==""){
				$("#cuisine_name").tips({
					side:3,
		            msg:'请输入菜系',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#cuisine_name").focus();
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