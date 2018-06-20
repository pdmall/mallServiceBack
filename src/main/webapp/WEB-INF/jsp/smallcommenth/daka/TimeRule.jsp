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
						
						
							<table id="simple-table"
								class="table table-striped table-bordered table-hover"
								style="margin-top: 5px;">
								<thead>
									<tr>
										
										<th class="center">id</th>
										<th class="center">规则描述</th>
										<th class="center">所属类型</th>
										<th class="center">更新时间</th>
										
										<th class="center ">操作</th>
									</tr>
								</thead>
								<div>
									<tbody>

										<tr v-for="item in items">
											
											<td class='center' style="width: 30px;">{{ item.id }}</td>
											<td class='center' style="width: 230px;">{{	item.rule }}</td>
										
											<td class='center'>{{	item.rType }}
											<span v-if="item.rType==1">天天打卡</span>
											<span v-if="item.rType==2">众愿规则</span>
											</td>
											<td class='center'>{{	item.updated }}</td>
											<td class="center ">
												<div  id="dsdssd">
													<a class="btn btn-xs btn-success" 
														@click="edit( item.id )"> <i
														class="ace-icon fa fa-pencil-square-o bigger-80"
														title="编辑"></i></a>

												</div>
											</td>
										</tr>
									</tbody>
								</div>
							</table>
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
	
							<!--******************打卡和众愿的规则描述页面 ************************-->
	
	
	
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
				items:[]
				
			  },
			  created: function(){
				  
	                var url="<%=basePath%>hou/daka/getRules";
	        
	                this.$http.get(url).then(function(data){
	                	console.log(data);
	                	 this.items=data.body;
	                },function(response){
	                    console.info(response);
	                });
	            }, 
	         
	         methods:{
	        	  //编辑修改页
		            edit:function(item){
		            	 localStorage.setItem("upda",item);
		            	 top.jzts();
		    			 var diag = new top.Dialog();
		    			 diag.Drag=true;
		    			 diag.Title ="编辑";
		    			 diag.URL = '<%=basePath%>page/smallcomment/rule/updateRule';
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
	    			
	              },
	          }
			})
      

	</script>


</body>
</html>