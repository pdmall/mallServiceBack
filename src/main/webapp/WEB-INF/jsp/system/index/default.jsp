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
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts.min.js"></script>
<!-- <script src="http://echarts.baidu.com/build/dist/echarts.js"> -->
<script src="static/echarts.min.js"></script>
<script type="text/javascript">
setTimeout("top.hangge()",500);
</script>
<style>
#manage .goodsOrder, .good, .manage {
	cursor: pointer
}

h5 {
	float: left
}

.active {
	border: 1px solid transparent;
	padding: 0;
	margin-left: -1px;
	margin-bottom: -1px;
}

h4 {
	margin: 0 10px;
	background-color: rgba(209, 91, 71, .03);
}

label:hover {
	cursor: pointer;
}

.active:hover {
	border: 1px solid rgb(209, 91, 71)
}

.h5Title {
	margin: 10px 16px 0 16px;
}

.widthTd {
	width: 105px;
}

.widthTd100 {
	width: 100px;
}
</style>
</head>
<body class="no-skin">
	
	<!-- /section:basics/navbar.layout style="position:fixed;top:-10px;left:0;right:0;" -->
	<!-- <div id="myEchart" style="height:500px;width:500px;background:#eeeeee;"> -->

	</div>

	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<!-- <div class="hr hr-18 dotted hr-double"></div> -->
					<div class="content" id="manage">
						<div class="row"
							style="margin: 10px 0; position: fixed; top: -10px; left: 0; right: 0; z-index: 3000; background: #fff;">


							<div class="col-xs-12">
								<div @click.prevent="browse()"
									style="background-color: #62a8d1; text-align: center; font-size: 12px; padding: 15px 0; color: white; margin-top: 15px; cursor: pointer"
									class="col-xs-1 col-xs-offset-1">近一周订单量</div>
								<div @click.prevent="browse1()"
									style="background-color: #62a8d1; text-align: center; font-size: 12px; padding: 15px 0; color: white; margin-top: 15px; cursor: pointer"
									class="col-xs-1 col-xs-offset-1">年销售量</div>
								<div @click.prevent="browse2()"
									style="background-color: #62a8d1; text-align: center; font-size: 12px; padding: 15px 0; color: white; margin-top: 15px; cursor: pointer"
									class="col-xs-1 col-xs-offset-1">某年每月订单量</div>
								<div Float:left >
									<embed src="static/FusionCharts/Column3D.swf"
										flashvars="chartWidth=500&amp;chartHeight=300&amp;DOMId=myNext&amp;debugMode=0&amp;registerWithJS=0&amp;dataXML=<graph caption='对比表' xAxisName='月份' yAxisName='值' decimalPrecision='0' formatNumberScale='0'><set name='1' value='462' color='AFD8F8'/><set name='2' value='857' color='F6BD0F'/><set name='3' value='671' color='8BBA00'/><set name='4' value='494' color='FF8E46'/><set name='5' value='761' color='008E8E'/><set name='6' value='960' color='D64646'/><set name='7' value='629' color='8E468E'/><set name='8' value='622' color='588526'/><set name='9' value='376' color='B3AA00'/><set name='10' value='494' color='008ED6'/><set name='11' value='761' color='9D080D'/><set name='12' value='960' color='A186BE'/></graph>&amp;scaleMode=&amp;lang="
										quality="high" width="600" height="500" name="myNext"
										allowscriptaccess="always"
										type="application/x-shockwave-flash"
										pluginspage="http://www.macromedia.com/go/getflashplayer"
										wmode="transparent" bgcolor=""></div>
								<div Float:right >
									<embed src="static/FusionCharts/Column3D.swf"
										flashvars="chartWidth=500&amp;chartHeight=300&amp;DOMId=myNext&amp;debugMode=0&amp;registerWithJS=0&amp;dataXML=<graph caption='对比表' xAxisName='月份' yAxisName='值' decimalPrecision='0' formatNumberScale='0'><set name='1' value='462' color='AFD8F8'/><set name='2' value='857' color='F6BD0F'/><set name='3' value='671' color='8BBA00'/><set name='4' value='494' color='FF8E46'/><set name='5' value='761' color='008E8E'/><set name='6' value='960' color='D64646'/><set name='7' value='629' color='8E468E'/><set name='8' value='622' color='588526'/><set name='9' value='376' color='B3AA00'/><set name='10' value='494' color='008ED6'/><set name='11' value='761' color='9D080D'/><set name='12' value='960' color='A186BE'/></graph>&amp;scaleMode=&amp;lang="
										quality="high" width="600" height="500" name="myNext"
										allowscriptaccess="always"
										type="application/x-shockwave-flash"
										pluginspage="http://www.macromedia.com/go/getflashplayer"
										wmode="transparent" bgcolor="">
										
								</div>




							</div>

							<div class="col-xs-12" style="margin-top: 50px;">

								<div id="main2"
									style="width: 650px; height: 600px; float: left;" class="asas">

								</div>

								<div v-if="numberss==2" style="width: 250px; float: left;"
									class="asas1">
									<span style="font-size: 15px">选择年:</span> <select id="ssss"
										@change="browse2()" class="chosen-select"
										style="vertical-align: top; width: 150px;">

										<option v-if="yearss>2025 || yearss==2025" value="2025">2025</option>
										<option v-if="yearss==2024 || yearss>2024" value="2024">2024</option>
										<option v-if="yearss>2023 || yearss==2023" value="2023">2023</option>
										<option v-if="yearss>2022 || yearss==2022" value="2022">2022</option>
										<option v-if="yearss>2021 || yearss==2021" value="2021">2021</option>
										<option v-if="yearss>2020 || yearss==2020" value="2020">2020</option>
										<option v-if="yearss>2019 || yearss==2019" value="2019">2019</option>
										<option v-if="yearss>2018 || yearss==2018" value="2018">2018</option>
										<option value="2017">2017</option>
									</select>
								</div>
								<div v-if="numbera==2" style="width: 550px; float: left;"
									class="asas1">
									<span style="font-size: 15px">选择年:</span> <select id="sas"
										@change="browse5()" class="chosen-select"
										style="vertical-align: top; width: 150px;">

										<option v-if="yearss>2025 || yearss==2025" value="2025">2025</option>
										<option v-if="yearss==2024 || yearss>2024" value="2024">2024</option>
										<option v-if="yearss>2023 || yearss==2023" value="2023">2023</option>
										<option v-if="yearss>2022 || yearss==2022" value="2022">2022</option>
										<option v-if="yearss>2021 || yearss==2021" value="2021">2021</option>
										<option v-if="yearss>2020 || yearss==2020" value="2020">2020</option>
										<option v-if="yearss>2019 || yearss==2019" value="2019">2019</option>
										<option v-if="yearss>2018 || yearss==2018" value="2018">2018</option>
										<option value="2017">2017</option>
									</select><br> <span style="font-size: 15px">选择月:</span> <select
										id="sas1" @change="browse5()" class="chosen-select"
										style="vertical-align: top; width: 150px;">

										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select> <input type="button" value="查询" @click="browse3()"
										style="border-bottom-color: #579ec8; width: 50px;">
								</div>
							</div>


						</div>


						<!-- 展示的详细内容-->

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
	<div id="iframeShow" class="show">

		<iframe name="mainFrame" id="mainFrame" frameborder="0" src=""
			style="margin: 0 auto; width: 100%; height: 800px; margin-top: 138px;"></iframe>




	</div>




	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->

	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<script src="https://cdn.bootcss.com/vue/2.4.0/vue.js"></script>
	<script
		src="https://cdn.bootcss.com/vue-resource/1.3.4/vue-resource.js"></script>
	<script>
	$(top.hangge());
	var example2 = new Vue({  
        el: '#manage',
        data: {
        	
        	
        	items:[],
			products:[],
			shops:[],
			typeName:[],
			typeNameChild:[],
			shopname:'',
		     checkedNames:[],
		     selected:1,
		     selectede:[],
		     selecteType:0,
		     selecteTypeChild:100,
		     numberss:1,
		     numbera:1,
		     aaaaa:1,
		     yearss:0,
        	
        	bg:0,
        	goodBg:-1,
        	subBg:-1,
        	xhOrderStatus:1,
        	xhOrderPage:1,
        	pdtOrderPage:1,
        	bgNumber:1
        },
        created:function(){
           
        	 var date=new Date;
			  var year=date.getFullYear(); 
			  this.yearss=year;
			
			  
               var url="<%=basePath%>app/user/zhouconsume";
               this.$http.get(url).then(function(data){
                   this.items=data.body;
                   echers(this.items,1);
               },function(response){
                   console.info(response);
               });
               
               var urls="<%=basePath%>app/user/getlistshop";
               this.$http.get(urls).then(function(data){
                   this.shops=data.body;
                  
               },function(response){
                   console.info(response);
               });
        },
        methods:{
        	 browse:function(){
	        		this.numberss=1;
	        		this.numbera=1;
	        		 var url="<%=basePath%>app/user/zhouconsume";
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,1);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse1:function(){
	        		
	        		 this.numbera=1;
	        		 this.numberss=1;
	        		 var url="<%=basePath%>app/user/getyearsconsume";
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,2);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse2:function(){
	        		var sss = $("#ssss").val();
	        		if(sss==undefined){
	        			 var date=new Date;
	   				   
	        			sss=date.getFullYear();
	        		}
	        		 this.numberss=2;
	        		 this.numbera=1;
	        		 var url="<%=basePath%>app/user/getdayconsume?year="+sss;
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,2);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	 browse3:function(){
	        	
	        		var year = $("#sas").val();
	        		var month = $("#sas1").val();
	        		if(year==undefined || month==undefined){
	        			 var date=new Date;
	   				   
	        			year=date.getFullYear();
	        			month=date.getMonth()+1;
	        		}
	        		var sd = year+"年"+month+"月订单量"
	        		 this.numberss=1;
	        		 this.numbera=2;
	        		 var url="<%=basePath%>app/user/getdayByyearandmonth?year="+year+"&month="+month;
		                this.$http.get(url).then(function(data){
		                    this.items=data.body;
		                    echers(this.items,);
		                },function(response){
		                    console.info(response);
		                });
	        	 },
	        	
	        	
	         }
			})
		
	function echers(list,status){
			var aaa=[];
			aaa.splice(0,aaa.length);
			var message=[];
		for(var i=0;i<list.length;i++){
			aaa.push(list[i].name);
			message.push(list[i].number);
		}
		example2.aaaaa=1;
		
		
		
		var myChart = echarts.init(document.getElementById("main2"));
		var sss ='';
		if(status==1){
			sss = '近一周订单量';
		}else if(status==2){
			sss = '每年订单量';
		}else{
			sss=status;
		}
		
		//app.title = '坐标轴刻度与标签对齐';

		option = {
		    color: ['#3398DB'],
		    title : {
		        text: sss,
		        subtext: '聚美美容',
		        x:'center'
		    },
		    
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : aaa,
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'销量',
		            type:'bar',
		            barWidth: '60%',
		            data:message
		        }
		    ]
		};

			myChart.setOption(option);
			if(message.length==0){
				alert('暂无数据');
			}
			
}

	function showOrHidden(){
		 $("#zhongxin").addClass("hidden");
   	  $("#iframeShow").removeClass("hidden")
	}

	function yanzhengjine333(obj) {

		var id = obj.id;
		var val = obj.value;
		var regStrs = [ [ '^0(\\d+)$', '$1' ], [ '[^\\d\\.]+$', '' ],
				[ '\\.(\\d?)\\.+', '.$2' ], [ '^(\\d+\\.\\d{2}).+', '$1' ] ];
		for (i = 0; i < regStrs.length; i++) {
			var reg = new RegExp(regStrs[i][0]);
			obj.value = obj.value.replace(reg, regStrs[i][1]);
		}

	}
	
    new Vue({  
        el: '#zhongxin',
        data: {	        	
        	itemLists:[],	
        	products:[],	
        	items:[],
        	contentItems:'',
        	checkAll:[],
        	active:false,        	
        	mTotal:0,
        	totalPrice:0,
        	price:'price',
        	tag:'tag',
        	tagSelect:'tagSelect',
        	pId:0,
        	typeTitel:'',
        	totalPriceOne:"totalPriceOne"
        },
        created:function(){
        	           
        	
         },
					methods : {
						clickShow:function(pId){
							this.pId=pId;
							var _this=this;	   
							        	  
				        	
						},
						selectChange:function(selectId,idx,tId,tId2){
							this.totalPrice-=this.items[idx].price*this.items[idx].num;
							var num=parseFloat($("#"+selectId).val());
							this.items[idx].num=num;
							var price=parseFloat($("#"+tId).val());
							this.totalPrice+=num*price;
						
						},
						yanzhengjine:function(ele,idx,tId){
							this.checkAll=this.items;
							var p=parseFloat($("#"+ele).val());
							this.items[idx].price=p;
							var num=parseFloat($("#"+this.tagSelect+tId).val());
							this.totalPrice+=p*num;
							
						},
						huoqujiaodian:function(ele,idx,tId){
							
							var p=parseFloat($("#"+ele).val());
							this.items[idx].price=p;
							var num=parseFloat($("#"+this.tagSelect+tId).val());
							if(p !==0){
							   this.totalPrice-=p*num;
							}
						},
						deleteXh:function(idx,ele,tId){
							this.checkAll=this.items;
							if(this.checkAll.length==0){   
								this.checkAll.splice(idx,1);	
							}
							this.items.splice(idx,1);
							var p=parseFloat($("#"+ele).val());
							var num=parseFloat($("#"+this.tagSelect+tId).val());
							this.totalPrice-=p*num;
							
						},
						dddd:function(id,ie,text){
							/*通过类别id获取类别名称*/
							var _this=this;
							$.ajax({
								url:'<%=basePath%>xh/item/type/my/getTypeNameById?typeId='+id,
								type:"GET",
								success:function(res){
									_this.typeTitel=res.text;
									var obj={
											tId:ie,
											ttype:text,
											pId:id,
											price:0,
											num:1,
											typeTitle:_this.typeTitel
										}
							     if(_this.items.length>0){
									 for (var i=0;i<_this.items.length;i++){
									    if(_this.items[i].tId == ie){
		                                    var ddd=_this.items[i].ttype;
		                                    
									        var itemseee=_this.contentItems.split(ddd)                
									        _this.contentItems=itemseee.join("");
									        
									            _this.items.splice(i);
									            _this.items.push(obj);
									            
									            _this.contentItems=this.contentItems+' '+text;
									           
									            return;
									            }else{
									             if(i==_this.items.length-1){
									              _this.items.push(obj);
									              _this.contentItems=this.contentItems+' '+text;
		                                          console.log(_this.contentItems)
									            }
									          }
									       }

									        }else {
									          _this.items.push(obj);
									          _this.contentItems+=text;
									        
									        }
								},
								error:function(){
									
								}
								
							})
							
							
							/* for(var j=0;j<this.products.length;j++){
							$(this).parent().css("border","1px solid blue");
							alert("dfd")
							}
						 */
						},
						
						submitData:function(){
							var name=$("#name").val();
							var tel=$("#tel").val();
							var member=$("input[name='member']:checked").val();
							var pickUp=$("input[name='pickUp']:checked").val();
							var pay=$("input[name='pay']:checked").val();
							var addr=$("#addr").val();						
							var moneyTotal=$("#num").val()*$("#money").val();
							this.mTotal=moneyTotal;
							var remark=$("#remark").val();
							if(this.contentItems==''){
								$("#contentItems").tips({
									side : 3,
									msg : '请选中商品信息后再提交',
									bg : '#AE81FF',
									time : 5
								});
												
							}else if(name==''){
								$("#name").tips({
									side : 3,
									msg : '请输入客户姓名',
									bg : '#AE81FF',
									time : 2
								});
								$("#name").focus();
								return false;
								
							}
							else if(tel==''){
								$("#tel").tips({
									side : 3,
									msg : '请输入客户电话',
									bg : '#AE81FF',
									time : 2
								});
								$("tel").focus();
								return false;
								
								
							}else if(addr==''){
								$("#addr").tips({
									side : 3,
									msg : '请输入客户收货地址',
									bg : '#AE81FF',
									time : 2
								});
								$("#addr").focus();
								return false;
								
								
							}else{
								this.checkAll.push(this.contentItems,name,tel,member,pickUp,pay,moneyTotal,addr,remark)
								this.checkAll.join(',');			
								$("input[type='radio']").removeAttr('checked');	
								this.contentItems='';
								this.checkAll=''
							}													
						},
						del:function(index){
							this.contentItems='';
							$("input[type='radio']").removeAttr('checked');								
						},													
					},
					computed:{
						moneyTotal:function(){
							return $("#money").val()*$("#num").val()+'元'
						}
					}

				})

    
    function add(){
    	var moneyTotal=$("#num").val()*$("#money").val();
		
		$("#asdf").text(moneyTotal);
    }
	</script>
</body>
</html>