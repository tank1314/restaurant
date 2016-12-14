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
    <%@ include file="../system/index/top.jsp"%>
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
                        <table id="simple-table1Report" class="table " style="margin-top:2px;">
                            <tr align="center">
                                <td><h4>城市运营数据分析</h4></td>
                            </tr>
                        </table>
						<!-- 检索  -->
						<form action="operationDataReport/cityoperadetail.do" method="post" name="Form" id="Form">
                            <table style="margin-top:1px;">
                                <tr>
                                    <c:if test="${QX.cha == 1 }">
                                        <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                        <td style="vertical-align:top;padding-left:2px">
                                        <a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                    </c:if>
                                </tr>
                            </table>
                            <!-- 检索  -->
                        <!-- 列表展示数据START -->
					    <div id="tableShow">
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center" rowspan="2">运营时间</th>
                                    <th class="center" colspan="3" bgcolor="#fff8dc">新用户&nbsp;&nbsp;<a class="green" id="show-option1" href="javascript:void(0);" title="当月注册并下单成功(服务完成)的用户"> <i class="ace-icon fa fa-hand-o-right"></i></a></th>
                                    <th class="center" colspan="3" bgcolor="#fffacd">使用用户&nbsp;&nbsp;<a class="green" id="show-option2" href="javascript:void(0);" title="当月下单成功(服务完成)的用户"> <i class="ace-icon fa fa-hand-o-right"></i></a></th>
                                    <th class="center" colspan="3" bgcolor="#fff8dc">预约订单&nbsp;&nbsp;<a class="green" id="show-option3" href="javascript:void(0);" title="当月的订单"> <i class="ace-icon fa fa-hand-o-right"></i></a></th>
                                    <th class="center" colspan="3" bgcolor="#fffacd">服务订单&nbsp;&nbsp;<a class="green" id="show-option4" href="javascript:void(0);" title="当月订单服务完成的订单"> <i class="ace-icon fa fa-hand-o-right"></i></a></th>
                                    <th class="center" colspan="3" bgcolor="#fff8dc">复购用户&nbsp;&nbsp;<a class="green" id="show-option5" href="javascript:void(0);" title="当月用户完成2笔以上订单的用户"> <i class="ace-icon fa fa-hand-o-right"></i></a></th>
                                    <th class="center" colspan="3" bgcolor="#fffacd">复购率&nbsp;&nbsp;<a class="green" id="show-option6" href="javascript:void(0);" title="复购用户&nbsp;/&nbsp;使用用户"> <i class="ace-icon fa fa-hand-o-right"></i></a></th>
                                </tr>
                                <tr>
                                    <th class="center" bgcolor="#fff8dc">上海</th>
                                    <th class="center" bgcolor="#fff8dc">深圳</th>
                                    <th class="center" bgcolor="#fff8dc">杭州</th>

                                    <th class="center" bgcolor="#fffacd">上海</th>
                                    <th class="center" bgcolor="#fffacd">深圳</th>
                                    <th class="center" bgcolor="#fffacd">杭州</th>

                                    <th class="center" bgcolor="#fff8dc">上海</th>
                                    <th class="center" bgcolor="#fff8dc">深圳</th>
                                    <th class="center" bgcolor="#fff8dc">杭州</th>

                                    <th class="center" bgcolor="#fffacd">上海</th>
                                    <th class="center" bgcolor="#fffacd">深圳</th>
                                    <th class="center" bgcolor="#fffacd">杭州</th>

                                    <th class="center" bgcolor="#fff8dc">上海</th>
                                    <th class="center" bgcolor="#fff8dc">深圳</th>
                                    <th class="center" bgcolor="#fff8dc">杭州</th>

                                    <th class="center" bgcolor="#fffacd">上海</th>
                                    <th class="center" bgcolor="#fffacd">深圳</th>
                                    <th class="center" bgcolor="#fffacd">杭州</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varList}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'>${var.currentTime}</td>
                                                    <td class='center' bgcolor="#fff8dc">${var.newUser20091637}</td>
                                                    <td class='center' bgcolor="#fff8dc">${var.newUser27763424}</td>
                                                    <td class='center' bgcolor="#fff8dc">${var.newUser26213393}</td>

                                                    <td class='center'>${var.syUser20091637}</td>
                                                    <td class='center'>${var.syUser27763424}</td>
                                                    <td class='center'>${var.syUser26213393}</td>

                                                    <td class='center' bgcolor="#fff8dc">${var.yyUser20091637}</td>
                                                    <td class='center' bgcolor="#fff8dc">${var.yyUser27763424}</td>
                                                    <td class='center' bgcolor="#fff8dc">${var.yyUser26213393}</td>

                                                    <td class='center'>${var.fwUser20091637}</td>
                                                    <td class='center'>${var.fwUser27763424}</td>
                                                    <td class='center'>${var.fwUser26213393}</td>

                                                    <td class='center' bgcolor="#fff8dc">${var.fgUser20091637}</td>
                                                    <td class='center' bgcolor="#fff8dc">${var.fgUser27763424}</td>
                                                    <td class='center' bgcolor="#fff8dc">${var.fgUser26213393}</td>

                                                    <td class='center'>${var.fgzb20091637}%</td>
                                                    <td class='center'>${var.fgzb27763424}%</td>
                                                    <td class='center'>${var.fgzb26213393}%</td>
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
                                            <td colspan="100" class="center" >
                                                    没有相关数据
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
						<%--<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>--%>
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
	<%@ include file="../system/index/foot.jsp"%>
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
    <script src="static/js/echarts.min.js"></script>
   <%-- <script src="static/js/siteOrderReport.js"></script>--%>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
            $("#Form").submit();
		}

		$(function() {

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

	</script>
</body>
</html>