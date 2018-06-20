<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@ include file="../../system/index/top.jsp"%>
<style type="text/css">
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
													<table style="width: 100%;" id="xtable">
													
														<div class="input-group input-group-lg">
															<span class="input-group-addon">名字:</span>
															<input type="text" class="form-control" v-model="types.sptDeliveryName" id="name" />
														</div>
														<br />
														<div class="input-group input-group-lg">
															<span class="input-group-addon">号码:</span>
															<input type="text" class="form-control" v-model="types.sptDeliveryPhone" id="link" />
														</div>
														<br />
														<div class="input-group input-group-lg">
															<span class="input-group-addon   ">时间:</span>
															<input type="text" class="form-control  " v-model="types.deliveryTime" id="cost" />
														</div>
														
														<br />
																	
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<!-- 编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";
	</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 编辑框-->
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/toolEmail.js"></script>
	<script type="text/javascript" src="plugins/webuploader/upload.js"></script>
	<script type="text/javascript">

	   var ids= localStorage.getItem("songorder");
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          types: [],
	        },
	        created:function(){
	        	 var url="<%=basePath%>shipments/getshipmentsByorder?order="+ids;
	                this.$http.get(url).then(function(data){
	                    this.types=data.body;
	                },function(response){
	                    console.info(response);
	                });
	              
	                              
	        },
	        methods:{

	        	//保存
	    		save:function (type) {
	    			//获取富文本编辑器里面的内容
	    			
	    			var link = $("#link").val();
	    			var companyname = $("#name").val();
	    			var cost = $("#cost").val();
	    			var updated = new Date();
					var photos='';
	    			
	    			if(imgUrldd==''){
	    				photos=type.photo;
	    			}else{
	    				photos=imgUrldd;
	    			}
	    			$.ajax({
	    				url:'<%=path%>/advertising/updateadvertising',
	    				type : 'POST',
	    				data : {
	    					id : ids,
	    				   link : link,
	    				   cost : cost,
	    				   companyname : companyname,
	    				   created : type.created,
	    				   updated : updated,
	    				   photo : photos
	    				},
	    				success : function() {
	    					 alert('添加成功')
	    					 top.Dialog.close();
	    				},
	    				error : function() {
	    					alert('修改失败')

	    				}
	    			})
	    		}
	        	
	        	
	        	
	        	
	        }
	      })
	       
	   var imgUrldd='';
	        	function toImgEdit() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑广告图";
			 diag.URL = '<%=basePath%>pictures/goAddPhoto.do';
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
		        var pdtMinImg=localStorage.getItem("pdtMinImg");
		        var strs= new Array(); //定义一数组
				strs=pdtMinImg.split(",");
				var imgUrl=strs[0];
				
				imgUrldd=imgUrl;
				
				
			var	a='http://192.168.5.8:8095/'
				
				
				$("#xhImgMin").attr('src',a+imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		

		function getLocalTimeHMS(date2) {
			var date = new Date(date2);
			var Y = date.getFullYear() + '-';
			var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1)
					: date.getMonth() + 1)
					+ '-';
			var D = date.getDate() + ' ';
			var h = date.getHours() + ':';
			var m = date.getMinutes() + ':';
			var s = date.getSeconds();
			return Y + M + D + h + m + s;

		}
		function yanzhengjine(obj) {
		    var id = obj.id;
		    var val = obj.value;
		    var regStrs = [['^0(\\d+)$', '$1'], ['[^\\d\\.]+$', ''], ['\\.(\\d?)\\.+', '.$2'], ['^(\\d+\\.\\d{2}).+', '$1']];
		    for ( i = 0; i < regStrs.length; i++) {
		        var reg = new RegExp(regStrs[i][0]);
		        obj.value = obj.value.replace(reg, regStrs[i][1]);
		    }

		}
	  	
	      
	</script>
</body>
</html>