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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/pageoffice.js" id="po_js_main"></script>
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
<form action="${pageContext.request.contextPath }/admin/shenpi" method="post">
					<ul class="add_conent">
						<li class=" clearfix"><label class="label_name"><i></i><span
								style="color: red">查看相关信息审批该项目立项！</span></label></li>
						<br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目立项编码:</label>
							${pro.code }</li>
						<br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目名称:</label>
							${pro.name }</li>

						<br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目类型:</label>
							${pro.type }</li>
						<br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目预算经费(<font
								color="red">元</font>):</label> ${pro.money }</li>
						<br />
						<li class=" clearfix"><label class="label_name"> <i>*</i>申请的企业项目开发部门:
						</label> ${pro.department }</li>
						<li class=" clearfix"></li>


						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目开发组长:</label>
							${pro.groupleader }</li>
						<br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目开发组员:

								${pro. groupmember} </label> <br /> <br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目周期预算天数(<font
								color="red">天</font>):</label> ${pro.cyclesum }</li>
						<br />
						<br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的立项申请书资料:</label>
							<input type="button" value="在线查看该项目立项申请书" class="btn btn-success"
							onclick="window.open('${pageContext.request.contextPath}/word?code=2&filename=${pro.code}-ApplicationForApprovalc','width=1200px;height=800px;');" />
							<input type="button" class="btn btn-info"
								   onclick="javascript:window.location.href='${pageContext.request.contextPath}/projectapplication/download?fileName=${pro.code}-ApplicationForApproval.doc'" 							value="下载该项目立项申请书" /></li>
						<br />
						<br />
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的需求分析资料:</label>&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-success" value="在线查看该项目需求分析书"
							onclick="window.open('${pageContext.request.contextPath}/word?code=1&filename=${pro.code}-RequirementAnalysisc','width=1200px;height=800px;');" />
							<input type="button" class="btn btn-info"
								   onclick="javascript:window.location.href='${pageContext.request.contextPath}/projectapplication/download?fileName=${pro.code}-RequirementAnalysis.doc'"
							value="下载该项目需求分析书" /></li>
						<li class=" clearfix"><label class="label_name"><i>*</i>申请的企业项目开发组长:</label>
							${pro.groupleader }</li>
						<br />

					</ul>
					<input type="hidden" name="id" value="${pro.id }" />
					<li class=" clearfix"><label class="label_name"><i>*</i>审批详情:</label>

						<textarea rows="10px" cols="100px" name="content"></textarea></li>
					<li class=" clearfix"><label class="label_name"><i>*</i>审批意见:</label>

						审批通过 <input checked="checked" type="radio" name="statu" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;

						<font color="red">审批不通过</font> <input type="radio" name="statu"
						value="2" /></li> <br /> <input id="su" type="submit" value="提交审批"
						class="btn btn-xs btn-success" style="margin-left: 13%;">

				</div>
			</div>
</form>



		</div>
	</div>

	</div>
</body>
</html>
