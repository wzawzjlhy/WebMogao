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

						<th width="80px">课程名称</th>

						<th width="120px">在线测试</th>





					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ceList }" var="c"
						varStatus="status">
						<tr>
							<td>${c.cname }</td>

							<td class="td-manage"><a
									href="javascript:funCs(${c.cid},${c.kg},${c.cscore})"
									title="在线测试" class="btn btn-xs btn-success">在线测试</a>


							</td>



					</c:forEach>

				</tbody>
			</table>

		</div>

	</div>
	</div>
	</div>
	</div>
	<br />






		</div>
	</div>

	</div>
<script >
	function funCs(cid,kg,cscore) {
        if (kg == 1) {
            layer.msg('你已经在线测试过该课程，分数为' + cscore);

        } else {
            layer.confirm('你将进行此课程在线测试，确定现在测试吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
              window.location.href="${pageContext.request.contextPath}/cw/csonline?cid="+cid;
            }, function(){
                layer.msg("你已取消在线测试");
            });

        }
    }


</script>
</body>
</html>
