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
					
					<form action="applicationuser/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<c:if test="${pd.save != 1 }">
									<td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
									<td><input type="text" name="mobile" id="mobile" readonly="readonly" value="${pd.mobile}" maxlength="15" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
								</c:if>
								<c:if test="${pd.save == 1 }">
									<td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
									<td><input type="text" name="mobile" id="mobile" value="${pd.mobile}" maxlength="15" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
								</c:if>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">积分:</td>

								<td style="vertical-align:top;padding-left:2px;">
									<select class="chosen-select form-control" name="level_score" id="level_score" data-placeholder="等级积分" style="vertical-align:top;width: 120px;">
										<option value="0" <c:if test="${pd.level_score == 0}">selected</c:if>>普通用户</option>
										<option value="10000" <c:if test="${pd.level_score == 10000}">selected</c:if>>超级VIP</option>
										<option value="7000" <c:if test="${pd.level_score == 7000}">selected</c:if>>普通VIP</option>
										<option value="6000" <c:if test="${pd.level_score == 6000}">selected</c:if>>内部用户</option>
									</select>
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
			if($("#id").val()==""){
				$("#id").tips({
					side:3,
		            msg:'请输入用户id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#id").focus();
			return false;
			}
			if($("#mobile").val()==""){
				$("#mobile").tips({
					side:3,
		            msg:'请输入手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#mobile").focus();
			return false;
			}
			if($("#level_score").val()==""){
				$("#level_score").tips({
					side:3,
		            msg:'请输入积分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#level_score").focus();
			return false;
			}
			if($("#level_name").val()==""){
				$("#level_name").tips({
					side:3,
		            msg:'请输入等级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#level_name").focus();
			return false;
			}
			if($("#level_update_name").val()==""){
				$("#level_update_name").tips({
					side:3,
		            msg:'请输入等级更新者',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#level_update_name").focus();
			return false;
			}
			if($("#level_update_time").val()==""){
				$("#level_update_time").tips({
					side:3,
		            msg:'请输入等级变更时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#level_update_time").focus();
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