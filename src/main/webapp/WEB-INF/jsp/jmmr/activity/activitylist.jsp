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
					<div class="row">
						<div class="col-xs-12" id="activityList">
							
                                <td><p style="margin-top:10px;">工作室名称：</p>
                                <select class="form-control" v-model="selecteShop" style="width:300px; margin-left:80px;margin-top:-35px;  border-radius:10px;padding:.5px 2px;" @change="changeshopname" >
											
										<option v-for="opts in shop" :value="opts.id">{{ opts.workname }}</option>
											
										</select>
									</td>
							<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top: 5px;">
								<thead>
									<tr>
										<th class="center" style="width: 35px;">
										<label class="pos-rel">
												<input type="checkbox" class="ace" id="zcheckbox" @click="selectAll"/>
												<span class="lbl"></span>
											</label>
										</th>
										<th class="center">id</th>
											<th class="center">活动名称</th>
										<th class="center">类型</th>
										<th class="center">负责人</th>
										<th class="center">地址</th>
										<th class="center">开始时间</th>
										<th class="center">操作</th>
									</tr>
								</thead>

								<tbody>

									<tr v-for="item in items">
										<td class='center'><label class="pos-rel">
												<input type='checkbox' name='ids' :value=" item.id " class="ace" v-model="checkedNames" />
												<span class="lbl"></span>
											</label></td>
										<td class='center' >{{ item.id }}</td>
										<td class='center' >{{ item.activityname }}</td>
										<td class='center' >
											<span v-if="item.type==1">活动报道</span>
											<span v-if="item.type==2">活动安排</span>
										</td>
										<td class='center' >{{ item.username }}</td>
										<td class='center' >{{ item.site }}</td>
										<td class='center' >{{ item.time }}</td>
										
										
										<td class="center">
											<div class="hidden-sm hidden-xs btn-group" id="dsdssd">
												<a class="btn btn-xs btn-danger" @click="delfff( item.id )">
													<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
												</a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="page-header position-relative">
								<table style="width: 100%;">
									<tr>
										<td style="vertical-align: top; width: 140px;"><a class="btn btn-mini btn-success hidden" onclick="add();">新增</a> <a class="btn btn-mini btn-danger" @click="makeAll('确定要删除选中的数据吗?');"
												title="批量删除">
												<i class='ace-icon fa fa-trash-o bigger-120'></i>
											</a></td>
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
	//showactivityList();
		$(top.hangge());//关闭加载状态
	

		
		
		var example2 = new Vue({
			  el: '#activityList',
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
			     selecteTypeChild:'',
			     shop:{},
			     selecteShop:'',
			     ids : ''
			  },
			  created: function(){
				  var urlWork="<%=basePath%>work/getWorkList";
				  
	 					  this.$http.get(urlWork).then(function(data){
	 		                   this.shop = data.body;
	 		                   this.selecteShop=this.shop[0].id;
	  							this.ids = this.shop[0].id;
	 			       	                },function(response){
	 			       	                    console.info(response);
	 			       	                });
	                   //获取工作室列表
				  var url="<%=basePath%>app/user/getactivityslist?page="+this.page;
			    	        
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/30);
			                    this.items=json.rows;

			                },function(response){
			                    console.info(response);
			                }); 

	                var urlBanner="<%=basePath%>banner/getBannerByPage";
	                
	                this.$http.get(urlBanner).then(function(data){
	                	    var json = data.body;
		                    this.banners=json.rows
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
	        	 
	        	 updatestatus:function(id,status){
	        		 
	        		 var url = "<%=basePath%>/product/updateProduct";
 					$.ajax({
							type: "POST",
							url: url,
					    	data: {
					    		id:id,
					    		pdtstatus:status
					    		},
							success: function(x){
								
								window.location.reload();
							}
						});
	        	 },
	        	 
	        	 
	        	 photo:function(item){
	            	 localStorage.setItem("pdtphoto",item);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="编辑";
	    			 diag.URL = '<%=basePath%>page/pdt/product/photo';
	    			 diag.Width = 450;
	    			 diag.Height = 450;
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
	            	change:function(isPutaway){
	            		 var url="<%=basePath%>app/user/getactivityslist?page="+this.page;
	         	        
	 	                this.$http.get(url).then(function(data){
	 	                    var json=data.body;
	 	                    this.all=Math.ceil(json.total/15);
	 	                    this.items=json.rows;
	 	                   
	 	                },function(response){
	 	                    console.info(response);
	 	                });	
	            	},
	            delfff:function(ids) {
	            	bootbox.confirm("确定要删除吗?", function(result) {
	    				if(result) {
	    					top.jzts();
	    					var params={ids:ids}
	    					var url = "<%=basePath%>/app/user/deleteactivity";
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
	             
	             
	              selectAll:function(){
	            	  var _this = this;
	            	    console.log(_this.checkboxModel);
	            	    if (this.checked) {//实现反选
	            	      _this.checkedNames = [];
	            	    }else{//实现全选
	            	      _this.checkedNames = [];
	            	      _this.items.forEach(function(item) {
	            	        _this.checkedNames.push(item.id);
	            	      });
	            	    }
	              },
	              btnClick: function(data){//页码点击事件
		               if(data != this.cur){
		                   this.cur = data 
		               }
		               
		               var url="<%=basePath%>app/user/getactivityslist?page="+this.page;
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/30);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		          
		          
		          changeshopname:function(){
		        	  
		        	  var ids = this.selecteShop;
		        	
		        	  var url="<%=basePath%>activitys/getActivitysByWork?page="+this.page+"&workId="+ids;
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/30);
		                    this.items=json.rows;
		                },function(response){
		                    console.info(response);
		                });  
		          },
		  
		           pageClick: function(){
		               this.page=this.cur;
		               var url="<%=basePath%>app/user/getactivityslist?page="+this.page;
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/30);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		           makeAll:function(){
		        	   top.jzts();
		        	   var ids=this.checkedNames;
   					var url = "<%=basePath%>/app/user/deleteactivitys";
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
      

      
		
	</script>


</body>
</html>