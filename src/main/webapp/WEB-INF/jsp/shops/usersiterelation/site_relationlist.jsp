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
						<form action="userSiteRelation/goRelation.do" method="post" name="userForm" id="userForm">
                        <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID}" width="100%">
                        <input type="hidden" name="type" id="type" value="${pd.type}" width="100%">
                       <%-- <div class="page-header position-relative">--%>
                            <table style="width:100%;">
                                <tr>
                                    <td style="vertical-align:top;">
                                        <div class="pagination" style="float: left;padding-top: 10px;margin-top: 0px;">
                                          员工姓名:&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: #0000DD">${userData.NAME}</b>
                                    </div>
                              </td>
                                </tr>
                            </table>
                        <%--</div>--%>
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="关键字:站点名称、站点编码"  style="vertical-align:top;width: 190px;"/>
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="city2" id="city2" data-placeholder="请选择城市" style="vertical-align:top;width: 120px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="1" <c:if test="${pd.city2==1}">selected</c:if>>上海</option>
                                        <option value="2" <c:if test="${pd.city2==2}">selected</c:if>>深圳</option>
                                        <option value="3" <c:if test="${pd.city2==3}">selected</c:if>>杭州</option>
								  	</select>
								</td>

                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="site_type" id="site_type" data-placeholder="请选择站点类型" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="01" <c:if test="${pd.site_type=='01'}">selected</c:if>>城市站</option>
                                        <option value="02" <c:if test="${pd.site_type=='02'}">selected</c:if>>区域站</option>
                                        <option value="03" <c:if test="${pd.site_type=='03'}">selected</c:if>>普通站</option>
                                        <option value="04" <c:if test="${pd.site_type=='04'}">selected</c:if>>合作站点</option>
                                    </select>
                                </td>

                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="distribute_type" id="distribute_type" data-placeholder="请选择派单类型" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="1" <c:if test="${pd.distribute_type =='1'}">selected</c:if>>辐射半径</option>
                                        <option value="0" <c:if test="${pd.distribute_type =='0'}">selected</c:if>>多边形</option>
                                    </select>
                                </td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon1" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<%--<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon2" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>--%>
								<%--<c:if test="${QX.FromExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon3" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td></c:if>--%>
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
                                    <th class="center">站点编码</th>
									<th class="center">站点名称</th>
                                    <th class="center" style="color: red">商户名称</th>
									<th class="center">服务区域</th>
                                    <th class="center">站点详细地址</th>
									<th class="center">建站日期</th>
									<%--<th class="center">操作</th>--%>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty siteList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${siteList}" var="site" varStatus="vs">
										<tr>
                                            <td class='center'>
                                                <label class="pos-rel"><input type='checkbox' name='ids' value="${site.site_sid}" class="ace" /><span class="lbl"></span></label>
                                            </td>
											<td class="center">${site.sitecode }</td>
											<td class="center">${site.site_name }</td>
                                            <td class="center">
                                                <c:if test="${site.bus_name eq null }">
                                                    --
                                                </c:if>
                                                ${site.bus_name}
                                            </td>
											<td class="center">${site.site_area}</td>
											<td class="center">${site.siteaddress}</td>
                                            <td class="center">${site.create_date}</td>
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
                                    <c:if test="${pd.type == 1}"><a class="btn btn-mini btn-success" onclick="makeAll('确定要给员工分配选中的门店吗?');">分配</a></c:if>
                                    <c:if test="${pd.type == 2}"><a class="btn btn-mini btn-success" onclick="makeAll('确定要取消分配的门店吗?');">取消分配</a></c:if>
								</c:if>
                                <%--<c:if test="${QX.FHSMS == 1 }"><a title="批量发送站内信" class="btn btn-mini btn-info" onclick="makeAll('确定要给选中的用户发送站内信吗?');"><i class="ace-icon fa fa-envelope-o bigger-120"></i></a></c:if>
                                <c:if test="${QX.email == 1 }"><a title="批量发送电子邮件" class="btn btn-mini btn-primary" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="ace-icon fa fa-envelope bigger-120"></i></a></c:if>
                                <c:if test="${QX.sms == 1 }"><a title="批量发送短信" class="btn btn-mini btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="ace-icon fa fa-envelope-o bigger-120"></i></a></c:if>
                                <c:if test="${QX.del == 1 }">
                                <a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
                                </c:if>--%>
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

//删除
function delUser(userId,msg){
	bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "<%=basePath%>user/deleteU.do?USER_ID="+userId+"&tm="+new Date().getTime();
			$.get(url,function(data){
				nextPage(${page.currentPage});
			});
		};
	});
}

//新增
function add(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增";
	 diag.URL = '<%=basePath%>siteUser/goAddU.do';
	 diag.Width = 469;
	 diag.Height = 510;
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

//修改
function editUser(user_id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>siteUser/goEditU.do?USER_ID='+user_id;
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}

//关联商铺
function relationBus(user_id,bus_id){
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag=true;
    diag.Title ="关联商户";
    diag.URL = '<%=basePath%>sitelist/goRelation.do?site_sid='+user_id+"&bus_id="+bus_id;
    diag.Width = 469;
    diag.Height = 510;
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
            var user_id = $("#user_id").val();
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  }
			}
			if(str==''){
				/*bootbox.dialog({
					message: "<span class='bigger-110'>您没有选择任何内容!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});*/
				$("#zcheckbox").tips({
					side:3,
		            msg:'点这里全选',
		            bg:'#AE81FF',
		            time:8
		        });
				
				return;
			}else{
				if(msg == '确定要给员工分配选中的门店吗?'){
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>userSiteRelation/userSiteRelation.do?tm='+new Date().getTime(),
				    	data: {site_sid:str,user_id:user_id,type:1},
						dataType: 'text',
						cache: false,
						success: function(data){
						}
					});
				}
                if(msg == '确定要取消分配的门店吗?'){
                    top.jzts();
                    $.ajax({
                        type: "POST",
                        url: '<%=basePath%>userSiteRelation/userSiteRelation.do?tm='+new Date().getTime(),
                        data: {site_sid:str,user_id:user_id,type:2},
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
