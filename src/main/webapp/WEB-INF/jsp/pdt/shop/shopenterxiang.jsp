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
													
														<tr>
															<td style="padding-top: 10px;">
																商家名称：<span type="text"  maxlength="32" id="titles" 
																style="width: 300px; margin-left: 13px;" >{{types.shopname}}</span>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">
																	联系人：<span type="text"  maxlength="32" id="titles" 
																style="width: 300px; margin-left: 13px;" >{{types.name}}</span>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">
																	联系电话：<span type="text"  maxlength="32" id="titles" 
																style="width: 300px; margin-left: 13px;" >{{types.phone}}</span>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">
																	法人代表：<span type="text"  maxlength="32" id="titles" 
																style="width: 300px; margin-left: 13px;" >{{types.legalname}}</span>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">
																	所在区域：<span type="text"  maxlength="32" id="titles" 
																style="width: 300px; margin-left: 13px;" >{{types.site}}</span>
															</td>
														</tr>
													
														<tr>
															<td style="text-align: center;" colspan="10"> <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a></td>
														</tr>
													</table>
												</div>
												<div id="zhongxin2" class="center" style="display: none">
													<br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4>
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
	<script type="text/javascript" src="static/jkurl.js"></script>
	<script type="text/javascript">

	   var ids= localStorage.getItem("shopenterid");
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          types: [],
	          aa:imgUrlsss
	        },
	        created:function(){
	        	 var url="<%=basePath%>app/user/getshopenterByid?id="+ids;
	                this.$http.get(url).then(function(data){
	                    this.types=data.body;
	                    
	                },function(response){
	                    console.info(response);
	                });
	              
	                              
	        },
	        methods:{

	        }
	      })
	       
	  
		

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