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
						<form action="sitelist/list.do" method="post" name="userForm" id="userForm">
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
                                    <select class="chosen-select form-control" name="bus_id" id="bus_id" data-placeholder="是否关联商户" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="1" <c:if test="${pd.bus_id =='1'}">selected</c:if>>已关联</option>
                                        <option value="0" <c:if test="${pd.bus_id =='0'}">selected</c:if>>未关联</option>
                                    </select>
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

                                <%--<td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="site_type" id="site_type" data-placeholder="请选择站点类型" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="01" <c:if test="${pd.site_type=='01'}">selected</c:if>>城市站</option>
                                        <option value="02" <c:if test="${pd.site_type=='02'}">selected</c:if>>区域站</option>
                                        <option value="03" <c:if test="${pd.site_type=='03'}">selected</c:if>>普通站</option>
                                        <option value="04" <c:if test="${pd.site_type=='04'}">selected</c:if>>合作站点</option>
                                    </select>
                                </td>--%>
                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="service_type" id="service_type" data-placeholder="请选择服务范围" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="1" <c:if test="${pd.service_type=='1'}">selected</c:if>>家政</option>
                                        <option value="2" <c:if test="${pd.service_type=='2'}">selected</c:if>>跑腿</option>
                                        <option value="3" <c:if test="${pd.service_type=='3'}">selected</c:if>>出行</option>
                                        <option value="4" <c:if test="${pd.service_type=='4'}">selected</c:if>>洗衣</option>
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
									<%--<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>--%>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">站点编号</th>
                                    <th class="center">站点编码</th>
                                    <th class="center" style="color: red">商户名称</th>
									<th class="center">站点名称</th>
                                    <th class="center">服务范围</th>
									<th class="center">服务区域</th>
                                    <th class="center">站点详细地址</th>
									<th class="center">建站日期</th>
                                    <th class="center">关联商户</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty siteList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${siteList}" var="site" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${site.site_sid }</td>
											<td class="center">${site.sitecode }</td>
                                            <td class="center">
                                                <c:if test="${site.bus_name eq null }">
                                                    --
                                                </c:if>
                                                    ${site.bus_name}
                                            </td>
											<td class="center">${site.site_name }</td>
                                            <td class="center">
                                                <c:if test="${site.service_type eq null || site.service_type == ''}">
                                                    --
                                                </c:if>
                                                <c:if test="${site.service_type eq 1 }">
                                                    家政
                                                </c:if>
                                                <c:if test="${site.service_type eq 2 }">
                                                    跑腿
                                                </c:if>
                                                <c:if test="${site.service_type eq 3 }">
                                                    出行
                                                </c:if>
                                                <c:if test="${site.service_type eq 4 }">
                                                    洗衣
                                                </c:if>
                                            </td>
											<td class="center">${site.site_area}</td>
											<td class="center">${site.siteaddress}</td>
                                            <td class="center">${site.create_date}</td>
                                            <td class="center">
                                                <c:if test="${QX.edit == 1 }">
                                                    <a style="cursor:pointer;" onclick="relationBus('${site.site_sid}','${site.bus_id}',1);" class="btn btn-warning btn-mini" data-rel="tooltip" title="关联商户">
                                                        <span class="red"> <i class="ace-icon fa fa-wrench bigger-110 icon-only"></i></span>
                                                    </a>
                                                </c:if>
                                                <c:if test="${QX.edit != 1 }">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
                                                </c:if>
                                            </td>
                                            <td class="center">
                                                <c:if test="${QX.edit != 1}">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
                                                </c:if>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <c:if test="${QX.edit == 1 }">
                                                        <a class="btn btn-xs btn-success" title="编辑" onclick="relationBus('${site.site_sid}','',2);">
                                                            <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
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
                                                                    <a style="cursor:pointer;" onclick="relationBus('${site.site_sid}','',2);" class="tooltip-success" data-rel="tooltip" title="编辑">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
                                                                    </a>
                                                                </li>
                                                            </c:if>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="11" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="11" class="center">没有相关数据</td>
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
								<a class="btn btn-mini btn-success" onclick="add();">新增</a>
								</c:if>
								<c:if test="${QX.FHSMS == 1 }"><a title="批量发送站内信" class="btn btn-mini btn-info" onclick="makeAll('确定要给选中的用户发送站内信吗?');"><i class="ace-icon fa fa-envelope-o bigger-120"></i></a></c:if>
								<c:if test="${QX.email == 1 }"><a title="批量发送电子邮件" class="btn btn-mini btn-primary" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="ace-icon fa fa-envelope bigger-120"></i></a></c:if>
								<c:if test="${QX.sms == 1 }"><a title="批量发送短信" class="btn btn-mini btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="ace-icon fa fa-envelope-o bigger-120"></i></a></c:if>
								<c:if test="${QX.del == 1 }">
								<a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
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
function relationBus(user_id,bus_id,type){
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag=true;
    if("1" == type){
        diag.Title ="关联商户";
        diag.URL = '<%=basePath%>sitelist/goRelation.do?site_sid='+user_id+"&bus_id="+bus_id+"&type=1";
    }
    if("2" == type){
        diag.Title ="服务范围";
        diag.URL = '<%=basePath%>sitelist/goRelation.do?site_sid='+user_id+"&type=2";
    }
    diag.Width = 469;
    diag.Height = 400;
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
			var emstr = '';
			var phones = '';
			var username = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  	
				  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
				  	else emstr += ';' + document.getElementsByName('ids')[i].id;
				  	
				  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
				  	else phones += ';' + document.getElementsByName('ids')[i].alt;
				  	
				  	if(username=='') username += document.getElementsByName('ids')[i].title;
				  	else username += ';' + document.getElementsByName('ids')[i].title;
				  }
			}
			if(str==''){
				bootbox.dialog({
					message: "<span class='bigger-110'>您没有选择任何内容!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				$("#zcheckbox").tips({
					side:3,
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
						url: '<%=basePath%>user/deleteAllU.do?tm='+new Date().getTime(),
				    	data: {USER_IDS:str},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							 $.each(data.list, function(i, list){
									nextPage(${page.currentPage});
							 });
						}
					});
				}else if(msg == '确定要给选中的用户发送邮件吗?'){
					sendEmail(emstr);
				}else if(msg == '确定要给选中的用户发送短信吗?'){
					sendSms(phones);
				}else if(msg == '确定要给选中的用户发送站内信吗?'){
					sendFhsms(username);
				}
			}
		}
	});
}

