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
						<form action="bussiteReport/jslist.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入技师姓名、手机号" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" style="vertical-align:top;width: 190px;"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" onchange="chooseBus();" name="bus_id" id="bus_id" data-placeholder="请选择商户列表" style="vertical-align:top;width: 140px;">
									<option value=""></option>
                                        <option value="">全部</option>
                                        <c:forEach items="${busList}" var="bus">
                                            <option value="${bus.bus_id }" <c:if test="${bus.bus_id ==pd.bus_id}">selected</c:if>>${bus.bus_name }</option>
                                        </c:forEach>
                                    </select>
								</td>
                                <div id="hidden_site" style="display: none;">
                                    <select class="chosen-select form-control" name="hidden_sid" id="hidden_sid" data-placeholder="请选择站点列表" style="vertical-align:top;width: 140px;">
                                        <c:forEach items="${siteList}" var="site">
                                            <option value="${site.site_sid}" bus_id = "${site.bus_id}">${site.site_name }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <c:if test="${pd.isSelct eq '1'}">
                                    <td style="vertical-align:top;padding-left:2px;">
                                        <select class="chosen-select form-control" name="site_sid" id="site_sid" data-placeholder="请选择站点列表" style="vertical-align:top;width: 140px;">
                                            <option value=""></option>
                                            <option value="">--请选择--</option>
                                            <c:forEach items="${siteList}" var="site">
                                                <option value="${site.site_sid}" <c:if test="${site.site_sid ==pd.site_sid}">selected</c:if>>${site.site_name }</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </c:if>
								<td style="vertical-align:top;padding-left:2px;">
									<select class="chosen-select form-control" name="jnstatus" id="jnstatus" data-placeholder="是否分配技能" style="vertical-align:top;width: 140px;">
										<option value=""></option>
										<option value="">--请选择--</option>
										<option value="1" <c:if test="${pd.jnstatus == 1}">selected</c:if>>已分配</option>
										<option value="2" <c:if test="${pd.jnstatus == 2}">selected</c:if>>未分配</option>
									</select>
								</td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>

                                <c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<%--<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>--%>
                                    <th class="center" style="width:50px;">序号</th>
									<th class="center" style="width:50px;">技师姓名</th>
									<th class="center">归属站点</th>
                                    <th class="center" style="width:50px;">性别</th>
									<th class="center">联系电话</th>
                                    <th class="center">邮箱</th>
									<th class="center">职位类型</th>
									<th class="center">常住地址</th>
                                    <th class="center">登录次数</th>
									<th class="center">创建时间</th>
									<th class="center">查看技能</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty jsList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${jsList}" var="var" varStatus="vs">
										<tr>
											<%--<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.id}" class="ace" /><span class="lbl"></span></label>
											</td>--%>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center' style="width: 100px;">${var.realname}</td>
											<td class='center' style="width: 100px;">${var.site_name}</td>
                                            <td class='center'>
                                                <c:if test="${var.xb ==0}">未知</c:if>
                                                <c:if test="${var.xb ==1}">男</c:if>
                                                <c:if test="${var.xb ==2}">女</c:if>
                                            </td>
											<td class='center'>${var.mobile}</td>
											<td class='center'>${var.email}</td>
                                            <td class='center'>
                                                <c:if test="${var.duty_type =='01'}">全职</c:if>
                                                <c:if test="${var.duty_type =='02'}">兼职</c:if>
                                            </td>
											<td class='center'>${var.address}</td>
											<td class='center'>${var.login_count}</td>
											<td class='center'>${var.createtime}</td>
											<td class="center">
												<c:if test="${var.skillcount > 0}">
													<div class="hidden-sm hidden-xs btn-group">
														<a title="查看技能" onclick="findJsSkill('${var.username}','${var.realname}')");>
															<i class="normal-icon ace-icon fa fa-eye green bigger-130" title="查看技能"></i>
														</a>
													</div>
												</c:if>
												<c:if test="${var.skillcount == 0 || var.skillcount == null} ">
													<font color="red">暂无技能</font>
												</c:if>
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
								<%--<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									</c:if>
									&lt;%&ndash;<c:if test="${QX.del == 1 }">
									<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>&ndash;%&gt;
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
            /*初始化时加载站点下拉数据*/
            var bus_id = $("#bus_id").val();//当前商户id
            var sitehtml = '<option value="">请选择站点列表</option>';
            var select=document.getElementById('hidden_sid');//将当前用户所有的站点列出
            if(bus_id){
                for(var i=0;i<select.length;i++) {
                    if(select.options[i].getAttribute("bus_id")==bus_id){
                        sitehtml+='<option value='+select.options[i].value+'>'+select.options[i].text+'</option>';
                    }
                }
            }
            $("#site_sid").html("");
            $("#site_sid").chosen("destroy");
            $("#site_sid").html(sitehtml);
            $("#site_sid").chosen();//初始化

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
        //商户下拉选择
        function chooseBus(){
            //首先需要对站点清空
            $("#site_sid").html("");
            $("#site_sid").chosen("destroy");
            var bus_id = $("#bus_id").val();//当前商户id
            var sitehtml = '<option value="">请选择站点列表</option>';
            var select=document.getElementById('hidden_sid');//将当前用户所有的站点列出
            for(var i=0;i<select.length;i++) {
                if(select.options[i].getAttribute("bus_id")==bus_id){
                    sitehtml+='<option value='+select.options[i].value+'>'+select.options[i].text+'</option>';
                }
            }
            $("#site_sid").html(sitehtml);
            $("#site_sid").trigger("liszt:updated");
            $("#site_sid").chosen();
        }

		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>alliancebusiness/excel.do';
		}

		/**
		查询员工技能*
		* @param empid
		* @param empname*/
		function findJsSkill(empid,empname){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="["+empname+"]技能查询";
			diag.URL = '<%=basePath%>bussiteReport/jsSkillList.do?empid='+empid;
			diag.Width = 480;
			diag.Height = 480;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		}
	</script>
</body>
</html>