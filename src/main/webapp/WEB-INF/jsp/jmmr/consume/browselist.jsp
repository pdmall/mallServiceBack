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
<script src="static/echarts.min.js"></script>
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
							<div  class="col-xs-12">
								<div @click.prevent="browse()" style="background-color:#62a8d1;text-align:center;font-size:38px;padding:25px 0;color:white;margin-top:20px;cursor:pointer" class="col-xs-2 col-xs-offset-1">
								浏览统计图
								</div>
								<div @click.prevent="browse1()"style="background-color:#62a8d1;text-align:center;font-size:38px;padding:25px 0;color:white;margin-top:20px;cursor:pointer" class="col-xs-3 col-xs-offset-1">
								年龄消费统计图
								</div>
								<div @click.prevent="browse2()"style="background-color:#62a8d1;text-align:center;font-size:38px;padding:25px 0;color:white;margin-top:20px;cursor:pointer" class="col-xs-3 col-xs-offset-1">
								项目消费统计图
								</div>
							</div >
							<div class="col-xs-3"  v-if="numberss==3" >
								<select id="ssss"  @change="browse2()">
									<option v-for="pr in products" :value="pr.id">{{pr.name}}</option>
									
								</select>
							 </div>
							<div class="col-xs-12">
									
								 	<div  id="main2" style="width:700px;height:700px;margin-left:350px" >
								 		
								 	</div>
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
			  el: '#pdtList',
			  data:{
				items:[],
				products:[],
				typeName:[],
				typeNameChild:[],
				 all: 1, //总页数
			     cur: 1,//当前页码
			     page:1,
			     checkedNames:[],
			     selected:1,
			     selecteType:0,
			     selecteTypeChild:100,
			     numberss:1
			  },
			  <!--查看用户信息 -->
			  created: function(){
	                var url="<%=basePath%>app/user/getBrowseUser";
	                this.$http.get(url).then(function(data){
	                    this.items=data.body;
	                    echers(this.items,1);
	                },function(response){
	                    console.info(response);
	                });
	                
	                var url="<%=basePath%>app/user/getproducttypes";
	                this.$http.get(url).then(function(data){
	                    this.products=data.body;
	                   
	                },function(response){
	                    console.info(response);
	                });
	                
	                
	            }, 
	            
	         methods:{
	        	 
	        	 browse:function(){
	        		this.numberss=1;
	        		 var url="<%=basePath%>app/user/getBrowseUser";
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,1);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse1:function(){
	        		 this.numberss=1;
	        		 var url="<%=basePath%>app/user/getconsumelists";
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,2);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse2:function(){
	        		 this.numberss=3;
	        		 var ssss=$("#ssss").val();
	        		 if(ssss==undefined){
	        			 ssss=this.products[0].id;
	        		 }
	        		 var url="<%=basePath%>app/user/getconsumelistBypid?pid="+ssss;
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,3);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	
	         }
			})
		
	function echers(list,status){
			var aaa=[];
			aaa.splice(0,aaa.length);
			var message=[];
		for(var i=0;i<list.length;i++){
			aaa.push(list[i].age+"岁");
			message.push({value:list[i].number, name:list[i].age+"岁"});
		}

		var myChart = echarts.init(document.getElementById("main2"));
		var sss ='';
		if(status==1){
			sss = '用户访问数据';
		}else if(status==2){
			sss = '年龄消费比例数据';
		}else if(status ==3){
			sss = '项目年龄消费比例';
		}
		
		option = {
			
		    title : {
		        text: sss,
		        subtext: '聚美美容',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        top: '20',
		        data:aaa
		    },
		    series : [
		        {
		            name: '聚美美容APP',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:message,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	
			myChart.setOption(option);
			
}

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