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


    <title></title>
</head>
<body>
<div style="margin-left: 30%;">
    <div class=" clearfix">
        <div id="add_brand" class="clearfix">
            <div class="left_add">
                <form
                        action="${pageContext.request.contextPath }/course/addcourse"  enctype="multipart/form-data"
                        method="post">

                    <ul class="add_conent">
                        <br/>

                        <li class=" clearfix"><span
                                style="color: red">管理员添加课程！</span></li>
                        <br />
                        <li class=" clearfix"><span
                                style="color: red">  <font color="red">${message}</font></span></li>
                        <br />
                        <li class=" clearfix"><label class="label_name"><i>*</i>请输入课程名称</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cname"  style="width: 280px" type="text" class="add_text" /></li>
                        <br />
                        <li class=" clearfix"><label class="label_name"><i>*</i>请输入课程分数</label>
                            <input name="credit"  style="width: 280px" type="text" class="add_text" /></li>
                        <br />
                        <li class=" clearfix"><label class="label_name"><i>*</i>请选择课程开课时间</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cdate" type="date" class="add_text"
                                                                       style="width: 280px" /></li>

                        <br />
                        <li class=" clearfix"><label class="label_name"><i>*</i>请添加课程在线视频</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="file" type="file" class="add_text"
                                                                       style="width: 280px" /></li>

                        <br />





                    </ul>

                    <input id="su" type="submit" value="确认添加"
                           class="btn btn-xs btn-success" style="margin-left: 13%;">
                </form>
            </div>
        </div>



    </div>
</div>

</div>
</body>
</html>

</script>