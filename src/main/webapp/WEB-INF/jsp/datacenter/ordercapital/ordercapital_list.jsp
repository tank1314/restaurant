﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
							
						<!-- 检索  -->
						<form action="ordercapital/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="month" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="日期" title="日期"/></td>
								<td style="vertical-align:top;padding-left:2px;">
									<select class="chosen-select form-control" name="citys" id="citys" data-placeholder="请选择选择城市站点" style="vertical-align:top;width: 140px;">
										<option value=""></option>
										<option value="">全部</option>
										<option value="1" <c:if test="${result.select_citys=='1'}">selected</c:if>>上海</option>
										<option value="2" <c:if test="${result.select_citys=='2'}">selected</c:if>>深圳</option>
										<option value="3" <c:if test="${result.select_citys=='3'}">selected</c:if>>杭州</option>
									</select>
								</td>
								<%--<td style="padding-left:2px;"><input class="span10 date-picker" name="end_month" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>--%>
								<%--<td style="vertical-align:top;padding-left:2px;">--%>
								 	<%--<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">--%>
									<%--<option value=""></option>--%>
									<%--<option value="">全部</option>--%>
									<%--<option value="">1</option>--%>
									<%--<option value="">2</option>--%>
								  	<%--</select>--%>
								<%--</td>--%>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
								<thead>
								<tr>
									<th class="center">当月复购用户</th>
									<th class="center">当月用户</th>
									<th class="center">当月复购率</th>
									<th class="center">总复购率</th>
								</tr>
								</thead>
								<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty result and not empty result.query_order_recover}">
										<c:if test="${QX.cha == 1 }">
											<tr>
												<td class='center'>${result.query_order_recover.recover_current_month}</td>
												<td class='center'>${result.query_order_recover.all_current_month}</td>
												<td class='center'>${result.query_order_recover.recover_rate_current_month}</td>
												<td class='center'>${result.query_order_recover.recover_rate_all}</td>
											</tr>
										</c:if>
										<c:if test="${QX.cha == 0 }">
											<tr>
												<td colspan="100" class="center">您无权查看</td>
											</tr>
										</c:if>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="100" class="center" >没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<%--<th class="center" style="width:35px;">--%>
									<%--<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>--%>
									<%--</th>--%>
									<%--<th class="center" style="width:50px;">序号</th>--%>
									<th class="center">资金指标</th>
									<th class="center">月份对比</th>
									<th class="center">微信</th>
									<th class="center">支付宝</th>
									<%--<th class="center">小牛支付宝</th>--%>
									<th class="center">上门</th>
									<th class="center">余额</th>
									<th class="center">月份合计</th>
									<%--<th class="center">操作</th>--%>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty result and not empty result.d0}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${result.d0}" var="var" varStatus="vs">
										<tr>
											<%--<td class='center'>--%>
												<%--<label class="pos-rel"><input type='checkbox' name='ids' value="${var.OrderCapital_ID}" class="ace" /><span class="lbl"></span></label>--%>
											<%--</td>--%>
											<%--<td class='center' style="width: 30px;">${vs.index+1}</td>--%>
											<c:if test="${vs.first}">
												<td class='center' rowspan="4">${var.header}</td>
											</c:if>
											<c:if test="${vs.index==4}">
												<td class='center' rowspan="3">${var.header}</td>
											</c:if>
											<td class='center'>${var.month_proportion}</td>
											<td class='center'>${var.weixin/100}</td>
											<td class='center'>${var.alipay/100}</td>
											<%--<td class='center'>${var.xiaoniu_alipay/100}</td>--%>
											<td class='center'>${var.shangmen/100}</td>
											<td class='center'>${var.wallet/100}</td>
											<td class='center'>${var.month_sum/100}</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<%--<th class="center" style="width:35px;">--%>
									<%--<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>--%>
									<%--</th>--%>
									<%--<th class="center" style="width:50px;">序号</th>--%>
									<th class="center">运营指标</th>
									<th class="center">月份对比</th>
									<th class="center">第一周</th>
									<th class="center">第二周</th>
									<th class="center">第三周</th>
									<th class="center">第四周</th>
									<th class="center">第五周</th>
									<th class="center">月份合计</th>
									<%--<th class="center">操作</th>--%>
								</tr>
							</thead>

							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty result and not empty result.d1}">
									<c:if test="${QX.cha == 1 }">
										<%--<c:when test="${result.d1.order_count!=null}">--%>
											<c:forEach items="${result.d1.order_count}" var="var" varStatus="vs">
												<tr>
													<c:if test="${vs.first}">
														<td class='center' rowspan="${result.d1.order_day_avg_count.size()}">${var.header}</td>
													</c:if>
													<td class='center'>${var.month_proportion}</td>
													<td class='center'>${var.week1/var.rate}</td>
													<td class='center'>${var.week2/var.rate}</td>
													<td class='center'>${var.week3/var.rate}</td>
													<td class='center'>${var.week4/var.rate}</td>
													<td class='center'>${var.week5/var.rate}</td>
													<td class='center'>${var.month_sum/var.rate}</td>
												</tr>
											</c:forEach>
										<%--</c:when>--%>
										<c:forEach items="${result.d1.order_capital}" var="var" varStatus="vs">
											<tr>
												<c:if test="${vs.first}">
													<td class='center' rowspan="${result.d1.order_day_avg_count.size()}">${var.header}</td>
												</c:if>
												<td class='center'>${var.month_proportion}</td>
												<td class='center'>${var.week1/var.rate}</td>
												<td class='center'>${var.week2/var.rate}</td>
												<td class='center'>${var.week3/var.rate}</td>
												<td class='center'>${var.week4/var.rate}</td>
												<td class='center'>${var.week5/var.rate}</td>
												<td class='center'>${var.month_sum/var.rate}</td>
											</tr>
										</c:forEach>
										<c:forEach items="${result.d1.order_day_avg_count}" var="var" varStatus="vs">
											<tr>
												<c:if test="${vs.first}">
													<td class='center' rowspan="${result.d1.order_day_avg_count.size()}">${var.header}</td>
												</c:if>
												<td class='center'>${var.month_proportion}</td>
												<td class='center'>${var.week1/var.rate}</td>
												<td class='center'>${var.week2/var.rate}</td>
												<td class='center'>${var.week3/var.rate}</td>
												<td class='center'>${var.week4/var.rate}</td>
												<td class='center'>${var.week5/var.rate}</td>
												<td class='center'>${var.month_sum/var.rate}</td>
											</tr>
										</c:forEach>
										<%----%>
										<c:forEach items="${result.d1.order_avg_capital}" var="var" varStatus="vs">
											<tr>
												<c:if test="${vs.first}">
													<td class='center' rowspan="${result.d1.order_day_avg_count.size()}">${var.header}</td>
												</c:if>
												<td class='center'>${var.month_proportion}</td>
												<td class='center'>${var.week1/var.rate}</td>
												<td class='center'>${var.week2/var.rate}</td>
												<td class='center'>${var.week3/var.rate}</td>
												<td class='center'>${var.week4/var.rate}</td>
												<td class='center'>${var.week5/var.rate}</td>
												<td class='center'>${var.month_sum/var.rate}</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<%--<div class="page-header position-relative">--%>
						<%--<table style="width:100%;">--%>
							<%--<tr>--%>
								<%--<td style="vertical-align:top;">--%>
									<%--<c:if test="${QX.add == 1 }">--%>
									<%--<a class="btn btn-sm btn-success" onclick="add();">新增</a>--%>
									<%--</c:if>--%>
									<%--<c:if test="${QX.del == 1 }">--%>
									<%--<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>--%>
									<%--</c:if>--%>
								<%--</td>--%>
								<%--<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>--%>
							<%--</tr>--%>
						<%--</table>--%>
						<%--</div>--%>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				format: "yyyy-mm",
				minViewMode: 1,
				autoclose: true,
				todayHighlight: true
			});
			
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
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>ordercapital/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>ordercapital/delete.do?OrderCapital_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>ordercapital/goEdit.do?OrderCapital_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>ordercapital/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>ordercapital/excel.do';
		}
	</script>


</body>
</html>