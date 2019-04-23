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
						<th width="50px">课程id</th>
						<th width="80px">课程名称</th>
						<th width="80px">开课时间</th>
						<th width="120px">学习价值分数</th>

						<th width="100px">申请</th>



					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courseVos }" var="c"
						varStatus="status">
						<tr>
							<td>${c.course.cid }</td>
							<td>${c.course.cname }</td>
							<td>${c.course.cdate }</td>
							<td>${c.course.credit }</td>


							<td class="td-manage">
							<a title="课程申请学习"
								href="#"
								onclick="funSq(${c.isSq},${c.course.cid})" class="btn btn-xs btn-warning">课程申请</a>
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






		</div>
	</div>

	</div>
</body>
</html>
<script>
    function funSq(id,cid) {

        if(id==0){

            layer.alert('该课程已开课，无法申请', {
                skin: 'layui-layer-lan'
                ,closeBtn: 0
                ,shift: 4
            });

		}else if(id==1){
            layer.confirm('确定申请该课程吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                layer.msg('申请提交成功');
                window.location.href="${pageContext.request.contextPath}/course/userSq?cid="+cid;
            }, function(){
               layer.msg("你已取消申请该课程");
            });



		}else if(id==2){
            layer.alert('你已申请过该课程，无法重复申请', {
                skin: 'layui-layer-lan'
                ,closeBtn: 0
                ,shift: 4
            });
		}else{

		}

    }

</script>