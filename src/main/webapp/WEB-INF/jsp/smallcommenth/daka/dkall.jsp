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
 				/************************《打卡人员详情页》**************************/	
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
					<!-- <img src="http://pan.baidu.com/share/qrcode?w=145&h=148&url={$article.Url}" alt="{$article.Title}"/> -->
						
						<div class="col-xs-12" id="DakaList">
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top: 5px;">
								<thead>
									<tr>
										<th class="center">id</th>
										<th class="center">用户id</th>
										<th class="center">成功打卡时间</th>
										<th class="center">打卡状态</th>
										<th class="center">打卡成功后分配的金豆</th>
										<th class="center">该用户最高连续打卡次数</th>
									</tr>
								</thead>
								<tbody>
										<tr>
										<td class='center' >{{item.id }}</td>
										<td class='center' >{{item.dkId}}</td>
										<td class='center' >{{item.dkTime}}
										<span v-if="item.dkTime==null">暂未打卡
										</td>
										<td class='center' >
										   <span  v-if="item.dkStauts==0" style="color: red;">打卡成功</span>
											<span v-if="item.dkStauts==1" style="color: #B452CD;">打卡失败</span>
											<span v-if="item.dkStauts==2" style="color: #080808;">参加挑战</span>
										</td>
										<td class='center' >{{item.fpje}}</td>
										<td class='center' >{{ item.maxCont }}</td>
								</tbody>
							</table>
						</tr>
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
	   var id= localStorage.getItem("xiangqing");
	   
	   var pdtBanner= new Vue({  
	        el: '#DakaList',
	        data: {
	          item: [],
	        },
	        created:function(){
	        	//var _this=this;
	        	 var url="<%=basePath%>hou/daka/selctDakaById?did="+id;
	        	 
	                this.$http.get(url).then(function(data){
	                	console.log(data.bodyText);
	                	var json=JSON.parse(data.bodyText);
	                    
	                	this.item = json;
	                },function(response){
	                	
	                    console.info(response);
	                });
	        },
	     
	      })
	</script>


</body>
</html>