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
<meta charset="utf-8" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<style type="text/css">
div#rMenu {
	position: absolute;
	visibility: hidden;
	top: 0;
	text-align: left;
	padding: 4px;
}

div#rMenu a {
	padding: 3px 15px 3px 15px;
	background-color: #cad4e6;
	vertical-align: middle;
}
</style>
<link rel="stylesheet" type="text/css" href="static/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="static/jquery-easyui-1.4.1/themes/icon.css" />
<body>
	<div style="background:#FFFFFF;width:800px;height: 555px;">

	<table style="width: 100%;" border="0">
		<tr>
			<td style="width: 15%;"  valign="top" bgcolor="#F9F9F9">
				<div style="width: 15%;">
					<ul id="leftTree" class="easyui-tree"></ul>
				</div>
			</td>
			<td style="width: 85%;" valign="top"><!-- <iframe name="treeFrame" id="treeFrame" frameborder="0" src="" style="margin: 0 auto; width: 100%; height: 700px;">
		        </iframe> -->
		        <h2>添加一级分类</h2>
		<label style="font-size: 20px;">类目名称</label> <input type="text"
			style="height: 30px;" id="typeName">
		<button onclick="addType();" style="height: 30px;">添加</button>
		</td>
		</tr>
	</table>
	<div id="leftTreeMenu" class="easyui-menu" style="width: 120px;" data-options="onClick:menuHandler">
	<div data-options="iconCls:'icon-add',name:'add'">添加</div>
	<div data-options="iconCls:'icon-remove',name:'rename'">重命名</div>
	<div data-options="iconCls:'icon-remove',name:'isRecommendTrue'">推荐</div>
	<div data-options="iconCls:'icon-remove',name:'isRecommendFalse'">取消推荐</div>
	<div class="menu-sep"></div>
	<div data-options="iconCls:'icon-remove',name:'delete'">删除</div>
</div>
</div>
<script type="text/javascript" src="static/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="static/three.js"></script>
<script type="text/javascript" src="static/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/datagrid-detailview.js"></script>
	<script type="text/javascript">
	var pId = localStorage.getItem("shopIds");
	
	function addType(){
		
	  var typeTitle=$("#typeName").val();
	    if(typeTitle==""){
	 	   alert("请输入内容再提交！");
	 	   return;
	    }
	    $.ajax({
	 	 url:"<%=request.getContextPath()%>/product/type/addPdtType",
				type : "POST",
				data : {
					pId : pId,
					text : typeTitle,
					state:'open'
				},
				statusCode : {
					201 : function() {
						$("#typeName").val("");
						$("#leftTree").tree("reload");
					},
					409 : function() {
						alert("类目已经存在");
						$("#typeName").val("");
					},
					500 : function() {
						alert("登陆失败");
					}

				}

			})
		}
	
		$(top.hangge());
				$(function() {
					$("#leftTree").tree({
						url : '<%=basePath%>/product/type/getListTypeByParentId?id='+pId,
						animate : true,
						method : "GET",
						onContextMenu : function(e, node) {
							console.log(node.target)
							e.preventDefault();
							$(this).tree('select', node.target);
							$('#leftTreeMenu').menu('show', {
								left : e.pageX,
								top : e.pageY
							});
						},
						onAfterEdit : function(node) {
							var _tree = $(this);
							var state='open';
							if(node.pId==0){
								state='closed';
							}
							if (node.id == 0) {
								// 新增节点
								$.post("<%=request.getContextPath()%>/product/type/addPdtType", {
									pId : node.pId,
									text : node.text,
									state:state
								}, function(data) {
									_tree.tree("update", {
										target : node.target,
										id : data.id+1
									});
								});
							} else {
								$.post("<%=request.getContextPath()%>/product/type/updatePdtType", {
									pId : node.pId,
									id:node.id,
									text : node.text,
									state:state
								});
							}
						}
					});
				});
				function menuHandler(item) {
					var tree = $("#leftTree");
					var node = tree.tree("getSelected");
					if (item.name === "add") {
						tree.tree('append', {
							parent : (node ? node.target : null),
							data : [ {
								text : '新建分类',
								id : 0,
								pId : node.id,
								state:'open'
							} ]
						});
						var _node = tree.tree('find', 0);
						tree.tree("select", _node.target).tree('beginEdit', _node.target);
					} else if (item.name === "rename") {
						tree.tree('beginEdit', node.target);
					} else if (item.name === "isRecommendTrue") {
						$.ajax({
							url:'<%=request.getContextPath()%>/product/type/updatePdtTypeIsRecommend',
						    type:'POST',
						    data:{
						    	id:node.id,
						    	isRecommend:1
						    },
						    success:function(){
						    	$.messager.show({
						    		title:'提示',
						    	    msg:'推荐成功'
						    	})
						    },
						    error:function(){
						    	
						    }
						})
						
					} else if (item.name === "isRecommendFalse") {
						
						$.ajax({
							url:'<%=request.getContextPath()%>/product/type/updatePdtTypeIsRecommend',
						    type:'POST',
						    data:{
						    	id:node.id,
						    	isRecommend:0
						    },
						    success:function(){
						    	$.messager.show({
						    		title:'提示',
						    	    msg:'取消推荐成功'
						    	})
						    },
						    error:function(){
						    	
						    }
						})
						
					} else if (item.name === "delete") {
						$.messager.confirm('确认', '确定删除名为 ' + node.text + ' 的分类吗？',
								function(r) {
									if (r) {
										$.ajax({
											type : "POST",
											url : "<%=request.getContextPath()%>/product/type/deleteByTypeId",
											data : {
														typeId : node.id,
														"_method" : "DELETE"
													},
													success : function(msg) {
														//$.messager.alert('提示','新增商品成功!');
														tree.tree("remove",
																node.target);
													},
													error : function() {
														$.messager.alert('提示',
																'删除失败!');
													}
												});
									}
								});
			}
		}
				
				function isRecommend(is,id){
					$.ajax({
						url:'',
						type:'POST',
						data:{
							id:id,
							isRecommend:is
						},
						success:function(){
							
						},
						error:function(){
							
						}
					})
				}
				
	</SCRIPT>
</body>
</html>

