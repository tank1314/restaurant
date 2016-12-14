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
							
						<!-- 检索  -->
						<form action="orderserver/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="输入订单号、员工号" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>

                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="site_sid" id="site_sid" data-placeholder="请选择服务站点" style="vertical-align:top;width: 120px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <c:forEach items="${siteList}" var="site">
                                            <option value="${site.site_sid }" <c:if test="${pd.site_sid==site.site_sid}">selected</c:if>>${site.site_name }</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="is_evaluate" id="is_evaluate" data-placeholder="是否评价" style="vertical-align:top;width: 120px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="0" <c:if test="${is_evaluate=='0'}">selected</c:if>>未评价</option>
                                        <option value="1" <c:if test="${is_evaluate=='1'}">selected</c:if>>已评价</option>
                                    </select>
                                </td>

								<td style="vertical-align:top;padding-left:2px;">
									<select class="chosen-select form-control" name="service_rating" id="service_rating" data-placeholder="满意度" style="vertical-align:top;width: 120px;">
										<option value=""></option>
										<option value="">全部</option>
										<option value="5" <c:if test="${service_rating=='5'}">selected</c:if>>满意</option>
										<option value="3" <c:if test="${service_rating=='3'}">selected</c:if>>一般</option>
										<option value="1" <c:if test="${service_rating=='1'}">selected</c:if>>不满意</option>
									</select>
								</td>

                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="has_collect_info" id="has_collect_info" data-placeholder="是否收集" style="vertical-align:top;width: 120px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="0" <c:if test="${has_collect_info=='0'}">selected</c:if>>未收集</option>
                                        <option value="1" <c:if test="${has_collect_info=='1'}">selected</c:if>>已收集</option>
                                    </select>
                                </td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px">
                                <a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icons" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
                                </c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>

									<th class="center">订单编号</th>
									<th class="center">服务员工号</th>
                                    <th class="center">站点名称</th>
									<%--<th class="center">服务地址</th>--%>
                                    <th class="center">服务日期</th>
                                    <th class="center">服务时间</th>

                                   <%-- <th class="center">客户年龄</th>
                                    <th class="center">是否外国人</th>
                                    <th class="center">是否结婚</th>
                                    <th class="center">是否有小孩</th>
                                    <th class="center">是否有宠物</th>
                                    <th class="center">房屋类型</th>
                                    <th class="center">房屋面积</th>--%>
                                    <th class="center">评价详情</th>
                                    <th class="center">用户习惯</th>
									<th class="center">用户详情</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${var.id}</td>
											<td class='center'>${var.allot_no}</td>
                                            <td class='center'>${var.site_name}</td>
											<%--<td class='center'>${var.address}</td>--%>
                                            <td class='center'>${var.start_day}</td>
                                            <td class='center'>${var.start_time}</td>
                                           <%-- <td class='center'>${var.age}</td>
                                            <td class='center'>
                                                <c:if test="${var.is_foreigner == false}">不是</c:if>
                                                <c:if test="${var.is_foreigner == true}">是</c:if>
                                            </td>
                                            <td class='center'>
                                                <c:if test="${var.is_marriage == false}">未婚</c:if>
                                                <c:if test="${var.is_marriage == true}">已婚</c:if>
                                            </td>
                                            <td class='center'>${var.child_age}</td>
                                            <td class='center'>${var.pet}</td>

                                            <td class='center'>${var.hourse_type}</td>
                                            <td class='center'>${var.hourse_area}</td>--%>
                                            <td class="center">
                                                <c:if test="${var.is_evaluate == '1' }">
                                                    <c:if test="${var.service_rating == '满意' }">
                                                        <font style="color: orangered;"> 满意</font>
                                                    </c:if>
                                                    <c:if test="${var.service_rating != '满意' }">
                                                        <a title="评价详情" onclick="showHabitDiv('[ ${var.service_rating} ] ${var.comment}',1);" style="text-decoration:none;cursor:pointer;" >
                                                            查看评价
                                                        </a>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${var.is_evaluate == '2' }">
                                                   系统满意
                                                </c:if>
                                                <c:if test="${var.is_evaluate == '0' }">
                                                暂无评价
                                                </c:if>
                                            </td>
                                            <td class='center'>
                                                <c:if test="${var.customer_habits !=null && var.customer_habits !='' }">
                                                    <a title="用户习惯" onclick="showHabitDiv('${var.customer_habits}',0);" style="text-decoration:none;cursor:pointer;" >
                                                        <c:if test="${var.customer_habits.length() > 4 }">${fn:substring(var.customer_habits, 0, 4)}...</c:if>&nbsp;
                                                        <c:if test="${var.customer_habits.length() <= 4 }">${var.customer_habits}</c:if>
                                                    </a>
                                                </c:if>
                                                <c:if test="${var.customer_habits == null || var.customer_habits =='' }">
                                                    暂未收集
                                                </c:if>
                                            </td>
											<td class="center">
												<a title="用户详情" onclick="showUserDiv('${var.order_sn}');" style="text-decoration:none;cursor:pointer;" >
													<i class="normal-icon ace-icon fa fa-eye green bigger-130"></i>
												</a>
											</td>
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



        function showHabitDiv(habbits,type){
            top.jzts();
            var diag = new top.Dialog();
            diag.Drag=true;
            if(0==type){
                diag.Title ="用户习惯";
            }
            if(1==type){
                diag.Title ="评价详情";
            }
            diag.URL = '<%=basePath%>yhinfo/view.do?customer_habits='+habbits;
            diag.Width = 360;
            diag.Height = 286;
            diag.CancelEvent = function(){ //关闭事件
                diag.close();
            };
            diag.show();
        }

        function  showUserDiv(orderid) {
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="用户详情";
			diag.URL = '<%=basePath%>orderserver/view.do?order_sn='+orderid;
			diag.Width = 660;
			diag.Height = 360;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		}

        //导出excel
        function toExcel(){
            var keywords = $("#nav-search-input").val();
            var lastLoginStart = $("#lastLoginStart").val();
            var lastLoginEnd = $("#lastLoginEnd").val();
            var site_sid = $("#site_sid").val();
            var is_evaluate = $("#is_evaluate").val();
            var has_collect_info = $("#has_collect_info").val();
            window.location.href='<%=basePath%>orderserver/excel.do?keywords='+keywords+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd+'&site_sid='+site_sid+'&is_evaluate='+is_evaluate+'&has_collect_info='+has_collect_info;
        }
	</script>


</body>
</html>