




<!DOCTYPE html>
<html lang="en">
<head>
<base href="http://localhost:8080/">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="static/ace/css/font-awesome.css" />
		<!-- page specific plugin styles -->
		<!-- text fonts -->
		<link rel="stylesheet" href="static/ace/css/ace-fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="static/ace/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="static/ace/css/ace-ie.css" />
		<![endif]-->
		<!-- inline styles related to this page -->
		<!-- ace settings handler -->
		<script src="static/ace/js/ace-extra.js"></script>
		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
		<!--[if lte IE 8]>
		<script src="static/ace/js/html5shiv.js"></script>
		<script src="static/ace/js/respond.js"></script>
		<![endif]-->


</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
	
						<!-- 检索  -->
						<form action="command/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="KEYWORD" value="" placeholder="这里输入关键词" />
										<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="chosen-select form-control" name="STATUS" id="STATUS" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;">
										<option value=""></option>
										<option value="">全部</option>
										<option value="1" selected>有效</option>
										<option value="2" >无效</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></button></td>
								
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td>
								
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center">
									<label><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width: 50px;">序号</th>
									<th class="center">关键词</th>
									<th class="center">应用路径</th>
									<th class="center">备注</th>
									<th class="center">创建时间</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							
								
									
									
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' class="ace" value="854a157c6d99499493f4cc303674c01f" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">1</td>
													<td class="center">关闭QQ</td>
													<td>taskkill /f /im qq.exe ...</td>
													<td class="center">关闭QQ</td>
													<td class="center">2015-05-10 21:25:46</td>
													<td style="width: 60px;" class="center">
														
														<span class="label label-success arrowed">有效</span>
													</td>
											<td class="center">
												<div class='hidden-phone visible-desktop btn-group'>
													
													
													<a style="cursor:pointer;" class="green" onclick="edit('854a157c6d99499493f4cc303674c01f');" title="编辑">
														<i class="ace-icon fa fa-pencil bigger-130"></i>
													</a>
													
													
													<a style="cursor:pointer;" class="red" onclick="del('854a157c6d99499493f4cc303674c01f');" title="删除">
														<i class="ace-icon fa fa-trash-o bigger-130"></i>
													</a>
													
												</div>
											</td>
										</tr>
									
									
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' class="ace" value="ab3a8c6310ca4dc8b803ecc547e55ae7" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">2</td>
													<td class="center">打开QQ</td>
													<td>D:/SOFT/QQ/QQ/Bin/qq.exe ...</td>
													<td class="center">打开QQ</td>
													<td class="center">2015-05-10 21:25:25</td>
													<td style="width: 60px;" class="center">
														
														<span class="label label-success arrowed">有效</span>
													</td>
											<td class="center">
												<div class='hidden-phone visible-desktop btn-group'>
													
													
													<a style="cursor:pointer;" class="green" onclick="edit('ab3a8c6310ca4dc8b803ecc547e55ae7');" title="编辑">
														<i class="ace-icon fa fa-pencil bigger-130"></i>
													</a>
													
													
													<a style="cursor:pointer;" class="red" onclick="del('ab3a8c6310ca4dc8b803ecc547e55ae7');" title="删除">
														<i class="ace-icon fa fa-trash-o bigger-130"></i>
													</a>
													
												</div>
											</td>
										</tr>
									
									
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' class="ace" value="2636750f6978451b8330874c9be042c2" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">3</td>
													<td class="center">锁定服务器</td>
													<td>rundll32.exe user32.dll,LockWorkStation ...</td>
													<td class="center">锁定计算机</td>
													<td class="center">2015-05-10 21:25:06</td>
													<td style="width: 60px;" class="center">
														
														<span class="label label-success arrowed">有效</span>
													</td>
											<td class="center">
												<div class='hidden-phone visible-desktop btn-group'>
													
													
													<a style="cursor:pointer;" class="green" onclick="edit('2636750f6978451b8330874c9be042c2');" title="编辑">
														<i class="ace-icon fa fa-pencil bigger-130"></i>
													</a>
													
													
													<a style="cursor:pointer;" class="red" onclick="del('2636750f6978451b8330874c9be042c2');" title="删除">
														<i class="ace-icon fa fa-trash-o bigger-130"></i>
													</a>
													
												</div>
											</td>
										</tr>
									
									
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' class="ace" value="46217c6d44354010823241ef484f7214" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">4</td>
													<td class="center">打开浏览器</td>
													<td>C:/Program Files/Internet Explorer/iexplore.exe ...</td>
													<td class="center">打开浏览器操作</td>
													<td class="center">2015-05-09 02:43:02</td>
													<td style="width: 60px;" class="center">
														
														<span class="label label-success arrowed">有效</span>
													</td>
											<td class="center">
												<div class='hidden-phone visible-desktop btn-group'>
													
													
													<a style="cursor:pointer;" class="green" onclick="edit('46217c6d44354010823241ef484f7214');" title="编辑">
														<i class="ace-icon fa fa-pencil bigger-130"></i>
													</a>
													
													
													<a style="cursor:pointer;" class="red" onclick="del('46217c6d44354010823241ef484f7214');" title="删除">
														<i class="ace-icon fa fa-trash-o bigger-130"></i>
													</a>
													
												</div>
											</td>
										</tr>
									
									
									
									
								
								
							
							</tbody>
						</table>
					<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;">
								
								<a class="btn btn-sm btn-success" onclick="add();">新增</a>
								
								
								<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
								
							</td>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">	<ul class="pagination pull-right no-margin">
	<li><a>共<font color=red>4</font>条</a></li>
	<li><input type="number" value="" id="toGoPage" style="width:50px;text-align:center;float:left" placeholder="页码"/></li>
	<li style="cursor:pointer;"><a onclick="toTZ();"  class="btn btn-mini btn-success">跳转</a></li>
	<li><a>首页</a></li>
	<li><a>上页</a></li>
