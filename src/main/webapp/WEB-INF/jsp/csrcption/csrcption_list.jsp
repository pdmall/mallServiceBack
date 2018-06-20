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
<%@ include file="../system/index/top.jsp"%>
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

							<!-- 检索  -->
							<table style="margin-top: 5px;">
								<tr>
									<td>
										<div class="nav-search">
											<span class="input-icon"> <input type="text" placeholder="在这里输入名称" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }"
													placeholder="在这里输入名称" /> <i class="ace-icon fa fa-search nav-search-icon"></i>
											</span>
										</div>
									</td>
									<td style="vertical-align: top; padding-left: 2px"><a class="btn btn-light btn-xs" onclick="tosearch();" title="检索">
											<i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>
										</a>
									</td>
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
										<th class="center">平台名称</th>
										<th class="center">平台网址</th>
										<th class="center hidden">平台介绍</th>
										<th class="center">是否显示</th>
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
										<td class='center' style="width: 130px;">{{ item.csoverName }}</td>
										<td class='center'><a @click="open(item.csoverLink);" target="blank" style="cursor:pointer;">点击查看</a></td>
										<td class='center hidden'>{{ item.csoverMsg }}</td>
										<td class='center' v-if="item.csoverShowStatus==0" style="color:red;">不显示</td>
										<td class='center' v-if="item.csoverShowStatus==1">显示中</td>
										<td class='center' id="nihao">{{ item.created }}</td>
										<td class='center hidden'>{{ item.updated }}</td>
										<td class="center">
											<div class="hidden-sm hidden-xs btn-group" id="dsdssd">
												<a class="btn btn-xs btn-success" title="编辑" @click="edit( item )">
													<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
												</a>
												<a class="btn btn-xs btn-danger" @click="delfff( item.id )">
													<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
												</a>
												
												<a class="btn btn-xs btn-danger" @click="isPause( 1,item.id )"  style="color:red;"  v-if="item.csoverShowStatus==0">
													开启
												</a>
												<a class="btn btn-xs btn-success" @click="isPause( 0,item.id )" v-else>
													暂停
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
	<%@ include file="../system/index/foot.jsp"%>
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
			  },
			  created: function(){
	                var url="<%=basePath%>crossover/getCrossoverByPage?page="+this.page+"&status="+this.selected;
	        
	                this.$http.get(url).then(function(data){
	                    var json=data.body;
	                    this.all=Math.ceil(json.total/10);
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
	        	 
	             //关闭服务
	        	 isPause:function(isPause,id){
	        		 bootbox.confirm("你确定要开启该服务吗?", function(result) {
		    				if(result) {
		    					top.jzts();
	        		 var url="<%=basePath%>crossover/updateCrossoverStatusById";
	        		 $.ajax({
							type: "POST",
							url: url,
					    	data: {id:id,status:isPause},
							success: function(x){
								window.location.reload();
							}
						});
				     }
			       });
	        	 },
	         
	            edit:function(item){
	            	 localStorage.setItem("crossoverId",item.id);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="编辑";
	    			 diag.URL = '<%=basePath%>page/csrcption/crossover_edit';
	    			 diag.Width = 800;
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
	            delfff:function(ids) {
	            	bootbox.confirm("确定要删除吗?", function(result) {
	    				if(result) {
	    					top.jzts();
	    					var params={ids:ids}
	    					var url = "<%=basePath%>crossover/deleteCrossover";
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
		               var url="<%=basePath%>xh/item/getXhItemByPage?page="+this.cur+"&shopId=0";
			   	        
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/10);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		          changeIsPause:function(selected){
		        	  this.selected=selected;
		        	  var url="<%=basePath%>crossover/getCrossoverByPage?page="+this.cur+"&status="+this.selected;
			   	        
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
		               var url="<%=basePath%>crossover/getCrossoverByPage?page="+this.cur+"&status="+this.selected;
		   	        
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
   					var url = "<%=basePath%>corssover/deleteCorssover";
   					$.ajax({
							type: "POST",
							url: url,
					    	data: {ids:ids.toString()},
							success: function(x){
								alert('删除成功')
								window.location.reload();
							}
						});
		           },
		           open:function(csoverLink){
		        	   window.open('http://'+csoverLink);
		           }
	         }
			});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>page/csrcption/crossover_add';
			 diag.Width = 800;
			 diag.Height = 555;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				window.location.reload();
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
		
	
	</script>


</body>
</html>