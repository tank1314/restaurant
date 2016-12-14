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
						<form action="userDrawCash/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入用户手机号" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" />
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="apply_status" id="apply_status" data-placeholder="请选择提现状态" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="0" <c:if test="${pd.apply_status== 0 and pd.apply_status != ''}">selected</c:if>>提现申请中</option>
                                        <option value="1" <c:if test="${pd.apply_status== 1}">selected</c:if>>提现审核成功</option>
                                        <option value="2" <c:if test="${pd.apply_status== 2}">selected</c:if>>提现审核拒绝</option>
								  	</select>
								</td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" value="${pd.lastLoginStart}" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" value="${pd.lastLoginEnd}" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                                <c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
                            <!-- 如果登录用户有修改编辑的权限(即财务管理人员) 即可显示当前还有多少未审核的订单 -->
                            <c:if test="${QX.edit == 1 }">
                                <tr>
                                    <td style="vertical-align:top;padding-left:2px;" colspan="2">系统当前共有[&nbsp;<font color="red">${pd.cashCount}</font>&nbsp;]条未处理的用户提现记录</td>
                                </tr>
                            </c:if>
                            <c:if test="${QX.add == 1 }">
                                <tr><td style="vertical-align:top;">
                                    <a class="btn btn-sm btn-success" onclick="add();">录入提现单</a>
                                </td></tr>
                            </c:if>

						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
                                    <th class="center">提现编码</th>
                                    <th class="center">用户手机号</th>
                                    <th class="center">用户姓名</th>
									<th class="center">提现金额</th>
                                    <th class="center">提现状态</th>
									<th class="center">客服人员</th>
									<th class="center">申请时间</th>
                                    <th class="center">审核时间</th>
									<th class="center">审核意见</th>
                                    <th class="center">操作</th>
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
                                            <td class='center'>${var.user_phone}</td>
                                            <td class='center'>${var.user_name}</td>
                                            <td class='center'>${var.draw_moneyshow}</td>
											<td class='center'>
                                                <c:if test="${var.apply_status ==0}">
                                                    提现申请中
                                                </c:if>
                                                <c:if test="${var.apply_status ==1}">
                                                    提现审核成功
                                                </c:if>
                                                <c:if test="${var.apply_status ==2}">
                                                    提现审核拒绝
                                                </c:if>
                                            </td>
											<td class='center'>${var.name}</td>
											<td class='center'>${var.apply_time}</td>
                                            <td class='center'>${var.examin_time}</td>
											<td class='center'>${var.examin_desc}</td>
											<td class="center">
												<div class="hidden-sm hidden-xs">
                                                    <c:if test="${QX.add == 1}">
                                                        <c:if test="${var.apply_status == 2}">
                                                            <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.id}');">
                                                                <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${var.apply_status != 2}">
                                                            <span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
                                                        </c:if>
                                                    </c:if>
													<c:if test="${QX.edit == 1}">
                                                        <a class="btn btn-xs btn-success" title="审核" onclick="edit('${var.id}');">
                                                            <i class="ace-icon fa fa-pencil-square-o bigger-120" title="审核"></i>
                                                        </a>
                                                    <c:if test="${var.apply_status == 1 and var.yz_mark !=1}">
                                                        <a class="btn btn-xs btn-success" title="提现成功" onclick="confirmData('${var.user_phone}','${var.id}');">
                                                            <i class="ace-icon fa fa-check bigger-120" style="background: red;"  title="提现成功"></i>
                                                        </a>
                                                    </c:if>
													</c:if>
												</div>
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

        //新增
        function add(){
            top.jzts();
            var diag = new top.Dialog();
            diag.Drag=true;
            diag.Title ="提现申请单";
            diag.URL = '<%=basePath%>userDrawCash/goAdd.do';
            diag.Width = 880;
            diag.Height = 520;
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

        //审核
        function edit(user_id){
            top.jzts();
            var diag = new top.Dialog();
            diag.Drag=true;
            diag.Title ="提现审核";
            diag.URL = '<%=basePath%>userDrawCash/goEdit.do?id='+user_id;
            diag.Width = 860;
            diag.Height = 640;
            diag.CancelEvent = function(){ //关闭事件
                if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                    nextPage(${page.currentPage});
                }
                diag.close();
            };
            diag.show();
        }

        /**
        * 银证转账成功后 用户数据清空
        * @param phone
        */
        function confirmData(phone,trade_no){
            var isConf = confirm('提现是否已经完成?');
            if(isConf){
                $.ajax({
                    type: "POST",
                    url: '<%=basePath%>userDrawCash/changeMoney.do',
                    data: {user_phone:phone,trade_no:trade_no,tm:new Date().getTime()},
                    dataType:'json',
                    cache: false,
                    success: function(data){
                        var result = data.resultVo;
                        if(result.error_no == 0){
                            alert("提现流程完成!");
                        }
                        else if(result.error_no == -1){
                            alert("提现流程缺失参数!");
                        }
                        else if(result.error_no == -2){
                            alert("系统未检测到该用户信息!");
                        }
                        else if(result.error_no == 1){
                            alert("数据更新失败!请联系管理员!");
                        }
                        else{
                            alert("系统错误!");
                        }
                        location.href=location.href;
                    }
                });
            }
        }
	</script>

</body>
</html>