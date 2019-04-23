<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
	<title>管理员登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/font-awesome.min.css" />
	<!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/font-awesome-ie7.min.css" />
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/ace.min.css" />
	<link rel="stylesheet" type="text/css" href="http://localhost:8090/enterpriseprojecttracking/static/skin/css/ace-rtl.min.css" />
	<!--[if lte IE 8]>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/ace-ie.min.css" />
	<![endif]-->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/html5shiv.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/respond.min.js"></script>
	<![endif]-->
	<style>
		.login-layout .widget-box { position: static; margin-bottom: 20px;}
		@media (max-width: 767px) {
			.login-container-box { padding: 10px 10px 15px 10px;}
			.login-layout .widget-box { margin-bottom: 0;}
			.login-container {}
			.login-container h1 { margin: 10px 0 10px;}
			.login-container h1 * {font-size: 24px;}
			.login-container h4 { margin-top: 0px; padding-bottom: 10px; margin-bottom: 5px;}
		}
	</style>
	
</head>

<body class="login-layout">
<div class="main-container">
	<div class="main-content">
		<div class="row">
			<div class="login-container-box">
				<div class="login-container">
					<div class="center">
						<h1>
							<!-- <i class="icon-leaf green"></i> -->
							<span class="green">项目</span>
							<span class="red">跟踪</span>
							<span class="white">管理平台</span>
						</h1>
						<h4 class="blue"> 后台管理员登录</h4>
					</div>

					<div class="space-6"></div>
					<div class="position-relative">
						
	<div id="login-box" class="login-box visible widget-box no-border">
		<div class="widget-body">
			<div class="widget-main">
				<h4 class="header blue lighter bigger">
				
					请输入您的帐号密码
				</h4>

				<div class="space-6"></div>

				<form action="${pageContext.request.contextPath }/admin/login" method="post">
					<fieldset>
						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="username" type="text" class="form-control" placeholder="请输入管理员账号" />
								
							</span>
						</label>

						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="password" type="password" class="form-control" placeholder="请输入管理员密码" />
							
							</span>
						</label>

						<div class="space"></div>  

						<div class="clearfix">
							<label class="inline">
								<input type="checkbox" name="savelogin" value="1" class="ace" />
							</label>
							<input type="hidden" name="referer" value="/developer/"/>
							<input type="submit" class="width-35 pull-right btn btn-sm btn-primary" value="登录">
							

							</input>
						</div>

						<div class="space-4"></div>
					</fieldset>
				</form>
			</div>
			<div class="toolbar clearfix">
				<div></div>
			</div>
		</div>
	</div>

				${message }
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/base/js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/dialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layer.js"></script>

	<script>

	
	</script>

<div class="hide">
</div>
</body>
</html>