<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style type="text/css">
#dialog-add, #dialog-message, #dialog-comment {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	z-index: 99999999;
	display: none;
}

.contentStyleP{
    color:red;
    display:inline;
    margin:0 10px;
}
.commitopacity {
	position: absolute;
	width: 100%;
	height: 10000px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}

.commitbox {
	width: 100%;
	margin: 0px auto;
	position: absolute;
	top: 120px;
	z-index: 99999;
}

.commitbox_inner {
	width: 96%;
	height: 255px;
	margin: 6px auto;
	background: #efefef;
	border-radius: 5px;
}

.commitbox_top {
	width: 100%;
	height: 253px;
	margin-bottom: 10px;
	padding-top: 10px;
	background: #FFF;
	border-radius: 5px;
	box-shadow: 1px 1px 3px #e8e8e8;
}

.commitbox_top textarea {
	width: 95%;
	height: 195px;
	display: block;
	margin: 0px auto;
	border: 0px;
}

.commitbox_cen {
	width: 95%;
	height: 40px;
	padding-top: 10px;
}

.commitbox_cen div.left {
	float: left;
	background-size: 15px;
	background-position: 0px 3px;
	padding-left: 18px;
	color: #f77500;
	font-size: 16px;
	line-height: 27px;
}

.commitbox_cen div.left img {
	width: 30px;
}

.commitbox_cen div.right {
	float: right;
	margin-top: 7px;
}

.commitbox_cen div.right span {
	cursor: pointer;
}

.commitbox_cen div.right span.save {
	border: solid 1px #c7c7c7;
	background: #6FB3E0;
	border-radius: 3px;
	color: #FFF;
	padding: 5px 10px;
}

.commitbox_cen div.right span.quxiao {
	border: solid 1px #f77400;
	background: #f77400;
	border-radius: 3px;
	color: #FFF;
	padding: 4px 9px;
}

.uploadBtn {
	background: #ffffff;
	border: 1px solid #cfcfcf;
	color: #565656;
	padding: 0 18px;
	display: inline-block;
	border-radius: 3px;
	margin-left: 10px;
	cursor: pointer;
	font-size: 14px;
	float: left;
}

.uploadBtn:hover {
	background: #f0f0f0;
}

.uploadBtn {
	background: #00b7ee;
	color: #fff;
	border-color: transparent;
}

.uploadBtn:hover {
	background: #00a2d4;
}

.uploadBtn.disabled {
	pointer-events: none;
	opacity: 0.6;
}
</style>

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
												<div id="zhongxin">
												
													<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top: 5px;">
								<thead>
									<tr>
										<th class="center" style="width: 55px;">
										查看
										</th>
										<th class="center">id</th>
										<th class="center">商品标题</th>
										<th class="center">商品编号</th>
										<th class="center  hidden"  >所属店铺</th>
										<th class="center">单价</th>
										<th class="center">数量</th>
										<th class="center">总价</th>
									</tr>
								</thead>

								<tbody>

									<tr v-for="item in pdtOrder">
										<td class='center'><span style="cursor: pointer;" @click="showPdtDetail(item.id)">查看</span>
										</td>
										<td class='center' style="width: 30px;">{{ item.id }}</td>
										<td class='center'>{{item.pdtTitle}}</td>
										<td class='center'>{{ item.pdtNo }}</td>
										<td class='center' v-if="item.pdtShopId==0">总店</td>
										<td class='center'>{{ item.pdtMyPrice/100 }} ￥</td>
										<td class='center'>{{ item.pdtNum }}</td>
										<td class='center'>{{ item.pdtMyPrice * item.pdtNum/100 }} ￥</td>
									</tr>
								</tbody>
							</table>
								<textarea name="CONTENT" id="CONTENT" style="display: none"></textarea>
													<table style="width: 100%;" id="xtable">
														<tr>
															<td style="padding-top: 10px;">商品名称:
																  <p style="display: inline;color:blue;margin-ritht:10px;">{{obj.pdtTitle}}</p>  
																商品市价:<div class="contentStyleP"> {{obj.pdtScPrice / 100}}元</div>
																 会员价格:
																<div class="contentStyleP"> {{obj.pdtMyPrice / 100}}元</div>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px; padding-left: 2px;">
															<label style="margin-right: 3px;"> 商品类别:</label>
                                                                  {{ typeName }}
															<label style="margin-left: 13px;"> 商品店铺:</label>
                                                              {{ pdtShop }}
															<label style="margin-left: 13px;"> 商品编号:</label>
                                                              {{ obj.pdtNo }}
															</td>
														</tr>
														
													
														<tr>
															<td style="padding-top: 10px;">
															商品小图：
															<img :src=" obj.pdtMinImg " width="100" height="100"
																	style="margin-left: 20px; "></td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">商品详情:<div id="msg"></div> </td>
														</tr>

														<tr>
															<td style="text-align: center;" colspan="10"><a
																	class="btn btn-mini btn-primary" onclick="save();">保存</a>
																<a class="btn btn-mini btn-danger"
																	onclick="top.Dialog.close();">取消</a></td>
														</tr>
													</table>
												</div>
												<div id="zhongxin2" class="center" style="display: none">
													<br /> <br /> <br /> <br /> <br />
													<img src="static/images/jiazai.gif" />
													<br />
													<h4 class="lighter block green">提交中...</h4>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>

	<!-- 编辑框-->
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>

	<script type="text/javascript">
	$(top.hangge());//关闭加载状态
	   var pdtId= localStorage.getItem("pdtId");
	   
	    new Vue({  
	        el: '#zhongxin',
	        data: {
	          obj:{},
	          typeId:'',
	          typeName:'',
	          pdtShop:'',
	          pdtOrder:[]
	        },
	        created:function(){
	        	 this.pdtOrder=JSON.parse(pdtId);
	    },
	    methods:{
	    	showPdtDetail:function(pId){
	    		 var url="<%=basePath%>product/getProductDetailById?pdtId="+pId;
	        	 var pdtNum = this.pdtOrder.pdtNum;
						this.$http.get(url).then(function(data) {
							this.obj = data.body;
							$("#msg").append(this.obj.pdtMsg); 
							if(this.obj.pdtShopId==0){
								this.pdtShop="总店";
							}
					       var url2="<%=basePath%>product/type/getPdtTypeDetailByTypeId?typeId="+this.obj.pdtTypeId;
						            this.$http.get(url2).then(function(data) {
							          this.typeName=data.body.text;
							          
						             }, function(response) {
							          console.info(response);
					           	}); 
						}, function(response) {
							console.info(response);
						});
	    	}
	    }
	
		})
	</script>
</body>
</html>