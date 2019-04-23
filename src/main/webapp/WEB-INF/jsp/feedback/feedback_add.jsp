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


<title>企业项目跟踪管理系统</title>
</head>
<body>
	<div style="margin-left: 30%;">
		<div class=" clearfix">
			<div id="add_brand" class="clearfix">
				<div class="left_add">
					<form
						action="${pageContext.request.contextPath }/feedback/add"
						method="post">
						<ul class="add_conent">
							<li class=" clearfix"><label class="label_name"><i></i><span
									style="color: red">为了更好的使用系统，欢迎你添加使用功能后的相关反馈，谢谢！</span></label></li>
							<br />
							
							<br />
							<li class=" clearfix"><label class="label_name"><i>*</i>请选择反馈类别</label>
								&nbsp;&nbsp; <select name="type">
									<option value="bug">bug</option>
									<option value="建议">建议</option>
									<option value="需求">需求</option>
							</select></li>
							<br />
							<li class=" clearfix"><label class="label_name"><i>*</i>请输入联系号码
							</label> <input name="telephone" type="text"
								class="add_text" /></li>
							<br />
							<li class=" clearfix"><label class="label_name"> <i>*</i>请在下方输入反馈内容
							<br/><br/>
							<textarea rows="10px" cols="100px" name="content"></textarea>
								
							
						</ul>

						<input id="su" type="submit" value="提交反馈"
							class="btn btn-xs btn-success" style="margin-left: 13%;">
					</form>
				</div>
			</div>${message }


		</div>
	</div>

	</div>
</body>
</html>
