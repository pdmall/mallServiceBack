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
															<td style="padding-top: 10px;">店铺名称:<input type="text" id="shopTitle" :value="type.shopTitle" maxlength="50" placeholder="这里输入项目名称" title="店铺名称"
																	style="width: 200px; margin-left: 20px; margin-right: 10px;" /> 
															用户姓名:<input type="text"  name="shopLinkname" id="shopLinkname" maxlength="32" :value="type.shopLinkname"
																	placeholder="联系人姓名" title="联系人姓名" style="width: 160px; margin-left: 10px;" /><label style="margin-left:10px;"> 
																	用户手机号:</label><input type="text"  id="shopPhone" :value="type.shopPhone" readonly="readonly"
																	 maxlength="32" placeholder="用户手机号"  title="联系人电话" style="width: 170px; margin-left: 10px;" />
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">
															<span>选择省：</span>
															<select id = "province"v-model="selectede" class="chosen-select" style="vertical-align: top; width: 150px;" @change="province(selectede)">
																
																<option v-for="option in types" v-bind:value="option.provinceId">{{ option.provinceName }}
																</option>
															</select>
															市：
															<select id = "city" v-model="selectede1" class="chosen-select" style="vertical-align: top; width: 100px;" @change="changew(selectede1)">
																<option v-for="option in types1" v-bind:value="option.cityId">{{ option.cityName }}
																</option>
															</select>
															区：
															<select id="district" v-model="selectede2" class="chosen-select" style="vertical-align: top; width: 100px;">
																<option v-for="option in types2" :value="option.areaId">{{ option.areaName }}
																</option>
															</select>
																
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">店铺地址:
												&nbsp;&nbsp;&nbsp;
												<button class="btn btn-app btn-light btn-xs"  onclick="openMapShop();">
												<i class="ace-icon fa fa-globe"></i>
												</button>
											
															
															详细地址:<input type="text" id="shopAddress" :value="type.shopAddress" maxlength="50" style="width:400px;margin-left:20px;" placeholder="这里输入店铺地址" title="这里输入店铺地址" />
															
															</td>
														</tr>
														
														<tr>
															<td style="padding-top: 10px;">营业执照:<input type="hidden"  id="xhItemImgMin"  maxlength="250" style="width: 300px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"  style="margin-left: 15px;" onclick="toImgEdit();">上传营业执照</div>
															</td>
														</tr>
														
														<tr>
															<td style="padding-top: 10px;"><img :src="aa+type.shopZzImgList" id="xhImgMin" width="200" height="200" style="margin-left: 150px; margin-top: -30px;"></td>
														</tr>
													
														<tr>
															<td style="padding-top: 10px;">门头图片:<input type="hidden" name="PDT_MIN_IMG" id="PDT_MIN_IMG"  maxlength="150" style="width: 200px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary" style="margin-left: 15px;" onclick="toImgEdits();">上传门头图片</div>
															</td>
														</tr>
														<tr >
															<td style="padding-top: 10px;">
																<div v-for="(x,index) in imgUrl" style="position:relative;display:inline-block">													
																	<img  :src="aa+x" id="pdtImgMin" width="100" height="100" style="margin-left: 20px;">
																	<a @click="del(index)" style="position:absolute;top:0;right:0" class="btn btn-mini btn-danger">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</a>
																</div>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">店铺简介:<input type="hidden"  id="shopMsg" value="4444" maxlength="21845" placeholder="这里输入备注9" title="备注9"
																	style="width: 200px; margin-left: 20px;" /></td>
														</tr>
														<tr>
															<td id="nr" style="padding-top: 5px;">
																<textarea id="message" :value="type.shopMsg"> </textarea>
															</td>
														</tr>
														<tr>
															<td style="text-align: center;" colspan="10"><a class="btn btn-mini btn-primary" onclick="save();">确定修改</a> <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a></td>
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
	<!-- map -->
	
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/toolEmail.js"></script>
	<script type="text/javascript" src="plugins/webuploader/upload.js"></script>
	<script type="text/javascript" src="static/jkurl.js"></script>
	<script type="text/javascript">

	
	var cityid = localStorage.getItem("cityid");
	var aid = localStorage.getItem("shopIds");
	   var pdtBanner= new Vue({  
	        el: '#zhongxin',
	        data: {
	          selectedBanner: '1',
	          types: [],
	          type: [],
	          types1:[],
	          types2:[],
	          pId:1,
	          selected: '36',
	          selectede:'',
	          selectede1:'',
	          selectede2:'',
	          xhTypes:[],
	          imgUrl:[],
	          xhItme:{},
	          aa:imgUrlsss
	        },
	        created:function(){
	        	 var url="<%=basePath%>app/user/getprovince";
	                this.$http.get(url).then(function(data){
	                    this.types=data.body;
	                   
	                },function(response){
	                    console.info(response);
	                });
	                var url="<%=basePath%>app/user/getcitylists";
	                this.$http.get(url).then(function(data){
	                    this.types1 = data.body;
	                   
	                },function(response){
	                    console.info(response);
	                });
	                var url="<%=basePath%>app/user/getdistrictlist?id="+cityid;
	                this.$http.get(url).then(function(data){
	                    this.types2=data.body;
	                 	
	                },function(response){
	                    console.info(response);
	                });
	                
	                
	              
	                
	                
	                
	                
	        	 var url="<%=basePath%>app/user/getshopByid?id="+aid;
	                this.$http.get(url).then(function(data){
	                    this.type=data.body;
	                    var a = this.type.shopImg;
	                    this.imgUrl = a.split(",");
	                    
	                    this.selectede=this.type.shopProvinceId;
	                   this.selectede1=this.type.shopCityId;
	                   this.selectede2=this.type.shopCountyId;
	                  
	                },function(response){
	                    console.info(response);
	                });
	                  
	               
	                
	               
	        },
	        methods:{
	        	province:function(id){
	        		
	        		if(id!=undefined || id !='' || id!=null){
	        			this.selectede=id;
		        		var url="<%=basePath%>app/user/getcitylist?id="+id;
		                this.$http.get(url).then(function(data){
		                	
		                	if(data.body.length>0){
		                		 this.types1=data.body;
		                	}
		                   
		                  
		                },function(response){
		                    console.info(response);
		                });
	        			
	        		}
	        		
	        		
	        	},
	        	del(index){
					   this.imgUrl.splice(index,1)
				   },
	        	changew:function(id){
	        		
	        		if(id!=undefined || id !='' || id!=null){
	        			this.selectede1=id;
		        		var url="<%=basePath%>app/user/getdistrictlist?id="+id;
		                this.$http.get(url).then(function(data){
		                	
		                	if(data.body.length>0){
		                		 this.types2=data.body;
		                	}
		                   
		                   
		                },function(response){
		                    console.info(response);
		                });
	        		}
	        		
	        		
	        		
	        	},
	        	changewddd:function(ddd){
	        		this.selected=ddd;
	        	}
	        }
	      })  
	   var mapX='0';
	   var mapY='0';
	   function openMapShop(){
			
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title =" 地图";
			 diag.URL ="<%=basePath%>page/pdt/shop/mapXY";
			 diag.Width = 650;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				  mapX = diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_X').value;
			      mapY = diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_Y').value;
			     var soMap = diag.innerFrame.contentWindow.document.getElementById('suggestId').value;
			     $("#shopAddress").val(soMap+$("#shopAddress").val());
				diag.close();
			 };
			 diag.show();
		}
	   function toImgEdits() {
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
	   
	   var imgUrldd='';
	   function toImgEdit() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑营业执照";
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
				
				
				var a =imgUrlsss;
				
				$("#xhImgMin").attr('src',a+imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		//保存
		function save() {
			
			var shopclass = $("#types").val();
			
			//获取富文本编辑器里面的内容
			var shopMsg=$("#message").val();
			
			var a = pdtBanner.imgUrl;
			var shopImg=a.join(",");
			var province=pdtBanner.selectede;
			
			var city = pdtBanner.selectede1;
			var district = $("#district").val();
			
			var shopTitle=$("#shopTitle").val();
			
			var shopAddress=$("#shopAddress").val();
			var shopPhone=$("#shopPhone").val();
			var shopLinkname=$("#shopLinkname").val();
		
			var created = new Date();
			
			if(mapX=='0'){
				mapX=pdtBanner.type.shopMapX;
				mapY=pdtBanner.type.shopMapY;
			}
			
			
			if(mapX=='0' || mapY=='0'){
				alert("请选择地图坐标")
				openMapShop();
				return;
			}
			
			
			if (shopTitle == "") {
				$("#shopTitle").tips({
					side : 3,
					msg : '请输入店铺名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#shopTitle").focus();
				return false;
			}
			if (shopImg == "") {
				$("#shopImg").tips({
					side : 3,
					msg : '请上传店铺门头照',
					bg : '#AE81FF',
					time : 2
				});
				$("#shopImg").focus();
				return false;
			}
			if (shopAddress == "") {
				$("#shopAddress").tips({
					side : 3,
					msg : '输入店铺地址',
					bg : '#AE81FF',
					time : 2
				});
				$("#shopAddress").focus();
				return false;
			}
			if (shopLinkname == "") {
				$("#shopLinkname").tips({
					side : 3,
					msg : '请输入用户名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#shopLinkname").focus();
				return false;
			}
			if (shopMsg == "") {
				$("#shopMsg").tips({
					side : 3,
					msg : '请输入店铺介绍',
					bg : '#AE81FF',
					time : 2
				});
				$("#shopMsg").focus();
				return false;
			}
			if (shopPhone == "") {
				$("#shopPhone").tips({
					side : 3,
					msg : '请输入用户手机号',
					bg : '#AE81FF',
					time : 2
				});
				$("#shopPhone").focus();
				return false;
			}
			if (district == "") {
				$("#district").tips({
					side : 3,
					msg : '请选择所在区域',
					bg : '#AE81FF',
					time : 2
				});
				$("#district").focus();
				return false;
			}
			
			if(imgUrldd==''){
				imgUrldd=pdtBanner.type.shopZzImgList;
			}
				
			
			
			$.ajax({
				url:'<%=path%>/app/user/updeleteshop',
				type : 'POST',
				data : {
					id : aid,
					shopProvinceId : province,
					shopCityId : city,
					shopCountyId : district,
					shopTitle : shopTitle,
					shopImg : shopImg,
					shopAddress : shopAddress,
					shopZzImgList	: imgUrldd,
					shopLinkname : shopLinkname,
				   
				    shopMsg : shopMsg,
				    updated : created,
				    shopMapX:mapX,
				    shopMapY:mapY
					
				},
				success : function(data) {
					
					
						 alert('修改成功')
						 
						 $("#shopTitle").val('');
							$("#shopImg").attr("src",'');
							$("#shopAddress").val('');
							$("#shopPhone").val('');
							$("#shopLinkname").val('');
							$("#message").val('');
						 	$("#province").val('');
						 
					
					
					
						
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