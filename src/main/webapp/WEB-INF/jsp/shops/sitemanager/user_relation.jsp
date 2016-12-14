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
    <%@ include file="../../system/index/top.jsp"%>
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
                        <form action="siteUser/${msg }.do" name="userForm" id="userForm" method="post">
                            <input type="hidden" name="user_id" id="user_id" value="${pd.USER_ID }"/>
                            <div id="zhongxin" style="padding-top: 13px;">
                                <table id="table_report" class="table table-striped table-bordered table-hover">
                                    <%--<tr>
                                        <td style="width:79px;text-align: right;padding-top: 13px;">编号:</td>
                                        <td><input type="text" readonly  name="NUMBER" id="NUMBER" value="${pd.NUMBER }" maxlength="32"style="width:98%;color: gray;"/></td>
                                    </tr>--%>
                                    <input type="hidden" readonly name="USERNAME" id="loginname" value="${pd.USERNAME }" maxlength="32" placeholder="这里输入用户名" title="用户名" style="width:98%;color: gray;"/>

                                    <tr>
                                        <td style="width:79px;text-align: right;padding-top: 13px;">姓名:</td>
                                        <td><input type="text" readonly name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入姓名" title="姓名" style="width:98%;color: gray;"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width:79px;text-align: right;padding-top: 13px;">手机号:</td>
                                        <td><input type="number" readonly name="PHONE" id="PHONE"  value="${pd.PHONE }"  maxlength="32" placeholder="这里输入手机号" title="手机号" style="width:98%;color: gray;"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width:79px;text-align: right;padding-top: 13px;">邮箱:</td>
                                        <td><input type="email" readonly name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" style="width:98%;color: gray;"/></td>
                                    </tr>
                                    <tr>
                                        <%--<font color="red">*</font>--%>
                                        <td style="width:79px;text-align: right;padding-top: 13px;">商户:</td>
                                        <td id="juese">
                                            <select class="chosen-select form-control" name="bus_id" id="bus_id" data-placeholder="请选择商户" style="vertical-align:top;" style="width:98%;" >
                                                <option value=""></option>
                                                <option value="0">--请选择--</option>
                                                <c:forEach items="${busList}" var="bus">
                                                    <option value="${bus.id }" <c:if test="${bus.id== pd.bus_id }">selected</c:if>>${bus.bus_name }</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><font color="red">注:</font>请各位操作员认真操作商户数据!</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;" colspan="10">
                                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                            <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
</div>
<!-- /.main-container -->
<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- inline scripts related to this page -->
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
    $(top.hangge());
    $(document).ready(function(){
    });
    //保存
    function save(){
        /*if($("#bus_id").val()==""){
         $("#juese").tips({
         side:3,
         msg:'选择商户',
         bg:'#AE81FF',
         time:2
         });
         $("#bus_id").focus();
         return false;
         }
         else{*/
        $("#userForm").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
        //}
    }

    $(function() {
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
</script>
</html>