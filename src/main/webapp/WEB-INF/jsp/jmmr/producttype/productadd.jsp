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
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
 <link href="css/video-js.css" rel="stylesheet" type="text/css">

<link href=”http://vjs.zencdn.net/c/video-js.css” rel=”stylesheet”>
<script src=”http://vjs.zencdn.net/c/video.js”></script>

<style type="text/css">
#dialog-add, #dialog-message, #dialog-comment {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	z-index: 99999999;
	display: none;
}

.commitopacity {
	position: absolute;
	width: 100%;
	height: 10000px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}

.commitbox {
	width: 100%;
	margin: 0px auto;
	position: absolute;
	top: 120px;
	z-index: 99999;
}

.commitbox_inner {
	width: 96%;
	height: 255px;
	margin: 6px auto;
	background: #efefef;
	border-radius: 5px;
}

.commitbox_top {
	width: 100%;
	height: 253px;
	margin-bottom: 10px;
	padding-top: 10px;
	background: #FFF;
	border-radius: 5px;
	box-shadow: 1px 1px 3px #e8e8e8;
}

.commitbox_top textarea {
	width: 95%;
	height: 195px;
	display: block;
	margin: 0px auto;
	border: 0px;
}

.commitbox_cen {
	width: 95%;
	height: 40px;
	padding-top: 10px;
}

.commitbox_cen div.left {
	float: left;
	background-size: 15px;
	background-position: 0px 3px;
	padding-left: 18px;
	color: #f77500;
	font-size: 16px;
	line-height: 27px;
}

.commitbox_cen div.left img {
	width: 30px;
}

.commitbox_cen div.right {
	float: right;
	margin-top: 7px;
}

.commitbox_cen div.right span {
	cursor: pointer;
}

.commitbox_cen div.right span.save {
	border: solid 1px #c7c7c7;
	background: #6FB3E0;
	border-radius: 3px;
	color: #FFF;
	padding: 5px 10px;
}

.commitbox_cen div.right span.quxiao {
	border: solid 1px #f77400;
	background: #f77400;
	border-radius: 3px;
	color: #FFF;
	padding: 4px 9px;
}

.uploadBtn {
	background: #ffffff;
	border: 1px solid #cfcfcf;
	color: #565656;
	padding: 0 18px;
	display: inline-block;
	border-radius: 3px;
	margin-left: 10px;
	cursor: pointer;
	font-size: 14px;
	float: left;
}

.uploadBtn:hover {
	background: #f0f0f0;
}

.uploadBtn {
	background: #00b7ee;
	color: #fff;
	border-color: transparent;
}

.uploadBtn:hover {
	background: #00a2d4;
}

.uploadBtn.disabled {
	pointer-events: none;
	opacity: 0.6;
}
</style>

