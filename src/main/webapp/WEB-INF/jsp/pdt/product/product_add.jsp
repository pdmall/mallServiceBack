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
					<textarea name="EMAILs" id="EMAILs"
						placeholder="请选输入对方邮箱,多个请用(;)分号隔开" title="请选输入对方邮箱,多个请用(;)分号隔开"></textarea>
					<div class="commitbox_cen">
						<div class="left" id="cityname"></div>
						<div class="right">
							<span class="save" onClick="saveEmail()">保存</span>&nbsp;&nbsp;<span
								class="quxiao" onClick="cancel_pl()">取消</span>
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
														<tr id="shopname">
															<td style="padding-top: 10px;">店铺名称: <select
																class="form-control" v-model="selecteShop"
																style="width: 300px; border-radius: 10px; padding: .5px 2px;"
																@change="changeshopname">
																	<option v-for="opts in shop" :value="opts.id">{{ opts.shopTitle }}</option>

															</select>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">商品标题:<input
																type="text" name="PDT_TITLE" id="PDT_TITLE" value=""
																maxlength="50" placeholder="这里输入商品名称" title="商品标题"
																style="width: 300px; margin-left: 20px; margin-right: 10px;" />
																商品编号:<input type="text"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																name="PDT_ID" id="PDT_ID" value="" maxlength="32"
																placeholder="这里输入商品编号" title="例：111"
																style="width: 200px; margin-left: 20px;" />
															</td>
														</tr>
														<tr>
															<td id="PDT_BANNER_ID" style="padding-top: 10px;">商品市价:<input
																type="text" onkeyup="yanzhengjine(this);"
																name="PDT_SC_PRICE" id="PDT_SC_PRICE"
																value="${pd.PDT_SC_PRICE}" maxlength="32"
																placeholder="市场价" title="市场价"
																style="width: 60px; margin-left: 10px;" />元 <label
																style="margin-left: 10px;"> 本店价格</label>:<input
																type="text" name="PDT_MY_PRICE" id="PDT_MY_PRICE"
																value="" maxlength="32" placeholder="本店价"
																onkeyup="yanzhengjine(this);" title="本店价"
																style="width: 60px; margin-left: 10px;" />元 <label
																style="margin-left: 10px;"> 商品库存</label>:<input
																type="text" name="PDT_MY_PRICE" id="pdtRepertory"
																value="" maxlength="32" placeholder="数量"
																onkeyup="yanzhengjine(this);" title="数量"
																style="width: 60px; margin-left: 10px;" />件 <label
																style="margin-left: 10px;"> 商品品牌:</label> <select
																v-model="selected" id="pdtBannerId"
																class="chosen-select form-control"
																style="vertical-align: top; width: 100px; float: right; margin-right: 100px;">
																	<option v-for="option in options"
																		v-bind:value="option.id">{{ option.bannerTitle }}</option>
															</select>
															</td>
														</tr>

														<tr>
															<td id="PDT_TYPE_ID"
																style="padding-top: 10px; padding-left: 2px;"><label
																style="float: left; margin-right: 13px;"> 商品类别:</label>

																<select v-model="selectede"class="chosen-select form-control"
																@change="changew( selectede )"
																style="vertical-align: top; width: 140px; float: left;">
																	<option v-for="option in options"
																		v-bind:value="option.id">{{ option.text }}</option>
																</select> 
															<input id="pdtTypeId" class='center hidden' type="text":value="selected" />
																 
																<label style="float: left; margin-right: 13px; margin-left: 30px;">
																	</label> <select v-model="sizes" id="sizes"
																class="chosen-select form-control   hidden"
																style="vertical-align: top; width: 110px; float: left;">
																	<option v-for="option in size"
																		v-bind:value="option.sizess">尺码:{{ option.sizess }}</option>
															</select> <label style="float: left; margin-right: 13px;">
																	</label> <select v-model="colour" id="colour"
																class="chosen-select form-control   hidden"
																style="vertical-align: top; width: 110px; margin-left: 50px;">
																	<option v-for="opt in colours">颜色:{{ opt.colourss }}</option>
															</select></td>
														</tr>







														<tr>
															<td style="padding-top: 10px;">商品小图:<input
																type="hidden" name="PDT_MIN_IMG" id="PDT_MIN_IMG"
																value="" maxlength="150"
																style="width: 200px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"
																	style="margin-left: 15px;" onclick="toImgEdit();">上传商品小图</div>
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
														<%-- 	<tr>
																<td style="padding-top: 10px;">商品详情:<input type="text" name="PDT_MSG" id="PDT_MSG" value="${pd.PDT_MSG}" maxlength="21845" placeholder="这里输入备注6" title="备注6"
																		style="width: 200px; margin-left: 20px;" /></td>
															</tr> --%>

														<tr>
															<td style="padding-top: 10px;">商品详情:<input
																type="hidden" name="PDT_IMG_LIST" id="PDT_IMG_LIST"
																value="4444" maxlength="21845" placeholder="这里输入备注9"
																title="备注9" style="width: 200px; margin-left: 20px;" /></td>
														</tr>
														
														
														<tr>
															<td id="nr" style="padding-top: 5px;"><script
																	id="editor" type="text/plain"
																	style="width: 96%; height: 259px;"></script></td>
														</tr>
														<tr>
															 <td>
																<tbody id="aaa">
																	<tr   v-for="list in abc">
																		<td>
																			<input type="text" v-model="list.a" /> 
																			<input type="text" v-model="list.b" />
																		</td>
																	</tr>
																</tbody>
															</td>
															
															
														</tr>
														<tr>

															<td>商品参数:
																<div>
																	<input type="text" id="a" /> <input type="text" id="b" />
																	<input type="submit" value="添加" onclick="ab()">
																</div>
															</td>
														</tr>
														<br>
														<tr>
															<td>
																<span class="input-group-addon" style="width:693px;height:15px;">商品保障:</span>
																<textarea id="abc" style="width:693px;height:159px;"></textarea>
															</td>
														</tr>

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
													<br />
													<br />
													<br />
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
	<%@ include file="../../system/index/foot.jsp"%>
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
	<script type="text/javascript">
	
	   var pdt=localStorage.getItem("pdtId");
	   
	   var shopnames = new Vue({
		   el:'#shopname',
		   data:{
			   shop:{},
			   typeName:{},
			   selecteShop:''
		   },
		   
		   created:function(){			 
			  var urls="<%=basePath%>shop/getListShop"
			  this.$http.get(urls).then(function(data){
                   this.shop = data.body;
 		 
			  },function(response){
                    console.info(response);
                });
		   },
		   methods:{
			   changeshopname:function(){
		        	  var ids = this.selecteShop;
		        	 
		              var url2="<%=basePath%>product/type/getListTypeByParentId?id="+ids;
			          this.$http.get(url2).then(function(data){
			       	       this.typeName=data.body;
			       	    pdtType.options=data.body;		       	   
			       	   },function(response){
			       	         console.info(response);
			       	    });
		          }
		   }
	   });
	   
	   var pdtBanner= new Vue({  
	        el: '#PDT_BANNER_ID',  
	        data: {  
	          selected: '1',
	          options: []
	        },
	        created:function(){
	        	console.log(this.options)
	        	
	        	 var url="<%=basePath%>banner/getBannerByPage";
	        	 this.$http.get(url).then(function(data){
	        		 	var json=data.body;
	                    this.options=json.rows
	                   
	                },function(response){
	                   console.info(response);
	               });
	        }
	      }); 
	  
	   var buzhidao = new Vue({
		   el:'#buzhidao',
		   data:{
			   imgUrl:[],
			   aa:'http://www.weixiaoleda.com/'
			   
			   
		   },
		   methods:{
			   del(index){
				   this.imgUrl.splice(index,1)
			   }
		   }
	   });
	   var pdtType= new Vue({  
	        el: '#PDT_TYPE_ID',  
	        data: {  
	          selected: '',
	          selectede:'',
	          colour : '',
	          sizes : '',
	          options: [],
	          opti:[],
	          pdt:{},
	          colours :[],
	          size : []	          
	        },
	        created:function(){
	        	 //var url="<%=basePath%>product/type/getListTypeByParentId?id=" + 0;
	 	        
	                //this.$http.get(url).then(function(data){
	                //    this.options=data.body;
	                   
	              //  },function(response){
	              //      console.info(response);
	             //   });
	                var url2="<%=basePath%>product/type/getListTypeByParentId?id=1";
	 	 	        
	                this.$http.get(url2).then(function(data){
	                    this.opti=data.body;
	                   
	                },function(response){
	                    console.info(response);
	                });
	                
	                var url2="<%=basePath%>colours/getColourss";
	                this.$http.get(url2).then(function(data){
	                    this.colours=data.body;
	                },function(response){
	                    console.info(response);
	                });
	                
	                
	                
	                
	        },
	        methods:{
	        	changew:function(dddd){
	        		this.selected=dddd;
	        	},
	        	changewddd:function(ddd){
	        		var dd = ddd.text;
	        		this.pdt = ddd;
	        		
	        		var url="<%=basePath%>sizes/getsizesByids?type="+dd;
	        		this.$http.get(url).then(function(data){
	        			this.size=data.body;
	        		},function(response){
	        			console.info(response);
	        		});
	        	},
	        	
	        	
	        
	        	
	        	
	        }
	      })  
	   
	   var pdtBanner= new Vue({
		   el:"#aaa",
		   data: {
			   abc:[]
			   
		   }
		   
	   });
	   
	   function  ab(){
		   var a=$("#a").val();
		   var b=$("#b").val();	
		   if(a!='' || b!=''){
			 
			   var c = a+b;
			   pdtBanner.abc.push(
					   { a,b}
				
				   
			   )
			   $("#a").val("");
			   $("#b").val(""); 
		   }
		   
		  
		
	   }
	   
	   
		function toImgEdit() {		   
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
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
				//var imgUrl=strs[0];				
				buzhidao.imgUrl.push(strs[0]);
				//$("#PDT_MIN_IMG").val(imgUrl);
				//$("#pdtImgMin").attr('src',imgUrl);
				diag.close();
			 };
			 diag.show();
		}
		
	   
	   
		
   	//保存
		function save() {
   			var shopId=shopnames.selecteShop;
   			
			//获取富文本编辑器里面的内容
			var pdtMsg=UE.getEditor('editor').getContent();
			//商品编号
			var pdtId=$("#PDT_ID").val();
			//商品标题
			var pdtTitle=$("#PDT_TITLE").val();
			
			var pdtScPrice=$("#PDT_SC_PRICE").val();
			var pdtMyPrice=$("#PDT_MY_PRICE").val();
			
			var a = buzhidao.imgUrl;
			var pdtMinImg=a.join(",");
			var pdtTypeId=$("#pdtTypeId").val();
			
			var bb = pdtBanner.abc;
			
			var parameter =JSON.stringify(bb);
			var pdtBannerId=$("#pdtBannerId").val();
			var pdtRepertory=$("#pdtRepertory").val();
			var sizes = $("#sizes").val();
			var colour = $("#colour").val();
			var protection = $("#abc").val();
			var created = new Date();
			
			if (pdtId == "") {
				$("#PDT_ID").tips({
					side : 3,
					msg : '请输入商品编号',
					bg : '#AE81FF',
					time : 2
				});
				$("#PDT_ID").focus();
				return false;
			}
			if (pdtTitle == "") {
				$("#PDT_TITLE").tips({
					side : 3,
					msg : '请输入商品名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#PDT_TITLE").focus();
				return false;
			}
			if ( pdtScPrice== "") {
				$("#PDT_SC_PRICE").tips({
					side : 3,
					msg : '请输入商品市场价',
					bg : '#AE81FF',
					time : 2
				});
				$("#PDT_SC_PRICE").focus();
				return false;
			}
			if (pdtMyPrice == "") {
				$("#PDT_MY_PRICE").tips({
					side : 3,
					msg : '请输入商品本店价',
					bg : '#AE81FF',
					time : 2
				});
				$("#PDT_MY_PRICE").focus();
				return false;
			}
			if (pdtMinImg == "") {
				$("#PDT_MIN_IMG").tips({
					side : 3,
					msg : '请上传商品小图',
					bg : '#AE81FF',
					time : 2
				});
				$("#PDT_MIN_IMG").focus();
				return false;
			}
			if (pdtMsg == "") {
				$("#PDT_MSG").tips({
					side : 3,
					msg : '请输入商品详情',
					bg : '#AE81FF',
					time : 2
				});
				$("#PDT_MSG").focus();
				return false;
			}
			if (pdtTypeId == "") {
				$("#PDT_TYPE_ID").tips({
					side : 3,
					msg : '请选择商品类别',
					bg : '#AE81FF',
					time : 2
				});
				$("#PDT_TYPE_ID").focus();
				return false;
			}
			
			$.ajax({
				url:'<%=path%>/product/addProduct',
				type : 'POST',
				data : {
					protection : protection,
					parameter :parameter,
					pdtShopId: shopId,
					pdtNo : pdtId,
					pdtTitle : pdtTitle,
					pdtScPrice : pdtScPrice*100,
					pdtMyPrice : pdtMyPrice*100,
					pdtMinImg : pdtMinImg,
					pdtMsg : pdtMsg,
					pdtTypeId : pdtTypeId,
					pdtBannerId : pdtBannerId,
					pdtImgList : '333',
					pdtRepertory:pdtRepertory,
					colours : colour,
					sizes : sizes
				},
				success : function() {
					 alert('添加成功')
					 window.location.href="about:blank";
					 top.Dialog.close();
					
					/* $("#zhongxin").hide();
					$("#zhongxin2").show(); */
				},
				error : function() {
					alert('添加失败')

				}
			})

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
		
	       //localStorage.removeItem("name");

		
		

		
		

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