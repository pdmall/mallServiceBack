/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-04-18 08:07:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.tools;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class email_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/system/tools/../index/top.jsp", Long.valueOf(1524036862138L));
    _jspx_dependants.put("/WEB-INF/jsp/system/tools/../index/foot.jsp", Long.valueOf(1504314938000L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
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
      out.write("\t\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t#dialog-add,#dialog-message,#dialog-comment{width:100%; height:100%; position:fixed; top:0px; z-index:99999999; display:none;}\r\n");
      out.write("\t.commitopacity{position:absolute; width:100%; height:10000px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}\r\n");
      out.write("\t.commitbox{width:100%; margin:0px auto; position:absolute; top:120px; z-index:99999;}\r\n");
      out.write("\t.commitbox_inner{width:96%; height:255px;  margin:6px auto; background:#efefef; border-radius:5px;}\r\n");
      out.write("\t.commitbox_top{width:100%; height:253px; margin-bottom:10px; padding-top:10px; background:#FFF; border-radius:5px; box-shadow:1px 1px 3px #e8e8e8;}\r\n");
      out.write("\t.commitbox_top textarea{width:95%; height:195px; display:block; margin:0px auto; border:0px;}\r\n");
      out.write("\t.commitbox_cen{width:95%; height:40px; padding-top:10px;}\r\n");
      out.write("\t.commitbox_cen div.left{float:left;background-size:15px; background-position:0px 3px; padding-left:18px; color:#f77500; font-size:16px; line-height:27px;}\r\n");
      out.write("\t.commitbox_cen div.left img{width:30px;}\r\n");
      out.write("\t.commitbox_cen div.right{float:right; margin-top:7px;}\r\n");
      out.write("\t.commitbox_cen div.right span{cursor:pointer;}\r\n");
      out.write("\t.commitbox_cen div.right span.save{border:solid 1px #c7c7c7; background:#6FB3E0; border-radius:3px; color:#FFF; padding:5px 10px;}\r\n");
      out.write("\t.commitbox_cen div.right span.quxiao{border:solid 1px #f77400; background:#f77400; border-radius:3px; color:#FFF; padding:4px 9px;}\r\n");
      out.write("\t</style>\r\n");
      out.write("\t\r\n");
      out.write("\t</head> \r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<!-- 编辑邮箱  -->\r\n");
      out.write("<div id=\"dialog-add\">\r\n");
      out.write("\t<div class=\"commitopacity\"></div>\r\n");
      out.write("  \t<div class=\"commitbox\">\r\n");
      out.write("\t  \t<div class=\"commitbox_inner\">\r\n");
      out.write("\t        <div class=\"commitbox_top\">\r\n");
      out.write("\t        \t<textarea name=\"EMAILs\" id=\"EMAILs\" placeholder=\"请选输入对方邮箱,多个请用(;)分号隔开\" title=\"请选输入对方邮箱,多个请用(;)分号隔开\"></textarea>\r\n");
      out.write("\t            <div class=\"commitbox_cen\">\r\n");
      out.write("\t                <div class=\"left\" id=\"cityname\"></div>\r\n");
      out.write("\t                <div class=\"right\"><span class=\"save\" onClick=\"saveEmail()\">保存</span>&nbsp;&nbsp;<span class=\"quxiao\" onClick=\"cancel_pl()\">取消</span></div>\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t        </div>\r\n");
      out.write("\t  \t</div>\r\n");
      out.write("  \t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\t\r\n");
      out.write("<!-- /section:basics/navbar.layout -->\r\n");
      out.write("<div class=\"main-container\" id=\"main-container\">\r\n");
      out.write("\t<!-- /section:basics/sidebar -->\r\n");
      out.write("\t<div class=\"main-content\">\r\n");
      out.write("\t\t<div class=\"main-content-inner\">\r\n");
      out.write("\t\t\t<div class=\"page-content\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-12\">\t\t\r\n");
      out.write("\t\t\t\t \t<div class=\"span12\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"widget-box\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"widget-header widget-header-blue widget-header-flat wi1dget-header-large\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h4 class=\"lighter\">发送邮件</h4>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"widget-body\">\r\n");
      out.write("\t\t\t\t\t\t\t <div class=\"widget-main\">\r\n");
      out.write("\t\t\t\t\t\t\t <div class=\"step-content row-fluid position-relative\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"zhongxin\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<textarea name=\"CONTENT\" id=\"CONTENT\" style=\"display:none\" ></textarea>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"TYPE\" id=\"TYPE\" value=\"1\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"isAll\" id=\"isAll\" value=\"no\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t<table style=\"width:100%;\" id=\"xtable\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td style=\"margin-top:0px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t <div style=\"float: left;width:88%\"><textarea name=\"EMAIL\" id=\"EMAIL\" rows=\"1\" cols=\"50\" style=\"width:100%;height:35px;\" placeholder=\"请选输入对方邮箱,多个请用(;)分号隔开\" title=\"请选输入对方邮箱,多个请用(;)分号隔开\"></textarea></div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t <div style=\"float: right;width:10%;\"><a class='btn btn-mini btn-info' title=\"编辑邮箱\" onclick=\"dialog_open();\"><i class='ace-icon fa fa-pencil-square-o bigger-120'></i></a></div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t <input type=\"text\" name=\"TITLE\" id=\"TITLE\" value=\"\" placeholder=\"请选输入邮件标题\" style=\"width:95%\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td id=\"nr\" style=\"padding-top: 5px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t <script id=\"editor\" type=\"text/plain\" style=\"width:96%;height:259px;\"></script>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td style=\"text-align: center;padding-top: 5px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a class=\"btn btn-mini btn-primary\" onclick=\"sendEm();\">发送</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<label style=\"float:left;padding-left: 32px;\"><input name=\"form-field-radio\" id=\"form-field-radio1\" onclick=\"setType('1');\" checked=\"checked\" type=\"radio\" value=\"icon-edit\" class=\"ace\"><span class=\"lbl\">纯文本</span></label>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<label style=\"float:left;padding-left: 5px;\"><input name=\"form-field-radio\" id=\"form-field-radio2\" onclick=\"setType('2');\" type=\"radio\" value=\"icon-edit\" class=\"ace\" /><span class=\"lbl\">带标签</span></label>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<label style=\"float:left;padding-left: 15px;\"><input name=\"form-field-checkbox\" type=\"checkbox\" id=\"allusers\" onclick=\"isAll();\" class=\"ace\" /><span class=\"lbl\">全体用户</span></label>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"zhongxin2\" class=\"center\" style=\"display:none\"><br/><img src=\"static/images/jzx.gif\" id='msg' /><br/><h4 class=\"lighter block green\" id='msg'>正在发送...</h4><strong id=\"second_shows\" class=\"red\">6秒</strong>后关闭</div>\r\n");
      out.write("\t\t\t\t\t\t\t </div> \r\n");
      out.write("\t\t\t\t\t\t\t </div><!--/widget-main-->\r\n");
      out.write("\t\t\t\t\t\t\t</div><!--/widget-body-->\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!-- /.col -->\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-- /.row -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!-- /.page-content -->\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- /.main-content -->\r\n");
      out.write("\r\n");
      out.write("\t<!-- 返回顶部 -->\r\n");
      out.write("\t<a href=\"#\" id=\"btn-scroll-up\" class=\"btn-scroll-up btn btn-sm btn-inverse\">\r\n");
      out.write("\t\t<i class=\"ace-icon fa fa-angle-double-up icon-only bigger-110\"></i>\r\n");
      out.write("\t</a>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- /.main-container -->\r\n");
      out.write("<!-- basic scripts -->\r\n");
      out.write("<!-- 页面底部js¨ -->\r\n");
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
      out.write("<!-- ace scripts -->\r\n");
      out.write("<script src=\"static/ace/js/ace/ace.js\"></script>\r\n");
      out.write("<!-- 编辑框-->\r\n");
      out.write("<script type=\"text/javascript\" charset=\"utf-8\">window.UEDITOR_HOME_URL = \"");
      out.print(path);
      out.write("/plugins/ueditor/\";</script>\r\n");
      out.write("<script type=\"text/javascript\" charset=\"utf-8\" src=\"plugins/ueditor/ueditor.config.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" charset=\"utf-8\" src=\"plugins/ueditor/ueditor.all.js\"></script>\r\n");
      out.write("<!-- 编辑框-->\r\n");
      out.write("\r\n");
      out.write("<!--提示框-->\r\n");
      out.write("<script type=\"text/javascript\" src=\"static/js/jquery.tips.js\"></script>\r\n");
      out.write("<!--引入属于此页面的js -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"static/js/myjs/toolEmail.js\"></script>\t\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(top.hangge());\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
}