</head>
<body>

	<!-- 编辑邮箱  -->
	<div id="dialog-add">
		<div class="commitopacity"></div>
		<div class="commitbox">
			<div class="commitbox_inner">
				<div class="commitbox_top">
					<textarea name="EMAILs" id="EMAILs" placeholder="请选输入对方邮箱,多个请用(;)分号隔开" title="请选输入对方邮箱,多个请用(;)分号隔开"></textarea>
					<div class="commitbox_cen">
						<div class="left" id="cityname"></div>
						<div class="right">
							<span class="save" onClick="saveEmail()">保存</span>&nbsp;&nbsp;<span class="quxiao" onClick="cancel_pl()">取消</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
													<!-- <textarea name="CONTENT" id="CONTENT" style="display: none"></textarea> -->
													<div>
														产品名称：<input type="text"  id="name" :value=" pdt.name " maxlength="50" placeholder="这里输入产品名称" title="产品名称"
																	style="width: 200px; margin-left: 5px; margin-right: 10px;" /> 
													</div>
													<div>简 介：</div>
													<div style="padding-left: 20px;">
														<textarea rows="5" cols="40" id="intro"></textarea>
													</div>
													
													<div style="padding-top:10px;">
														分享页面链接：<input type="text" placeholder="这里输入分享页面链接" title="分享链接" id="fensite" style="width: 356px; margin-left: 5px; margin-right: 10px;">
													</div>
													<div style="padding-top:10px;">
														<div  style="float:left">
															<div >
																产品展示图:<input type="hidden" name="PDT_MIN_IMG" id="PDT_MIN_IMG"  maxlength="150" style="width: 200px; margin-left: 20px;" />
																		<div class="btn btn-mini btn-primary" style="margin-left: 15px;" onclick="toImgEdit();">上传产品展示图</div>
															</div>
															<div style="padding-top:5px;">
																<div  style="position:relative;display:inline-block">													
																			<img   id="pdtImgMin" width="183" height="163" style="margin-left: 20px;">
																			
																		</div>
															</div>
														</div>
														<div style=" float:left;padding-left:100px;">
															<div>
																<label style="color:white;background-color:red;padding:3px 5px;font-weight:bolder" for="fileVideo"  class="video">	
															视频上传													        
														    	<form>
														    		<input ref="fileVideo" @change="onSelect"  style="display:none" id="fileVideo" type="file">
														        </form>
														     </label>	
															</div>
															<div>
															<video id="my_video_1" class="video-js vjs-default-skin" 
															    controls preload="auto" width="240" height="164" poster="my_video_poster.png" data-setup="{}">
															    <source id="videos"  type="video/mp4">
															    <source id="videoss"  type="video/webm">
															</video>
															</div>
														</div>
													</div><br>
													
													<div style="padding-top:198px;">
														<div >
															产品图片列表:<input type="hidden" name="PDT_MIN_IMG" id="PDT_MIN_IMG"  maxlength="150" style="width: 200px; margin-left: 20px;" />
															<div class="btn btn-mini btn-primary" style="margin-left: 15px;" onclick="toImgEdit1();">上传产品图片列表</div>
														</div>
														<div style="padding-top:5px;">
															<div v-for="(x,index) in imgUrl1"
																	style="position: relative; display: inline-block">
																	<img :src="aa+x" id="pdtImgMin" width="100" height="100"
																		style="margin-left: 20px;"> <a
																		@click="del(index)"
																		style="position: absolute; top: 0; right: 0"
																		class="btn btn-mini btn-danger"> <i
																		class="ace-icon fa fa-trash-o bigger-120"></i>
																	</a>
																</div>
														</div>
													</div>
													<div style="padding-top:10px;">
													说明标题：<input type="text"  id="sname" :value=" pdt.name " maxlength="50" placeholder="这里输入步骤标题" title="步骤标题"
																	style="width: 200px; margin-left: 5px; margin-right: 10px;" /> 
													</div>
													<div>步骤说明：</div>
													<div style="padding-top:10px;">
														<textarea rows="8" cols="50" id="buzhou"></textarea>
													</div>
													
													
													<div style="padding-top:10px;">
														<div >
															步骤图片上传:<input type="hidden" name="PDT_MIN_IMG" id="PDT_MIN_IMG"  maxlength="150" style="width: 200px; margin-left: 20px;" />
															<div class="btn btn-mini btn-primary" style="margin-left: 15px;" onclick="toImgEdit2();">上传步骤图片列表</div>
														</div>
														<div style="padding-top:5px;">
															<div v-for="(x,index) in imgUrl12"
																	style="position: relative; display: inline-block">
																	<img :src="aa+x" id="pdtImgMin" width="100" height="100"
																		style="margin-left: 20px;"> <a
																		@click="del1(index)"
																		style="position: absolute; top: 0; right: 0"
																		class="btn btn-mini btn-danger"> <i
																		class="ace-icon fa fa-trash-o bigger-120"></i>
																	</a>
																</div>
														</div>
													</div>
													
													<div style="padding-top:10px;">
														<div style="padding-left:300px;">
															<a class="btn btn-mini btn-primary" onclick="save();">保存</a> <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
														</div>
													</div>
													
												
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
	<script type="text/javascript" src="static/jkurl.js"></script>
	<script type="text/javascript" src="plugins/webuploader/webuploader.js"></script>
	<script type="text/javascript" src="plugins/webuploader/upload.js"></script>
	<script type="text/javascript">

	   var id= localStorage.getItem("activityid");
	   
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          selectedBanner: '1',
	          banners: [],
	          selected: 1,
	          selectede:1,
	          options: [],
	          opti:[],
	          pdt:{},
	   		  size:[],
	   		  sizes:'',
	   		  colours:[],
	   		  colour:'',
	   		  pid:0,
	   		 imgUrl:'',
	   		 imgUrl1:[],
	   		 imgUrl12:[],//步骤图片
	   		 aa:imgUrlsss,
	   		coruses:'',//视频链接地址
	        },
	        created:function(){
	        	
	              
	                
	                
	      
	        },
	        methods:{
	        	 del(index){
					   this.imgUrl1.splice(index,1)
				   },
	        	 del1(index){
					   this.imgUrl1.splice(index,1)
				   },
	        	onSelect(){	
	        		this.text="正在上传..."
				     var _this=this
                    var formData=new FormData();
				     var urls ="<%=basePath%>app/files/upload";
				     formData.append('uploadFile',this.$refs.fileVideo.files[0]);
				     this.$http.post(urls,formData).then(function(res){
				    	 this.coruses = res.body;
				    	 $("#videos").attr('src',this.aa+this.coruses);
				    	 
				    	 alert("上传成功");
				    	 this.text="上传成功!"
				    	
				     })
				    
			    },
	        }
	      })  
	
	       //localStorage.removeItem("name");

		
		//保存
		function save() {
			
			
			var name = $("#name").val();//产品名称
			
			
			var intro= $("#intro").val();//简介
			var sname = $("#sname").val();//标题说明
			var buzhou = $("#buzhou").val();//步骤
			var fensite = $("#fensite").val();//分享链接
		 
			var video = '';
			if(pdtBanner.coruses==''){
				video=1;
			}else{
				video=pdtBanner.coruses;
			}
			var a = pdtBanner.imgUrl1;
			var photolist=a.join(",");//产品列表
			var b = pdtBanner.imgUrl12;
			var buz=b.join(",");//步骤图片
			
			var created = new Date();
			if (name == "") {
				$("#name").tips({
					side : 3,
					msg : '请输入产品名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#name").focus();
				return false;
			}
			if (intro == "") {
				$("#intro").tips({
					side : 3,
					msg : '请输入简介',
					bg : '#AE81FF',
					time : 2
				});
				$("#intro").focus();
				return false;
			}
			if ( sname== "") {
				$("#sname").tips({
					side : 3,
					msg : '请输入步骤标题',
					bg : '#AE81FF',
					time : 2
				});
				$("#sname").focus();
				return false;
			}
			
			
			if (buzhou == "") {
				$("#buzhou").tips({
					side : 3,
					msg : '请输入步骤详情',
					bg : '#AE81FF',
					time : 2
				});
				$("#buzhou").focus();
				return false;
			}
			if (fensite == "") {
				$("#fensite").tips({
					side : 3,
					msg : '请输入分享链接',
					bg : '#AE81FF',
					time : 2
				});
				$("#fensite").focus();
				return false;
			}
			
			
			$.ajax({
				url:'<%=path%>/app/user/postProducts',
				type : 'POST',
				data : {
				   
					productname:name,
				   
				    sphotolist : photolist,//产品图片
				    stuepphoto : buz,//步骤图片
				    intro : intro,//简介
				    headline : sname,//步骤标题
				    
				    step:buzhou,//步骤
				    fenxiang:fensite,//分享链接
				    sphoto :pdtBanner.imgUrl,//展示图片
					updated:created,
					videosite : video,//视频
					
				},
				success : function() {
					 alert('添加成功')
					 window.location.href="about:blank";
					 top.Dialog.close();
					
					/* $("#zhongxin").hide();
					$("#zhongxin2").show(); */
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
		/*关闭窗口*/
		function CloseWebPage() {     
		    if (navigator.userAgent.indexOf("MSIE") > 0) {     
		        if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {     
		            window.opener = null; window.close();     
		        }     
		        else {     
		            window.open('', '_top'); window.top.close();     
		        }     
		    }     
		    else if (navigator.userAgent.indexOf("Firefox") > 0) {     
		        window.location.href = 'about:blank '; //火狐默认状态非window.open的页面window.close是无效的    
		        //window.history.go(-2);     
		    }     
		    else {     
		        window.opener = null;      
		        window.open('', '_self', '');     
		        window.close();     
		    }     
		}  
		var imgUrldd='';
		 function toImgEdit() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑项目小图";
			 diag.URL = '<%=basePath%>page/pdt/product/userphoto_edit';
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
		        var pdtMinImg=localStorage.getItem("pdtMinImg");
		        var strs= new Array(); //定义一数组
				strs=pdtMinImg.split(",");
				pdtBanner.imgUrl=strs[0];
				var a = imgUrlsss;
				$("#pdtImgMin").attr('src',a+pdtBanner.imgUrl);
				//var imgUrl=strs[0];
				//imgUrldd=imgUrl;
				//$("#pdtMinImg").attr('src',imgUrl);
				//$("#PDT_MIN_IMG").val(imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		 function toImgEdit1() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑项目小图";
			 diag.URL = '<%=basePath%>page/pdt/product/userphoto_edit';
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
		        var pdtMinImg=localStorage.getItem("pdtMinImg");
		        var strs= new Array(); //定义一数组
				strs=pdtMinImg.split(",");
				pdtBanner.imgUrl1.push(strs[0]);
				
				
				//var imgUrl=strs[0];
				//imgUrldd=imgUrl;
				//$("#pdtMinImg").attr('src',imgUrl);
				//$("#PDT_MIN_IMG").val(imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		 function toImgEdit2() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="图片编辑";
			 diag.URL = '<%=basePath%>page/pdt/product/userphoto_edit';
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
		        var pdtMinImg=localStorage.getItem("pdtMinImg");
		        var strs= new Array(); //定义一数组
				strs=pdtMinImg.split(",");
				pdtBanner.imgUrl12.push(strs[0]);
				
				
				//var imgUrl=strs[0];
				//imgUrldd=imgUrl;
				//$("#pdtMinImg").attr('src',imgUrl);
				//$("#PDT_MIN_IMG").val(imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
	</script>
</body>
</html>