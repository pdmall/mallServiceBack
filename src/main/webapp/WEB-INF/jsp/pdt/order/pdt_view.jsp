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
							<input type="hidden" name="USER_ID" id="user_id" />
							<div id="zhongxin" style="padding-top: 13px;">
							    
								<label style="  padding-top: 5px;">商品名称:</label>
								<label> {{pdt.pdtTitle}} </label>
								<label style=" padding-top: 5px;margin-left:20px;">市场价:</label>
								<label> {{pdt.pdtScPrice}} </label>元
								<label style=" padding-top: 5px;margin-left:20px;">本店价:</label>
								<label> {{pdt.pdtMyPrice}} </label>元
								<label style= "padding-top: 5px;margin-left:20px;">产品编号:</label>
								<label> {{pdt.pdtNo}} </label>
								<hr style="margin:10px;">
								<label style="  padding-top: 5px;">商品类别:</label>
								<label> {{ pdtTypeName }} </label>
								<label style=" padding-top: 5px;margin-left:20px;">商品店铺:</label>
								<label v-if="pdt.pdtShopId==0">总店</label>
								<label style=" padding-top: 5px;margin-left:20px;">商品品牌:</label>
								<label> {{ pdtBannerName }} </label>
								<label style= "padding-top: 5px;margin-left:20px;">上下架:</label>
								<label v-if="pdt.pdtIsPutaway==0">下架中</label>
								<label v-else>上架中</label>
								<hr style="margin:10px;">
								<label style="  padding-top: 5px;">商品剩余:</label>
								<label> {{pdt.pdtRepertory}} </label>件
								<label style=" padding-top: 5px;margin-left:20px;">商品销量:</label>
								<label> {{pdt.pdtSellNum}} </label>
								<hr style="margin:10px;">
								<label style="  padding-top: 5px;margin-right:20px;" >商品小图:</label>
								<img alt="" :src=" pdt.pdtMinImg ">
								<hr style="margin:10px;">
								<label style="padding-top: 5px;">商品详情:</label><br>
								<div v-html=" pdt.pdtMsg ">
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
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
		<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";
	</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	 var pId=localStorage.getItem('pdtId');
	 var zhongxin= new Vue({  
	        el: '#zhongxin',
	        data: {
	         pdt:{},
	         pdtTypeName:'',
	         pdtBannerName:'',
	         pdtTypeId:'',
	         pdtBannerId:''
	        },
	        created:function(){
	         var url="<%=basePath%>product/getProductDetailById?pdtId=" + pId;
			  this.$http.get(url).then(function(data) {
				this.pdt = data.body;
				this.pdtTypeId=this.pdt.pdtTypeId;
				this.pdtBannerId=this.pdt.pdtBannerId;
				
				 var url2="<%=basePath%>product/type/getPdtTypeDetailByTypeId?typeId="+this.pdtTypeId;
	             
	             this.$http.get(url2).then(function(data){
	            	 
	    	                    this.pdtTypeName=data.body.text;
	    	                },function(response){
	    	                    console.info(response);
	    	                });
	             var urlBanner="<%=basePath%>banner/getBannerById?bannerId="+this.pdtBannerId;
	             
	             this.$http.get(urlBanner).then(function(data){
	             	 this.pdtBannerName=data.body.bannerTitle;
	    	                },function(response){
	    	                    console.info(response);
	    	                });
				
			}, function(response) {
				console.info(response);
			});
			
		}
	})
	
</script>
</html>