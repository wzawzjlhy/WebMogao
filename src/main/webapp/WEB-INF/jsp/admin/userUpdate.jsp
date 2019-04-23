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


<title>慕课平台管理系统</title>
</head>
<body>
	<div style="margin-left: 30%;">
		<div class=" clearfix">
			<div id="add_brand" class="clearfix">
				<div class="left_add">
					<form
						action="${pageContext.request.contextPath }/admin/updateuser"
						method="post">
						<ul class="add_conent">
						<br/>
							<li class=" clearfix">修改用户:<span
									style="color: red">${user.account }</span></label></li>
							<br />
							<li class=" clearfix"><label class="label_name"><i>*</i>用户账号</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input readonly="readonly" value="${user.account }" name="account"  style="width: 280px" type="text" class="add_text" /></li>
							<br />
							<li class=" clearfix"><label class="label_name"><i>*</i>用户姓名</label>
								<input name="name" value="${user.name }"  style="width: 280px" type="text" class="add_text" /></li>
							<br />
							<li class=" clearfix"><label class="label_name"><i>*</i>用户手机号</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input value="${user.telephone }" name="telephone" type="text" class="add_text"
								style="width: 280px" /></li>

							<br />
							<input type="hidden" name="id" value="${user.id }" />
							<input type="hidden" name="password" value="${user.password }" />
								<input type="hidden" name="distributiontime" value="${user.distributiontime}" />
									<input type="hidden" name="lastlogintime" value="${user.lastlogintime }" />
							<li class=" clearfix"><label class="label_name"><i>*</i>用户职位</label>
									<input name="position" value="${user.position }" type="text" class="add_text"
								style="width: 280px" /></li>
								
							<br />    
							<li class=" clearfix"><label class="label_name"><i>*</i>用户登录状态</label>
									<c:if test="${user.status  eq '0'}">
									允许登录<input type="radio" name="status" value="0" checked="checked"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<font color="red">禁止登录</font><input type="radio" name="status" value="1"/>
									
									</c:if>
									<c:if test="${user.status  eq '1'}">
									
									允许登录<input type="radio" name="status" value="0"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
									<font color="red">禁止登录</font><input type="radio" name="status" value="1" checked="checked"/>
									</c:if>
									
									</li>
								
							<br />  
							
								
							

						</ul>

						<input id="su" type="submit" value="确认修改"
							class="btn btn-xs btn-success" style="margin-left: 13%;">
					</form>
				</div>
			</div>${message }

			<!--列表样式-->


		</div>
	</div>

	</div>
</body>
</html>
