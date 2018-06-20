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
	width: 106px;
	background-color: #FFF;
	border: 1px solid #cccccc;
}

.search-sort-list li {
	padding-left: 7px;
	color: #5B5B5B;
	line-height: 25px;
}

.search-sort-list .current, .search-sort-list li:hover {
	background-color: #E0E0E0;
}

.search-input {
	float: left;
	padding: 0 3px;
	width: 220px;
	height: 35px;
	line-height: 32px;
	color: #333333;
	border: 0;
}

.search-btn {
	float: left;
	width: 50px;
	height: 35px;
	line-height: 34px;
	cursor: pointer;
	text-align: center;
	color: #333333;
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
						<div class="col-xs-12" id="pdtList">
						<div style="padding-top:6px;">
								店铺名称：<input type="text" id="sous" placeholder="这里输入店铺名称"/><a style="cursor:pointer;padding-left:3px" @click="sousuo()">搜索</a> <a @click="sousuos()"style="cursor:pointer;padding-left:20px;">刷新</a>
							</div>
						
							<table id="simple-table"
								class="table table-striped table-bordered table-hover"
								style="margin-top: 5px;">
								<thead>
									<tr>
										
										
										<th class="center">用户名</th>
										<th class="center">手机号</th>
										<th class="center">账户号</th>
										<th class="center">余额</th>
										<th class="center">转款金额</th>
										<th class="center ">店铺名称</th>
										<th class="center">转账记录</th>
										
										<th class="center ">更新时间</th>
										<th class="center ">操作</th>
									</tr>
								</thead>
								<div>
									<tbody>

										<tr v-for="item in items">
											
										
											<td class='center' >{{ item.name }}</td>
											<td class='center' >{{ item.phone }}</td>
											<td class='center' >{{ item.username }}</td>
											<td class='center' >{{ item.money/100 }}元</td>
											<td><input type="text" :value="item.money/100"  id="zhuans" >元</td>
											<td class='center '><a @click="shopsss( item )" style="cursor:pointer;">{{item.shopname}}</a></td>
											<td class='center'><a @click="xiang( item )" style="cursor:pointer;">详情</a></td>
											
											
											<td class='center ' style="width: 200px;">{{
												item.updated }}</td>
											<td class="center ">
												<div class="hidden-sm hidden-xs btn-group" id="dsdssd">
													<a class="btn btn-xs btn-success" title="确定转款" @click="zhuan( item )">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="确定转款"></i>
													</a>
													

												</div>
											</td>
										</tr>
									</tbody>
								</div>


							</table>
							<div class="page-header position-relative">
								<table style="width: 100%;">
									<tr>
										
										<td style="vertical-align: top; width: 140px;" class="hidden"> <a class="btn btn-mini btn-danger" @click="makeAll('确定要删除选中的数据吗?');"
												title="批量删除">
												<i class='ace-icon fa fa-trash-o bigger-120'></i>
											</a></td>
										<td style="vertical-align: top; width: 140px;"> </td>
										<td style="vertical-align: top;"><div class="pagination"
												style="float: right; padding-top: 0px; margin-top: -50px; width: 500px;">
												<div class="page-bar">
													<ul>
														<li v-if="cur>1"><a v-on:click="cur--,pageClick()">上一页</a>
														</li>
														<li v-if="cur==1"><a class="banclick">上一页</a></li>
														<li v-for="index in indexs"
															v-bind:class="{ 'active': cur == index}"><a
															v-on:click="btnClick(index)">{{ index }}</a></li>
														<li v-if="cur!=all"><a v-on:click="cur++,pageClick()">下一页</a>
														</li>
														<li v-if="cur == all"><a class="banclick">下一页</a></li>
														<li><a> 共<i>{{all}}</i>页
														</a></li>
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
	<script type="text/javascript">
	//showPdtList();
		$(top.hangge());//关闭加载状态
		var example2 = new Vue({
			  el: '#pdtList',
			  data:{
				items:[],
				typeName:[],
				typeNameChild:[],
				 all: 1, //总页数
			     cur: 1,//当前页码
			     page:1,
			     checkedNames:[],
			     selected:1,
			     selecteType:0,
			     selecteTypeChild:100,
			     keys:'100',
			  },
			  <!--查看用户信息 -->
			  created: function(){
				    
				    
	                var url="<%=basePath%>app/user/getappuserslist?page="+this.page+"&keys="+this.keys;
	        
	                this.$http.get(url).then(function(data){
	                    var json=data.body;
	                    this.all=Math.ceil(json.total/30);
	                    this.items=json.rows;
	                   
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
		        		
		        		 if(as=='' ){
		        			 as=100;
		        		 }
		        		
		        		this.keys=as;
		        		 var url="<%=basePath%>app/user/getappuserslist?page="+this.page+"&keys="+this.keys;
		     	        
			                this.$http.get(url).then(function(data){
			                    var json=data.body;
			                    this.all=Math.ceil(json.total/30);
			                    this.items=json.rows;
			                   
			                },function(response){
			                    console.info(response);
			                });
		        	 },
	        	 sousuos:function(){
	        		 window.location.reload();
	        	 },
	        	 zhuan:function(item){
	        		 var zhuan = $("#zhuans").val();
	        		 var s = zhuan*100;
	        		 var id = item.userId;
	        		 
	        		 if(s<item.money){
		        		var url ="<%=basePath%>/app/user/updatedappuser2";	 
		        		$.ajax({
							type: "POST",
							url: url,
					    	data: {
					    		userId : id,
					    		zhuan :s
					    		},
							success: function(x){
								alert('转账成功');
								window.location.reload();
							}
						}); 
	        		 }else{
	        			 alert("余额不足!");
	        		 }
	        	 },
	        	 
	        	 
	        	 xiang:function(item){
            		
	            	 localStorage.setItem("dealsphone",item.phone);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="查看";
	    			 diag.URL = '<%=basePath%>page/jmmr/cost/deals';
	    			 diag.Width = 500;
	    			 diag.Height = 600;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    		    	
	    				diag.close();
	    			 };
	    			 diag.show();
	            	},
	        	 shopss:function(item){
            		
	            	 localStorage.setItem("shopssphone",item.phone);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="查看";
	    			 diag.URL = '<%=basePath%>page/jmmr/cost/shopss';
	    			 diag.Width = 500;
	    			 diag.Height = 600;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    		    	
	    				diag.close();
	    			 };
	    			 diag.show();
	            	},
	        	 change:function(id,status){
	        		 var statuss = '';
	        		 if(status==0){
	        			 statuss=1
	        		 }else{
	        			 statuss=0
	        		 }
	        		var url ="<%=basePath%>/advertising/updateadvertisingById";	 
	        		$.ajax({
						type: "POST",
						url: url,
				    	data: {
				    		id : id,
				    		status :statuss
				    		},
						success: function(x){
							
							window.location.reload();
						}
					}); 
	        	 },
	        	 <!--消费详情-->
	      		getconsume:function(phone){
	      			 top.jzts();
	      			 localStorage.setItem("consumephone",phone);	
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="消费详情";
	    			 diag.URL = '<%=basePath%>/page/jmmr/consume/consumelist';
	    			 diag.Width = 700;
	    			 diag.Height = 655;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    		    	 window.location.reload();
	    				diag.close();
	    			 };
	    			 diag.show();
	      		},
	        	 <!--取消订单列表-->
	      		getorder8:function(phone){
	      			 top.jzts();
	      			 localStorage.setItem("order8phone",phone);	
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="消费详情";
	    			 diag.URL = '<%=basePath%>/page/jmmr/consume/order8list';
	    			 diag.Width = 700;
	    			 diag.Height = 655;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    		    	 window.location.reload();
	    				diag.close();
	    			 };
	    			 diag.show();
	      		},
	        	 <!--添加用户-->
	      		add:function(){
	      			 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="增加";
	    			 diag.URL = '<%=basePath%>/page/jmmr/cost/costadd';
	    			 diag.Width = 700;
	    			 diag.Height = 555;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    		    	 window.location.reload();
	    				diag.close();
	    			 };
	    			 diag.show();
	      		},
	        	 
	         	<!--修改弹出-->
	            edit:function(item){
	            	 localStorage.setItem("appuserid",item.userId);	            	 
	            	            	 
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="编辑";
	    			 diag.URL = '<%=basePath%>page/jmmr/consume/updateduserstar';
	    			 diag.Width = 200;
	    			 diag.Height = 155;
	    			 diag.Modal = true;				//有无遮罩窗口
	    			 diag. ShowMaxButton = true;	//最大化按钮
	    		     diag.ShowMinButton = true;		//最小化按钮 
	    			 diag.CancelEvent = function(){ //关闭事件
	    		    	 window.location.reload();
	    				diag.close();
	    			 };
	    			 diag.show();
	            	},
	            	
	            <!--单条删除用户信息-->	
	            delfff:function(ids) {
	            	bootbox.confirm("确定要删除吗?", function(result) {
	    				if(result) {
	    					top.jzts();
	    					var params={ids:ids}
	    					var url = "<%=basePath%>/app/user/deletepricelist";
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
		               var url="<%=basePath%>app/user/getappuserslist?page="+this.cur+"&keys="+this.keys;
			   	        
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/30);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		          changeType:function(pid){
		        	  this.selecteType=pid;
		        	  var url="<%=basePath%>app/user/getappuserslist?page="+this.selecteType+"&keys="+this.keys;
		 	 	        
		                this.$http.get(url).then(function(data){
		                    this.typeNameChild=data.body;
		                },function(response){
		                    console.info(response);
		                }); 
		          },
		       
		          changeIsPause:function(selected){
		        	  this.selected=selected;
		        	  var url="<%=basePath%>app/user/getappuserslist?page="+this.cur+"&keys="+this.keys;
			   	        
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
		               var url="<%=basePath%>app/user/getappuserslist?page="+this.cur+"&keys="+this.keys;
		   	        
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
   					var url = "<%=basePath%>/app/user/deletepricelists";
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
								url: '<%=basePath%>XhItem/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>XhItem/excel.do';
		}
		$(function(){
			
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
	</script>


</body>
</html>