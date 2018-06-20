<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
	<link rel="stylesheet" type="text/css" href="static/jquery.datetimepicker.css"/>

</head>
<body>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="span12">
								<div class="widget-box">
									<div class="widget-body">
										<div class="widget-main">
											<div class="step-content row-fluid position-relative">
												<div id="zhongxin" style="margin-top:140px;">
													<textarea name="CONTENT" id="CONTENT" style="display: none"></textarea>
													<table style="width: 100%;" id="xtable">
														<tr>
															<td style="padding-top: 10px;">
															                   送货人员姓名:<input type="text" id="sptDeliveryName"  maxlength="50" placeholder="姓名" title="姓名"
																	style="width: 100px; margin-left: 20px; margin-right: 10px;" /> 
																	送货人员电话:<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" id="sptDeliveryPhone" value=""
																	maxlength="32" placeholder="这里输入电话" title="例：15982545654" style="width: 100px; margin-left: 20px;"/>
															</td>
														</tr>
														<tr>
															<td  style="padding-top: 10px;">
															                    送货时间:<input class="span10 date-picker" name="lastStart" id="updated" value="" type="text" data-date-format="yyyy-mm-dd - hh:ii" readonly="readonly" style="width: 130px;margin-left:10px;" placeholder="送货时间" title="送货时间" />
																	 
															</td>
														</tr>
														<tr >
															<td style="text-align: center;margin-top:30px;" colspan="10"><a class="btn btn-mini btn-primary" onclick="save();" style="margin-top:30px;">保存</a> <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();" style="margin-top:30px;">取消</a></td>
														</tr>
													</table>
												</div>
												<div id="zhongxin2" class="center" style="display: none">
													<br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4>
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	 <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->

	<!-- 编辑框-->
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<!-- 日期框 -->
	<script src="static/jquery.datetimepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--引入属于此页面的js -->

	<script type="text/javascript">
	    $(top.hangge());//关闭加载状态
	    var orderNo= localStorage.getItem("orderNo");
		//保存
		function save() {
			//商品编号
			var sptDeliveryName=$("#sptDeliveryName").val();
			//商品标题
			var sptDeliveryPhone=$("#sptDeliveryPhone").val();
			var updated=$("#updated").val();
			if (updated == "") {
				$("#updated").tips({
					side : 3,
					msg : '请输入送货时间',
					bg : '#AE81FF',
					time : 2
				});
				$("#updated").focus();
				return false;
			}
			if (sptDeliveryName == "") {
				$("#sptDeliveryName").tips({
					side : 3,
					msg : '请输入送货人员姓名',
					bg : '#AE81FF',
					time : 2
				});
				$("#sptDeliveryName").focus();
				return false;
			}
			if (sptDeliveryPhone == "") {
				$("#sptDeliveryPhone").tips({
					side : 3,
					msg : '请输入送货员电话',
					bg : '#AE81FF',
					time : 2
				});
				$("#sptDeliveryPhone").focus();
				return false;
			}
			$.ajax({
				url:'<%=path%>/shipments/addShipments',
				type : 'POST',
				data : {
				    sptDeliveryName: sptDeliveryName,
				    sptDeliveryPhone : sptDeliveryPhone,
				    deliveryTime : updated,
				    updated : updated,
				    sptType:1,
				    sptOrderNo:orderNo
				},
				success : function() {
					 alert('设置成功')
					 window.location.href="about:blank";
					 top.Dialog.close();
				},
				error : function() {
					alert('修改失败')

				}
			})

		}
	   $('.date-picker').datetimepicker({
		   pickerPosition:'bottom-left'
	   });
	</script>
</body>
</html>