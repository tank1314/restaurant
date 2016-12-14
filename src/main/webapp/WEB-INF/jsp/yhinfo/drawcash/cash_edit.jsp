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

					<form action="userDrawCash/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="id" id="id" value="${pd.id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
                            <tr><td colspan="4">用户基本信息</td></tr>
							<tr>
                                <td style="width:79px;text-align: right;padding-top: 13px;"><font color="red">*</font>手机号:</td>
                                <td><input type="text" name="user_phone" onmouseout="checkUser();" id="user_phone" value="${pd.user_phone}" placeholder="这里输入用户手机号" title="手机号" style="width:98%;" /></td>
                                <td style="width:79px;text-align: right;padding-top: 13px;">用户姓名:</td>
                                <td><input type="text" readonly name="user_name" id="user_name" value="${pd.user_name}" title="user_name" style="width:98%;" /></td>
							</tr>
                            <tr>
                                <input type="hidden" name="user_id" id="user_id" value="${pd.user_id }" placeholder="用户id" style="width:52%;" />
                                <td style="width:79px;text-align: right;padding-top: 13px;">充值总金额:</td>
                                <td><input type="text" readonly name="recharge_money" id="recharge_money" value="${pd.recharge_money }" style="width:98%;" /></td>
                                <td style="width:79px;text-align: right;padding-top: 13px;">充值剩余总金额:</td>
                                <td><input type="text" readonly name="current_balance" id="current_balance" value="${pd.current_balance }" style="width:98%;" /></td>
                            </tr>
                            <tr>
                                <td style="width:79px;text-align: right;padding-top: 13px;">赠送总金额:</td>
                                <td><input type="text" readonly name="give_money" id="give_money" value="${pd.give_money }" style="width:98%;" /></td>
                                <td style="width:79px;text-align: right;padding-top: 13px;">赠送剩余总金额:</td>
                                <td><input type="text" readonly name="remain_give_money" id="remain_give_money" value="${pd.remain_give_money }" style="width:98%;" /></td>
                            </tr>
                            <tr>
                                <td style="width:79px;text-align: right;padding-top: 13px;">可提现金额:</td>
                                <td bgcolor="#ffefd5"><input type="text" readonly  id="ky_current_balance" value="${pd.current_balance}" style="width:98%;border-radius:30%;border-radius:3px;border:0px #adff2f;border: hidden" /></td>
                                <td style="width:79px;text-align: right;padding-top: 13px;"><font color="red">*</font>提现金额:</td>
                                <td><input type="text" readonly name="draw_money" id="draw_money" value="${pd.draw_money}" style="width:98%;"/></td>
                            </tr>
                            <tr><td colspan="4">提现方式</td></tr>
                            <tr>
                                <td style="width:79px;text-align: right;padding-top: 13px;"><font color="red">*</font>提现方式:</td>
                                <td colspan="3">
                                    <select class="chosen-select form-control" onchange="checkMethod();" name="draw_method" id="draw_method" data-placeholder="请选择提现方式" style="vertical-align:top;" style="width:98%;" >
                                        <option value="">--请选择提现方式--</option>
                                        <option value="1" <c:if test="${pd.draw_method == 1}">selected</c:if>>支付宝</option>
                                        <option value="2" <c:if test="${pd.draw_method == 2}">selected</c:if>>微信</option>
                                        <option value="3" <c:if test="${pd.draw_method == 3}">selected</c:if>>银行卡</option>
                                    </select>
                                </td>
                            </tr>
                            <tr id="zfb_show" style="display: none;">
                                <td style="width:79px;text-align: right;padding-top: 13px;" id="zfbwx">(支付宝/微信)账号:</td>
                                <td><input type="text"  name="user_bank_name" id="user_bank_name" value="${pd.user_bank_name }" style="width:98%;" /></td>
                            </tr>
                            <tr id="bank_show" style="display: none;">
                                <td style="width:79px;text-align: right;padding-top: 13px;">开户行:</td>
                                <td><input type="text" name="user_open_bank" id="user_open_bank" value="${pd.user_open_bank}" style="width:98%;"/></td>
                                <td style="width:79px;text-align: right;padding-top: 13px;">银行卡号:</td>
                                <td><input type="text" name="bank_code" id="bank_code" value="${pd.bank_code}" style="width:98%;"/></td>
                            </tr>
                            <tr><td colspan="4">申请描述</td></tr>
                            <tr>
                                <td style="width:79px;text-align: right;padding-top: 13px;">申请备注:</td>
                                <td colspan="3">
                                    <textarea name="apply_desc" id="apply_desc" style="width:98%;">${pd.apply_desc}</textarea>
                                </td>
                            </tr>
                            <c:if test="${QX.edit == 1 }">
                                <tr><td colspan="4">审核描述</td></tr>
                                <tr>
                                    <input type="hidden" id="yz_mark" value="${pd.yz_mark}"/>
                                    <td style="width:79px;text-align: right;padding-top: 13px;">是否通过:</td>
                                    <td>
                                        <input type="radio" name="apply_status" <c:if test="${pd.apply_status ==1 || pd.apply_status ==''}">checked="checked"</c:if> value="1">通过
                                        <input type="radio" name="apply_status" <c:if test="${pd.apply_status ==2}">checked="checked" </c:if> value="2">拒绝
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:79px;text-align: right;padding-top: 13px;">审核备注:</td>
                                    <td colspan="3">
                                        <textarea name="examin_desc" id="examin_desc" style="width:98%;">${pd.examin_desc}</textarea>
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <td class="center" colspan="4">
                                    <c:if test="${QX.edit == 1}">
                                        <c:if test="${(pd.apply_status == 1 || pd.apply_status == 2 )}">
                                            <a class="btn btn-mini btn-primary">已审批</a>
                                        </c:if>
                                        <c:if test="${pd.apply_status == 0}">
                                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${QX.add == 1}">
                                        <c:if test="${pd.apply_status ==0 || pd.apply_status ==null || pd.apply_status == 2}">
                                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                        </c:if>
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

            //默认提现方式 隐藏
            var cashmethod = $('#draw_method option:selected').val();
            if(cashmethod == 1 || cashmethod == 2){
                $("#zfb_show").show();
            }
            else if(cashmethod == 3){
                $("#bank_show").show();
            }
            //如果用户有编辑审核的权限  则申请备注为只读
            var isedit = ${QX.edit} ;
            var isid = $("#id").val();//判断是否是编辑
            if(isid != ""){
                $("#user_phone").attr("readonly","readonly","bgcolor","F5F5F5");
            }
            if(isedit == 1){
                $("#user_phone").attr("readonly","readonly","bgcolor","F5F5F5");
                $("#user_phone").css("background-color","#F5F5F5");
                $("#apply_desc").attr("readonly","readonly","bgcolor","F5F5F5");
                $("#apply_desc").css("background-color","#F5F5F5");
                $("#draw_method").chosen("destroy");
                $("#draw_method").attr("disabled","disabled","bgcolor","F5F5F5");
                $("#draw_method").css("background-color","#F5F5F5");
                $("#draw_method").chosen();
                var yz_mark = $("#yz_mark").val();
                if(cashmethod == 1 || cashmethod == 2){
                    $("#zfb_show").show();
                    $("#user_bank_name").attr("readonly","readonly");
                }
                else{
                    $("#user_open_bank").attr("readonly","readonly");
                    $("#bank_code").attr("readonly","readonly");
                    $("#bank_show").show();
                }
                if(yz_mark !=0){
                    $("#examin_desc").attr("readonly","readonly");
                }
            }
		});
        //保存
        function save(){
            var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
            if($("#user_phone").val()==""){
                $("#user_phone").tips({
                    side:3,
                    msg:'输入手机号',
                    bg:'#AE81FF',
                    time:3
                });
                $("#user_phone").focus();
                return false;
            }else if($("#user_phone").val().length != 11 && !myreg.test($("#user_phone").val())){
                $("#user_phone").tips({
                    side:3,
                    msg:'手机号格式不正确',
                    bg:'#AE81FF',
                    time:3
                });
                $("#user_phone").focus();
                return false;
            }
            if($("#draw_money").val()=="" || $("#draw_money").val() == 0){
                $("#draw_money").tips({
                    side:3,
                    msg:'输入提现金额',
                    bg:'#AE81FF',
                    time:3
                });
                $("#draw_money").focus();
                return false;
            }
            if($("#draw_method").val()==""){
                $("#draw_method").chosen("destroy");
                $("#draw_method").tips({
                    side:3,
                    msg:'请选择提现方式',
                    bg:'#AE81FF',
                    time:2
                });
                $("#draw_method").focus();
                $("#draw_method").chosen();
                return false;
            }
            if(($("#draw_method").val()==1 ||$("#draw_method").val()==2) && $("#user_bank_name").val()=='' ){
                $("#user_bank_name").tips({
                    side:3,
                    msg:'输入提现账号',
                    bg:'#AE81FF',
                    time:3
                });
                $("#user_bank_name").focus();
                return false;
            }
            if(($("#draw_method").val()==3) && $("#bank_code").val()=='' ){
                $("#bank_code").tips({
                    side:3,
                    msg:'输入银行卡号',
                    bg:'#AE81FF',
                    time:3
                });
                $("#bank_code").focus();
                return false;
            }
            else{
                $("#draw_method").removeAttr("disabled");
                $("#Form").submit();
                $("#zhongxin").hide();
                $("#zhongxin2").show();
            }
        }
        /**
        *鼠标移动事件
         * 如果是编辑状态  则用户提现信息不可编辑  鼠标滑动不影响
        * @param phone
         */
        function checkUser(){
            var isedit = $("#id").val();//判断是否是编辑
            if(isedit == ""){
                var phone = $("#user_phone").val();//获取用户手机号

                if(phone !="" && phone !='未查找到用户信息或用户未有充值记录!' && phone !='缺失参数!'){
                    $.ajax({
                        type: "POST",
                        url: '<%=basePath%>userDrawCash/userDetail.do',
                        data: {phone:phone,tm:new Date().getTime()},
                        dataType:'json',
                        cache: false,
                        success: function(data){
                            var result = data.resultVo;
                            if(result.error_no == 0){
                                $("#user_phone").css("background-color","#FFFFFF");
                                var pd = result.result_info;
                                var id = pd.id;
                                var realname = pd.realname;
                                var symoney = pd.symoney;
                                var recharge_money = pd.smrecharge_money;//充值总金额
                                var give_money = pd.smgive_money;//赠送总金额
                                var remain_give_money = pd.smremain_give_money;//赠送剩余总金额
                                $("#user_name").val(realname);
                                $("#user_id").val(id);
                                $("#current_balance").val(symoney);
                                $("#recharge_money").val(recharge_money);
                                $("#give_money").val(give_money);
                                $("#ky_current_balance").val(symoney);
                                $("#remain_give_money").val(remain_give_money);
                                $("#draw_money").val(symoney);
                            }
                            else if(result.error_no == -1){
                                $("#user_name").val("");
                                $("#user_id").val("");
                                $("#current_balance").val("");
                                $("#recharge_money").val("");
                                $("#give_money").val("");
                                $("#remain_give_money").val("");
                                $("#ky_current_balance").val("");
                                $("#draw_money").val("");
                                $("#user_phone").css("background-color","#AAE5A2");
                                setTimeout("$('#user_phone').val('未查找到用户信息或用户未有充值记录!')",500);
                            }
                            else if(result.error_no == 2){
                                $("#user_phone").css("background-color","#D16E6C");
                                setTimeout("$('#user_phone').val('缺失参数!')",500);
                            }
                        }
                    });
                }
                else{
                    $("#user_name").val("");
                    $("#user_id").val("");
                    $("#current_balance").val("");
                    $("#recharge_money").val("");
                    $("#give_money").val("");
                    $("#remain_give_money").val("");
                    $("#ky_current_balance").val("");
                    $("#draw_money").val("");
                }
            }
        }
        function checkMethod(){
            $("#draw_method").chosen("destroy");
            var cashmethod = $('#draw_method option:selected').val();
            if(cashmethod == 1 || cashmethod == 2){
                $("#user_open_bank").val("");
                $("#bank_code").val("");
                $("#bank_show").hide();
                $("#zfb_show").show();
                /*$("#user_open_bank").val("");
                $("#bank_code").val("");
                $("#user_open_bank").attr("readonly","readonly");
                $("#bank_code").attr("readonly","readonly");
                $("#user_bank_name").removeAttr("readOnly");*/
            }
            else if(cashmethod == 3){
                $("#user_bank_name").val("");
                $("#bank_show").show();
                $("#zfb_show").hide();
                /*$("#user_bank_name").val("");
                $("#user_open_bank").removeAttr("readOnly");
                $("#bank_code").removeAttr("readOnly");
                $("#user_bank_name").attr("readonly","readonly");*/
            }
            $("#draw_method").chosen();
        }
		</script>
</body>
</html>