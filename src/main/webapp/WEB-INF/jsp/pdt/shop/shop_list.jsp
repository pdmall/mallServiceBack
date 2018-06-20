<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<style type="text/css">
.shadowPadding {
	-webkit-box-shadow: inset 0 0 10px #0CC;
	-moz-box-shadow: inset 0 0 10px #0CC;
	box-shadow: inset 0 0 10px #0CC;
}

.shadowMargin {
	-webkit-box-shadow: inset 0 0 10px #0CC;
	-moz-box-shadow: inset 0 0 10px #0CC;
	box-shadow: inset 0 0 10px #0CC;
}
li.items{list-style:none;margin-top:10px;padding:0}
.itemList{border:1px solid transparent}
.itemList:hover{border:1px solid orange}
.page-bar {
	margin: 40px;
}

ul, li {
	margin: 0px;
	padding: 0px;
}

li {
	list-style: none
}

.page-bar li:first-child>a {
	margin-left: 0px
}

.page-bar a {
	border: 1px solid #ddd;
	text-decoration: none;
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #337ab7;
	cursor: pointer
}

.page-bar a:hover {
	background-color: #eee;
}

.page-bar a.banclick {
	cursor: not-allowed;
}

.page-bar .active a {
	color: #fff;
	cursor: default;
	background-color: #337ab7;
	border-color: #337ab7;
}

