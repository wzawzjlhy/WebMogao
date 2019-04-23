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
	<br />
	<div class=" page-content clearfix">
		<div id="products_style"></div>
		<div class="table_menu_list" id="testIframe">
			<table class="table table-striped table-bordered table-hover"
				id="sample-table">
				<thead>
					<tr>
						<th width="80px">用户账号</th>
						<th width="80px">姓名</th>
						<th width="120px">账号分配时间</th>
						<th width="120px">用户最后登录系统时间</th>
						<th width="90px">手机号</th>
						<th width="80px">职位</th>
						<th width="70px">是否允许登录</th>
						<th width="100px">操作</th>



					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.page_list }" var="c"
						varStatus="status">
						<tr>
							<td>${c.account }</td>
							<td>${c.name }</td>

							<td>${c.distributiontime }</td>
							<td>${c.lastlogintime }</td>
							<td>${c.telephone }</td>
							<td>${c.position }</td>

							<td><c:if test="${c.status==0}">允许登陆</c:if> <c:if
									test="${c.status==1}"><font color="red">禁止登陆</font></c:if></td>



							<td class="td-manage"><a
								href="${pageContext.request.contextPath }/admin/updateUser?account=${c.account }"
								title="修改" class="btn btn-xs btn-success">修改</a>
							<a title="删除"
								href="#"
								onclick="funDeleteUser(${c.id})" class="btn btn-xs btn-warning">删除</a>
							</td>
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
							href="${ pageContext.request.contextPath }/admin/userList?page=1&size=5">首页</a>|
								<a
							href="${ pageContext.request.contextPath }/admin/userList?size=5&page=${pageBean.page_current-1}">上一页</a>|
							
    </c:if> <c:if test="${pageBean.page_current!=pageBean.page_total}">
						<a
							href="${ pageContext.request.contextPath }/admin/userList?size=5&page=${pageBean.page_current+1}">下一页</a>|
								<a
							href="${ pageContext.request.contextPath}/admin/userList?size=5&page=${pageBean.page_total}">尾页</a>|
							
    </c:if></span>
			</div>




		</div>
	</div>

	</div>
</body>
</html>
<script>
    function funDeleteUser(id) {


        layer.confirm('确定删除该用户？', {
            btn: ['确认删除','我再想想'] //按钮
        }, function(){

            window.location.href="${pageContext.request.contextPath}/admin/deleteUser?id="+id;
            layer.msg('删除用户成功！');
        }, function(){
            layer.msg('取消删除成功');
        });
    }

</script>