//去发送短信页面
function sendSms(phone){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="发送短信";
	 diag.URL = '<%=basePath%>head/goSendSms.do?PHONE='+phone+'&msg=appuser';
	 diag.Width = 600;
	 diag.Height = 265;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//去发送电子邮件页面
function sendEmail(EMAIL){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="发送电子邮件";
	 diag.URL = '<%=basePath%>head/goSendEmail.do?EMAIL='+EMAIL;
	 diag.Width = 660;
	 diag.Height = 486;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//发站内信
function sendFhsms(username){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="站内信";
	 diag.URL = '<%=basePath%>fhsms/goAdd.do?username='+username;
	 diag.Width = 660;
	 diag.Height = 444;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
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

//导出excel
function toExcel(){
	var keywords = $("#nav-search-input").val();
	var lastLoginStart = $("#lastLoginStart").val();
	var lastLoginEnd = $("#lastLoginEnd").val();
	var ROLE_ID = $("#role_id").val();
	window.location.href='<%=basePath%>user/excel.do?keywords='+keywords+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd+'&ROLE_ID='+ROLE_ID;
}

//打开上传excel页面
function fromExcel(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="EXCEL 导入到数据库";
	 diag.URL = '<%=basePath%>user/goUploadExcel.do';
	 diag.Width = 300;
	 diag.Height = 150;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location.reload()",100);
			 }else{
				 nextPage(${page.currentPage});
			 }
		}
		diag.close();
	 };
	 diag.show();
}	

//查看用户
function viewUser(USERNAME){
	if('admin' == USERNAME){
		bootbox.dialog({
			message: "<span class='bigger-110'>不能查看admin用户!</span>",
			buttons: 			
			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
		});
		return;
	}
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>siteUser/view.do?USERNAME='+USERNAME;
	 diag.Width = 469;
	 diag.Height = 380;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
		
</script>
</html>
