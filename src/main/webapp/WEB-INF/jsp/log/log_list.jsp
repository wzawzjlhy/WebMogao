<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link
            href="${pageContext.request.contextPath }/static/assets/css/bootstrap.min.css"
            rel="stylesheet" />
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/css/style.css" />
    <link
            href="${pageContext.request.contextPath }/static/assets/css/codemirror.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/assets/css/colorbox.css">
    <!--图片相册-->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/assets/css/ace.min.css" />

    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <script
            src="${pageContext.request.contextPath }/static/js/jquery-1.9.1.min.js"></script>
    <script
            src="${pageContext.request.contextPath }/static/assets/js/jquery.colorbox-min.js"></script>
    <script
            src="${pageContext.request.contextPath }/static/assets/js/typeahead-bs2.min.js"></script>
    <script
            src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.min.js"></script>
    <script
            src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script
            src="${pageContext.request.contextPath }/static/assets/layer/layer.js"
            type="text/javascript"></script>


    <title>日志管理</title>
</head>
<body>

<br />
<div class=" page-content clearfix">

    <div id="products_style"></div>
    <div class="table_menu_list" id="testIframe">
        <table class="table table-striped table-bordered table-hover"
               id="sample-table">
            <thead>
            <tr>
                <th width="70px">时间</th>
                <th width="320px">日志內容</th>
                <th width="80px">日志操作ip</th>
                <th width="70px">日志模块</th>
                <th width="70px">日志描述</th>
                <th width="70px">日志操作用戶</th>




            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageBean.page_list }" var="c"
                       varStatus="status">
                <tr>
                    <td>${c.logTime }</td>

                    <td>${c.logContent }</td>

                    <td>${c.logIp }</td>
                    <td>${c.logModule}</td>
                    <td>${c.logDescription}

                    </td>
                    <td>${c.logUsername}</td>

                </tr>


            </c:forEach>

            </tbody>
        </table>

    </div>

</div>
</div>
</div>
</div>
<br />

<div class="page-content clearfix">
    <div class="sort_adsadd_style">
        <div class="border clearfix" style="margin-left: 35%;">
				<span class="l_f"><a href="javascript:ovid()"
                                     onClick="javascript :history.back(-1);" class="btn btn-info"><i
                        class="fa fa-reply"></i> 返回上一步</a> </span> <span class="r_f">本页共：<b>${fn:length(pageBean.page_list)}</b>&nbsp;&nbsp;条记录
					&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					第${pageBean.page_current }页/${pageBean.page_total }页 <c:if
                    test="${pageBean.page_current!=1 }">
						<a
                                href="${ pageContext.request.contextPath }/log/findAll?page=1&size=10">首页</a>|
                <a
                        href="${ pageContext.request.contextPath }/log/findAll?size=10&page=${pageBean.page_current-1}">上一页</a>|

            </c:if> <c:if test="${pageBean.page_current!=pageBean.page_total}">
						<a
                                href="${ pageContext.request.contextPath }/log/findAll?size=10&page=${pageBean.page_current+1}">下一页</a>|
                <a
                        href="${ pageContext.request.contextPath}/log/findAll?size=10&page=${pageBean.page_total}">尾页</a>|

            </c:if></span>
        </div>




    </div>
</div>

</div>

</body>
</html>


</script>