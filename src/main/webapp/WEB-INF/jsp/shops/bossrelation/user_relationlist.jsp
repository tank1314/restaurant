<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<form action="bossuser/goRelation.do" method="post" name="userForm" id="userForm">
                        <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID}" width="100%">
                        <input type="hidden" name="opertype" id="opertype" value="${pd.opertype}" width="100%">
                            <table style="width:100%;">
                                <tr>
                                    <td style="vertical-align:top;">
                                        <div class="pagination" style="float: left;padding-top: 10px;margin-top: 0px;">
                                         管理员姓名:&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: #0000DD">${userData.NAME}</b>
                                    </div>
                              </td>
                                </tr>
                            </table>
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="关键字:商户名称、归属单位"  style="vertical-align:top;width: 210px;"/>
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon1" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
                                    <th class="center">加盟商名称</th>
									<th class="center">押金</th>
                                    <th class="center">归属单位</th>
                                    <th class="center">创建人</th>
								</tr>
							</thead>
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty busList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${busList}" var="bus" varStatus="vs">
										<tr>
                                            <td class='center'>
                                                <label class="pos-rel"><input type='checkbox' name='ids' value="${bus.id}" class="ace" /><span class="lbl"></span></label>
                                            </td>
											<td class="center">${bus.bus_name}</td>
											<td class="center">${bus.deposit}</td>
                                            <td class="center">${bus.belong_unit}</td>
                                            <td class="center">${bus.create_by}</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="10" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						
					<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;">
								<c:if test="${QX.add == 1 }">
                                    <c:if test="${pd.opertype == 1}"><a class="btn btn-mini btn-success" onclick="makeAll('确定要给员工管理选中的商户吗?');">管理</a></c:if>
                                    <c:if test="${pd.opertype == 2}"><a class="btn btn-mini btn-success" onclick="makeAll('确定要取消管理的商户吗?');">取消管理</a></c:if>
								</c:if>
                                </td>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
					</div>
                    <!-- 解决关闭弹出成  无效-->
                    <div id="zhongxin" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>

<script type="text/javascript">
$(top.hangge());

//检索
function searchs(){
	top.jzts();
	$("#userForm").submit();
}

//批量操作
function makeAll(msg){
	bootbox.confirm(msg, function(result) {
		if(result) {
			var str = '';
            var user_id = $("#user_id").val();
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  }
			}
            console.log(str+"===");
			if(str==''){
				$("#zcheckbox").tips({
					side:3,
		            msg:'点这里全选',
		            bg:'#AE81FF',
		            time:8
		        });
				
				return;
			}else{
				if(msg == '确定要给员工管理选中的商户吗?'){
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>bossuser/bossUserRelation.do?tm='+new Date().getTime(),
				    	data: {bus_id:str,boss_id:user_id,opertype:1},
						dataType: 'text',
						cache: false,
						success: function(data){
						}
					});
				}
                if(msg == '确定要取消管理的商户吗?'){
                    top.jzts();
                    $.ajax({
                        type: "POST",
                        url: '<%=basePath%>bossuser/bossUserRelation.do?tm='+new Date().getTime(),
                        data: {bus_id:str,boss_id:user_id,opertype:2},
                        dataType: 'text',
                        cache: false,
                        success: function(data){
                        }
                    });
                }
                //关闭弹出层
                top.Dialog.close();
			}
		}
	});
}

$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
	
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
		
</script>
</html>
