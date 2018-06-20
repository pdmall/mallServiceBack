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
																<label style="margin-left: 10px;"> 产品类别:</label>
																<select v-model="selectede" id="type1" class="" @change="changew( selectede )" style="width: 80px;">
																	<option v-for="item in items" v-bind:value="item.id">{{item.name}}</option>
																</select>
																
																<select v-model="sess" id="type2"  class=""  style="width: 100px;">
																	<option v-for="item in itemss" v-bind:value="item.id">{{item.name}}</option>
																</select>
																	
															</td>
														</tr>

														<tr>
															<td>
																<label style="margin-left: 10px;"> 时间:</label>
																<select id="shijian">
															   		<option value="1">早上</option>
															   		<option value="2">中午</option>
															   		<option value="3">晚上</option>
															   </select>
															</td>
														</tr>
														<tr>
															<td style="padding-top: 10px;">
															<label style="margin-left: 10px;"> 时刻:</label>
															   <select id="ks">
															   		<option value="00">00</option>
															   		<option value="01">01</option>
															   		<option value="02">02</option>
															   		<option value="03">03</option>
															   		<option value="04">04</option>
															   		<option value="05">05</option>
															   		<option value="06">06</option>
															   		<option value="07">07</option>
															   		<option value="08">08</option>
															   		<option value="09">09</option>
															   		<option value="10">10</option>
															   		<option value="11">11</option>
															   		<option value="12">12</option>
															   		<option value="13">13</option>
															   		<option value="14">14</option>
															   		<option value="15">15</option>
															   		<option value="16">16</option>
															   		<option value="17">17</option>
															   		<option value="18">18</option>
															   		<option value="19">19</option>
															   		<option value="20">20</option>
															   		<option value="21">21</option>
															   		<option value="22">22</option>
															   		<option value="23">23</option>
															   </select>
															   <label style="margin-left: 10px;">:</label>
															   <select id="kf">
															   		<option>00</option>
															   		<option>01</option>
															   		<option>02</option>
															   		<option>03</option>
															   		<option>04</option>
															   		<option>05</option>
															   		<option>06</option>
															   		<option>07</option>
															   		<option>08</option>
															   		<option>09</option>
															   		<option>10</option>
															   		<option>11</option>
															   		<option>12</option>
															   		<option>13</option>
															   		<option>14</option>
															   		<option>15</option>
															   		<option>16</option>
															   		<option>17</option>
															   		<option>18</option>
															   		<option>19</option>
															   		<option>20</option>
															   		<option>21</option>
															   		<option>22</option>
															   		<option>23</option>
															   		<option>24</option>
															   		<option>25</option>
															   		<option>26</option>
															   		<option>27</option>
															   		<option>28</option>
															   		<option>29</option>
															   		<option>30</option>
															   		<option>31</option>
															   		<option>32</option>
															   		<option>33</option>
															   		<option>34</option>
															   		<option>35</option>
															   		<option>36</option>
															   		<option>37</option>
															   		<option>38</option>
															   		<option>39</option>
															   		<option>40</option>
															   		<option>41</option>
															   		<option>42</option>
															   		<option>43</option>
															   		<option>44</option>
															   		<option>45</option>
															   		<option>46</option>
															   		<option>47</option>
															   		<option>48</option>
															   		<option>49</option>
															   		<option>50</option>
															   		<option>51</option>
															   		<option>52</option>
															   		<option>53</option>
															   		<option>54</option>
															   		<option>55</option>
															   		<option>56</option>
															   		<option>57</option>
															   		<option>58</option>
															   		<option>59</option>
															   		
															   </select>
															   <label style="margin-left: 10px;"> —</label>
															   <select id="js">
															   		<option value="00">00</option>
															   		<option value="01">01</option>
															   		<option value="02">02</option>
															   		<option value="03">03</option>
															   		<option value="04">04</option>
															   		<option value="05">05</option>
															   		<option value="06">06</option>
															   		<option value="07">07</option>
															   		<option value="08">08</option>
															   		<option value="09">09</option>
															   		<option value="10">10</option>
															   		<option value="11">11</option>
															   		<option value="12">12</option>
															   		<option value="13">13</option>
															   		<option value="14">14</option>
															   		<option value="15">15</option>
															   		<option value="16">16</option>
															   		<option value="17">17</option>
															   		<option value="18">18</option>
															   		<option value="19">19</option>
															   		<option value="20">20</option>
															   		<option value="21">21</option>
															   		<option value="22">22</option>
															   		<option value="23">23</option>
															   </select>
															   <label style="margin-left: 10px;">:</label>
															   <select id="jf">
															   		<option>00</option>
															   		<option>01</option>
															   		<option>02</option>
															   		<option>03</option>
															   		<option>04</option>
															   		<option>05</option>
															   		<option>06</option>
															   		<option>07</option>
															   		<option>08</option>
															   		<option>09</option>
															   		<option>10</option>
															   		<option>11</option>
															   		<option>12</option>
															   		<option>13</option>
															   		<option>14</option>
															   		<option>15</option>
															   		<option>16</option>
															   		<option>17</option>
															   		<option>18</option>
															   		<option>19</option>
															   		<option>20</option>
															   		<option>21</option>
															   		<option>22</option>
															   		<option>23</option>
															   		<option>24</option>
															   		<option>25</option>
															   		<option>26</option>
															   		<option>27</option>
															   		<option>28</option>
															   		<option>29</option>
															   		<option>30</option>
															   		<option>31</option>
															   		<option>32</option>
															   		<option>33</option>
															   		<option>34</option>
															   		<option>35</option>
															   		<option>36</option>
															   		<option>37</option>
															   		<option>38</option>
															   		<option>39</option>
															   		<option>40</option>
															   		<option>41</option>
															   		<option>42</option>
															   		<option>43</option>
															   		<option>44</option>
															   		<option>45</option>
															   		<option>46</option>
															   		<option>47</option>
															   		<option>48</option>
															   		<option>49</option>
															   		<option>50</option>
															   		<option>51</option>
															   		<option>52</option>
															   		<option>53</option>
															   		<option>54</option>
															   		<option>55</option>
															   		<option>56</option>
															   		<option>57</option>
															   		<option>58</option>
															   		<option>59</option>
															   </select>
															</td>
														</tr>
														
														
														
														<tr style="padding-top:10px;">
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
	$(top.hangge());//关闭加载状态
	           	 
	var photo = localStorage.getItem("typephoto");	 
	   
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
	          name : '',
	          photo:'',
	          aa:imgUrlsss,
	          items:[],
	          itemss:[],
	          ses : [],
	          sess : '',
	         
	        },
	        created:function(){

                var url="<%=basePath%>app/user/getintegraltype?id="+0;
    	        
                this.$http.get(url).then(function(data){
                	this.items=data.body;
                  
                },function(response){
                    console.info(response);
                });  
            
	        },
	        methods:{
	        	changew:function(id){
	        		var url="<%=basePath%>app/user/getintegraltype?id="+id;
	    	        
	                this.$http.get(url).then(function(data){
	                	this.itemss=data.body;
	                  
	                },function(response){
	                    console.info(response);
	                });  
	        	},
	        	
	      }})  
	   var imgUrldd='';
	   function toImgEdit() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑图片";
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
				
				
				var a = imgUrlsss
				
				$("#xhImgMin").attr('src',a+imgUrl);
			  diag.close();
			 };
			 diag.show();
		}
		//保存
		function save() {
			
			//获取富文本编辑器里面的内容
	    	
			
			
			var type1 = $("#type1").val();//一级
			var type2 = pdtBanner.sess;//2级
			var name = $("#type2").find("option:selected").text();//产品名称
			var t = $("#shijian").val();//时间
			var ks = $("#ks").val();//开始时间
			var kf = $("#kf").val();//开始分
			var js = $("#js").val();//结束时
			var jf = $("#jf").val();//结束分
		    var tim = ks+":"+kf+"-"+js+":"+jf;
			
			
			
			var created = new Date();
			$.ajax({
				url:'<%=path%>/app/user/postplan',
				type : 'POST',
				data : {
					pid:type1,
					planid : type2,
				   created : created,
				   name : name,
				   time : tim,
				   type : t,
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