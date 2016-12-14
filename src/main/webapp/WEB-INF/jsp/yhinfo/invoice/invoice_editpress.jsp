<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					<form action="invoiceData/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="id" id="id" value="${pd.id}"/>
                        <input type="hidden" name="editType" id="editType" value="${pd.editType}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
                            <tr>
                                <td style="width:79px;padding-top: 13px;">快递公司:
                                    <input type="text" name="express_comp" value="${pd.express_comp}" placeholder="快递公司" title="快递公司" style="width: 300px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">快递单号:
                                    <input type="text" name="express_no" value="${pd.express_no}" placeholder="快递单" title="快递单" style="width: 300px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">快递费用:
                                    <input type="number" name="express_fee" value="${pd.express_fee}" placeholder="快递费用" title="快递费用" style="width: 300px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">收件人:　
                                    <input type="text" name="receiver" value="${pd.receiver}" placeholder="收件人" title="收件人" style="width: 300px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">联系电话:
                                    <input type="text" name="tel" value="${pd.tel}" placeholder="联系电话" title="联系电话" style="width: 300px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">省市区:　
                                    <input type="text" name="district" value="${pd.district}" placeholder="省市区" title="省市区" style="width: 300px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">详细地址:
                                    <input type="text" name="address" value="${pd.address}" placeholder="详细地址" title="详细地址" style="width: 300px;"/>
                                </td>
                            </tr>

                            <tr>
                                <td class="center" colspan="4">
                                    <c:if test="${QX.edit == 1}">
                                        <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                    </c:if>
                                    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                </td>
                            </tr>
						</table>
						</div>
                        <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
                        <div id="zhongxin3" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
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

		});
        //保存
        function save(){
                $("#Form").submit();
                $("#zhongxin").hide();
                $("#zhongxin2").show();
        }
		</script>
</body>
</html>