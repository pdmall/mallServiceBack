/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-04-18 08:05:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.onlinemanager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class onlinemanager_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/onlinemanager/../index/foot.jsp", Long.valueOf(1504314938000L));
    _jspx_dependants.put("/WEB-INF/jsp/system/onlinemanager/../index/top.jsp", Long.valueOf(1524036862138L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("<!-- jsp文件头和头部 -->\r\n");
      out.write("\t\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("\t\t<meta charset=\"utf-8\" />\r\n");
      out.write("\t\t<title>小众点评</title>\r\n");
      out.write("\t\t<meta name=\"description\" content=\"\" />\r\n");
      out.write("\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0\" />\r\n");
      out.write("\t\t<!-- bootstrap & fontawesome -->\r\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"static/ace/css/bootstrap.css\" />\r\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"static/ace/css/font-awesome.css\" />\r\n");
      out.write("\t\t<!-- page specific plugin styles -->\r\n");
      out.write("\t\t<!-- text fonts -->\r\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"static/ace/css/ace-fonts.css\" />\r\n");
      out.write("\t\t<!-- ace styles -->\r\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"static/ace/css/ace.css\" class=\"ace-main-stylesheet\" id=\"main-ace-style\" />\r\n");
      out.write("\t\t<!--[if lte IE 9]>\r\n");
      out.write("\t\t\t<link rel=\"stylesheet\" href=\"static/ace/css/ace-part2.css\" class=\"ace-main-stylesheet\" />\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\t\t<!--[if lte IE 9]>\r\n");
      out.write("\t\t  <link rel=\"stylesheet\" href=\"static/ace/css/ace-ie.css\" />\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\t\t<!-- inline styles related to this page -->\r\n");
      out.write("\t\t<!-- ace settings handler -->\r\n");
      out.write("\t\t<script src=\"static/ace/js/ace-extra.js\"></script>\r\n");
      out.write("\t\t<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->\r\n");
      out.write("\t\t<!--[if lte IE 8]>\r\n");
      out.write("\t\t<script src=\"static/ace/js/html5shiv.js\"></script>\r\n");
      out.write("\t\t<script src=\"static/ace/js/respond.js\"></script>\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"no-skin\">\r\n");
      out.write("\r\n");
      out.write("\t<!-- /section:basics/navbar.layout -->\r\n");
      out.write("\t<div class=\"main-container\" id=\"main-container\">\r\n");
      out.write("\t\t<!-- /section:basics/sidebar -->\r\n");
      out.write("\t\t<div class=\"main-content\">\r\n");
      out.write("\t\t\t<div class=\"main-content-inner\">\r\n");
      out.write("\t\t\t\t<div class=\"page-content\">\r\n");
      out.write("\t\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-xs-12\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t<table style=\"margin-top:10px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr bgcolor=\"#E0E0E0\" style=\"height:26px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"padding-left: 15px;\">在线人数：</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div style=\"width:39px;\" id=\"onlineCount\">0</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t<table id=\"simple-table\" class=\"table table-striped table-bordered table-hover\"  style=\"margin-top:5px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"center\" style=\"width: 30px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label><input class=\"ace\" type=\"checkbox\" id=\"zcheckbox\" /><span class=\"lbl\"></span></label>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class='center' style=\"width:50px;\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th>用户名</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"center\" style=\"width: 100px;\">操作</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<tbody id=\"userlist\">\r\n");
      out.write("\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t \t\t<div class=\"page-header position-relative\">\r\n");
      out.write("\t\t\t\t\t\t<table style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"vertical-align:top;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write(" \r\n");
      out.write(" \t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- /.col -->\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!-- /.row -->\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-- /.page-content -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- /.main-content -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 返回顶部 -->\r\n");
      out.write("\t\t<a href=\"#\" id=\"btn-scroll-up\" class=\"btn-scroll-up btn btn-sm btn-inverse\">\r\n");
      out.write("\t\t\t<i class=\"ace-icon fa fa-angle-double-up icon-only bigger-110\"></i>\r\n");
      out.write("\t\t</a>\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- /.main-container -->\r\n");
      out.write("\r\n");
      out.write("\t<!-- basic scripts -->\r\n");
      out.write("\t<!-- 页面底部js¨ -->\r\n");
      out.write("\t");
      out.write('	');
      out.write('	');

			String pathf = request.getContextPath();
			String basePathf = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ pathf + "/";
		
      out.write("\r\n");
      out.write("\t\t<!--[if !IE]> -->\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\twindow.jQuery || document.write(\"<script src='");
      out.print(basePathf);
      out.write("static/ace/js/jquery.js'>\"+\"<\"+\"/script>\");\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<!-- <![endif]-->\r\n");
      out.write("\t\t<!--[if IE]>\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t window.jQuery || document.write(\"<script src='");
      out.print(basePathf);
      out.write("static/ace/js/jquery1x.js'>\"+\"<\"+\"/script>\");\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\tif('ontouchstart' in document.documentElement) document.write(\"<script src='");
      out.print(basePathf);
      out.write("static/ace/js/jquery.mobile.custom.js'>\"+\"<\"+\"/script>\");\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<script src=\"static/ace/js/bootstrap.js\"></script>");
      out.write("\r\n");
      out.write("\t<!-- 删除时确认窗口 -->\r\n");
      out.write("\t<script src=\"static/ace/js/bootbox.js\"></script>\r\n");
      out.write("\t<!-- ace scripts -->\r\n");
      out.write("\t<script src=\"static/ace/js/ace/ace.js\"></script>\r\n");
      out.write("\t<!--提示框-->\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"static/js/jquery.tips.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t$(top.hangge());\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /WEB-INF/jsp/system/onlinemanager/onlinemanager_list.jsp(100,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${QX.cha == 1 }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t<script type=\"text/javascript\">\r\n");
          out.write("\t\t\r\n");
          out.write("\t\t//初始化\r\n");
          out.write("\t\t$(function(){\r\n");
          out.write("\t\t\tonline();\r\n");
          out.write("\t\t\t//复选框全选控制\r\n");
          out.write("\t\t\tvar active_class = 'active';\r\n");
          out.write("\t\t\t$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){\r\n");
          out.write("\t\t\t\tvar th_checked = this.checked;//checkbox inside \"TH\" table header\r\n");
          out.write("\t\t\t\t$(this).closest('table').find('tbody > tr').each(function(){\r\n");
          out.write("\t\t\t\t\tvar row = this;\r\n");
          out.write("\t\t\t\t\tif(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);\r\n");
          out.write("\t\t\t\t\telse $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);\r\n");
          out.write("\t\t\t\t});\r\n");
          out.write("\t\t\t});\r\n");
          out.write("\t\t});\r\n");
          out.write("\t\t\r\n");
          out.write("\t\tvar websocketonline;//websocke对象\r\n");
          out.write("\t\tvar userCount = 0;\t//在线总数\r\n");
          out.write("\t\tfunction online(){\r\n");
          out.write("\t\t\tif (window.WebSocket) {\r\n");
          out.write("\t\t\t\twebsocketonline = new WebSocket(encodeURI('ws://'+top.oladress)); //oladress在main.jsp页面定义\r\n");
          out.write("\t\t\t\twebsocketonline.onopen = function() {\r\n");
          out.write("\t\t\t\t\twebsocketonline.send('[QQ728971035]fhadmin');//连接成功\r\n");
          out.write("\t\t\t\t};\r\n");
          out.write("\t\t\t\twebsocketonline.onerror = function() {\r\n");
          out.write("\t\t\t\t\t//连接失败\r\n");
          out.write("\t\t\t\t};\r\n");
          out.write("\t\t\t\twebsocketonline.onclose = function() {\r\n");
          out.write("\t\t\t\t\t//连接断开\r\n");
          out.write("\t\t\t\t};\r\n");
          out.write("\t\t\t\t//消息接收\r\n");
          out.write("\t\t\t\twebsocketonline.onmessage = function(message) {\r\n");
          out.write("\t\t\t\t\tvar message = JSON.parse(message.data);\r\n");
          out.write("\t\t\t\t\tif (message.type == 'count') {\r\n");
          out.write("\t\t\t\t\t\tuserCount = message.msg;\r\n");
          out.write("\t\t\t\t\t}else if(message.type == 'userlist'){\r\n");
          out.write("\t\t\t\t\t\t$(\"#userlist\").html('');\r\n");
          out.write("\t\t\t\t\t\t $.each(message.list, function(i, user){\r\n");
          out.write("\t\t\t\t\t\t\t $(\"#userlist\").append(\r\n");
          out.write("\t\t\t\t\t\t\t\t'<tr>'+\t \r\n");
          out.write("\t\t\t\t\t\t\t\t\t '<td class=\"center\">'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t'<label><input type=\"checkbox\" name=\"ids\" value=\"'+user+'\" class=\"ace\" /><span class=\"lbl\"></span></label>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t'</td>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t'<td class=\"center\">'+(i+1)+'</td>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t'<td><a onclick=\"editUser(\\''+user+'\\')\" style=\"cursor:pointer;\">'+user+'</a></td>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t'<td class=\"center\">'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t'<button class=\"btn btn-mini btn-danger\" onclick=\"goOutTUser(\\''+user+'\\')\">强制下线</button>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t'</td>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t'</tr>'\r\n");
          out.write("\t\t\t\t\t\t\t );\r\n");
          out.write("\t\t\t\t\t\t\t userCount = i+1;\r\n");
          out.write("\t\t\t\t\t\t });\r\n");
          out.write("\t\t\t\t\t\t $(\"#onlineCount\").html(userCount);\r\n");
          out.write("\t\t\t\t\t}else if(message.type == 'addUser'){\r\n");
          out.write("\t\t\t\t\t\t $(\"#userlist\").append(\r\n");
          out.write("\t\t\t\t\t\t\t'<tr>'+\t \r\n");
          out.write("\t\t\t\t\t\t\t\t '<td class=\"center\">'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t'<label><input type=\"checkbox\" name=\"ids\" value=\"'+message.user+'\" class=\"ace\" /><span class=\"lbl\"></span></label>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t'</td>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t'<td class=\"center\">'+(userCount+1)+'</td>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t'<td><a onclick=\"editUser(\\''+message.user+'\\')\" style=\"cursor:pointer;\">'+message.user+'</a></td>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t'<td class=\"center\">'+\r\n");
          out.write("\t\t\t\t\t\t\t\t\t'<button class=\"btn btn-mini btn-danger\" onclick=\"goOutTUser(\\''+message.user+'\\')\">强制下线</button>'+\r\n");
          out.write("\t\t\t\t\t\t\t\t'</td>'+\r\n");
          out.write("\t\t\t\t\t\t\t'</tr>'\r\n");
          out.write("\t\t\t\t\t\t);\r\n");
          out.write("\t\t\t\t\t\t userCount = userCount+1;\r\n");
          out.write("\t\t\t\t\t\t $(\"#onlineCount\").html(userCount);\r\n");
          out.write("\t\t\t\t\t}\r\n");
          out.write("\t\t\t\t};\r\n");
          out.write("\t\t\t}\r\n");
          out.write("\t\t}\r\n");
          out.write("\t\t\r\n");
          out.write("\t\t//强制某用户下线\r\n");
          out.write("\t\tfunction goOutUser(theuser){\r\n");
          out.write("\t\t\twebsocketonline.send('[goOut]'+theuser);\r\n");
          out.write("\t\t}\r\n");
          out.write("\t\t\r\n");
          out.write("\t\t//强制某用户下线\r\n");
          out.write("\t\tfunction goOutTUser(theuser){\r\n");
          out.write("\t\t\tif('admin' == theuser){\r\n");
          out.write("\t\t\t\tbootbox.dialog({\r\n");
          out.write("\t\t\t\t\tmessage: \"<span class='bigger-110'>不能强制下线admin用户!</span>\",\r\n");
          out.write("\t\t\t\t\tbuttons: \t\t\t\r\n");
          out.write("\t\t\t\t\t{ \"button\":{ \"label\":\"确定\", \"className\":\"btn-sm btn-success\"}}\r\n");
          out.write("\t\t\t\t});\r\n");
          out.write("\t\t\t\treturn;\r\n");
          out.write("\t\t\t}\r\n");
          out.write("\t\t\tbootbox.confirm(\"确定要强制[\"+theuser+\"]下线吗?\", function(result) {\r\n");
          out.write("\t\t\t\tif(result) {\r\n");
          out.write("\t\t\t\t\tgoOutUser(theuser);\r\n");
          out.write("\t\t\t\t}\r\n");
          out.write("\t\t\t});\r\n");
          out.write("\t\t}\r\n");
          out.write("\t\t\r\n");
          out.write("\t\t//查看修改用户\r\n");
          out.write("\t\tfunction editUser(USERNAME){\r\n");
          out.write("\t\t\tif('admin' == USERNAME){\r\n");
          out.write("\t\t\t\tbootbox.dialog({\r\n");
          out.write("\t\t\t\t\tmessage: \"<span class='bigger-110'>不能查看修改admin用户!</span>\",\r\n");
          out.write("\t\t\t\t\tbuttons: \t\t\t\r\n");
          out.write("\t\t\t\t\t{ \"button\":{ \"label\":\"确定\", \"className\":\"btn-sm btn-success\"}}\r\n");
          out.write("\t\t\t\t});\r\n");
          out.write("\t\t\t\treturn;\r\n");
          out.write("\t\t\t}\r\n");
          out.write("\t\t\t top.jzts();\r\n");
          out.write("\t\t\t var diag = new top.Dialog();\r\n");
          out.write("\t\t\t diag.Drag=true;\r\n");
          out.write("\t\t\t diag.Title =\"资料\";\r\n");
          out.write("\t\t\t diag.URL = '");
          out.print(basePath);
          out.write("user/goEditUfromOnline.do?USERNAME='+USERNAME;\r\n");
          out.write("\t\t\t diag.Width = 469;\r\n");
          out.write("\t\t\t diag.Height = 510;\r\n");
          out.write("\t\t\t diag.CancelEvent = function(){ //关闭事件\r\n");
          out.write("\t\t\t\tdiag.close();\r\n");
          out.write("\t\t\t };\r\n");
          out.write("\t\t\t diag.show();\r\n");
          out.write("\t\t}\r\n");
          out.write("\t\t\r\n");
          out.write("\t\t//批量操作\r\n");
          out.write("\t\tfunction makeAll(msg){\r\n");
          out.write("\t\t\tbootbox.confirm(msg, function(result) {\r\n");
          out.write("\t\t\t\tif(result) {\r\n");
          out.write("\t\t\t\t\tvar str = '';\r\n");
          out.write("\t\t\t\t\tfor(var i=0;i < document.getElementsByName('ids').length;i++)\r\n");
          out.write("\t\t\t\t\t{\r\n");
          out.write("\t\t\t\t\t\t  if(document.getElementsByName('ids')[i].checked){\r\n");
          out.write("\t\t\t\t\t\t\t  if('admin' != document.getElementsByName('ids')[i].value){\r\n");
          out.write("\t\t\t\t\t\t\t\t  if(str=='') str += document.getElementsByName('ids')[i].value;\r\n");
          out.write("\t\t\t\t\t\t\t\t  else str += ',' + document.getElementsByName('ids')[i].value;\r\n");
          out.write("\t\t\t\t\t\t\t  }else{\r\n");
          out.write("\t\t\t\t\t\t\t\t  document.getElementsByName('ids')[i].checked  = false;\r\n");
          out.write("\t\t\t\t\t\t\t\t  $(\"#zcheckbox\").tips({\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\tside:3,\r\n");
          out.write("\t\t\t\t\t\t\t            msg:'admin用户不能强制下线',\r\n");
          out.write("\t\t\t\t\t\t\t            bg:'#AE81FF',\r\n");
          out.write("\t\t\t\t\t\t\t            time:5\r\n");
          out.write("\t\t\t\t\t\t\t        });\r\n");
          out.write("\t\t\t\t\t\t\t  }\r\n");
          out.write("\t\t\t\t\t\t  }\r\n");
          out.write("\t\t\t\t\t}\r\n");
          out.write("\t\t\t\t\tif(str==''){\r\n");
          out.write("\t\t\t\t\t\tbootbox.dialog({\r\n");
          out.write("\t\t\t\t\t\t\tmessage: \"<span class='bigger-110'>您没有选择任何用户!</span>\",\r\n");
          out.write("\t\t\t\t\t\t\tbuttons: \t\t\t\r\n");
          out.write("\t\t\t\t\t\t\t{ \"button\":{ \"label\":\"确定\", \"className\":\"btn-sm btn-success\"}}\r\n");
          out.write("\t\t\t\t\t\t});\r\n");
          out.write("\t\t\t\t\t\t$(\"#zcheckbox\").tips({\r\n");
          out.write("\t\t\t\t\t\t\tside:1,\r\n");
          out.write("\t\t\t\t            msg:'点这里全选',\r\n");
          out.write("\t\t\t\t            bg:'#AE81FF',\r\n");
          out.write("\t\t\t\t            time:3\r\n");
          out.write("\t\t\t\t        });\r\n");
          out.write("\t\t\t\t\t\treturn;\r\n");
          out.write("\t\t\t\t\t}else{\r\n");
          out.write("\t\t\t\t\t\ttop.jzts();\r\n");
          out.write("\t\t\t\t\t\tvar arField = str.split(',');\r\n");
          out.write("\t\t\t\t\t\tfor(var i=0;i<arField.length;i++){\r\n");
          out.write("\t\t\t\t\t\t\twebsocketonline.send('[goOut]'+arField[i]);\r\n");
          out.write("\t\t\t\t\t\t}\r\n");
          out.write("\t\t\t\t\t\ttop.hangge();\r\n");
          out.write("\t\t\t\t\t}\r\n");
          out.write("\t\t\t\t}\r\n");
          out.write("\t\t\t});\r\n");
          out.write("\t\t}\r\n");
          out.write("\t\t</script>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      out.write("\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/jsp/system/onlinemanager/onlinemanager_list.jsp(60,9) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${QX.del == 1 }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t\t\t\t\t\t<a title=\"批量强制下线\" class=\"btn btn-mini btn-danger\" onclick=\"makeAll('确定要把这些用户强制下线吗?');\" >强制下线</a>\r\n");
        out.write("\t\t\t\t\t\t\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f2.setParent(null);
    // /WEB-INF/jsp/system/onlinemanager/onlinemanager_list.jsp(268,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${QX.cha == 0 }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f2 = _jspx_th_c_005fif_005f2.doStartTag();
    if (_jspx_eval_c_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t<script type=\"text/javascript\">\r\n");
        out.write("\t\t\t\talert(\"您无权查看\");\r\n");
        out.write("\t\t\t</script>\r\n");
        out.write("\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
    return false;
  }
}