<li class="active"><a><font color='white'>1</font></a></li>
	<li><a>下页</a></li>
	<li><a>尾页</a></li>
	<li><a>共1页</a></li>
	<li><select title='显示条数' style="width:55px;float:left;margin-top:1px;" onchange="changeCount(this.value)">
	<option value='15'>15</option>
	<option value='10'>10</option>
	<option value='20'>20</option>
	<option value='30'>30</option>
	<option value='40'>40</option>
	<option value='50'>50</option>
	<option value='60'>60</option>
	<option value='70'>70</option>
	<option value='80'>80</option>
	<option value='90'>90</option>
	<option value='99'>99</option>
	</select>
	</li>
</ul>
<script type="text/javascript">
function nextPage(page){ top.jzts();	if(true && document.forms[0]){
		var url = document.forms[0].getAttribute("action");
		if(url.indexOf('?')>-1){url += "&currentPage=";}
		else{url += "?currentPage=";}
		url = url + page + "&showCount=15";
		document.forms[0].action = url;
		document.forms[0].submit();
	}else{
		var url = document.location+'';
		if(url.indexOf('?')>-1){
			if(url.indexOf('currentPage')>-1){
				var reg = /currentPage=\d*/g;
				url = url.replace(reg,'currentPage=');
			}else{
				url += "&currentPage=";
			}
		}else{url += "?currentPage=";}
		url = url + page + "&showCount=15";
		document.location = url;
	}
}
function changeCount(value){ top.jzts();	if(true && document.forms[0]){
		var url = document.forms[0].getAttribute("action");
		if(url.indexOf('?')>-1){url += "&currentPage=";}
		else{url += "?currentPage=";}
		url = url + "1&showCount="+value;
		document.forms[0].action = url;
		document.forms[0].submit();
	}else{
		var url = document.location+'';
		if(url.indexOf('?')>-1){
			if(url.indexOf('currentPage')>-1){
				var reg = /currentPage=\d*/g;
				url = url.replace(reg,'currentPage=');
			}else{
				url += "1&currentPage=";
			}
		}else{url += "?currentPage=";}
		url = url + "&showCount="+value;
		document.location = url;
	}
}
function toTZ(){var toPaggeVlue = document.getElementById("toGoPage").value;if(toPaggeVlue == ''){document.getElementById("toGoPage").value=1;return;}if(isNaN(Number(toPaggeVlue))){document.getElementById("toGoPage").value=1;return;}nextPage(toPaggeVlue);}
</script>
</div></td>
						</tr>
					</table>
					</div>
					</form>
					
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
			
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='http://localhost:8080/static/ace/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='http://localhost:8080/static/ace/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='http://localhost:8080/static/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="static/ace/js/bootstrap.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = 'http://localhost:8080/command/goAdd.do';
			 diag.Width = 650;
			 diag.Height = 279;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('1' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(1);
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "http://localhost:8080/command/delete.do?COMMAND_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(1);
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = 'http://localhost:8080/command/goEdit.do?COMMAND_ID='+Id;
			 diag.Width = 650;
			 diag.Height = 279;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(1);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		$(function() {
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}

			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
			
		});
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: 'http://localhost:8080/command/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(1);
									 });
								}
							});
						}
					}
				}
			});
		}
		
		//导出excel
		function toExcel(){
			window.location.href='http://localhost:8080/command/excel.do';
		}
		</script>
		
</body>
</html>

