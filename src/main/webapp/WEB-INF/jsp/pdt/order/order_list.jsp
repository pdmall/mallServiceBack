<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.aTag{
color:#03F;
cursor:pointer;
}

.search {
	float: left;
	font-size: 14px;
	border: 1px solid #CCC;
	

}
.search-sort {
	float: left;
	position: relative;
	padding: 0 5px;
	height: 35px;
	line-height: 35px;
	cursor: pointer;
	background-color: #FFF;
}
.search-sort-txt {
	display: inline-block;
	margin-right: 4px;
	width: 60px;
	color: #5B5B5B;
	
}
.search-sort em {
	display: inline-block;
	width: 0;
	height: 0;
	vertical-align: middle;
	border: 5px solid #FFF;
	border-bottom-width: 0; 
	border-top-color: #5B5B5B;
}
.search-sort:hover em {
	border: 5px solid #FFF;
	border-top-width: 0;
	border-bottom-color: #5B5B5B;
}
.search-sort-list {
	display: none;
	position: absolute;
	top: 35px;
	left: -1px;
	z-index: 10;
	width:106px;
	background-color: #FFF;
	border: 1px solid #cccccc;
	
}
 .search-sort-list li {
	padding-left: 7px;
	color: #5B5B5B;
	line-height:25px;
}
 .search-sort-list .current,
 .search-sort-list li:hover {
	background-color: #E0E0E0;
}
 .search-input {
	float: left;
	padding: 0 3px;
	width: 220px;
	height: 35px;
	line-height: 32px;
	color:#333333;
	border: 0;
}
 .search-btn {
	float: left;
	width: 50px;
	height: 35px;
	line-height: 34px;
	cursor: pointer;
	text-align: center;
	color:#333333;
	border-left: 1px solid #CCC;
	background-color: #F5F5F5;
}
 .search-btn:hover {
	text-decoration: none;
	color: #277eb6;
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
						<div class="col-xs-12" id="orderList">

							<!-- 检索  -->
							<table style="margin-top: 5px;">
								<tr>
								<td>
							   	   <div class="header-ba search cf" style="z-index:99999;">
		                               
					             					
				                  <input type="text"  id="orderno" placeholder="输入订单编号" class="search-input" x-webkit-speech value="" style="border: 0px;outline:none;">
					              <a class="search-btn" @click="getorder()">搜索</a>
			
				                </div> 
							   
							   </td>
									<td><select class="form-control" v-model="selected" style="border-radius:10px;padding:.5px 2px;" @change="change( selected )">
											<option value="100">所有订单</option>
											<option value="1">待接单</option>
											<option value="2">已接单\待发货</option>
											<option value="3">已发货</option>
											<option value="4">已送达\待确认</option>
											<option value="5">确认收货 </option>
											<option value="6">已评论 </option>
											<option value="7">已删除</option>
											
											
										</select>
									</td>
								
								
									<td style="vertical-align: top; padding-left: 2px"><a class="btn btn-light btn-xs" onclick="tosearch();" title="检索">
											<i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>
										</a></td>
									<td style="vertical-align: top; padding-left: 2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL">
											<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i>
										</a></td>

								</tr>
							</table>
							<!-- 检索  -->

							<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top: 5px;">
								<thead>
									<tr>
										<th class="center" style="width: 35px;">
										<label class="pos-rel">
												<input type="checkbox" class="ace" id="zcheckbox" />
												<span class="lbl"></span>
											</label>
										</th>
										<th class="center">id</th>
										<th class="center">订单编号</th>
										<th class="center">订单状态</th>
										<th class="center">订单详情</th>
										<th class="center">下单用户</th>
										<th class="center">订单价格</th>
										<th class="center">收货地址</th>
										<th class="center hidden">图片列表</th>
										<th class="center ">下单时间</th>
										<th class="center hidden">更新时间</th>
										<th class="center">操作</th>
										<th class="center">订单评论</th>
									</tr>
								</thead>

								<tbody>

									<tr v-for="item in items">
										<td class='center'><label class="pos-rel">
												<input type='checkbox' name='ids' :value=" item.id " class="ace" v-model="checkedNames" />
												<span class="lbl"></span>
											</label></td>
										<td class='center' style="width: 30px;">{{ item.id }}</td>
										<td class='center' style="width: 130px;">{{ item.orderNo }}</td>
										<td class='center'>
										 <span  v-if="item.orderStatus ==1">待接单 </span>
										 <span  v-else-if="item.orderStatus ==2">已接单\待发货 </span>
										 <span  v-else-if="item.orderStatus ==3">已发货 </span>
										 <span  v-else-if="item.orderStatus ==4">已送达\待确定</span>
										 <span  v-else-if="item.orderStatus ==5">已确认\待评论 </span>
										 <span  v-else-if="item.orderStatus ==6">已评论 </span>
										 <span  v-else-if="item.orderStatus ==7">已删除 </span>
										 <span  v-else-if="item.orderStatus ==8">确认退货 </span>
										 <span  v-else-if="item.orderStatus ==8">退款退货完成 </span>
										 </td>
										<td class='center aTag' @click="getPdtById(item.orderPdtId)">订单产品</td>
										<td class='center aTag' @click="getUserById(item.orderUserId)">查看用户</td>
										<td class='center'>{{ item.totalPrices /100 }} ￥</td>
										<td class='center' v-for="todo in typeName" v-if=" item.pdtTypeId == todo.id ">{{ todo.text }}</td>
										<td class='center' v-for="banner in banners" v-if=" item.pdtBannerId == banner.id ">{{ banner.bannerTitle }}</td>
										<td class='center aTag' @click="getAddressById(item.orderAddressId)">收货地址</td>
										<td class='center' id="nihao">{{ item.created | date}}</td>
										<td class='center hidden'>{{ item.updated }}</td>
										<td class="center">
											<div class="hidden-sm hidden-xs btn-group" id="dsdssd">
												  <a class="btn btn-xs btn-info" @click="updateorder( item.id,2 )" v-if="item.orderStatus ==1"> 接单</a>
												  <a class="btn btn-xs btn-info" @click="myDelivery( item.orderNo)" v-if="item.orderStatus ==2"> 发货</a>
												  <a class="btn btn-xs btn-info" @click="mysong( item.orderNo)" v-if="item.orderStatus ==3"> 送货人信息</a>
												  <a class="btn btn-xs btn-info" @click="mysong( item.orderNo)" v-if="item.orderStatus ==4"> 送货人信息</a>
												  
												<a class="btn btn-xs btn-default" @click="delfff( item.id )">
													<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
												</a>
											</div>
										</td>
										<td class='center'>{{ item.orderComment }}</td>
									</tr>
								</tbody>
							</table>
							<div class="page-header position-relative">
								<table style="width: 100%;">
									<tr>
									
										<td style="vertical-align: top;"><div class="pagination" style="float: right; padding-top: 0px; margin-top: -50px; width: 500px;">
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
	<script type="text/javascript">
	$(function() {
		
		$("#header-search").hover(function(){
			$("#search-sort-list").show();
		},function(){
			$("#search-sort-list").hide();
		});
		
		//搜索选项选择
		$("#search-sort-list li").click(function(){
			var curTxt = $(this).text();
			var type = $(this).val();
			$('#search').val(type);
			$(this).addClass("current").siblings().removeClass("current");
			$(this).parent().siblings(".search-sort-txt").text(curTxt);			
			
			if(type==181)
			{
				$(".search-sort-txt").css("width","60px");			
			}else if(type==190){
				$(".search-sort-txt").css("width","60px");
			}else{
				$(".search-sort-txt").css("width","60px");
			}
			
			$(this).parent().hide();
		  });
		});
	//showorderList();
		$(top.hangge());//关闭加载状态
		var example2 = new Vue({
			  el: '#orderList',
			  data:{
				items:[],
				typeName:[],
				typeNameChild:[],
				banners:[],
				 all: 1, //总页数
			     cur: 1,//当前页码
			     page:1,
			     checkedNames:[],
			     selected:1,
			     selecteType:0,
			     selecteTypeChild:0,
			     orderStatus:1,
			     ite:{}
			  },
			  created: function(){
				  var pdtOrderStatus=localStorage.getItem("pdtOrderStatus");
				  
				  if(pdtOrderStatus !=null || pdtOrderStatus != ''){
					  this.orderStatus=pdtOrderStatus;
				  }
	              var url="<%=basePath%>order/getOrderByPage?page="+this.page+"&orderStatus="+this.orderStatus;
	        
	                this.$http.get(url).then(function(data){
	                    var json=data.body;
	                    this.all=Math.ceil(json.total/10);
	                    this.items=json.rows;
	                   
	                },function(response){
	                    console.info(response);
	                });
	            },
	            filters:{
	            	date:function(x){
	            		 var d = new Date(x);
	            		    var year = d.getFullYear();
	            		    var month = d.getMonth() + 1;
	            		    var day = d.getDate() <10 ? '0' + d.getDate() : '' + d.getDate();
	            		    var hour = d.getHours();
	            		    var minutes = d.getMinutes();
	            		    var seconds = d.getSeconds();
	            		    return year+ '-' + month + '-' + day + ' ' + hour + ':' + minutes + ':' + seconds;
	            	}
	            },
	            computed: {
	            	 getorder:function(){
		        		 var orderno = $("#orderno").val();
		        		 var url="<%=basePath%>order/getOrderByorder?page="+this.page+"&orderno="+orderno;
		     	        
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/30);
			                    this.items=json.rows;
			                   
			                },function(response){
			                    console.info(response);
			                });
		        	 },
	            	
	            	
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
	        	 
	        	 
	        	 updateorder:function(id,status) {
		    					top.jzts();
		    					
		    					
		    					var url = "<%=basePath%>/order/updateOrder";
		    					$.ajax({
									type: "POST",
									url: url,
							    	data: {
							    		id:id,
							    		orderStatus : status
							    	},
									success: function(x){
										alert('接单成功')
										window.location.reload();
									}
								});
		             		 },
	        	 
	        	 updateorders:function(id,status,order) {
		    					top.jzts();
		    					
		    					this.myDelivery(order);
		    					var url = "<%=basePath%>/order/updateOrder";
		    					$.ajax({
									type: "POST",
									url: url,
							    	data: {
							    		id:id,
							    		orderStatus : status
							    	},
									success: function(x){
										
										
									}
								});
		             		 },
	        	 
	        	 
	        	 
	        	 
	        	 getmessage:function(){
	        		 var or = $("#orders").val();
	        		 var url="<%=basePath%>order/getOrder?orderNo="+or;
	        		 this.$http.get(url).then(function(data){
		                    
		                    this.items=data.body;
		                   
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 
	        	 change:function(orderStatus){
	        		 this.orderStatus=orderStatus;
	        		 var url="<%=basePath%>order/getOrderByPage?page="+this.page+"&orderStatus="+this.orderStatus;
	     	        
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/10);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	            	getUserById:function(uId){
	            		localStorage.setItem("uId",uId);
		            	 top.jzts();
		    			 var diag = new top.Dialog();
		    			 diag.Drag=true;
		    			 diag.Title ="用户详情";
		    			 diag.URL = '<%=basePath%>happuser/userDetailById.do?USER_ID='+uId;
		    			 diag.Width = 600;
		    			 diag.Height = 455;
		    			 diag.Modal = true;				//有无遮罩窗口
		    			 diag. ShowMaxButton = true;	//最大化按钮
		    		     diag.ShowMinButton = true;		//最小化按钮 getProductDetailById?pdtId='+pId
		    			 diag.CancelEvent = function(){ //关闭事件
		    				diag.close();
		    			 };
		    			 diag.show();
	            	},
	            	getPdtById:function(pId){
	            		localStorage.setItem("pdtId",pId);
		            	 top.jzts();
		    			 var diag = new top.Dialog();
		    			 diag.Drag=true;
		    			 diag.Title ="订单产品";
		    			 diag.URL = '<%=basePath%>page/pdt/product/product_detail';
		    			 diag.Width = 800;
		    			 diag.Height = 755;
		    			 diag.Modal = true;				//有无遮罩窗口
		    			 diag. ShowMaxButton = true;	//最大化按钮
		    		     diag.ShowMinButton = true;		//最小化按钮 
		    			 diag.CancelEvent = function(){ //关闭事件
		    				diag.close();
		    			 };
		    			 diag.show();
	            	},
	            	getAddressById:function(aId){
	            		localStorage.setItem("aId",aId);
		            	 top.jzts();
		    			 var diag = new top.Dialog();
		    			 diag.Drag=true;
		    			 diag.Title ="地址详情";
		    			 diag.URL = '<%=basePath%>page/pdt/order/address_view';
		    			 diag.Width = 500;
		    			 diag.Height = 255;
		    			 diag.Modal = true;				//有无遮罩窗口
		    			 diag. ShowMaxButton = true;	//最大化按钮
		    		     diag.ShowMinButton = true;		//最小化按钮 
		    			 diag.CancelEvent = function(){ //关闭事件
		    				diag.close();
		    			 };
		    			 diag.show();
	            	},
	            	
	            	mysong:function(order){
	            		localStorage.setItem("songorder",order);
		            	 top.jzts();
		    			 var diag = new top.Dialog();
		    			 diag.Drag=true;
		    			 diag.Title ="送货人信息";
		    			 diag.URL = '<%=basePath%>page/pdt/order/songxinxi';
		    			 diag.Width = 500;
		    			 diag.Height = 255;
		    			 diag.Modal = true;				//有无遮罩窗口
		    			 diag. ShowMaxButton = true;	//最大化按钮
		    		     diag.ShowMinButton = true;		//最小化按钮 
		    			 diag.CancelEvent = function(){ //关闭事件
		    				diag.close();
		    			 };
		    			 diag.show();
	            	},
	            	
	            	
	            	
	            	
	            delfff:function(ids) {
	            	bootbox.confirm("确定要删除吗?", function(result) {
	    				if(result) {
	    					top.jzts();
	    					var params={ids:ids}
	    					var url = "<%=basePath%>/order/deleteOrder";
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
	              myDelivery:function(orderNo){
	            	  localStorage.setItem("orderNo",orderNo);
	            	 
		            	 top.jzts();
		    			 var diag = new top.Dialog();
		    			 diag.Drag=true;
		    			 diag.Title ="自己送货";
		    			 diag.URL = '<%=basePath%>page/pdt/order/express_add';
		    			 diag.Width = 500;
		    			 diag.Height = 405;
		    			 diag.Modal = true;				//有无遮罩窗口
		    			 diag. ShowMaxButton = true;	//最大化按钮
		    		     diag.ShowMinButton = true;		//最小化按钮 
		    			 diag.CancelEvent = function(){ //关闭事件
		    				 window.location.reload();
		    		    	 diag.close();
		    			 };
		    			 diag.show();
	              },
	              express:function(orderNo){
	            	  localStorage.setItem("orderNo",orderNo);
		            	 top.jzts();
		    			 var diag = new top.Dialog();
		    			 diag.Drag=true;
		    			 diag.Title ="发快递";
		    			 diag.URL = '<%=basePath%>page/pdt/order/express_add2';
		    			 diag.Width = 500;
		    			 diag.Height = 405;
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
		               if(data != this.cur){
		                   this.cur = data 
		               }
		               var url="<%=basePath%>order/getOrderByPage?page="+data+"&orderStatus="+this.orderStatus;
			   	        
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/10);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		         
		           pageClick: function(){
		               this.page=this.cur;
		               var url="<%=basePath%>order/getOrderByPage?page="+this.page+"&orderStatus="+this.orderStatus;
		   	        
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/10);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		           makeAll:function(){
		        	   top.jzts();
		        	   var ids=this.checkedNames;
   					var url = "<%=basePath%>/order/deleteorder";
   					$.ajax({
							type: "POST",
							url: url,
					    	data: {ids:ids.toString()},
							success: function(x){
								alert('删除成功')
								window.location.reload();
							}
						});
		           }
	         }
			})
      

      
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
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>page/pdt/order/order_add';
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
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>order/delete.do?order_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						tosearch();
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>order/goEdit.do?order_ID='+Id;
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 tosearch();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>/order/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											tosearch();
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>order/excel.do';
		}
	</script>


</body>
</html>