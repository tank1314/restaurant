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
                            <tr><td colspan="4"><b>发票基本信息</b></td></tr>
							<tr>
                                <%--<td style="width:79px;padding-top: 13px;">发票编号:${pd.invoice_sn}</td>--%>
                                <td style="width:79px;padding-top: 13px;" colspan="2">发票抬头:${pd.title}</td>
                                <td style="width:79px;padding-top: 13px;">开票金额:${pd.amount}</td>
							</tr>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">用户编号:${pd.uid}</td>
                                <td style="width:79px;padding-top: 13px;">用户姓名:${pd.realname}</td>
                                <td style="width:79px;padding-top: 13px;">联系电话:${pd.mobile}</td>
                            </tr>
                            <%--<tr>
                                <td style="width:79px;padding-top: 13px;" colspan="3">发票内容:
                                    <textarea rows="4" cols="50" readonly>${pd.content}</textarea>
                                </td>
                            </tr>--%>
                            <tr>
                                <td style="width:79px;padding-top: 13px;">申请时间:${pd.create_time}</td>
                                <td style="width:79px;padding-top: 13px;" colspan="2">当前状态:&nbsp;&nbsp;
                                <font color="red">
                                        <c:if test="${pd.status == 0}">待审核</c:if>
                                        <c:if test="${pd.status == 1}">审核通过</c:if>
                                        <c:if test="${pd.status == 2}">配送中</c:if>
                                        <c:if test="${pd.status == 3}">拒绝</c:if>
                                        <c:if test="${pd.status == 4}">配送完成</c:if>
                                    </font></td>
                            </tr>
                            <c:if test="${pd.status == 0 || pd.status ==3 || pd.status == 2}">
                                <c:if test="${pd.status == 0 || pd.status ==3}">
                                    <tr>
                                        <td style="width:79px;padding-top: 13px;" colspan="2">
                                            增值税发票号:
                                            <input type="text" name="nmw_invoice_code" placeholder="增值税发票号" title="请填写增值税发票号" value="${pd.nmw_invoice_code}" style="width: 240px;" />
                                        </td>
                                        <td style="width:79px;padding-top: 13px;" >是否审批通过:&nbsp;&nbsp;
                                            <input type="radio" name="status" <c:if test="${pd.status == 0}">checked="checked"</c:if> value="1">同意
                                            &nbsp;&nbsp;
                                            <input type="radio" name="status" <c:if test="${pd.status == 3}">checked="checked" </c:if> value="3">拒绝
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:79px;padding-top: 13px;" colspan="3">审核意见:
                                            <textarea rows="4" cols="50" name="audit_explain">${pd.audit_explain}</textarea>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${pd.status == 2}">
                                    <td style="width:79px;padding-top: 13px;" colspan="3"><font color="red">√配送完成:</font>
                                        <input type="checkbox" class="ace" name="status" <c:if test="${pd.status == 4}">checked="checked"</c:if> value="4">&nbsp;&nbsp;<span class="lbl">配送完成</span>
                                    </td>
                                </c:if>
                            </c:if>

                            <c:if test="${pd.status != 0 && pd.status != 3}">
                                <tr>
                                    <td style="width:79px;padding-top: 13px;" colspan="3">
                                        增值税发票号: <u>${pd.nmw_invoice_code == null ?"----":pd.nmw_invoice_code}</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:79px;padding-top: 13px;" colspan="3">审核意见:
                                        <textarea rows="4" cols="100" readonly>${pd.audit_explain}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:79px;padding-top: 13px;">审核人:${pd.auditor}</td>
                                    <td style="width:79px;padding-top: 13px;" colspan="2">审核时间:${pd.audit_time}</td>
                                </tr>
                                <!-- 如果此发票申请 的状态不为 审核通过  则显示快递单信息 -->
                                <c:if test="${pd.status !=1}">
                                    <tr><td colspan="4"><b>物流信息</b></td></tr>
                                    <tr>
                                        <td style="width:79px;padding-top: 13px;">快递公司:${pd.express_comp}</td>
                                        <td style="width:79px;padding-top: 13px;">快递单号:${pd.express_no}</td>
                                        <td style="width:79px;padding-top: 13px;">快递费用:${pd.express_fee}</td>
                                    </tr>
                                    <tr>
                                        <td style="width:79px;padding-top: 13px;">收件人:${pd.receiver}</td>
                                        <td style="width:79px;padding-top: 13px;">联系电话:${pd.tel}</td>
                                        <td style="width:79px;padding-top: 13px;">省市区:${pd.district}</td>
                                    </tr>
                                    <tr>
                                        <td style="width:79px;padding-top: 13px;" colspan="3">详细地址:${pd.address}</td>
                                    </tr>
                                </c:if>

                            </c:if>
                            <tr>
                                <td class="center" colspan="4">
                                    <c:if test="${QX.edit == 1}">
                                        <c:if test="${pd.status == 0 || pd.status == 3 || pd.status == 2}">
                                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                        </c:if>
                                    </c:if>
                                    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
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