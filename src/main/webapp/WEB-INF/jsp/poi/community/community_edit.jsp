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
					
					<form action="community/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="community_id" id="community_id" value="${pd.community_id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">城市名称:</td>
								<td><select id="province" name="province"></select>
									<select id="city" name="city" value="${pd.city_name}"></select>
									<select id="area" name="area" value="${pd.distinct_name}"></select></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小区类别</td>
								<td><select id="category"  name="category" value="${pd.category}" style="width:100px;">
									<option value="">请选择</option>
									<option value="A">A类</option>
									<option value="B">B类</option>
									<option value="C">C类</option>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小区名称:</td>
								<td><input type="text" name="name" id="name" value="${pd.name}" maxlength="255" placeholder="这里输入小区名称" title="小区名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">建造时间:</td>
								<td><input class="span10 date-picker" name="build_year" id="build_year" value="${pd.build_year}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="建造时间" title="建造时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">户数:</td>
								<td><input type="number" name="house_num" id="house_num" value="${pd.house_num}" maxlength="32" placeholder="这里输入户数" title="户数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">均价:</td>
								<td><input type="number" name="price" id="price" value="${pd.price}" maxlength="32" placeholder="这里输入均价" title="均价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">详细地址:</td>
								<td><input type="text" name="address" id="address" value="${pd.address}" maxlength="255" placeholder="这里输入详细地址" title="详细地址" style="width:98%;"/></td>
							</tr>

							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经度:</td>
								<td><input type="text" name="lat" id="lat" value="${pd.lat}" maxlength="255" placeholder="这里输入经度" title="经度" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">纬度:</td>
								<td><input type="text" name="lon" id="lon" value="${pd.lon}" maxlength="255" placeholder="这里输入纬度" title="纬度" style="width:98%;"/></td>
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
	<script src="static/js/jsAddress.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<script type="text/javascript">
    	addressInit('province', 'city', 'area');
		$(top.hangge());
		//保存
		function save(){

			var city_name = $("#city").val();
			var distinct_name = $("#area").val();
			var category=$("#category").val();
			console.log(city_name);
			console.log(distinct_name);
			console.log(category);
			if(city_name==""||city_name=='请选择'){
				alert("请输入城市名称");
			return false;
			}

			if(distinct_name==""||distinct_name=="请选择"){
				alert("请选择区域");
			return false;
			}
			if(category==""||category=="请选择"){
				alert("请选择小区分类");
				return false;
			}
			if($("#name").val()==""){
				$("#name").tips({
					side:3,
		            msg:'请输入小区名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#name").focus();
			return false;
			}
			if($("#build_year").val()==""){
				$("#build_year").tips({
					side:3,
		            msg:'请输入建造时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#build_year").focus();
			return false;
			}
			if($("#house_num").val()==""){
				$("#house_num").tips({
					side:3,
		            msg:'请输入户数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#house_num").focus();
			return false;
			}
			if($("#price").val()==""){
				$("#price").tips({
					side:3,
		            msg:'请输入均价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#price").focus();
			return false;
			}
			if($("#address").val()==""){
				$("#address").tips({
					side:3,
		            msg:'请输入详细地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#address").focus();
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