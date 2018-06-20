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
													
														
														
														
														


														<tr>
														<td style="padding-top: 10px;width:220px"><img :src="aa+types.zphoto"  width="200" height="200" style="margin-left: 20px; margin-top: -30px;"></td>
															<td style="padding-top: 10px;">身份证正面:<input type="hidden"  id="xhItemImgMin"  maxlength="250" style="width: 300px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"  style="margin-left: 15px;" onclick="toImgEdit();">上传身份证正面</div>
															</td>
														</tr>
														
														<tr>
															<td style="padding-top: 10px;"><img  id="xhImgMin" width="200" height="200" style="margin-left: 200px; margin-top: -30px;"></td>
														</tr>
														<tr>
														<td style="padding-top: 10px;width:220px"><img :src="aa+types.fphoto"  width="200" height="200" style="margin-left: 20px; margin-top: -30px;"></td>
															<td style="padding-top: 10px;">身份证反面:<input type="hidden"  id="xhItemImgMin"  maxlength="250" style="width: 300px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"  style="margin-left: 15px;" onclick="toImgEdit1();">上传身份证反面</div>
															</td>
														</tr>
														
														<tr>
															<td style="padding-top: 10px;"><img  id="xhImgMin1" width="200" height="200" style="margin-left: 200px; margin-top: -30px;"></td>
														</tr>
														<tr>
															<td style="padding-top: 10px;width:220px"><img :src="aa+types.xphoto"  width="200" height="200" style="margin-left: 20px; margin-top: -30px;"></td>
															<td style="padding-top: 10px;">学生证:<input type="hidden"  id="xhItemImgMin"  maxlength="250" style="width: 300px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"  style="margin-left: 15px;" onclick="toImgEdit2();">上传学生证</div>
															</td>
														</tr>
														
														<tr>
															<td style="padding-top: 10px;"><img  id="xhImgMin2" width="200" height="200" style="margin-left: 200px; margin-top: -30px;"></td>
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

	   var pdtid2= localStorage.getItem("wxissue");
	   
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          selectedBanner: '1',
	          types: [],
	          pId:1,
	          selected: '36',
	          selectede:'34',
	          xhTypes:[],
	          xhItme:{},
	          imgUrl:[],
			   aa:'http://192.168.5.17:8095/'
	        },
	        created:function(){
	        	
	        	var url="/expert/getexpertByid?id="+pdtid2;
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
				
				var a ='http://192.168.5.17:8095/'
				
				$("#xhImgMin").attr('src',a+imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
	   var imgUrldd1='';
	   function toImgEdit1() {
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
				imgUrldd1=imgUrl;
				
				var a ='http://192.168.5.17:8095/'
				
				$("#xhImgMin1").attr('src',a+imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
	   var imgUrldd2='';
	   function toImgEdit2() {
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
				imgUrldd2=imgUrl;
				
				var a ='http://192.168.5.17:8095/'
				
				$("#xhImgMin2").attr('src',a+imgUrl);
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
			
			
			var zphoto='';
			
			if(imgUrldd==''){
				
				zphoto=pdtBanner.types.zphoto;
			}else{
				zphoto=imgUrldd;
			}
			
			var fphoto='';
			
			if(imgUrldd1==''){
				fphoto=pdtBanner.types.fphoto;
			}else{
				fphoto=imgUrldd1;
			}
			
			var xphoto='';
			
			if(imgUrldd2==''){
			
				xphoto=pdtBanner.types.xphoto;
				
			}else{
				xphoto=imgUrldd2;
			}
			
			if(pdtBanner.types==''){
				
				var created = new Date();
				$.ajax({
					url:'<%=path%>/expert/postexpert',
					type : 'POST',
					data : {
						zphoto: zphoto,
						fphoto: fphoto,
						xphoto: xphoto,
						userid: pdtid2,
					   created : created
					},
					success : function() {
						 alert('添加成功')
						 top.Dialog.close();
					},
					error : function() {
						alert('修改失败')
					}
				})
			} else  {
				
			
				var created = new Date();
				$.ajax({
					url:'<%=path%>/expert/updateexpert',
					type : 'POST',
					data : {
						id : pdtBanner.types.id,
						zphoto: zphoto,
						fphoto: fphoto,
						xphoto: xphoto,
						userid: pdtid2,
					   created : created
					 
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