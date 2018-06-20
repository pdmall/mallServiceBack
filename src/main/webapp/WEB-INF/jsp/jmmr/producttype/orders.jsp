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
													<textarea name="CONTENT" id="CONTENT" style="display: none"></textarea>
													<table style="width: 100%;" id="xtable">
														
														<tr style="padding-top: 10px;">
															<td style="padding-top: 5px;"> 
																订单编号:<span >{{pdt.orderno}}</span>
															</td>
														</tr>
														<tr style="padding-top: 10px;">
															<td style="padding-top: 5px;"> 
																店铺名称:<span >{{pdt.shopname}}</span>
															</td>
														</tr>
														<tr style="padding-top: 10px;">
															<td style="padding-top: 5px;"> 
																产品名称:<span >{{pdt.name}}</span>
															</td>
														</tr>
														<tr style="padding-top: 10px;">
															<td style="padding-top: 5px;"> 
																产品图:
															</td>
														</tr>
														
														<tr style="padding-top: 10px;">
															<td style="padding-top: 10px;"><img :src="aa+pdt.photo" id="xhImgMin" width="100" height="100" style="margin-left: 25px; margin-top: 1px;"></td>
														</tr>
														<tr style="padding-top: 10px;">
															<td style="padding-top: 5px; width:150px">
																单价：<span>{{pdt.cose/100}}</span>
															</td>
															<td style="padding-top: 5px;width:50px">
																数量：<span>{{pdt.number}}</span>
															</td>
															<td style="padding-top: 5px;width:150px">
																总价：<span>{{pdt.zcose/100}}</span>
															</td>
														</tr>
														<tr style="padding-top: 10px;">
															<td>
																用户名称：<span>{{pdt.username}}</span>
															</td>
															<td>
																手机号：<span>{{pdt.phone}}</span>
															</td>
														</tr>
														<tr>
															<td>
																预约时间：<span>{{pdt.time}}</span>
															</td>
															
														</tr>
														
														
														
														
														
														<tr>
															<td style="text-align: center;" colspan="10"> <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a></td>
														</tr>
													</table>
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
	<script type="text/javascript" src="plugins/webuploader/webuploader.js"></script>
	<script type="text/javascript" src="plugins/webuploader/upload.js"></script>
	<script type="text/javascript" src="static/jkurl.js"></script>
	<script type="text/javascript">

	   var pdtid2= localStorage.getItem("orderno");
	 
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          selectedBanner: '1',
	          banners: [],
	          selected: '1',
	          selectede:'',
	          options: [],
	          opti:[],
	          pdt:{},
	   		 
	   		  imgUrl:[],
	   		  abc:[],
	   		  aa:imgUrlsss
	   		
	        },
	        created:function(){
	        	
	                var url5="<%=basePath%>app/user/getJMorderByorderno?orderno="+pdtid2;
	                this.$http.get(url5).then(function(data){
	                    this.pdt=data.body;
	                  
	                },function(response){
	                    console.info(response);
	                });
	               
	        },
	        methods:{
	        	
	        	
	        }
	      })  
	
	  
	   
	   
		
	       //localStorage.removeItem("name");

		
	
		//保存
		function save() {
			var a = pdtBanner.imgUrl;
			var message=a.join(",");
			var name=$("#name").val();
   			var intro = $("#intro").val();
			
			var created = new Date();
			if(imgUrldd==""){
				imgUrldd=pdtBanner.pdt.photo;
			}
				
			
			
			if (message == "") {
				$("#message").tips({
					side : 3,
					msg : '请上传详情图',
					bg : '#AE81FF',
					time : 2
				});
				$("#message").focus();
				return false;
			}
			
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
					msg : '请输入产品介绍',
					bg : '#AE81FF',
					time : 2
				});
				$("#intro").focus();
				return false;
			}
			if (imgUrldd == "") {
				$("#imgUrldd").tips({
					side : 3,
					msg : '请上传展示图',
					bg : '#AE81FF',
					time : 2
				});
				$("#imgUrldd").focus();
				return false;
			}
			
			
			
			$.ajax({
				url:'<%=path%>/app/user/updatedproduct',
				type : 'POST',
				data : {
					id : pdtid2,
					name : name,
					intro : intro,
					photo : imgUrldd,
					message : message
				},
				success : function() {
					 alert('修改成功')
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
		   function toImgEdit1() {
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="编辑图片";
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
					var a =imgUrlsss
					
					$("#xhImgMin").attr('src',a+imgUrl);
				  diag.close();
				 };
				 diag.show();
			}
		 function toImgEdit() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑图片";
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
				pdtBanner.imgUrl.push(strs[0]);
		        
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