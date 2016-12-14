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
            <form action="invoiceData/list.do" method="post" name="Form" id="Form">
              <table style="margin-top:5px;">
                <tr>
                  <td>
                    <div class="nav-search">
                          <span class="input-icon">
                              <input type="text" placeholder="关键字:发票抬头、联系电话、收件人" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" />
                              <i class="ace-icon fa fa-search nav-search-icon"></i>
                          </span>
                    </div>
                  </td>
                  <td style="vertical-align:top;padding-left:2px;">
                    <select class="chosen-select form-control" name="status" id="status" data-placeholder="请选择审核状态" style="vertical-align:top;width: 140px;">
                     <%-- <option value=""></option>--%>
                      <option value="">全部</option>
                      <option value="0" <c:if test="${pd.status== 0 and pd.status != ''}">selected</c:if>>待审核</option>
                      <option value="1" <c:if test="${pd.status== 1}">selected</c:if>>审核通过</option>
                      <option value="2" <c:if test="${pd.status== 2}">selected</c:if>>配送中</option>
                      <option value="3" <c:if test="${pd.status== 3}">selected</c:if>>审核拒绝</option>
                      <option value="4" <c:if test="${pd.status== 4}">selected</c:if>>配送完成</option>
                    </select>
                  </td>
                  <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" value="${pd.lastLoginStart}" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                  <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" value="${pd.lastLoginEnd}" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                  <c:if test="${QX.cha == 1 }">
                    <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                  </c:if>
                </tr>
              </table>
              <!-- 检索  -->
              <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                <thead>
                <tr>
                  <th class="center">发票序号</th>
                  <th class="center">用户ID</th>
                 <%-- <th class="center">用户姓名</th>--%>
                  <th class="center">会员账号</th>
                  <th class="center">发票金额</th>
                  <th class="center">发票抬头</th>
                  <th class="center">发票内容</th>
                  <th class="center">状态</th>
                  <th class="center">申请时间</th>
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
                          <td class='center'>${var.uid}</td>
                         <%-- <td class='center'>${var.realname}</td>--%>
                          <td class='center'>${var.mobile}</td>
                          <td class='center'>${var.amount}</td>
                          <td class='center'>${var.title}</td>
                          <td class='center'>${var.content}</td>
                          <td class='center'>
                            <c:if test="${var.status ==0}">
                              <i class="ace-icon fa fa-exclamation-triangle red bigger-60">待审核</i>
                            </c:if>
                            <c:if test="${var.status ==1}">
                              <i class="ace-icon fa fa-check bigger-111">&nbsp;审核通过</i>
                            </c:if>
                            <c:if test="${var.status ==2}">
                              配送中...
                            </c:if>
                            <c:if test="${var.status ==3}">
                              <i class="ace-icon fa fa-times">&nbsp;审核拒绝</i>
                            </c:if>
                            <c:if test="${var.status ==4}">
                              <font color="red">√ 配送完成</font>
                            </c:if>
                          </td>
                          <td class='center'>${var.create_time}</td>
                          <td class="center">
                            <div class="hidden-sm hidden-xs">
                              <c:if test="${QX.edit == 1}">
                                  <c:if test="${var.status == 0 || var.status == 3 }">
                                    <a class="btn btn-xs btn-success" title="发票审核" onclick="approveStatus('${var.id}');">
                                      <i class="ace-icon fa fa-pencil-square-o bigger-120" title="发票审核"></i>
                                    </a>
                                  </c:if>
                                  <c:if test="${var.status == 1}">
                                    <a class="btn btn-xs btn-success" title="快递单" onclick="express('${var.id}');">
                                      <i class="ace-icon fa fa-check bigger-120" style="background: red;"  title="快递单"></i>
                                    </a>
                                    <a class="btn btn-xs btn-success" title="发票详情" onclick="approveStatus('${var.id}');">
                                      <span class="ui-icon ace-icon fa fa-search orange"></span>
                                        <%--<i class="ace-icon fa fa-pencil-square-o bigger-120" title="发票详情"></i>--%>
                                    </a>
                                  </c:if>
                                  <c:if test="${var.status == 2 || var.status ==4 }">
                                    <a class="btn btn-xs btn-success" title="发票详情" onclick="approveStatus('${var.id}');">
                                      <span class="ui-icon ace-icon fa fa-search orange"></span>
                                      <%--<i class="ace-icon fa fa-pencil-square-o bigger-120" title="发票详情"></i>--%>
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
  <%--<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
  </a>--%>

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

  //发票审核
  function approveStatus(user_id){
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag=true;
    diag.Title ="发票审核";
    diag.URL = '<%=basePath%>invoiceData/goEdit.do?id='+user_id+"&editType=1";
    diag.Width = 880;
    diag.Height = 600;
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

  function express(user_id){
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag=true;
    diag.Title ="快递信息";
    diag.URL = '<%=basePath%>invoiceData/goEdit.do?id='+user_id+"&editType=2";
    diag.Width = 480;
    diag.Height = 640;
    diag.CancelEvent = function(){ //关闭事件
      if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
        nextPage(${page.currentPage});
      }
      diag.close();
    };
    diag.show();
  }


</script>

</body>
</html>