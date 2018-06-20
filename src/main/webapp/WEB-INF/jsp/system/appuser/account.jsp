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
<%@ include file="../index/top.jsp"%>

<style type="text/css">
#dialog-add, #dialog-message, #dialog-comment {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	z-index: 99999999;
	display: none;
}

.contentStyle {
	color: red;
	font-size: 18px;
}
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
													<textarea name="CONTENT" id="CONTENT" style="display: none"></textarea>
													<table style="width: 100%; font-size: 20px;" id="xtable">

														<tr>
															<td style="padding-top: 10px;">剩余金额: 
															        <lable class="contentStyle"> ￥{{userPrice}} </lable>
																	<input type="text" style="width: 40px; margin-left: 5px;"
																	onkeyup="yanzhengjine(this);" id="giveP" /> 
																	<a style="margin-left: 5px;margin-right:10px; color: blue; font-size: 18px; cursor: pointer;"
																	@click="givePrice(user.userId);">送现金</a> 
																	剩余积分: 
															        <lable class="contentStyle"> F{{user.userIntegral}} </lable>
																	<input type="text" style="width: 40px; margin-left: 5px;"
																	onkeyup="yanzhengjine(this);" id="giveI" /> 
																	<a style="margin-left: 5px; color: blue; font-size: 18px; cursor: pointer;"
																	@click="giveIntegral(user.userId);">送积分</a> 
																	<lable style="font-size:16px;">用户电话:</lable> 
																	<lable class="contentStyle"> {{user.phone}} </lable> 
																	<lable style="font-size:16px;">用户姓名:</lable> <lable class="contentStyle"> {{user.name}} </lable>
															</td>
														</tr>

													</table>
													<table id="simple-table"
														class="table table-striped table-bordered table-hover"
														style="margin-top: 5px;">
														<thead>
															<tr>
																<th class="center" style="width: 35px;"><label
																		class="pos-rel">
																		<input type="checkbox" class="ace" id="zcheckbox" />
																		<span class="lbl"></span>
																	</label></th>
																<th class="center">id</th>
																<th class="center">用户余额</th>
																<th class="center ">流动积分</th>
																<th class="center ">流动金额</th>
																<th class="center ">类别</th>
																<th class="center">操作时间</th>
															</tr>
														</thead>

														<tbody>

															<tr v-for="item in items">
																<td class='center'><label class="pos-rel">
																		<input type='checkbox' name='ids' :value=" item.id "
																			class="ace" />
																		<span class="lbl"></span>
																	</label>
																	</td>
																<td class='center' style="width: 30px;">{{ item.id }}</td>
																<td class='center'>￥{{ item.accountBalancePrice / 100 }}</td>
																<td class='center'>{{ item.accountFlowIntegral }}</td>
																<td class='center'>{{ item.accountFlowPrice }}</td>
																<td class='center' v-if=" item.accountUseType ==0">消费</td>
																<td class='center' v-if=" item.accountUseType ==1">充值</td>
																<td class='center' v-if=" item.accountUseType ==2">提现</td>
																<td class='center' v-if=" item.accountUseType ==3">赠送</td>
																<td class='center' id="nihao">{{ item.created }}</td>
																<td class='center hidden'>{{ item.updated }}</td>
																
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
	<%@ include file="../index/foot.jsp"%>

	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript">
	$(top.hangge());//关闭加载状态
	   var uId= localStorage.getItem("uId");
	   
	    new Vue({  
	        el: '#zhongxin',
	        data: {
	          userPrice:0,
	          user:{},
	          accountUseType:100,
	          items:[],
	          page:1,
	          all: 1, //总页数
			  cur: 1,//当前页码
			  page:1
	        },
	        created:function(){
	        	
	        	 var url="<%=basePath%>app/user/getUserInfoByUserId?uId="
								+ uId;
						this.$http.get(url).then(function(data) {
							this.user = data.body;
							this.userPrice=this.user.userPrice/100;
							
						}, function(response) {
							console.info(response);
						});
						
			   var urlAccount="<%=basePath%>app/user/account/getAppUserAccountByPage?page="+this.page+"&accountUseType="+this.accountUseType+"&uId="+uId;
			   this.$http.get(urlAccount).then(function(data) {
				   var json=data.body;
                   this.all=Math.ceil(json.total/5);
                   this.items=json.rows;
				}, function(response) {
					console.info('出错');
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
	        	  giveIntegral:function(uIdd){
	        		 var giveI=$("#giveI").val();
	        		 if(giveI=='' || giveI==0){
	        			 alert('请输入积分');
	        			 return;
	        		 }
	        		 bootbox.confirm("确定要赠送该用户"+giveI+"分吗？", function(result) {
	     				if(result) {
	     					 $.ajax({
	    	        			 url:'<%=basePath%>app/user/account/addIntegralByUId',
	    						 type : 'POST',
	    					      data : {
	    											uId : uIdd,
	    											integral : giveI
	    										},
	    										success : function() {
	    											location.reload();
	    										},
	    										error : function() {

	    										}
	    									})

	    						}	
	     			});
	        	  },
	        	  pageClick: function(){
		               this.page=this.cur;
		               var urlAccount="<%=basePath%>app/user/account/getAppUserAccountByPage?page="+this.page+"&accountUseType="+this.accountUseType+"&uId="+uId;
		                this.$http.get(urlAccount).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/5);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
	        	  btnClick: function(data){//页码点击事件
		               if(data != this.cur){
		                   this.cur = data 
		               }
		               var urlAccount="<%=basePath%>app/user/account/getAppUserAccountByPage?page="+this.cur+"&accountUseType="+this.accountUseType+"&uId="+uId;
		                this.$http.get(urlAccount).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/5);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
						givePrice : function(uIdd) {
							var giveP = $("#giveP").val();
							 if(giveP=='' || giveP==0){
			        			 alert('请输入赠送金额');
			        			 return;
			        		 }
			        		 bootbox.confirm("确定要赠送该用户"+giveP+"元吗？", function(result) {
			     				if(result) {
			     					 $.ajax({
			    	        			 url:'<%=basePath%>app/user/account/addPriceByUId',
			    										type : 'POST',
			    										data : {
			    											uId : uIdd,
			    											price : giveP*100
			    										},
			    										success : function() {
			    											location.reload();
			    										},
			    										error : function() {

			    										}
			    									})

			    						}	
			     			});
						}
					}

				})

		function yanzhengjine(obj) {

			var id = obj.id;
			var val = obj.value;
			var regStrs = [ [ '^0(\\d+)$', '$1' ], [ '[^\\d\\.]+$', '' ],
					[ '\\.(\\d?)\\.+', '.$2' ], [ '^(\\d+\\.\\d{2}).+', '$1' ] ];
			for (i = 0; i < regStrs.length; i++) {
				var reg = new RegExp(regStrs[i][0]);
				obj.value = obj.value.replace(reg, regStrs[i][1]);
			}

		}
	</script>
</body>
</html>