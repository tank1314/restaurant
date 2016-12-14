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

                        <form action="coupon/${msg}.do" name="Form" id="Form" method="post">
                            <div id="zhongxin" style="padding-top: 13px;">
                                <table id="table_report" class="table table-striped table-bordered table-hover">
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
                                        <td><input type="text" name="mobile" onblur="checkMobile();" id="mobile" value="${pd.mobile}" maxlength="15" placeholder="这里输入用户手机号" title="手机号" style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">截止日期:</td>
                                        <td><input class="span10 date-picker" name="end_time" id="end_time" value="${pd.end_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="截止日期" title="截止日期" style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">金额:</td>
                                        <td><input type="number" name="price" id="price" value="${pd.price}" placeholder="金额" title="金额" style="width:98%;"
                                                   onkeyup="maxNum();" onkeydown="onlyNum();" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">添加原因:</td>
                                        <td><input type="text" name="reason" id="reason" value="${pd.reason}" maxlength="200" placeholder="原因" title="原因" style="width:98%;"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">分类:</td>
                                        <td>
                                            <select class="chosen-select" name="service_type" id="service_type" data-placeholder="分类" style="vertical-align:top;width: 120px;">
                                                <option value="1">家政服务</option>
                                            </select>
                                            <select class="chosen-select" name="coupon_type" id="coupon_type" data-placeholder="分类" style="vertical-align:top;width: 120px;">
                                                <option value="4">通用券</option>
                                                <option value="1">套餐券</option>
                                                <option value="2">单项券</option>
                                                <option value="3">专项券</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;" colspan="10">
                                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                            <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>

                        </form>

                        <div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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
<%@ include file="../system/index/foot.jsp"%>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());
    //保存
    //var flag=true;
    function checkMobile(){
        $.ajax({
            type: "GET",
            url: "coupon/findUserByMobile",
            dataType: "json",
            data: "mobile="+$("#mobile").val(),
            success: function(msg){
                if(msg==null){
                    $("#mobile").tips({
                        side:3,
                        msg:'手机号不存在',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#mobile").focus();
                    //flag=false;
                    //alert(flag);
                }else{
                    return true;
                }
            }
        });
    }


    function onlyNum() {
        if(!(event.keyCode==46)&&!(event.keyCode==8)&&!(event.keyCode==37)&&!(event.keyCode==39))
            if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105)))
                event.returnValue=false;
    }

    function maxNum(){
        if($("#price").val()>150){
            $("#price").val(150);
        }
    }

    function save(){
/*        if(flag){
            return false;
        }*/

        if($("#mobile").val()==""){
            $("#mobile").tips({
                side:3,
                msg:'请输入用户手机号',
                bg:'#AE81FF',
                time:2
            });
            $("#mobile").focus();
            return false;
        }

        if($("#end_time").val()==""){
            $("#end_time").tips({
                side:3,
                msg:'请输入截止日期',
                bg:'#AE81FF',
                time:2
            });
            $("#end_time").focus();
            return false;
        }
        if($("#reason").val()==""){
            $("#reason").tips({
                side:3,
                msg:'请输入原因',
                bg:'#AE81FF',
                time:2
            });
            $("#reason").focus();
            return false;
        }
        if($("#price").val()==""){
            $("#price").tips({
                side:3,
                msg:'请输入金额',
                bg:'#AE81FF',
                time:2
            });
            $("#price").focus();
            return false;
        }



        $("#Form").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }

    $(function() {
        //日期框
        $('.date-picker').datepicker({autoclose: true,todayHighlight: true});
    });
</script>
</body>
</html>