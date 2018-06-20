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
<%@ include file="../system/index/top.jsp"%>

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
															<span class="input-group-addon">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</span>
															<input type="text" class="form-control " placeholder="请输入娱乐类型名称" :value="types.type" id="type" />
														</div>
														<br />
														<div class="input-group input-group-lg">
															<span class="input-group-addon">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</span>
															<input type="text" class="form-control " placeholder="请输入店铺地址" :value="types.site"id="site" />
														</div>
														<br />
														<div class="input-group input-group-lg">
															<span class="input-group-addon">优&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;惠:</span>
															<input type="text" class="form-control " placeholder="请输入优惠内容" :value="types.gift"id="gilt" />
														</div>
														<br />
														<div class="input-group input-group-lg">
															<span class="input-group-addon">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介:</span>
															<input type="text" class="form-control " placeholder="请输入简介内容" :value="types.intro"id="intro" />
														</div>
														<br />
														<div class="input-group input-group-lg">
															<span class="input-group-addon">开放时间:</span>
															<input type="text" class="form-control " placeholder="如：周五-周六" :value="types.time"id="time" />
														</div>
														<br />
														<div class="input-group input-group-lg">
															<span class="input-group-addon">联系方式:</span>
															<input type="text" class="form-control " placeholder="如：13565656565":value="types.uphone" id="uphone" />
														</div>
														<br />
														
														
														
														
														<div class="input-group input-group-lg">
															<span class="input-group-addon">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</span>
															<input type="text" class="form-control " placeholder="请输入价格" :value="types.cost"id="cost" />
														</div>
														<br />


														<tr>
															<td style="padding-top: 10px;width:220px"><img :src="aa+types.photo"  width="200" height="200" style="margin-left: 20px; margin-top: -30px;"></td>
															<td style="padding-top: 10px;">首图展示:<input type="hidden"  id="xhItemImgMin"  maxlength="250" style="width: 300px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"  style="margin-left: 15px;" onclick="toImgEdit();">上传展示图片</div>
															</td>
														</tr>
														
														<tr>
															<td style="padding-top: 10px;"><img  id="xhImgMin" width="200" height="200" style="margin-left: 200px; margin-top: -30px;"></td>
														</tr>
														
														
														
														
														
														<tr>
															<td style="text-align: center;" colspan="10"><a class="btn btn-mini btn-primary" onclick="save();">保存</a> <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a></td>
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
	<%@ include file="../system/index/foot.jsp"%>
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

	var a = localStorage.getItem("recrea"); 
	   
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          selectedBanner: '1',
	          types: [],
	          pId:1,
	          selected: '36',
	          selectede:'34',
	         
	         
	          imgUrl:[],
			   aa:'http://192.168.5.17:8095/'
	        },
	        created:function(){
	        	 
	        	
	        	 var url="/recrea/getrecreation?id="+a;
	                this.$http.get(url).then(function(data){
	                	this.types  =data.body;
	                   
	                   
	                },function(response){
	                    console.info(response);
	                });
	        	
	        },
	        methods:{
	        	del(index){
					   this.imgUrl.splice(index,1)
				   }
	      }})  
	   var imgUrldd='';
	   function toImgEdit() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑展示图";
			 diag.URL = '/pictures/goAddPhoto.do';
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
				
				
				var a ='http://192.168.5.8:8095/'
				
				$("#xhImgMin").attr('src',a+imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
	   
	   function toImgEdits() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑详细图片";
			 diag.URL = '/pictures/goAddPhoto.do';
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
		        var pdtMinImg=localStorage.getItem("pdtMinImg");
		        var strs= new Array(); //定义一数组
				strs=pdtMinImg.split(",");
				pdtBanner.imgUrl.push(strs[0]);
				//var imgUrl=strs[0];
				//imgUrldd=imgUrl;
				//var a ='http://192.168.5.8:8095/'
				//$("#xhImgMin").attr('src',a+imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		//保存
		function save() {
		
			var type = $("#type").val();
			var site = $("#site").val();
			var gilt = $("#gilt").val();
			var intro = $("#intro").val();
			var time = $("#time").val();
			var uphone = $("#uphone").val();
			var cost = $("#cost").val();
			
			var photos='';
			
			if(imgUrldd==''){
				photos=type.photo;
			}else{
				photos=imgUrldd;
			}
			var created = new Date();
			$.ajax({
				url:'<%=path%>/recrea/updaterecreation',
				type : 'POST',
				data : {
					id : a,
					type: type,
					site : site,
					gift :gilt ,
				   status : 1,
				   intro : intro,
				   time : time,
				   uphone : uphone,
				   created : created,
				   cost : cost,
				   photo : photos
				},
				success : function() {
					 alert('修改成功')
					 top.Dialog.close();
				},
				error : function() {
					alert('修改失败')

				}
			})
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