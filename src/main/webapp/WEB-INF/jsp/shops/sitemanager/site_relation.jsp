<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
								<form action="sitelist/${msg }.do" name="userForm" id="userForm" method="post">
									<input type="hidden" name="site_sid" id="site_sid" value="${pd.site_sid }"/>
                                    <input type="hidden" name="opertype" id ="opertype" value="${pd.opertype}" />
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <td style="width:99px;text-align: right;padding-top: 13px;">站点编码:</td>
                                            <td><input type="text" readonly  name="sitecode" id="sitecode" value="${pd.sitecode }" maxlength="32"style="width:98%;color: gray;"/></td>
                                        </tr>
                                        <tr>
                                            <td style="width:99px;text-align: right;padding-top: 13px;">站点名称:</td>
											<td><input type="text" readonly name="site_name" id="site_name" value="${pd.site_name }" maxlength="32" style="width:98%;color: gray;"/></td>
										</tr>
                                        <tr>
                                            <td style="width:99px;text-align: right;padding-top: 13px;">服务区域:</td>
                                            <td><input type="text" readonly name="site_area" id="site_area" value="${pd.site_area }" maxlength="32" style="width:98%;color: gray;"/></td>
                                        </tr>
                                        <!-- 1:分配商户 2: 操作服务范围-->
                                        <c:if test="${pd.opertype == 1 }">
                                            <tr>
                                                <%--<font color="red">*</font>--%>
                                                <td style="width:99px;text-align: right;padding-top: 13px;">商户:</td>
                                                <td id="juese">
                                                    <select class="chosen-select form-control" name="bus_id" id="bus_id" data-placeholder="请选择商户" style="vertical-align:top;" style="width:98%;" >
                                                        <option value=""></option>
                                                        <option value="0">--请选择--</option>
                                                        <c:forEach items="${busList}" var="bus">
                                                            <option value="${bus.id }" <c:if test="${bus.id== pd.bus_id }">selected</c:if>>${bus.bus_name }</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${pd.opertype == 2 }">
                                            <tr>
                                                <td style="width:99px;text-align: right;padding-top: 13px;">服务范围:</td>
                                                <td id="juese">
                                                    <select class="chosen-select form-control" name="service_type" id="service_type" data-placeholder="请选择服务范围" style="vertical-align:top;" style="width:98%;" >
                                                        <option value=""></option>
                                                        <option value="0">--请选择--</option>
                                                        <option value="1" <c:if test="${pd.service_type=='1'}">selected</c:if>>家政</option>
                                                        <option value="2" <c:if test="${pd.service_type=='2'}">selected</c:if>>跑腿</option>
                                                        <option value="3" <c:if test="${pd.service_type=='3'}">selected</c:if>>出行</option>
                                                        <option value="4" <c:if test="${pd.service_type=='4'}">selected</c:if>>洗衣</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </c:if>

										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
	});
	//保存
	function save(){
		/*if($("#bus_id").val()==""){
			$("#juese").tips({
				side:3,
	            msg:'选择商户',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#bus_id").focus();
			return false;
		}
		else{*/
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		//}
	}

	$(function() {
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
	});
</script>
</html>