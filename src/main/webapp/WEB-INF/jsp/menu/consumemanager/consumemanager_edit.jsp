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

<link rel="stylesheet" href="static/html_UI/assets/css/ui.jqgrid.css" />
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
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title">会员搜索</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main">
										<form class="form-inline">
											<input type="text" name="userName" id="userName"
												placeholder="姓名"> 
											<input type="tel" name="phone"
												id="phone" placeholder="手机号码">
											<button type="button" id="searchUser"
												class="btn btn-purple btn-sm">
												<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>查询
											</button>
										</form>
									</div>
								</div>
							</div>
							<div class="step-content pos-rel">
								<%--消费人员信息录入 START--%>
								<div id="customerDiv" style="display: block;">
									<form action="consumemanager/${msg}.do" name="Form" id="Form"
										method="post">
										<input type="hidden" name="id" id="id" value="${pd.id}" />
										<div id="zhongxin" style="padding-top: 13px;">
											<table id="table_report"
												class="table table-striped table-bordered table-hover">
												<input type="hidden" name="user_id" id="user_id"
													value="${pd.user_id}" maxlength="32" placeholder="这里输入会员id"
													title="会员id" style="width: 98%;" />
												<tr>
													<td
														style="width: 75px; text-align: right; padding-top: 13px;">顾客姓名:</td>
													<td><input type="text" readonly name="user_name"
														id="user_name" value="${pd.user_name}" maxlength="255"
														placeholder="顾客姓名" title="顾客姓名" style="width: 98%;" /></td>
												</tr>
												<tr>
													<td
														style="width: 75px; text-align: right; padding-top: 13px;">会员手机:</td>
													<td><input type="text" readonly name="user_phone"
														id="user_phone" value="${pd.user_phone}" maxlength="255"
														placeholder="会员手机" title="会员手机" style="width: 98%;" /></td>
												</tr>

												<tr>
													<td
														style="width: 75px; text-align: right; padding-top: 13px;">用餐人数:</td>
													<td><input type="number" name="people_num"
														id="people_num" value="${pd.people_num}" maxlength="32"
														placeholder="这里输入用餐人数" title="用餐人数" style="width: 98%;" /></td>
												</tr>
												<tr>
													<td
														style="width: 75px; text-align: right; padding-top: 13px;">消费金额:</td>
													<td><input type="text" name="pay_money" id="pay_money"
														value="${pd.pay_money}" maxlength="255"
														placeholder="这里输入消费金额" title="消费金额" style="width: 98%;" /></td>
												</tr>
												<tr>
													<td
														style="width: 75px; text-align: right; padding-top: 13px;">折扣价:</td>
													<td><input type="text" name="discount_money"
														id="discount_money" value="${pd.discount_money}"
														maxlength="255" placeholder="这里输入折扣价" title="折扣价"
														style="width: 98%;" /></td>
												</tr>
												<tr>
													<td
														style="width: 75px; text-align: right; padding-top: 13px;">消费时间:</td>
													<td><input type="text" name="consum_time"
														id="consum_time" value="${pd.consum_time}" maxlength="255"
														class="span10 date-picker" value=""
														data-date-format="yyyy-mm-dd" readonly="readonly"
														placeholder="这里输入消费时间" title="消费时间" style="width: 98%;" /></td>
												</tr>
												
												<tr>
													<td
														style="width: 75px; text-align: right; padding-top: 13px;">客户需求描述:</td>
													<td><textarea id="consum_desc" name="consum_desc" placeholder="这里输入客户需求描述" title="客户需求描述" rows="2"
															cols="100">${pd.consum_desc}</textarea></td>
												</tr>
												<%--<tr>
                                                <td style="text-align: center;" colspan="10">
                                                    <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                                    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                                </td>
                                            </tr>--%>
											</table>
										</div>
										<div id="zhongxin2" class="center" style="display: none">
											<br />
											<br />
											<br />
											<br />
											<br />
											<img src="static/images/jiazai.gif" /><br />
											<h4 class="lighter block green">提交中...</h4>
										</div>
									</form>
								</div>
								<%--消费人员信息录入 END--%>

								<%--食用菜单录入 START--%>
								<div id="foodInfoDiv" style="display: none;">
								<!-- <div class="page-header">
							<h1>
								jqGrid
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									Dynamic tables and grids using jqGrid plugin
								</small>
							</h1>
						</div> --><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="well well-sm">
									####消费菜单列表####
								</div>

								<table id="grid-table"></table>

								<div id="grid-pager"></div>

								<script type="text/javascript">
									var $path_base = "..";//in Ace demo this will be used for editurl parameter
								</script>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div>
								</div>

							</div> 

							<div class="wizard-actions">
								<!-- #section:plugins/fuelux.wizard.buttons -->
									<button class="btn btn-prev" id="preBtn" style="display:none;">
										<i class="ace-icon fa fa-arrow-left"></i> 上一步
									</button>
								<%-- </c:if>
								<c:if test="${empty pd.id}"> --%>
									<button class="btn btn-success btn-next" data-last="Finish" id="saveCustmerBtn">
										下一步 <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
									</button>
								<!-- /section:plugins/fuelux.wizard.buttons -->
							</div>


							<div id="zhongxin2" class="center" style="display: none">
								<img src="static/images/jzx.gif" style="width: 50px;" /><br />
								<h4 class="lighter block green"></h4>
							</div>
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
	
	
	<script src="static/html_UI/assets/js/jqGrid/jquery.jqGrid.src.js"></script>
	<script src="static/html_UI/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());
		//保存
		function save() {
			if ($("#user_name").val() == "") {
				$("#user_name").tips({
					side : 3,
					msg : '请输入顾客姓名',
					bg : '#AE81FF',
					time : 2
				});
				$("#user_name").focus();
				return false;
			}
			if ($("#user_phone").val() == "") {
				$("#user_phone").tips({
					side : 3,
					msg : '请输入会员手机',
					bg : '#AE81FF',
					time : 2
				});
				$("#user_phone").focus();
				return false;
			}
			if ($("#consum_time").val() == "") {
				$("#consum_time").tips({
					side : 3,
					msg : '请输入消费时间',
					bg : '#AE81FF',
					time : 2
				});
				$("#consum_time").focus();
				return false;
			}
			if ($("#people_num").val() == "") {
				$("#people_num").tips({
					side : 3,
					msg : '请输入用餐人数',
					bg : '#AE81FF',
					time : 2
				});
				$("#people_num").focus();
				return false;
			}
			if ($("#pay_money").val() == "") {
				$("#pay_money").tips({
					side : 3,
					msg : '请输入消费金额',
					bg : '#AE81FF',
					time : 2
				});
				$("#pay_money").focus();
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true 
			});
		});

		/**
		 * 根据手机号+用户姓名详情查询
		 */
		$("#searchUser").click(function() {
			var phone = $("#phone").val();
			var userName = $("#userName").val();
			if (phone.length != 11 && phone != '') {
				$("#phone").tips({
					side : 3,
					msg : '请正确输入用户手机号!',
					bg : '#AE81FF',
					time : 2
				});
				$("#phone").focus();
				return false;
			}
			$.ajax({
				async : true,//异步
				type : "POST",
				url : "consumemanager/findUserByParams",
				dataType : "json",
				data : "phone=" + phone + "&userName=" + userName,
				success : function(data) {
					var result = data.result;
					if (data.error_no == 1) {
						alert('未查询到用户信息!');
						return false;
					}
					else if(data.error_no == -1){
						alert('数据检索异常!');
						return false;
					}
					$("#user_name").val(result.user_name);
					$("#user_phone").val(result.phone);
					$("#user_id").val(result.id);
				}
			});
		});
		
		/** 客户消费记录保存 **/
		$("#saveCustmerBtn").click(function(){
			//如果消费 信息已经有数据 则直接打开下一步页面
			if($("#id").val()){
				$("#preBtn").show(); //上一步
				$("#customerDiv").hide();
				$("#foodInfoDiv").show();
			}
			else{
				if ($("#user_name").val() == "") {
					$("#userName").tips({
						side : 3,
						msg : '请输入消费者姓名信息检索',
						bg : '#AE81FF',
						time : 2
					});
					$("#userName").focus();
					return false;
				}
				if ($("#user_phone").val() == "") {
					$("#phone").tips({
						side : 3,
						msg : '请输入消费者手机号信息检索',
						bg : '#AE81FF',
						time : 2
					});
					$("#phone").focus();
					return false;
				}
				if ($("#people_num").val() == "") {
					$("#people_num").tips({
						side : 3,
						msg : '请输入消费人数',
						bg : '#AE81FF',
						time : 2
					});
					$("#people_num").focus();
					return false;
				}
				
				if ($("#pay_money").val() == "") {
					$("#pay_money").tips({
						side : 3,
						msg : '请输入消费金额',
						bg : '#AE81FF',
						time : 2
					});
					$("#pay_money").focus();
					return false;
				}
				var paramData = {
						"user_id":$("#user_id").val(),
						"user_name":$("#user_name").val(),
						"user_phone":$("#user_phone").val(),
						"consum_time":$("#consum_time").val(),
						"people_num":$("#people_num").val(),
						"pay_money":$("#pay_money").val(),
						"discount_money":$("#discount_money").val(),
						"consum_desc":$("#consum_desc").val()
				};
				$.ajax({
					async : true,//异步
					type : "POST",
					url : "consumemanager/saveCustmer",
					dataType : "json",
					data : paramData,
					success : function(data) {
						if (data.error_no == 1) {
							alert('消费者消费数据录入失败!');
							return false;
						}
						else{
							console.log(data.consumeId+"=====");
							$("#id").val(data.consumeId);
							$("#preBtn").show(); //上一步
							$("#customerDiv").hide();
							$("#foodInfoDiv").show();
						}
					}
				});
			}
		});
		
		/* 上一步事件点击 */
		$("#preBtn").click(function(){
			$("#preBtn").hide(); //上一步
			$("#customerDiv").show();
			$("#foodInfoDiv").hide();
		});
		
		var grid_data = 
			[
				{id:"1",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"2",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"3",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"4",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"5",name:"Laser Printer",note:"note2",stock:"Yes",ship:"FedEx",sdate:"2007-12-03"},
				{id:"6",name:"Play Station",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"7",name:"Mobile Telephone",note:"note",stock:"Yes",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"8",name:"Server",note:"note2",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"9",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"10",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"11",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"12",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"13",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"14",name:"Laser Printer",note:"note2",stock:"Yes",ship:"FedEx",sdate:"2007-12-03"},
				{id:"15",name:"Play Station",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"16",name:"Mobile Telephone",note:"note",stock:"Yes",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"17",name:"Server",note:"note2",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"18",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"19",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"20",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"21",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"22",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"23",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"}
			];
			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8}
			];
			var selectData = "tt:tt;FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX" ;
		
		
	</script>
	
	<script type="text/javascript">
			
			
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
				
				//resize to fit page size
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
			    })
				//resize on sidebar collapse/expand
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 0);
					}
			    })
				
				//if your grid is inside another element, for example a tab pane, you should use its parent's width:
				/**
				$(window).on('resize.jqGrid', function () {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				})
				//and also set width when tab pane becomes visible
				$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				  if($(e.target).attr('href') == '#mygrid') {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				  }
				})
				*/
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
			
					//subgrid options
					subGrid : true,
					//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
					//datatype: "xml",
					subGridOptions : {
						plusicon : "ace-icon fa fa-plus center bigger-110 blue",
						minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
						openicon : "ace-icon fa fa-chevron-right center orange"
					},
					//for this example we are using local data
					subGridRowExpanded: function (subgridDivId, rowId) {
						var subgridTableId = subgridDivId + "_t";
						$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
						$("#" + subgridTableId).jqGrid({
							datatype: 'local',
							data: subgrid_data,
							colNames: ['No','Item Name','Qty'],
							colModel: [
								{ name: 'id', width: 50 },
								{ name: 'name', width: 150 },
								{ name: 'qty', width: 50 }
							]
						});
					},
			
					data: grid_data,
					datatype: "local",
					height: 450,
					colNames:[' ', 'ID','菜类','菜系', '菜名','点餐备注'],
					colModel:[
						{name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
							formatter:'actions', 
							formatoptions:{ 
								keys:true,
								//delbutton: false,//disable delete button
								
								delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
								//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
							}
						},
						{name:'id',index:'id', width:60, sorttype:"int", editable: true},
					/* 	{name:'sdate',index:'sdate',width:90, editable:true, sorttype:"date",unformat: pickDate}, */
						{name:'name',index:'name', width:150,editable: true,editoptions:{size:"20",maxlength:"30"}},
						{name:'stock',index:'stock', width:70, editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch},
						{name:'ship',index:'ship', width:90, editable: true,edittype:"select",editoptions:{value:selectData}},
						{name:'note',index:'note', width:150, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}} 
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					multiselect: true,
					//multikey: "ctrlKey",
			        multiboxonly: true,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					caption: "消费明细"
			
					//,autowidth: true,
			
			
					/**
					,
					grouping:true, 
					groupingView : { 
						 groupField : ['name'],
						 groupDataSorted : true,
						 plusicon : 'fa fa-chevron-down bigger-110',
						 minusicon : 'fa fa-chevron-up bigger-110'
					},
					caption: "Grouping"
					*/
			
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				
			
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});
			
			
				//switch element when editing inline
				function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
			
			
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: true,
						editicon : 'ace-icon fa fa-pencil blue',
						add: true,
						addicon : 'ace-icon fa fa-plus-circle purple',
						del: true,
						delicon : 'ace-icon fa fa-trash-o red',
						search: true,
						searchicon : 'ace-icon fa fa-search orange',
						refresh: true,
						refreshicon : 'ace-icon fa fa-refresh green',
						view: true,
						viewicon : 'ace-icon fa fa-search-plus grey',
					},
					{
						//edit record form
						//closeAfterEdit: true,
						//width: 700,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if(form.data('styled')) return false;
							
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							
							form.data('styled', true);
						},
						onClick : function(e) {
							//alert(1);
						}
					},
					{
						//search form
						recreateForm: true,
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true,
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						}
					}
				)
			
			
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
							  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
							
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
			
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
		</script>
</body>
</html>