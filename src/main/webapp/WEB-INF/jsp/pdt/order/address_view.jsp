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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<style >
    @page {
      size: auto;  /* auto is the initial value */
      margin: 0mm; /* this affects the margin in the printer settings */
    }
</style>
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
							<div id="zhongxin" style="padding-top: 13px;">
								<label style="padding-top: 5px;">收件人姓名:</label>
								<label> {{ads.adName}} </label><br>
								<hr style="margin:10px;">
								<label style=" padding-top: 5px;">收件人电话:</label>
								<label> {{ads.adPhone}} </label><br>
								<hr style="margin:10px;">
								<label style=" padding-top: 5px;">收件人详细地址:</label>
								<label> {{ads.adMsgAddress}} </label>
								<hr style="margin:10px;">
								<label style=" padding-top: 5px;">收件人备注:</label>
								<label> {{ads.adRemark}} </label>
								<hr style="margin:10px;">
								<button onclick="printdiv();">打印</button>
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
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
</body>
<script type="text/javascript">
function printdiv() {
	window.print();
}
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//判断用户名是否存在
    var aId=localStorage.getItem('aId');
    var zhongxin= new Vue({  
        el: '#zhongxin',
        data: {
        	ads:{}
        },
        created:function(){
         var url="<%=basePath%>address/getAddressById?addressId=" + aId;
		  this.$http.get(url).then(function(data) {
			this.ads = data.body;
		}, function(response) {
			console.info(response);
		});
		
	}
})

</script>
</html>