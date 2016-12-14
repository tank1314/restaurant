<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							
						<!-- 检索    -->
						<form action="yhinfo/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入员工号、员工姓名" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" />
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="age" id="age" data-placeholder="请选择年龄" style="vertical-align:top;width: 120px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="0~10" <c:if test="${age=='0~10'}">selected</c:if>>0~10</option>
                                        <option value="10~20" <c:if test="${age=='10~20'}">selected</c:if>>10~20</option>
                                        <option value="20~30" <c:if test="${age=='20~30'}">selected</c:if>>20~30</option>
                                        <option value="30~40" <c:if test="${age=='30~40'}">selected</c:if>>30~40</option>
                                        <option value="40~50" <c:if test="${age=='40~50'}">selected</c:if>>40~50</option>
                                        <option value="50~60" <c:if test="${age=='50~60'}">selected</c:if>>50~60</option>
                                        <option value="60~70" <c:if test="${age=='60~70'}">selected</c:if>>60~70</option>
                                        <option value="70~80" <c:if test="${age=='70~80'}">selected</c:if>>70~80</option>
                                        <option value="其它" <c:if test="${age=='其它'}">selected</c:if>>其它</option>
								  	</select>
								</td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" value="${pd.lastLoginStart}" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" value="${pd.lastLoginEnd}" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                                <c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
                                    <th class="center">用户ID</th>
                                    <th class="center">年龄</th>
									<th class="center">外国人</th>
									<th class="center">宠物</th>
									<th class="center">房屋类型</th>
									<th class="center">房屋面积</th>
                                    <th class="center">员工编号</th>
									<th class="center">订单号</th>
									<th class="center">是否已婚</th>
                                    <th class="center">是否有小孩</th>
                                    <th class="center">用户习惯</th>
                                    <th class="center">创建时间</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
                                            <td class='center'>${var.uid}</td>
                                            <td class='center'>${var.age}</td>
											<td class='center'>
                                                <c:if test="${var.is_foreigner == false}">不是</c:if>
                                                <c:if test="${var.is_foreigner == true}">是</c:if>
                                            </td>

											<td class='center'>${var.pet}</td>
											<td class='center'>${var.hourse_type}</td>
											<td class='center'>${var.hourse_area}</td>
                                            <td class='center'>${var.emp_no}</td>
											<td class='center'>${var.order_id}</td>
											<td class='center'>
                                                <c:if test="${var.is_marriage == false}">未婚</c:if>
                                                <c:if test="${var.is_marriage == true}">已婚</c:if>
                                            </td>
                                            <td class='center'>${var.child_age}</td>
                                            <td class='center'>
                                                <c:if test="${var.customer_habits !=null && var.customer_habits !=''}">
                                                    <a title="用户习惯" onclick="showHabitDiv('${var.customer_habits}');" style="text-decoration:none;cursor:pointer;" >
                                                        <c:if test="${var.customer_habits.length() > 4 }">${fn:substring(var.customer_habits, 0, 4)}...</c:if>&nbsp;
                                                        <c:if test="${var.customer_habits.length() <= 4 }">${var.customer_habits}</c:if>
                                                    </a>
                                                </c:if>
                                            </td>
                                            <td class='center'>${var.create_time}</td>
											<%--<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>--%>
												<%--<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.id}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.id}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.id}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.id}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>--%>
											<%--</td>--%>
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
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<%--<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>
								</td>--%>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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

        function showHabitDiv(habbits){
            //top.jzts();
            /*var diag = new top.Dialog();
            diag.Width = 300;
            diag.Height = 100;
            diag.Title = "用户习惯";
            $("#_Container_0").innerHTML='直接输出html，使用dialog.<b>innerHTML';
           // diag.innerHTML='直接输出html，使用dialog.<b>innerHTML';
            diag.OKEvent = function(){
                diag.close();
            };//点击确定后调用的方法
            diag.show();*/
            var diag = new top.Dialog();
             diag.Drag=true;
             diag.Title ="用户习惯";
             diag.URL = '<%=basePath%>yhinfo/view.do?customer_habits='+habbits;
             diag.Width = 360;
             diag.Height = 286;
             diag.CancelEvent = function(){ //关闭事件
                 diag.close();
             };
             diag.show();
        }
	</script>


</body>
</html>