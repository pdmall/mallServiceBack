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
															<td style="padding-top: 10px;">平台名称:<input type="text" maxlength="50" id="csoverName" placeholder="这里输入项目名称" title="平台名称"
																	style="width: 200px; margin-left: 20px; margin-right: 10px;" :value="itme.csoverName"/> 
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">平台连接:<input type="text" id="csoverLink" :value="itme.csoverLink" maxlength="32"
																	placeholder="平台连接" title="平台连接" style="width: 360px; margin-left: 20px;" />
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px; padding-left: 2px;">
															<label style="float: left; margin-right: 13px;"> 是否显示:</label> 
																<select id="csoverShowStatus"  class="chosen-select form-control" style="vertical-align: top; width: 140px;float:left;">
																	<option value="1" selected="selected">显示</option>
																	<option value="0">不显示</option>
															  </select>
														  </td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">平台详情:<input type="hidden" id="csoverMsg"   maxlength="21845" placeholder="这里输入备注9" title="备注9"
																	style="width: 200px; margin-left: 20px;" /></td>
														</tr>
														<tr>
															<td id="nr" style="padding-top: 5px;"><script id="editor" type="text/plain" style="width: 96%; height: 259px;" >
                                                           {{itme.csoverMsg}}
                                                          </script></td>
														</tr>
														<tr>
															<td style="text-align: center;" colspan="10"><a class="btn btn-mini btn-primary" onclick="updated();">提交</a> <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a></td>
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
	var crossoverId=localStorage.getItem("crossoverId");
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          selectedBanner: '1',
	          types: [],
	          pId:1,
	          selected: '36',
	          selectede:'34',
	          xhTypes:[],
	          itme:{}
	        },
	        created:function(){
	        	 var url="<%=basePath%>crossover/getCrossoverDetailById?crossoverId="+crossoverId;
	                this.$http.get(url).then(function(data){
	                    this.itme=data.body;
	                   
	                },function(response){
	                    console.info(response);
	                });
	        },
	        methods:{
	        	changew:function(dddd){
	        		this.pId=dddd;
	        		this.selectede=dddd;
	        		 var url="<%=basePath%>xh/item/type/getListTypeByParentId?id=" + this.pId;
	 	 	        
		                this.$http.get(url).then(function(data){
		                    this.xhTypes=data.body;
		                   
		                },function(response){
		                    console.info(response);
		                });
	        	},
	        	changewddd:function(ddd){
	        		this.selected=ddd;
	        	}
	        }
	      })  
	   function toImgEdit() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑项目小图";
			 diag.URL = '<%=basePath%>pictures/goXhItemPhoto.do';
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
		        var pdtMinImg=localStorage.getItem("xhItemMinImg");
		        var strs= new Array(); //定义一数组
				strs=pdtMinImg.split(",");
				var imgUrl=strs[0];
				imgUrldd=imgUrl;
				$("#xhImgMin").attr('src',imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		//保存
		function updated() {
			
			
			//获取富文本编辑器里面的内容
			var csoverMsg=UE.getEditor('editor').getContent();
			var csoverLink=$("#csoverLink").val();
			var csoverName=$("#csoverName").val();
			var csoverShowStatus=$("#csoverShowStatus").val();
			
			if (csoverName == "") {
				$("#csoverName").tips({
					side : 3,
					msg : '请输入平台名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#csoverName").focus();
				return false;
			}
			if (csoverMsg == "") {
				$("#csoverMsg").tips({
					side : 3,
					msg : '请输入详情介绍',
					bg : '#AE81FF',
					time : 2
				});
				$("#csoverMsg").focus();
				return false;
			}
			
			if (csoverLink == "") {
				$("#csoverLink").tips({
					side : 3,
					msg : '请输入平台连接',
					bg : '#AE81FF',
					time : 2
				});
				$("#csoverLink").focus();
				return false;
			}
			
			if (csoverShowStatus == "") {
				$("#csoverShowStatus").tips({
					side : 3,
					msg : '请选择是否显示',
					bg : '#AE81FF',
					time : 2
				});
				$("#csoverShowStatus").focus();
				return false;
			}
			
			$.ajax({
				url:'<%=path%>crossover/updateCrossover',
				type : 'POST',
				data : {
					id:crossoverId,
					csoverShowStatus : csoverShowStatus,
					csoverLink : csoverLink,
					csoverMsg : csoverMsg,
					csoverName : csoverName
				},
				success : function() {
					 alert('添加成功')
					 top.Dialog.close();

				},
				error : function() {
					alert('添加失败')

				}
			})

		}

	</script>
</body>
</html>