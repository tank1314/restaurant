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
					
					<form action="alliancebusiness/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="id" id="id" value="${pd.id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%--<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">加盟商编码:</td>
								<td><input type="text" name="bus_code" id="bus_code" value="${pd.bus_code}" maxlength="255" placeholder="这里输入加盟商编码" title="加盟商编码" style="width:98%;"/></td>
							</tr>--%>
							<tr>
								<td style="width:105px;text-align: right;padding-top: 13px;"><font color="red">*</font>商户名称:</td>
								<td><input type="text" name="bus_name" id="bus_name" value="${pd.bus_name}" maxlength="255" placeholder="这里输入加盟商名称" title="加盟商名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:105px;text-align: right;padding-top: 13px;">押　金(元):</td>
								<td><input type="text" name="deposit" id="deposit" value="${pd.deposit_money}" maxlength="255" placeholder="这里输入押金(元)" onkeyup="value=this.value.replace(/\D+/g,'')" title="押金" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:105px;text-align: right;padding-top: 13px;">归属单位:</td>
								<td><input type="text" name="belong_unit" id="belong_unit" value="${pd.belong_unit}" maxlength="255" placeholder="这里输入归属单位" title="归属单位" style="width:98%;"/></td>
							</tr>

							<tr>
								<td style="width:105px;text-align: right;padding-top: 13px;">所属城市:</td>
								<td>
									<select class="chosen-select form-control" name="city_id" id="city_id" data-placeholder="选择所属城市" style="width:98%;">
										<option value="1" <c:if test="${pd.city_id == 1}">selected</c:if>>上海市</option>
										<option value="2" <c:if test="${pd.city_id == 2}">selected</c:if>>深圳市</option>
										<option value="3" <c:if test="${pd.city_id == 3}">selected </c:if>>杭州市</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:105px;text-align: right;padding-top: 13px;">城市名称:</td>
								<td><input type="text" name="city_name" id="city_name" value="${pd.city_name}" maxlength="255" placeholder="这里输入城市名称" title="城市名称" style="width:98%;"/></td>
							</tr>

							<%--<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">门店负责人:</td>
								<td><input type="text" name="bus_master" id="bus_master" value="${pd.bus_master}" maxlength="255" placeholder="这里输入门店负责人" title="门店负责人" style="width:98%;"/></td>
							</tr>--%>
                            <c:if test="${msg == 'edit'}">
                                <tr>
                                    <td style="width:75px;text-align: right;padding-top: 13px;"><font color="red">*</font>商户状态:</td>
                                    <td>
                                        <select class="chosen-select form-control" name="bus_status" id="bus_status" data-placeholder="请选择加盟状态" style="width:98%;">
                                            <option value="0" <c:if test="${pd.bus_status == 0}">selected="" </c:if>>撤销</option>
                                            <option value="1" <c:if test="${pd.bus_status == 1}">selected="" </c:if>>加盟中</option>
                                        </select>
                                    </td>
                                </tr>
                            </c:if>
							<input type="hidden" name="create_by" id="create_by" value="${pd.create_by}" maxlength="255" placeholder="这里输入创建人" title="创建人" style="width:98%;"/>
							<input type="hidden" name="create_time" id="create_time" value="${pd.create_time}" maxlength="255" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/>
							<input type="hidden" name="modify_by" id="modify_by" value="${pd.modify_by}" maxlength="255" placeholder="这里输入更新人" title="更新人" style="width:98%;"/>
							<input type="hidden" name="modify_time" id="modify_time" value="${pd.modify_time}" maxlength="255" placeholder="这里输入更新时间" title="更新时间" style="width:98%;"/>
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
	
					<div id="zhongxin3" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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
			if($("#bus_name").val()==""){
				$("#bus_name").tips({
					side:3,
		            msg:'请输入加盟商名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#bus_name").focus();
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