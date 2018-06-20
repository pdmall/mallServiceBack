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
.asas1 {
	position:absolute;left:750px;top:10px
}
.asas {
	position:absolute;left:100px;top:10px
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
								<div @click.prevent="browse()" style="background-color:#62a8d1;text-align:center;font-size:12px;padding:15px 0;color:white;margin-top:15px;cursor:pointer" class="col-xs-1 col-xs-offset-1">
								近一周订单量
								</div>
								<div @click.prevent="browse1()"style="background-color:#62a8d1;text-align:center;font-size:12px;padding:15px 0;color:white;margin-top:15px;cursor:pointer" class="col-xs-1 col-xs-offset-1">
								年销售量
								</div>
								<div @click.prevent="browse2()"style="background-color:#62a8d1;text-align:center;font-size:12px;padding:15px 0;color:white;margin-top:15px;cursor:pointer" class="col-xs-1 col-xs-offset-1">
								某年每月订单量
								</div>
								<div @click.prevent="browse3()"style="background-color:#62a8d1;text-align:center;font-size:12px;padding:15px 0;color:white;margin-top:15px;cursor:pointer" class="col-xs-1 col-xs-offset-1">
								某年某月每天订单量
								</div>
								
							</div >
							
							<div class="col-xs-12" style="margin-top:100px;">
									
								 	<div  id="main2" style="width:600px;height:600px;" class="asas">
								 		
								 	</div>
								 	
								 	<div   v-if="numberss==2" style="width:250px;" class="asas1">
										<span style="font-size:15px">选择年:</span>
										<select id="ssss"  @change="browse2()" class="chosen-select" style="vertical-align: top; width:150px;">
											
											<option v-if="yearss>2025 || yearss==2025" value="2025">2025</option>
											<option v-if="yearss==2024 || yearss>2024" value="2024">2024</option>
											<option v-if="yearss>2023 || yearss==2023" value="2023">2023</option>
											<option v-if="yearss>2022 || yearss==2022" value="2022">2022</option>
											<option v-if="yearss>2021 || yearss==2021" value="2021">2021</option>
											<option v-if="yearss>2020 || yearss==2020" value="2020">2020</option>
											<option v-if="yearss>2019 || yearss==2019" value="2019">2019</option>
											<option v-if="yearss>2018 || yearss==2018" value="2018">2018</option>
											<option value="2017">2017</option>
										</select>
									 </div>
								 	<div   v-if="numbera==2" style="width:550px;" class="asas1">
										<span style="font-size:15px">选择年:</span>
										<select id="sas"  @change="browse5()" class="chosen-select" style="vertical-align: top; width:150px;">
											
											<option v-if="yearss>2025 || yearss==2025" value="2025">2025</option>
											<option v-if="yearss==2024 || yearss>2024" value="2024">2024</option>
											<option v-if="yearss>2023 || yearss==2023" value="2023">2023</option>
											<option v-if="yearss>2022 || yearss==2022" value="2022">2022</option>
											<option v-if="yearss>2021 || yearss==2021" value="2021">2021</option>
											<option v-if="yearss>2020 || yearss==2020" value="2020">2020</option>
											<option v-if="yearss>2019 || yearss==2019" value="2019">2019</option>
											<option v-if="yearss>2018 || yearss==2018" value="2018">2018</option>
											<option value="2017">2017</option>
										</select><br>
										<span style="font-size:15px">选择月:</span>
										<select id="sas1"  @change="browse5()" class="chosen-select" style="vertical-align: top; width:150px;">
											
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
										<input type="button" value="查询" @click="browse3()" style="border-bottom-color:#579ec8;width:50px; ">
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
				shops:[],
				typeName:[],
				typeNameChild:[],
				shopname:'',
			     checkedNames:[],
			     selected:1,
			     selectede:[],
			     selecteType:0,
			     selecteTypeChild:100,
			     numberss:1,
			     numbera:1,
			     aaaaa:1,
			     yearss:0
			  },
			  <!--查看用户信息 -->
			  created: function(){
				  var date=new Date;
				  var year=date.getFullYear(); 
				  this.yearss=year;
				
				  
	                var url="<%=basePath%>app/user/zhouconsume";
	                this.$http.get(url).then(function(data){
	                    this.items=data.body;
	                    echers(this.items,1);
	                },function(response){
	                    console.info(response);
	                });
	                
	                var urls="<%=basePath%>app/user/getlistshop";
	                this.$http.get(urls).then(function(data){
	                    this.shops=data.body;
	                   
	                },function(response){
	                    console.info(response);
	                });
	              
	            }, 
	            
	         methods:{
	        	 
	        	 browse:function(){
	        		this.numberss=1;
	        		this.numbera=1;
	        		 var url="<%=basePath%>app/user/zhouconsume";
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,1);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse1:function(){
	        		
	        		 this.numbera=1;
	        		 this.numberss=1;
	        		 var url="<%=basePath%>app/user/getyearsconsume";
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,2);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse2:function(){
	        		var sss = $("#ssss").val();
	        		if(sss==undefined){
	        			 var date=new Date;
	   				   
	        			sss=date.getFullYear();
	        		}
	        		 this.numberss=2;
	        		 this.numbera=1;
	        		 var url="<%=basePath%>app/user/getdayconsume?year="+sss;
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,2);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse3:function(){
	        	
	        		var year = $("#sas").val();
	        		var month = $("#sas1").val();
	        		if(year==undefined || month==undefined){
	        			 var date=new Date;
	   				   
	        			year=date.getFullYear();
	        			month=date.getMonth()+1;
	        		}
	        		var sd = year+"年"+month+"月订单量"
	        		 this.numberss=1;
	        		 this.numbera=2;
	        		 var url="<%=basePath%>app/user/getdayByyearandmonth?year="+year+"&month="+month;
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,);
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
			aaa.push(list[i].name);
			message.push(list[i].number);
		}
		example2.aaaaa=1;
		
		
		
		var myChart = echarts.init(document.getElementById("main2"));
		var sss ='';
		if(status==1){
			sss = '近一周订单量';
		}else if(status==2){
			sss = '每年订单量';
		}else{
			sss=status;
		}
		
		//app.title = '坐标轴刻度与标签对齐';

		option = {
		    color: ['#3398DB'],
		    title : {
		        text: sss,
		        subtext: '聚美美容',
		        x:'center'
		    },
		    
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : aaa,
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'销量',
		            type:'bar',
		            barWidth: '60%',
		            data:message
		        }
		    ]
		};

			myChart.setOption(option);
			if(message.length==0){
				alert('暂无数据');
			}
			
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
		
		
		

		

	
	</script>


</body>
</html>