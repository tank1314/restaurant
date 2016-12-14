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
                                <td><h4>订单分布统计</h4></td>
                            </tr>
                        </table>
						<!-- 检索  -->
						<form action="siteOrderReport/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:1px;">
							<tr>

                                <td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="city_id" id="city_id" data-placeholder="请选择选择城市站点" style="vertical-align:top;width: 140px;">
                                        <option value=""></option>
                                        <option value="">全部</option>
                                        <option value="1" <c:if test="${pd.city_id=='1'}">selected</c:if>>上海</option>
                                        <option value="2" <c:if test="${pd.city_id=='2'}">selected</c:if>>深圳</option>
                                        <option value="3" <c:if test="${pd.city_id=='3'}">selected</c:if>>杭州</option>
                                    </select>
                                </td>
                                   <td style="vertical-align:top;padding-left:2px;">
                                       <select class="chosen-select form-control" name="catagory" id="catagory" data-placeholder="请选择站点分类" style="vertical-align:top;width: 140px;">
                                           <option value=""></option>
                                           <option value="">全部</option>
                                           <option value="1" <c:if test="${pd.catagory=='1'}">selected</c:if>>自营</option>
                                           <option value="2" <c:if test="${pd.catagory=='2'}">selected</c:if>>合作</option>
                                       </select>
                                   </td>
								<c:if test="${QX.cha == 1 }">
                                    <c:if test="${QX.to_month == 1 }">
                                        <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                        <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                                        <td style="vertical-align:top;padding-left:2px">
                                            <a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                    </c:if>
                               <%-- <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icons" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>--%>
                                </c:if>
							</tr>
						</table>
						<!-- 检索  -->
                        <!-- 列表展示数据START -->
					    <div id="tableShow">
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center">
                                        <c:if test="${pd.city_id=='1'}">
                                            上海
                                        </c:if>
                                        <c:if test="${pd.city_id=='2'}">
                                            深圳
                                        </c:if>
                                        <c:if test="${pd.city_id=='3'}">
                                            杭州
                                        </c:if>
                                        <c:if test="${pd.catagory=='1'}">
                                            【自营】
                                        </c:if>
                                        <c:if test="${pd.catagory=='2'}">
                                            【合作】
                                        </c:if>
                                        站点</th>
                                    <th class="center">订单数量</th>
                                    <th class="center">占比</th>
                                    <th class="center">应付金额</th>
                                    <th class="center">占比</th>
                                    <th class="center">订单总额</th>
                                    <th class="center">占比</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList}">
                                        <c:if test="${QX.cha == 1 }">
                                            <c:forEach items="${varList}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'>${var.site_name}</td>
                                                    <td class='center'>${var.sitecount}</td>
                                                    <td class='center' bgcolor="#add8e6">${var.pctcount}%</td>
                                                    <td class='center'>${var.ordermoneyshow}</td>
                                                    <td class='center' bgcolor="#00bfff">${var.pctmoney}%</td>
                                                    <td class='center'>${var.allmoneyshow}</td>
                                                    <td class='center' bgcolor="#add8e6">${var.pctallmoney}%</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class='center' bgcolor="#6495ed">合计</td>
                                                <td class='center' bgcolor="#6495ed">${allsitecount}</td>
                                                <td class='center' bgcolor="#6495ed">${pctc}%</td>
                                                <td class='center' bgcolor="#6495ed">${allordermoneys}</td>
                                                <td class='center' bgcolor="#6495ed">${pctm}%</td>
                                                <td class='center' bgcolor="#6495ed">${allMoneys}</td>
                                                <td class='center' bgcolor="#6495ed">${pctallMoeny}%</td>
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
                                            <td colspan="100" class="center" >
                                                <c:if test="${pd.monthOrWeek == 1}">
                                                    没有相关数据
                                                </c:if>
                                                <c:if test="${pd.monthOrWeek == 2}">
                                                    过去&nbsp;7天&nbsp;暂无数据
                                                </c:if>
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
			//top.jzts();
            /*if($("#lastLoginStart").val()=="" &&$("#lastLoginEnd").val()==""){
                $("#lastLoginStart").tips({
                    side:3,
                    msg:'请输入时间区间',
                    bg:'#AE81FF',
                    time:2
                });
                $("#lastLoginStart").focus();
                return false;
            }
			else{*/
            $("#Form").submit();
           // }
		}
		$(function() {
			//日期框
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