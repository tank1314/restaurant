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
					
					<form action="vipuserinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="id" id="id" value="${pd.id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户姓名:</td>
								<td><input type="text" name="user_name" id="user_name" value="${pd.user_name}" maxlength="64" placeholder="这里输入用户姓名" title="用户姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
									<select class="chosen-select form-control" name="sex" id="sex" data-placeholder="请选择性别" style="width:98%;">
										<option value="0" <c:if test="${pd.sex == 0}">selected</c:if>>男</option>
										<option value="1" <c:if test="${pd.sex == 1}">selected</c:if>>女</option>
									</select>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">族群:</td>
								<td>
									<select class="chosen-select form-control" name="group_type" id="group_type" data-placeholder="请选择族群" style="width:98%;">
										<option value="1" <c:if test="${pd.group_type == 1}">selected</c:if>>学生</option>
										<option value="2" <c:if test="${pd.group_type == 2}">selected</c:if>>工人</option>
										<option value="3" <c:if test="${pd.group_type == 3}">selected</c:if>>社会精英</option>
										<option value="4" <c:if test="${pd.group_type == 4}">selected</c:if>>其他</option>
									</select>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员类型:</td>
								<td>
									<select class="chosen-select form-control" name="member_type" id="member_type" data-placeholder="请选择会员类型" style="width:98%;">
										<option value="1" <c:if test="${pd.member_type == 1}">selected</c:if>>普通</option>
										<option value="2" <c:if test="${pd.member_type == 2}">selected</c:if>>黄金</option>
										<option value="3" <c:if test="${pd.member_type == 3}">selected</c:if>>白银</option>
									</select>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
								<td><input type="text" name="phone" id="phone" value="${pd.phone}" maxlength="12" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系地址:</td>
								<td><input type="text" name="comm_address" id="comm_address" value="${pd.comm_address}" maxlength="255" placeholder="这里输入常用联系地址" title="常用联系地址" style="width:98%;"/></td>
							</tr>

							<%--<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员号:</td>
								<td><input type="text" name="idcard" id="idcard" value="${pd.idcard}" maxlength="255" placeholder="这里输入会员号" title="会员号" style="width:98%;"/></td>
							</tr>--%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员信息备注:</td>
								<td><input type="text" name="user_desc" id="user_desc" value="${pd.user_desc}" maxlength="255" placeholder="这里输入会员信息备注" title="会员信息备注" style="width:98%;"/></td>
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

			if($("#user_name").val()==""){
				$("#user_name").tips({
					side:3,
		            msg:'请输入用户姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#user_name").focus();
			return false;
			}
			if($("#sex").val()==""){
				$("#sex").tips({
					side:3,
		            msg:'请输入性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#sex").focus();
			return false;
			}
			if($("#group_type").val()==""){
				$("#group_type").tips({
					side:3,
		            msg:'请输入族群（1:学生 2：工人 3：社会精英）',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#group_type").focus();
			return false;
			}
			if($("#member_type").val()==""){
				$("#member_type").tips({
					side:3,
		            msg:'请输入会员类型(1:普通 2：黄金 3：白银)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#member_type").focus();
			return false;
			}
			if($("#phone").val()==""){
				$("#phone").tips({
					side:3,
		            msg:'请输入手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#phone").focus();
			return false;
			}

			if($("#comm_address").val()==""){
				$("#comm_address").tips({
					side:3,
		            msg:'请输入常用联系地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#comm_address").focus();
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