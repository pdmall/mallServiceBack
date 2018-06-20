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
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>

<style type="text/css">
#l-map{
     height:300px;
     width:100%;
     }
#r-result{
     width:100%;
     }
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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YOwszXAmroGjxRyPbyhmxlZGrjPLYz6m"></script>
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
			                                           
														<tr id="users">
															<td style="padding-top: 10px;">工作室名称:<input
																type="text" name="workname" id="workname" :value="works.workname" 
																maxlength="50" placeholder="这里输入工作室名称" title="工作室名称"
																style="width: 240px; margin-left: 20px; margin-right: 10px;" />
																用户电话:<input type="text" placeholder="这里输入用户电话"  id="phone"  name="phone" 
													            placeholder="这里输入电话"  @blur="sousuo()"/> 
											
															</td>
														</tr>
														<tr>
														   <td  style="padding-top: 10px;">
														   <span id="cu" style="font-size: 12px;color: red;display:none;" >该用户不存在，请重新输入</span>
													       <span id="zq" style="display:block;" >
													                     负责人姓名:<span id="uname" style="margin-left:20px">{{works.userName}}</span>
													       </span>
														   </td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">工作室图:<input
																type="hidden" name="PDT_MIN_IMG" id="PDT_MIN_IMG"
																value="" maxlength="150"
																style="width: 200px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"
																	style="margin-left: 15px;" onclick="toImgEdit();">上传工作室图</div>
															</td>
														</tr>
														<tr id="buzhidao">
															<td style="padding-top: 10px;">
																<div v-for="(x,index) in imgUrl"
																	style="position: relative; display: inline-block">
																	<img :src="aa+x" id="pdtImgMin" width="100" height="100"
																		style="margin-left: 20px;"> <a
																		@click="del(index)"
																		style="position: absolute; top: 0; right: 0"
																		class="btn btn-mini btn-danger"> <i
																		class="ace-icon fa fa-trash-o bigger-120"></i>
																	</a>
																</div>
															</td>
														</tr>
														 <tr>
															<td style="padding-top: 10px;">
															当前地址:<span id="dqdi">{{works.site}}</span>
	                                               <div id="r-result" style="padding-top: 10px;">请输入地址:<input type="text" id="suggestId" size="100"  style="width:400px;"  />
	                                              &nbsp;&nbsp;   经度:<span id="lng">{{works.mayx}}</span>&nbsp;&nbsp;纬度:<span id="lat">{{works.mayy}}</span></div>
	                                               <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
	                                                
	                                               </td>
														</tr>
														<tr>
														  <td style="padding-top: 10px;"><div id="l-map"></div></td>
														</tr>
														<tr>
															<td>
																<span class="input-group-addon" style="width:693px;height:15px;">工作室详情:</span>
																<textarea id="message" style="width:893px;height:159px;">{{works.message}}</textarea>
															</td>
														</tr>
                                                        </div>
                                                       
														<tr>
															<td style="text-align: center;" colspan="10"><a
																class="btn btn-mini btn-primary" onclick="save();">保存</a>
																<a class="btn btn-mini btn-danger"
																onclick="top.Dialog.close();">取消</a></td>
														</tr>
													</table>
												</div>
												<div id="zhongxin2" class="center" style="display: none">
													<br />
													<img src="static/images/jiazai.gif" /><br />
													<h4 class="lighter block green">提交中...</h4>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
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
	<script type="text/javascript" charset="utf-8"
		src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 编辑框-->
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/toolEmail.js"></script>
	<script type="text/javascript" src="plugins/webuploader/webuploader.js"></script>
	<script type="text/javascript" src="plugins/webuploader/upload.js"></script>
	<script type="text/javascript" src="static/js/myjs/commonUrl.js"></script>
	<script type="text/javascript">
	var workid= localStorage.getItem("workid");
	
	  
	  
	   var us= new Vue({  
	        el: '#zhongxin',  
	        data: {  
	         user:'',
	         phone:'',
	         works:{},
	         imgUrl:[],
			   aa:tupianIp,
	        },
	        created:function(){
	        	 var url="<%=basePath%>work/getWorkById?id="+workid;
	                this.$http.get(url).then(function(data){
	                	
	                   this.works=data.body;
	                   var a = this.works.photo;
	                   this.imgUrl = a.split(",");
	                },function(response){
	                    console.info(response);
	                });
	                
	        },
	        methods:{
	        	 sousuo:function(){
	        		 var ph=$("#phone").val();
	        		 this.phone=ph;
	        		 var url="<%=basePath%>appuser/getUserByPhone?phone="+this.phone;
		                this.$http.get(url).then(function(data){
		                	this.user=data.body;
		                    
		                   if(this.user==null || this.user==""){
		                	   $("#cu").css("display","block");
		                	   $("#zq").css("display","none");
		                	   
		                   }else{
		                	   $("#uname").html(this.user.name)
		                	   $("#zq").css("display","block");
		                	   $("#cu").css("display","none");
		                	   
		                   }
		                   
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 del(index){
					   this.imgUrl.splice(index,1)
				   }
	        }
	      }) 

	   
	// 百度地图API功能
		function G(id) {
			return document.getElementById(id);
		}
		var map = new BMap.Map("l-map");
		map.centerAndZoom("成都",12);                   // 初始化地图,设置城市和地图级别。
		var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
			{"input" : "suggestId"
			,"location" : map
		});
		ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
		var str = "";
			var _value = e.fromitem.value;
			var value = "";
			if (e.fromitem.index > -1) {
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
			value = "";
			if (e.toitem.index > -1) {
				_value = e.toitem.value;
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
			G("searchResultPanel").innerHTML = str;
		});

		var myValue;
		ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
			myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
			setPlace();
		});

		function setPlace(){
			map.clearOverlays();    //清除地图上所有覆盖物
			function myFun(){
				var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
				map.centerAndZoom(pp, 18);
				map.addOverlay(new BMap.Marker(pp));    //添加标注
				$("#lng").html(pp.lng);
				$("#lat").html(pp.lat);
				var dz=$("#suggestId").val();
				console.log(dz)
				$("#dqdi").html(dz);
			}
			var local = new BMap.LocalSearch(map, { //智能搜索
			  onSearchComplete: myFun
			});
			local.search(myValue);
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
				us.imgUrl.push(strs[0]);
		        
				//var imgUrl=strs[0];
				//imgUrldd=imgUrl;
				//$("#pdtMinImg").attr('src',imgUrl);
				//$("#PDT_MIN_IMG").val(imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		
	   
		
   	//保存
		function save() {
   		console.log(us.imgUrl)
   		    
		    var workname=$("#workname").val();//工作室名称
   			var phone=$("#phone").val();//电话
   			var site=$("#dqdi").text();//地址
   			var lng=$("#lng").text();//经度
   			var lat=$("#lat").text();//纬度
   			var id=workid;
   			var a=us.imgUrl;//图片
   			var photo=a.join(",");
		
   			var message=$("#message").val();//详情
			var created = new Date();
			
			if (workname == "") {
				$("#workname").tips({
					side : 3,
					msg : '请输入工作室名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#workname").focus();
				return false;
			}
			if (site == "") {
				$("#suggestId").tips({
					side : 3,
					msg : '请输入地址',
					bg : '#AE81FF',
					time : 2
				});
				$("#suggestId").focus();
				return false;
			}
			
			if (message == "") {
				$("#message").tips({
					side : 3,
					msg : '请输入工作室详情',
					bg : '#AE81FF',
					time : 2
				});
				$("#message").focus();
				return false;
			}
			
			
			$.ajax({
				url:'<%=path%>work/updateWork',
				type : 'POST',
				data : {
					id:id,
					phone:phone,
					workname:workname,
					site:site,
					mayx:lng,
					mayy:lat,
					photo:photo,
					message:message
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
	</script>
</body>
</html>