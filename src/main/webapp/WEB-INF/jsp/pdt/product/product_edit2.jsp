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
					
					<form action="product/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${pd.PRODUCT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品Id:</td>
								<td><input type="number" name="PDT_ID" id="PDT_ID" value="${pd.PDT_ID}" maxlength="32" placeholder="这里输入备注1" title="备注1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品标题:</td>
								<td><input type="text" name="PDT_TITLE" id="PDT_TITLE" value="${pd.PDT_TITLE}" maxlength="50" placeholder="这里输入备注2" title="备注2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品市场价:</td>
								<td><input type="number" name="PDT_SC_PRICE" id="PDT_SC_PRICE" value="${pd.PDT_SC_PRICE}" maxlength="32" placeholder="这里输入备注3" title="备注3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">本店价格:</td>
								<td><input type="number" name="PDT_MY_PRICE" id="PDT_MY_PRICE" value="${pd.PDT_MY_PRICE}" maxlength="32" placeholder="这里输入备注4" title="备注4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品小图:</td>
								<td><input type="text" name="PDT_MIN_IMG" id="PDT_MIN_IMG" value="${pd.PDT_MIN_IMG}" maxlength="150" placeholder="这里输入备注5" title="备注5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品详情:</td>
								<td><input type="text" name="PDT_MSG" id="PDT_MSG" value="${pd.PDT_MSG}" maxlength="21845" placeholder="这里输入备注6" title="备注6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品类别:</td>
								<td><input type="number" name="PDT_TYPE_ID" id="PDT_TYPE_ID" value="${pd.PDT_TYPE_ID}" maxlength="32" placeholder="这里输入备注7" title="备注7" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品品牌:</td>
								<td><input type="number" name="PDT_BANNER_ID" id="PDT_BANNER_ID" value="${pd.PDT_BANNER_ID}" maxlength="32" placeholder="这里输入备注8" title="备注8" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品图片列表:</td>
								<td><input type="text" name="PDT_IMG_LIST" id="PDT_IMG_LIST" value="${pd.PDT_IMG_LIST}" maxlength="21845" placeholder="这里输入备注9" title="备注9" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品发布时间:</td>
								<td><input class="span10 date-picker" name="PDT_CREATED" id="PDT_CREATED" value="${pd.PDT_CREATED}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="备注10" title="备注10" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品更新时间:</td>
								<td><input class="span10 date-picker" name="PDT_UPDATED" id="PDT_UPDATED" value="${pd.PDT_UPDATED}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="备注11" title="备注11" style="width:98%;"/></td>
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
		//保存
		function save(){
			if($("#PDT_ID").val()==""){
				$("#PDT_ID").tips({
					side:3,
		            msg:'请输入备注1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_ID").focus();
			return false;
			}
			if($("#PDT_TITLE").val()==""){
				$("#PDT_TITLE").tips({
					side:3,
		            msg:'请输入备注2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_TITLE").focus();
			return false;
			}
			if($("#PDT_SC_PRICE").val()==""){
				$("#PDT_SC_PRICE").tips({
					side:3,
		            msg:'请输入备注3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_SC_PRICE").focus();
			return false;
			}
			if($("#PDT_MY_PRICE").val()==""){
				$("#PDT_MY_PRICE").tips({
					side:3,
		            msg:'请输入备注4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_MY_PRICE").focus();
			return false;
			}
			if($("#PDT_MIN_IMG").val()==""){
				$("#PDT_MIN_IMG").tips({
					side:3,
		            msg:'请输入备注5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_MIN_IMG").focus();
			return false;
			}
			if($("#PDT_MSG").val()==""){
				$("#PDT_MSG").tips({
					side:3,
		            msg:'请输入备注6',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_MSG").focus();
			return false;
			}
			if($("#PDT_TYPE_ID").val()==""){
				$("#PDT_TYPE_ID").tips({
					side:3,
		            msg:'请输入备注7',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_TYPE_ID").focus();
			return false;
			}
			if($("#PDT_BANNER_ID").val()==""){
				$("#PDT_BANNER_ID").tips({
					side:3,
		            msg:'请输入备注8',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_BANNER_ID").focus();
			return false;
			}
			if($("#PDT_IMG_LIST").val()==""){
				$("#PDT_IMG_LIST").tips({
					side:3,
		            msg:'请输入备注9',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_IMG_LIST").focus();
			return false;
			}
			if($("#PDT_CREATED").val()==""){
				$("#PDT_CREATED").tips({
					side:3,
		            msg:'请输入备注10',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_CREATED").focus();
			return false;
			}
			if($("#PDT_UPDATED").val()==""){
				$("#PDT_UPDATED").tips({
					side:3,
		            msg:'请输入备注11',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PDT_UPDATED").focus();
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