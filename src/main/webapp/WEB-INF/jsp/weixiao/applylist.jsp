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
						
						
							<table id="simple-table"
								class="table table-striped table-bordered table-hover"
								style="margin-top: 5px;">
								<thead>
									<tr>
										
										<th class="center">id</th>
										<th class="center">姓名</th>
										<th class="center">手机号</th>
										<th class="center">时间</th>
										
										<th class="center ">操作</th>
									</tr>
								</thead>
								<div>
									<tbody>

										<tr v-for="item in items">
											
											<td class='center' style="width: 30px;">{{ item.id }}</td>
											<td class='center' style="width: 230px;">{{	item.name }}</td>
										
											<td class='center'>{{	item.phone }}</td>
											<td class='center'>{{	item.updated }}</td>
											
											<td class="center ">
												<div  id="dsdssd">
													
													 <a class="btn btn-xs btn-danger"
														@click="delfff( item.id )"> <i
														class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>

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
		var aa =  localStorage.getItem("wxapplylist");
		var example2 = new Vue({
			  el: '#pdtList',
			  data:{
				items:[]
				
			  },
			  created: function(){
				  
	                var url="<%=basePath%>apply/getapplyByids?id="+aa;
	        
	                this.$http.get(url).then(function(data){
	                	 this.items=data.body;
	                },function(response){
	                    console.info(response);
	                });
	            }, 
	         
	         methods:{
	        
	            <!--单条删除用户信息-->	
	            delfff:function(ids) {
	            	bootbox.confirm("确定要删除吗?", function(result) {
	    				if(result) {
	    					top.jzts();
	    					var params={ids:ids}
	    					var url = "<%=basePath%>/apply/deleteapply";
	    					$.ajax({
								type: "POST",
								url: url,
						    	data: {id:ids},
								success: function(x){
									alert('删除成功')
									window.location.reload();
								}
							});
	    				}
	    			});
	              },
	             
		          
	         }
			})
      

	</script>


</body>
</html>