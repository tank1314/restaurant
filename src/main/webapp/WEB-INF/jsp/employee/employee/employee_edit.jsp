<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath() +"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=path%>">
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
					
					<form action="employee/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="Employee_ID" id="Employee_ID" value="${pd.Employee_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">

							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">员工姓名:</td>
								<td><input type="text" name="user_name" id="user_name" value="${pd.user_name}" maxlength="255" placeholder="这里输入员工姓名" title="员工姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
                                <td id="juese">
                                    <select class="chosen-select form-control" name="user_sex" id="user_sex" data-placeholder="请选择性别" style="vertical-align:top;" style="width:98%;" >
                                        <c:if test="${pd.user_sex == 1}">
                                            <option value="0">男</option>
                                            <option value="1" selected:>女</option>
                                        </c:if>
                                        <option value="0">男</option>
                                        <option value="1">女</option>
                                        <option value="${role.ROLE_ID }" <c:if test="${role.ROLE_ID == pd.ROLE_ID }">selected</c:if>>${role.ROLE_NAME }</option>
                                    </select>
                                </td>
								<td><input type="text" name="" id="user_sex" value="${pd.user_sex}" maxlength="32" placeholder="这里输入性别(0:男 1:女)" title="性别(0:男 1:女)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">居住地:</td>
								<td><input type="text" name="address" id="address" value="${pd.address}" maxlength="255" placeholder="这里输入居住地" title="居住地" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">身份证:</td>
								<td><input type="text" name="user_idcard" id="user_idcard" value="${pd.user_idcard}" maxlength="18" placeholder="这里输入身份证" title="身份证" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">入职日期:</td>
								<td><input class="span10 date-picker" name="join_date" id="join_date" value="${pd.join_date}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="入职日期" title="入职日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">离职日期:</td>
								<td><input class="span10 date-picker" name="exit_date" id="exit_date" value="${pd.exit_date}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="离职日期" title="离职日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建日期:</td>
								<td><input class="span10 date-picker" name="create_time" id="create_time" value="${pd.create_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建日期" title="创建日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人:</td>
								<td><input type="text" name="create_user" id="create_user" value="${pd.create_user}" maxlength="255" placeholder="这里输入创建人" title="创建人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input class="span10 date-picker" name="update_time" id="update_time" value="${pd.update_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="修改时间" title="修改时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改人:</td>
								<td><input type="text" name="update_user" id="update_user" value="${pd.update_user}" maxlength="255" placeholder="这里输入修改人" title="修改人" style="width:98%;"/></td>
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
		            msg:'请输入员工姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#user_name").focus();
			return false;
			}
			if($("#user_sex").val()==""){
				$("#user_sex").tips({
					side:3,
		            msg:'请输入性别(0:男 1:女)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#user_sex").focus();
			return false;
			}
			if($("#address").val()==""){
				$("#address").tips({
					side:3,
		            msg:'请输入居住地',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#address").focus();
			return false;
			}
			if($("#user_idcard").val()==""){
				$("#user_idcard").tips({
					side:3,
		            msg:'请输入身份证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#user_idcard").focus();
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