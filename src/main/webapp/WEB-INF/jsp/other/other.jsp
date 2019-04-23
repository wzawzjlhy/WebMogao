<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.p1 {
	margin-left: 30px;
	float: left;
	width: 60%;
	height: 200px;
}

.p2 {
	margin-left: 20px;
}
</style>
</head>
<body>
	<h3 style="margin-left: 30%;">
		<font color="red">慕课平台管理系统</font>
	</h3>
	<div class="p1">
		<p>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			本慕课平台管理系统主要有相关功能:
<br/>

			(1) 个人屮心：川户注册、登录<br/>
			(2) 在线课程信息浏览：按课程名称、幵课时间等信息查询相关课程<br/>
			(3) 在线课程屮沾：审核条件后申请在线课程<br/>
			(4) 在线课程学习：观看视频、浏览课件、在线测试、学习进度显示<br/>

		</p>
	</div>
	<div class="p2">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
			src="${pageContext.request.contextPath }/static/images/you.png"
			width="300px" height="500px">
	</div>
</body>
</html>