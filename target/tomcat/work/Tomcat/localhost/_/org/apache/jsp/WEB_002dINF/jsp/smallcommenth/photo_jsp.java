/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-06-05 09:29:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.smallcommenth;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class photo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/jsp/smallcommenth/../system/index/top.jsp", Long.valueOf(1524036862138L));
    _jspx_dependants.put("/WEB-INF/jsp/smallcommenth/../system/index/foot.jsp", Long.valueOf(1504314938000L));
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
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
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
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("                             <!--*******************查看微信头像界面 *********************->\r\n");
      out.write("                             \r\n");
      out.write("\r\n");
      out.write("\t<!-- /section:basics/navbar.layout -->\r\n");
      out.write("\t<div class=\"main-container\" id=\"main-container\">\r\n");
      out.write("\t\t<!-- /section:basics/sidebar -->\r\n");
      out.write("\t\t<div class=\"main-content\">\r\n");
      out.write("\t\t\t<div class=\"main-content-inner\">\r\n");
      out.write("\t\t\t\t<div class=\"page-content\">\r\n");
      out.write("\t\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-xs-12\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"span12\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"widget-box\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"widget-body\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"widget-main\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"step-content row-fluid position-relative\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div id=\"zhongxin\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div   width=\"450\" height=\"450\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t \t<img :src=\"photo\"  width=\"350\" height=\"350\" style=\"margin-left: -9px; margin-top: -3px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<!--/widget-main-->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<!--/widget-body-->\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- /.col -->\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!-- /.row -->\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-- /.page-content -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- /.main-content -->\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 返回顶部 -->\r\n");
      out.write("\t\t<a href=\"#\" id=\"btn-scroll-up\" class=\"btn-scroll-up btn btn-sm btn-inverse\">\r\n");
      out.write("\t\t\t<i class=\"ace-icon fa fa-angle-double-up icon-only bigger-110\"></i>\r\n");
      out.write("\t\t</a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- /.main-container -->\r\n");
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
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<script src=\"static/vue.js\"></script>\r\n");
      out.write("\t<script src=\"static/vue-resource.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"static/js/jquery.tips.js\"></script>\r\n");
      out.write("\t<script src=\"static/ace/js/ace/ace.js\"></script>\r\n");
      out.write("\t<!--引入属于此页面的js -->\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"static/js/myjs/toolEmail.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"plugins/webuploader/webuploader.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"plugins/webuploader/upload.js\"></script>\r\n");
      out.write("\t<!-- 引入图片服务器地址 -->\r\n");
      out.write("\t<!-- <script type=\"text/javascript\" src=\"static/imgurl.js\"></script> -->\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t   var photo= localStorage.getItem(\"pdtphoto\");\r\n");
      out.write("\t   var pdtBanner= new Vue({  \r\n");
      out.write("\t        el: '#zhongxin',\r\n");
      out.write("\t        data: {\r\n");
      out.write("\t         \t photo:'',\r\n");
      out.write("\t\t   \t\t photos : [],\r\n");
      out.write("\t\t   \t\t// aaa:imgurlaaa,\r\n");
      out.write("\t        },\r\n");
      out.write("\t        created:function(){\r\n");
      out.write("\t        \tthis.photo=photo;\r\n");
      out.write("\t        },\r\n");
      out.write("\t        methods:{\r\n");
      out.write("\t        \t\r\n");
      out.write("\t        \t\r\n");
      out.write("\t        }\r\n");
      out.write("\t      })  \r\n");
      out.write("\t     function  ab(){\r\n");
      out.write("\t\t   var a=$(\"#a\").val();\r\n");
      out.write("\t\t   var b=$(\"#b\").val();\t\t   \r\n");
      out.write("\t\t   pdtBanner.abc.push({\r\n");
      out.write("\t\t\t   a:a,\r\n");
      out.write("\t\t\t   b:b,\r\n");
      out.write("\t\t   })\r\n");
      out.write("\t\t   $(\"#a\").val(\"\");\r\n");
      out.write("\t\t   $(\"#b\").val(\"\");\r\n");
      out.write("\t\t   alert($(\"#a\").val());\r\n");
      out.write("\t\t   alert(a)\r\n");
      out.write("\t   }\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//保存\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction getLocalTimeHMS(date2) {\r\n");
      out.write("\t\t\tvar date = new Date(date2);\r\n");
      out.write("\t\t\tvar Y = date.getFullYear() + '-';\r\n");
      out.write("\t\t\tvar M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1)\r\n");
      out.write("\t\t\t\t\t: date.getMonth() + 1)\r\n");
      out.write("\t\t\t\t\t+ '-';\r\n");
      out.write("\t\t\tvar D = date.getDate() + ' ';\r\n");
      out.write("\t\t\tvar h = date.getHours() + ':';\r\n");
      out.write("\t\t\tvar m = date.getMinutes() + ':';\r\n");
      out.write("\t\t\tvar s = date.getSeconds();\r\n");
      out.write("\t\t\treturn Y + M + D + h + m + s;\r\n");
      out.write("\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t/*关闭窗口*/\r\n");
      out.write("\t\tfunction CloseWebPage() {     \r\n");
      out.write("\t\t    if (navigator.userAgent.indexOf(\"MSIE\") > 0) {     \r\n");
      out.write("\t\t        if (navigator.userAgent.indexOf(\"MSIE 6.0\") > 0) {     \r\n");
      out.write("\t\t            window.opener = null; window.close();     \r\n");
      out.write("\t\t        }     \r\n");
      out.write("\t\t        else {     \r\n");
      out.write("\t\t            window.open('', '_top'); window.top.close();     \r\n");
      out.write("\t\t        }     \r\n");
      out.write("\t\t    }     \r\n");
      out.write("\t\t    else if (navigator.userAgent.indexOf(\"Firefox\") > 0) {     \r\n");
      out.write("\t\t        window.location.href = 'about:blank '; //火狐默认状态非window.open的页面window.close是无效的    \r\n");
      out.write("\t\t        //window.history.go(-2);     \r\n");
      out.write("\t\t    }     \r\n");
      out.write("\t\t    else {     \r\n");
      out.write("\t\t        window.opener = null;      \r\n");
      out.write("\t\t        window.open('', '_self', '');     \r\n");
      out.write("\t\t        window.close();     \r\n");
      out.write("\t\t    }     \r\n");
      out.write("\t\t}  \r\n");
      out.write("\t\t\r\n");
      out.write("\t\t \r\n");
      out.write("\t</script>\r\n");
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
