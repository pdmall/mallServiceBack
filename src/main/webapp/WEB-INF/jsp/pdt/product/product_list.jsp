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
						<div class="col-xs-12" id="pdtList">
							<td>店铺名称：<select class="form-control" v-model="selecteShop" style="width:300px;  border-radius:10px;padding:.5px 2px;" @change="changeshopname">
											
											<option v-for="opts in shop" :value="opts.id">{{ opts.shopTitle }}</option>
											
										</select>
									</td>
							<!-- 检索  -->
							<table style="margin-top: 5px;">
								<tr>
									<td><select class="form-control" v-model="selected" style="border-radius:10px;padding:.5px 2px;" @change="change( selected )">
											<option value="1">上架产品列表</option>
											<option value="0">下架产品列表</option>
										</select>
										</td>
									<td><select class="form-control" v-model="selecteType" style="border-radius:10px;padding:.5px 2px;" @change="changeType( selecteType )">
											<option value="0">显示所有</option>
											<option v-for="opt in typeName"  v-bind:value="opt.id">{{ opt.text }}</option>
										</select>
									</td>
									
									<td>
										<div class="nav-search">
											<span class="input-icon"> <input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }"
													placeholder="这里输入关键词" /> <i class="ace-icon fa fa-search nav-search-icon"></i>
											</span>
										</div>
									</td>
									
									
									<td style="padding-left: 2px;"><input class="span10 date-picker" name="lastStart" id="lastStart" value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly"
											style="width: 88px;" placeholder="开始日期" title="开始日期" /></td>
									<td style="padding-left: 2px;"><input class="span10 date-picker" name="lastEnd" name="lastEnd" value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width: 88px;"
											placeholder="结束日期" title="结束日期" /></td>
									<td style="vertical-align: top; padding-left: 2px;"><select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align: top; width: 120px;">
											<option value=""></option>
											<option value="">全部</option>
											<option value="">1</option>
											<option value="">2</option>
										</select></td>
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
												<input type="checkbox" class="ace" id="zcheckbox" @click="selectAll"/>
												<span class="lbl"></span>
											</label>
										</th>
										<th class="center">id</th>
											<th class="center">商品编号</th>
										<th class="center">商品标题</th>
										<th class="center">商品品牌</th>
										<th class="center">商品类别</th>
										<th class="center">市场价</th>
										<th class="center">本站价</th>
										<th class="center">商品小图</th>
										<th class="center hidden">商品详情</th>
										<th class="center">上下架</th>
										<th class="center">库存</th>
										<th class="center">销量</th>
										<th class="center hidden">图片列表</th>
										<th class="center ">商品状态</th>
										<th class="center hidden ">尺寸</th>
										<th class="center ">创建时间</th>
										<th class="center hidden">更新时间</th>
										<th class="center">操作</th>
									</tr>
								</thead>

								<tbody>

									<tr v-for="item in items">
										<td class='center'><label class="pos-rel">
												<input type='checkbox' name='ids' :value=" item.id " class="ace" v-model="checkedNames" />
												<span class="lbl"></span>
											</label></td>
										<td class='center' style="width: 30px;">{{ item.id }}</td>
										<td class='center'>{{ item.pdtNo }}</td>
										<td class='center' style="width: 130px;">{{ item.pdtTitle }}</td>
										<td class='center' v-for="banner in banners" v-if=" item.pdtBannerId == banner.id ">{{ banner.bannerTitle }}</td>
										<td class='center' v-for="todo in typeName" v-if=" item.pdtTypeId == todo.id ">{{ todo.text }}</td>
										
										<td class='center'>{{ item.pdtScPrice/100 }}</td>
										<td class='center'>{{ item.pdtMyPrice/100 }}</td>
										
									
										<td class='center'><a @click="photo( item.pdtMinImg )" >图片</a></td>
										<td class='center hidden'>{{ item.pdtMsg }}</td>
										<td class='center'><span v-if=" item.pdtIsPutaway ==1 ">上架中</span> <span style="color: red;" v-else>下架中 </span></td>
										<td class='center'>{{ item.pdtRepertory }}</td>
										<td class='center'>{{ item.pdtSellNum }}</td>
										
										
										<td class='center hidden'>{{ item.pdtImgList }}</td>
										<td class='center hidden' >{{ item.colours }}</td>
										
										
										<td>
											<div style="text-align:center;">
												<input :class="item.pdtstatus==0?'lightblue':''" type="button"   @click="updatestatus(item.id,0)"    value="无状态">
												<input :class="item.pdtstatus==1?'lightblue':''" type="button"   @click="updatestatus(item.id,1)"   value="热销">
												<input :class="item.pdtstatus==2?'lightblue':''" type="button"   @click="updatestatus(item.id,2)"   value="新上架">												
											</div>
										
										</td>
										
										
										
										<td class='center hidden' >{{ item.sizes }}</td>
										<td class='center' id="nihao">{{ item.created | date}}</td>
										<td class='center hidden'>{{ item.updated }}</td>
										<td class="center">
											<div class="hidden-sm hidden-xs btn-group" id="dsdssd">
												<a class="btn btn-xs btn-success" title="编辑" @click="edit( item )">
													<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
												</a>
							                        <a class="btn btn-xs btn-info" @click="putaway( item.id ,item.pdtIsPutaway)" v-if="item.pdtIsPutaway==0"> 上架 </a>
												    <a class="btn btn-xs btn-danger" @click="soldOut( item.id ,item.pdtIsPutaway)" v-else> 下架 </a>			
												    <a class="btn btn-xs btn-info" @click="pdtAudit( item.id ,item.pdtIsAudit)" v-if="item.pdtIsAudit==0" title="通过审核"> 审核 </a>
												    <a class="btn btn-xs btn-danger" @click="pdtNoAudit( item.id ,item.pdtIsAudit)" title="冻结该产品" v-else> 冻结 </a>
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
										<td style="vertical-align: top; width: 140px;"><a class="btn btn-mini btn-success" onclick="add();">新增</a> <a class="btn btn-mini btn-danger" @click="makeAll('确定要删除选中的数据吗?');"
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
	//showPdtList();
		$(top.hangge());//关闭加载状态
	

		
		
		var example2 = new Vue({
			  el: '#pdtList',
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
				  var urls="<%=basePath%>shop/getListShop"
					  this.$http.get(urls).then(function(data){
		                   this.shop = data.body;
		                   this.selecteShop=this.shop[0].id;
 							this.ids = this.shop[0].id;
		                   var url2="<%=basePath%>product/type/getListTypeByParentId?id="+this.ids;
			                this.$http.get(url2).then(function(data){
			       	                    this.typeName=data.body;   	                    
			       	                },function(response){
			       	                    console.info(response);
			       	                });
		                   
			                var url="<%=basePath%>product/getProductByPage?page="+this.page+"&isPutaway="+this.selected+"&pId="+0+"&shopId="+this.ids;
			    	        
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/15);
			                    this.items=json.rows;
			               //   var a =  this.items[0].parameter;
			              //    var aa = [];
			                  
			             //     console.info(aa[0].a);
			                },function(response){
			                    console.info(response);
			                });  
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
		       filters:{
	            	date(x){
	            		var d = new Date(x);
	            	       var year = d.getFullYear();
	            	       var month = d.getMonth() + 1;
	            	       var day = d.getDate() <10 ? '0' + d.getDate() : '' + d.getDate();
	            	       var hour = d.getHours();
	            	       var minutes = d.getMinutes();
	            	       var seconds = d.getSeconds();
	            	       return  year+ '-' + month + '-' + day + ' ' + hour + ':' + minutes + ':' + seconds;
	            	},
	            	RMB(x){
	            		return '￥'+ (x/100).toFixed(2)
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
	            		 var url="<%=basePath%>product/getProductByPage?page="+this.page+"&isPutaway="+isPutaway+"&pId="+this.selecteTypeChild;;
	         	        
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
	              pdtNoAudit:function(id,audit){
	            	  if(audit==0){
	            		  alert('已经冻结');
	            		  return;
	            	  }
	            	  bootbox.confirm("确定要冻结该商品吗?", function(result) {
		    				if(result) {
		    					top.jzts();
		    					var url = "<%=basePath%>/product/isAuditProduct";
		    					$.ajax({
									type: "POST",
									url: url,
							    	data: {id:id,isAudit:0},
									success: function(x){
										alert('冻结成功')
										window.location.reload();
									}
								});
		    				}
		    			});
	              },
	              pdtAudit:function(id,audit){
	            	  if(audit==1){
	            		  alert('已经上线');
	            		  return;
	            	  }
	            	  bootbox.confirm("确定要上线该商品吗?", function(result) {
		    				if(result) {
		    					top.jzts();
		    					var url = "<%=basePath%>/product/isAuditProduct";
		    					$.ajax({
									type: "POST",
									url: url,
							    	data: {id:id,isAudit:1},
									success: function(x){
										alert('审核上线成功')
										window.location.reload();
									}
								});
		    				}
		    			});
	              },
	              putaway:function(id,isPutaway){
	            	  if(isPutaway==1){
	            		  alert('已经上架');
	            		  return;
	            	  }
	            	  bootbox.confirm("确定要上架吗?", function(result) {
		    				if(result) {
		    					top.jzts();
		    					var url = "<%=basePath%>/product/isPutawayProduct";
		    					$.ajax({
									type: "POST",
									url: url,
							    	data: {id:id,isPutaway:1},
									success: function(x){
										alert('上架成功')
										window.location.reload();
									}
								});
		    				}
		    			});
	              },
	              soldOut:function(id,isPutaway){
	            	  if(isPutaway==0){
	            		  alert('已经下架');
	            		  return;
	            	  }
	            	  bootbox.confirm("确定要下架吗?", function(result) {
		    				if(result) {
		    					top.jzts();
		    					var url = "<%=basePath%>/product/isPutawayProduct";
		    					$.ajax({
									type: "POST",
									url: url,
							    	data: {isPutaway:0,id:id},
									success: function(x){
										alert('下架成功')
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
		               
		               var url="<%=basePath%>product/getProductByPage?page="+this.page+"&isPutaway="+this.selected+"&pId="+0+"&shopId="+this.ids;
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/15);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		          changeType:function(pid){
		        	  this.selecteType=pid;
		        	  var ids = this.selecteShop;
		        	  if(pid==0){
		        		  
		        		  var url="<%=basePath%>product/getProductByPage?page="+this.page+"&isPutaway="+this.selected+"&pId="+pid+"&shopId="+ids;
		        	  }else{
		        		  var url="<%=basePath%>product/getProductByPage?page="+this.page+"&isPutaway="+this.selected+"&pId="+pid;
		        	  }
		        	 
		    	        
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/15);
		                    this.items=json.rows;
		                },function(response){
		                    console.info(response);
		                }); 
		        	  
		        	 
		          },
		          
		          changeshopname:function(){
		        	  
		        	  
		        	  var ids = this.selecteShop;
		        	 
		        	  var url="<%=basePath%>product/getProductByPage?page="+this.page+"&isPutaway="+this.selected+"&pId="+0+"&shopId="+ids;
		    	        
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/15);
		                    this.items=json.rows;
		                   
		                    var url2="<%=basePath%>product/type/getListTypeByParentId?id="+ids;
				               
			                this.$http.get(url2).then(function(data){
			       	                    this.typeName=data.body;
			       	                    
			       	                },function(response){
			       	                    console.info(response);
			       	                });
		                },function(response){
		                    console.info(response);
		                });  
		          },
		  
		           pageClick: function(){
		               this.page=this.cur;
		               var url="<%=basePath%>product/getProductByPage?page="+this.page+"&isPutaway="+this.selected+"&pId="+0+"&shopId="+this.ids;
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/15);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		           makeAll:function(){
		        	   top.jzts();
		        	   var ids=this.checkedNames;
   					var url = "<%=basePath%>/product/deleteProduct";
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
			 diag.URL = '<%=basePath%>page/pdt/product/product_add';
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
					var url = "<%=basePath%>product/delete.do?PRODUCT_ID="+Id+"&tm="+new Date().getTime();
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
			 diag.URL = '<%=basePath%>product/goEdit.do?PRODUCT_ID='+Id;
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
								url: '<%=basePath%>/product/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>product/excel.do';
		}
	</script>


</body>
</html>