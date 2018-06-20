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
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				
					<div class="row">
					<!-- 生成二维码 -->
					<!-- <img src="http://pan.baidu.com/share/qrcode?w=145&h=148&url={$article.Url}" alt="{$article.Title}"/>
					 <td style="padding-left:2px;"><input class="span10 date-picker" 
					 name="lastLoginStart" id="lastLoginStart" value="" 
					 type="text" data-date-format="yyyy-mm-dd" readonly="readonly"
					  style="width:88px;" placeholder="开始日期" title="开始日期"></td>
					 
					 -->
						<div class="col-xs-12" id="DakaList">
						<!-- 检索  -->
							<table id="table">
							<td style="padding-left:8px;"><b>根据</b>  <input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:100px;" placeholder="参加打卡日期" title="参加打卡日期"/></td>
							<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="STATUS" id="SELECT" data-placeholder="状态" style="vertical-align:top;width: 92px;">
									<option value="">全部</option>
									<option value="1">成功打卡</option>
									<option value="2">打卡失败</option>
									<option value="3">参与打卡</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" v-on:click="tosearch"  title="查询"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</table>
                                
							<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top: 5px;">
								<thead>
									<tr>
										<th class="center" style="width: 35px;">
										<label class="pos-rel">
												<input type="checkbox" id="zcheckbox" class="ace" v-model='checked' v-on:click='checkedAll'/>
												<span class="lbl"></span>
											</label>
										</th>
										<th class="center">id</th>
										<th class="center">用户昵称</th>
										<th class="center">用户头像</th>
										<th class="center">参与挑战日期</th>
										<th class="center">打卡金额</th>
										<th class="center">打卡状态</th>
										<th class="center">打卡时间</th>
										<th class="center">连续打卡</th>
										<th class="center">操作</th>
									</tr>
								</thead>

								<tbody id="tdse">

									<tr v-for="item in items">
										<td class='center'><label class="pos-rel">
												<input type='checkbox' v-model='checkedNames' name='ids' :value=" item.id " class="ace" />
												<span class="lbl"></span>
											</label></td>
										<td class='center' >{{ item.id }}</td>
										<td class='center' >{{ item.name }}</td>
										<td class='center' ><a href="javascript:void(0);" @click="photo(item.photo)" >头像</a></td>
										<td class='center' >{{ item.day }}</td>
										<td class='center' >{{ item.dkGold }}</td>
										<td class='center' >
										   <span  v-if="item.dkStauts==0" style="color: red;">打卡成功</span>
											<span v-if="item.dkStauts==1" style="color: #B452CD;">打卡失败</span>
											<span v-if="item.dkStauts==2" style="color: #080808;">参加挑战</span>
										</td>
										<td class='center' >{{ item.dkTime }}
										<span v-if="item.dkTime==null">暂未打卡</span>
										</td>
										<td class='center' >{{ item.maxCont }}</td>
										<td class="center">
											<div class="hidden-sm hidden-xs btn-group" id="dsdssd">
											<a class="btn btn-xs btn-success" 
														@click="edit( item.id )"> <i
														class="ace-icon fa fa-pencil-square-o bigger-80"
														title="详情"></i></a>
												<a class="btn btn-xs btn-danger" @click="delfff( item.id )">
													<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
												</a>
											</div>
										</td>
									</tr>
									<tr v-if="showzw" style="text-align:center;"><td  colspan="10"><h2>没有相关数据!</h2></td></tr>
								</tbody>
							</table>
							<div class="page-header position-relative">
								<table style="width: 100%;">
									<tr>
										<td style="vertical-align: top; width: 140px;"><a class="btn btn-mini btn-success hidden" onclick="add();">新增</a> <a class="btn btn-mini btn-danger" @click="deletAll('可能很重要，确定要删除选择的数据吗?');"
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
	
	
	
	
	
	           <!--***************************参与打卡人员信息表**************************->
	
	
	
	
	
	
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
		
		
		// 对Date的扩展，将 Date 转化为指定格式的String
		// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
		// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
		// 例子：
		// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
		// (new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18

		Date.prototype.Format = function (fmt) { // author: meizz
		    var o = {
		        "M+": this.getMonth() + 1, // 月份
		        "d+": this.getDate(), // 日
		        "h+": this.getHours(), // 小时
		        "m+": this.getMinutes(), // 分
		        "s+": this.getSeconds(), // 秒
		        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
		        "S": this.getMilliseconds() // 毫秒
		    };
		    if (/(y+)/.test(fmt))
		        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var k in o)
		        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		            return fmt;
		};
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
			
		});
		
		var example2 = new Vue({
			
			  el: '#DakaList',
			  data:{
				  items:[],
					 all: 1, //总页数
				     cur: 1,//当前页码
				     page:1,
				     showzw:false,
				     checked: false, //全选框
				     checkedNames:[]
			  },
			  watch: {//深度监视 
	                 'checkedNames': {
	                     handler: function(val, oldVal) {
	                         if (val.length === this.items.length) {
	                             this.checked = true;
	                         } else {
	                             this.checked = false;
	                         }
	                     },
	                     deep: true
	                 }
	             }, 
			  created: function(){
				  var urlWork="<%=basePath%>hou/daka/getDakaAll?page="+this.page+"&rows="+15;
	 					  this.$http.get(urlWork).then(function(data){
	 		                   this.items = data.body.rows;
	 		                    this.all=Math.ceil(data.body.total/15);
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
	              //查看头像
	        	 photo:function(item){
	            	 localStorage.setItem("pdtphoto",item);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="头像";
	    			 diag.URL = "/page/smallcommenth/photo";
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
	        	  //详情页
	            edit:function(item){
	            	 localStorage.setItem("xiangqing",item);
	            	 top.jzts();
	    			 var diag = new top.Dialog();
	    			 diag.Drag=true;
	    			 diag.Title ="详情";
	    			 diag.URL = '<%=basePath%>page/smallcommenth/daka/dkall';
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
	            	
	             	//根据id删除打卡人员信息
	            	
	            delfff:function(id) {
	            	  bootbox.confirm("确定要删除吗?", function(result) {
	    				if(result) {
	    					var ids=id;
	    					var url = "<%=basePath%>hou/daka/deletDakaById";
	    					$.ajax({
								type: "POST",
								url: url,
						    	data: {id:ids},
								success: function(data){
									
									if(data){
										alert('删除成功')
										window.location.reload();
									}
									
								},
								error: function() {
									alert("出现了异常");
								}
							});
	    				}
	    			});
	              }, 
	              tosearch:function() {
	            	  var time=$("#lastLoginStart").val();//选中的时间
	            	 
	            	  var options=$("#SELECT option:selected"); //获取选中的项
	            	  if(time==''){
	            		  time=new Date().Format("yyyy-MM-dd");
	            	  }
	            	  var text1=options.text();//选中的文字
	            	  var va=options.val(); //拿到选中项的值
	            	  if(text1=="全部"){
	            		  var va=4;
	            	  }
	            	  if(va==1){//成功打卡
	            		  
	            		  var va=0;
	            	  }else if(va==2){//打卡失败
	            		  var va=1;
	            		  
	            	  }else if(va==3){//参与打卡
	            		  var va=2;
	            	  }
					var url = "<%=basePath%>hou/daka/getDakaAllByDay";
					_this=this;
					$.ajax({
						type: "POST",
						url: url,
				    	data: {
				    		day:time,
				    		status:va,
				    		page:1,
				    		rows:15
				    	},
						success: function(data){						
							_this.items =data.rows;
							
							console.log(data);
							  if(data.total==0){
								  _this.showzw=true;
	
							}else{

								  _this.showzw=false;
							}
 		                    _this.all=Math.ceil(data.total/15);
 		                   //window.location.reload();
						}
						});
	            	  
	              },
	              
	              /*
	                              复选框选择
	              */
	            	 checkedAll: function() {
	            		 var _this = this;
	            	      console.log(_this.checkedNames);
	            	      console.log(_this.checkedNames);
	            	      if (!_this.checked) { //实现反选
	            	        _this.checkedNames = [];
	            	      } else { //实现全选
	            	        _this.checkedNames = [];
	            	        _this.items.forEach(function(item) {
	            	          _this.checkedNames.push(item.id);
	            	        });
	            	      }
	            	    },
	            	    
	            	  /* 页码点击事件 */
	              btnClick: function(data){
		               if(data != this.cur){
		                   this.cur = data 
		               }
		               var a=15;
		               var url="<%=basePath%>hou/daka/getDakaAll?page="+data+"&rows="+a;
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/15);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		           pageClick: function(){
		               this.page=this.cur;
		               var url="<%=basePath%>hou/daka/getDakaAll?page="+this.page+"&rows="+15;
		                this.$http.get(url).then(function(data){
		                    var json=data.body;
		                    this.all=Math.ceil(json.total/15);
		                    this.items=json.rows;
		                   
		                },function(response){
		                    console.info(response);
		                });
		           },
		           
		         //  批量删除
		           deletAll:function(msg){
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
		       						if(msg == '可能很重要，确定要删除选择的数据吗?'){
		       							top.jzts();
		       							$.ajax({
		       								type: "POST",
		       								url: '<%=basePath%>hou/daka/deletDakaByIds',
		       						    	data: {ids:str},
		       								dataType:'json',
		       								//beforeSend: validateData,
		       								cache: false,
		       								success: function(data){
		       									
		    									if(data){
		    										alert('删除成功')
		    										window.location.reload();
		    									}
		    									
		    								},
		    								error: function() {
		    									alert("出现了异常");
		    								}
		       							});
		       						}
		       					}
		       				}
		       			});
		       		}
	             }
			})
	</script>


</body>
</html>