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
                        <table id="simple-table1Report" class="table " style="margin-top:5px;">
                            <tr align="center">
                                <td><h4>终端信息统计</h4></td>
                            </tr>
                        </table>
						<!-- 检索  -->
						<form action="terUserDataReport/list.do" method="post" name="Form" id="Form">
                        <!-- 列表展示数据START 1-->
                            <h5><strong>微信用户统计</strong></h5>
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center">运营时间</th>
                                    <th class="center">新增关注</th>
                                    <th class="center">取消关注人数</th>
                                    <th class="center">净增关注人数</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList1}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varList1}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.re_month}</font></td>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.wx_add_count}</font></td>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.wx_sub_count}</font></td>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.lastcount}</font></td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center' >环比增长值</td>
                                                <td class='center' >${hbzzWxlValue1}</td>
                                                <td class='center' >${hbzzWxlValue2}</td>
                                                <td class='center' >${hbzzWxlValue3}</td>
                                            </tr>
                                            <tr>
                                                <td class='center' >环比增长率</td>
                                                <td class='center' >${hbzzlWx1}%</td>
                                                <td class='center' >${hbzzlWx2}%</td>
                                                <td class='center' >${hbzzlWx3}%</td>
                                            </tr>
                                            <tr>
                                                <td class='center' >历史累计用户</td>
                                                <td class='center' colspan="3">${lsljuserCount}</td>
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
                    <!-- 微信统计end-->
                            <h5><strong>APP安装用户统计</strong></h5>
                            <table id="simple-table2" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center">手机端统计</th>
                                    <th class="center">APP下载量</th>
                                    <th class="center">IOS下载</th>
                                    <th class="center">安卓下载</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList2}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varList2}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.re_month}</font></td>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.appcount}</font></td>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.ios_count}</font></td>
                                                    <td class='center'><font color="${vs.index+1 == 1?"red":""} ">${var.andr_count}</font></td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center' >环比增长值</td>
                                                <td class='center' >${hbzzappValue1}</td>
                                                <td class='center' >${hbzzappValue2}</td>
                                                <td class='center' >${hbzzappValue3}</td>
                                            </tr>
                                            <tr>
                                                <td class='center' >环比增长率</td>
                                                <td class='center' >${hbzzlapp1}%</td>
                                                <td class='center' >${hbzzlapp2}%</td>
                                                <td class='center' >${hbzzlapp3}%</td>
                                            </tr>
                                            <tr>
                                                <td class='center' >历史总下载量</td>
                                                <td class='center' >${lsappCount}</td>
                                                <td class='center' >${lsiosCount}</td>
                                                <td class='center' >${lsandrCount}</td>
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
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
            var cityName = $("#city_id").find("option:selected").text();//选中的文本
            var catagoryName = $("#catagory").find("option:selected").text();//选中的文本
            //$("thead tr th:eq(0)").html(cityName+" "+catagoryName);
			$("#Form").submit();
            //$("#siteName").html(cityName+" "+catagoryName);
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