.page-bar i {
	font-style: normal;
	color: #d44950;
	margin: 0px 4px;
	font-size: 12px;
}
.lightblue{
    background:lightblue
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
					<div class="row" style="margin-top: 10px;">
						
							
							<div class="row" id="shopList">
							<div style="padding-top:-19px;padding-left:15px;">
								店铺名称：<input type="text" id="sous" placeholder="这里输入店铺名称"/><a style="cursor:pointer;padding-left:3px" @click="sousuo()">搜索</a> <a @click="sousuos()"style="cursor:pointer;padding-left:20px;">刷新</a>
							</div>
								<ul class="col-xs-11 "  style="margin:0px 0 0 10px;padding:0;">
									<li class="col-lg-2 col-xs-6 col-sm-3 items" style="padding-top: 10px;padding-left:3px;" v-for="shop in shopList" >
										<div class="itemList col-xs-12" style="margin:0 0px;position:relative;padding:0" >
											 <div class="shopName " style="padding:2px 0;font-size:1.2em;color:orange" >{{ shop.shopTitle }}</div>	
										  <a style="position:absolute;top:27;right:0;cursor: pointer;" class="btn btn-danger" @click="deletes(shop.id)" >
										       <i class="ace-icon fa fa-trash-o bigger-120" title="删除" style="cursor:pointer;"></i>
										  </a>
										 
										  <img class="shopImg" :src="aa+shop.shopImg.split(',')[0]" style="width: 100%;height:170px" />
										  									  
										  <div class="col-xs-5 " @click="openShopDetail(shop.id,shop.shopCityId)" style="padding-left:0;cursor:pointer;color:#62a8d1" >店铺详情</div>
										  <div class="col-xs-5 text-right " @click="openShopPdtList(shop.id)" style="cursor:pointer;padding-right:0;color:#62a8d1">店铺产品</div>
										  
										</div>
										
									</li>
								</ul>
								
								
								<div class="page-header">
								<table style="width: 100%;">
									<tr>
										
										<td style="vertical-align: top;"><div class="pagination" style="float: right; padding-top: 50px;  width: 500px;">
												<div class="page-bar">
													<ul>
														<li v-if="cur>1">
															<a v-on:click="cur--,pageClick()">上一页</a>
														</li>
														<li v-if="cur==1">
															<a class="banclick">上一页</a>
														</li>
														<li v-for="index in indexs" v-bind:class="{ 'active': cur == index}">
															<a v-on:click="btnClick(index)">{{ index }}</a>
														</li>
														<li v-if="cur!=all">
															<a v-on:click="cur++,pageClick()">下一页</a>
														</li>
														<li v-if="cur == all">
															<a class="banclick">下一页</a>
														</li>
														<li>
															<a>
																共<i>{{all}}</i>页
															</a>
														</li>
													</ul>
												</div>

											</div></td>
									</tr>
								</table>
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
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/jkurl.js"></script>
	<script type="text/javascript">
	//showPdtList();
		$(top.hangge());//关闭加载状态
		var example2 = new Vue({
			  el: '#shopList',
			 
			  data:{
				  all: 1, //总页数
				  cur: 1,//当前页码
				  page:1,
				  shopList:[],
				  aa:imgUrlsss,
				  keys:'100',
			  },
			  created: function(){
	                var url="<%=basePath%>app/user/getshoplist?page="+this.page+"&keys="+this.keys;
	                this.$http.get(url).then(function(data){
	                	  	var json=data.body;
	 	                    this.all=Math.ceil(json.total/12);
	 	                    this.shopList=json.rows;
	                   
	                },function(response){
	                    console.info(response);
	                });
	            }, 
	            computed: {
			           indexs: function(){
				             var left = 1;
				             var right = this.all;
				             var ar = [];
				             if(this.all>= 5){
				               if(this.cur > 3 && this.cur < this.all-2){
				                       left = this.cur - 2
				                       right = this.cur + 2
				               }else{
				                   if(this.cur<=3){
				                       left = 1
				                       right = 5
				                   }else{
				                       right = this.all
				                       left = this.all -4
				                   }
				               }
				            }
				           while (left <= right){
				               ar.push(left)
				               left ++
				           }
				           return ar
				          }
				            
				       },
	         methods:{
	        	 sousuo:function(){
	        		var as = $("#sous").val(); 
	        		this.keys=as;
	        		 var url="<%=basePath%>app/user/getshoplist?page="+this.page+"&keys="+this.keys;
		                this.$http.get(url).then(function(data){
		                	  	var json=data.body;
		 	                    this.all=Math.ceil(json.total/12);
		 	                    this.shopList=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 sousuos:function(){
	        		 window.location.reload();
	        	 },
	        	 deletes:function(ids){
	        		 bootbox.confirm("确定要删除吗?", function(result) {
		    				if(result) {
		    					top.jzts();
		    					var params={ids:ids}
		    					var url = "<%=basePath%>/app/user/deleteshop";
		    					$.ajax({
									type: "POST",
									url: url,
							    	data: {id:ids},
									success: function(x){
										alert('删除成功')
										window.location.reload();
									}
								});
		    				}
		    			});
	        	 },
	        	 
	        	 openShopDetail:function(id,cityid){
	        	
	        		
	        		 localStorage.setItem("cityid",cityid);
	        		 localStorage.setItem("shopIds",id);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="店铺详情";
	    			 diag.URL = '<%=basePath%>page/pdt/shop/shop_detail';
	    			 diag.Width = 900;
	    			 diag.Height = 555;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    				diag.close();
	    			 };
	    			 diag.show();
	        	 },
	        	 openShopPdtList:function(id){
	        		 localStorage.setItem("shopId",id);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="店铺产品列表";
	    			 diag.URL = '<%=basePath%>page/pdt/shop/pdt_list';
	    			 diag.Width = 1200;
	    			 diag.Height = 555;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    				diag.close();
	    			 };
	    			 diag.show();
	        	 },
	            edit:function(item){
	            	 localStorage.setItem("pdtId",item.id);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="编辑";
	    			 diag.URL = '<%=basePath%>page/pdt/product/product_edit';
	    			 diag.Width = 800;
	    			 diag.Height = 755;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    		    	 window.location.reload();
	    				diag.close();
	    			 };
	    			 diag.show();
	            	},
	            	 btnClick: function(data){//页码点击事件
			               
			                   this.cur = data 
			              
			               
			               var url="<%=basePath%>app/user/getshoplist?page="+this.cur+"&keys="+this.keys;
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/12);
			                    this.shopList=json.rows;
			                   
			                },function(response){
			                    console.info(response);
			                });
			           },
			          changeType:function(pid){
			        	 
			        		  var url="<%=basePath%>?page="+this.page+"&keys="+this.keys;
			        	 
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/15);
			                    this.shopList=json.rows;
			                },function(response){
			                    console.info(response);
			                }); 
			        	
			          },
			          
			          changeshopname:function(){
			        	 
			        	  var url="<%=basePath%>app/user/getshoplist?page="+this.page+"&keys="+this.keys;
			    	        
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/12);
			                    this.shopList=json.rows;
			               
			                },function(response){
			                    console.info(response);
			                });  
			          },
			  
			           pageClick: function(){
			               this.page=this.cur;
			               var url="<%=basePath%>app/user/getshoplist?page="+this.page+"&keys="+this.keys;
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/12);
			                    this.shopList=json.rows;
			                   
			                },function(response){
			                    console.info(response);
			                });
			           },
	            delfff:function(ids) {
	            	bootbox.confirm("确定要删除吗?", function(result) {
	    				if(result) {
	    					top.jzts();
	    					var params={ids:ids}
	    					var url = "<%=basePath%>/product/deleteProduct";
	    					$.ajax({
								type: "POST",
								url: url,
						    	data: {ids:ids},
								success: function(x){
									alert('删除成功')
									window.location.reload();
								}
							});
	    				}
	    			});
	              },
	             
	             

			}
		})
	</script>


</body>
</html>