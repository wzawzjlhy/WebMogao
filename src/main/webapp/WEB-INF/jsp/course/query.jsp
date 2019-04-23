<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yq
  Date: 2019/4/20
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap-theme.min.css">
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/screen.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animation.css">
    <!--[if IE 7]>

    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ie.css" type="text/css" media="screen, projection">
    <![endif]-->
    <link href="css/lity.css" rel="stylesheet">
    <style>

    </style>
</head>
<body class="bs-docs-home" >
<form action="${pageContext.request.contextPath}/course/query" method="post" name="form1" style="margin-left: 40%">



    <div class="input-group">
       <input type="text"   name="cname" placeholder="请输入课程名称" >
         <input type="date" name="cdate" placeholder="请选择开课时间"/>


    </div>

    <button style="margin-left: 10%" class="btn btn-default" type="submit"  >查询课程</button>


</form>
<div class="row" style="margin-left:15%">

    <!-- HOME MAIN POSTS -->
    <div class="col-lg-12 col-md-12">
        <section id="home-main">
            <div class="row">
                <!-- ARTICLES -->
                <div class="col-lg-9 col-md-12 col-sm-12">
                    <div class="row auto-clear">
<c:forEach var="course" items="${course}">
                        <article class="col-lg-3 col-md-6 col-sm-4">
                            <!-- POST L size -->
                            <div class="post post-medium">
                                <div class="thumbr">
                                    <a class="afterglow post-thumb" href="" data-lity>
                                        <span class="play-btn-border" title="Play"><i class="fa fa-play-circle headline-round" aria-hidden="true"></i></span>
                                        <div class="cactus-note ct-time font-size-1"><span>02:02</span></div>
                                        <img class="img-responsive" src="${pageContext.request.contextPath}/img/1.jpg" alt="#">
                                    </a>
                                </div>
                                <div class="infor">
                                    <h4>
                                        <a class="title" href="#">${course.cname}</a>
                                    </h4>

                                </div>
                            </div>
                        </article>
</c:forEach>

                    </div>
                    <div class="clearfix spacer"></div>
                </div>

            </div>
        </section>
    </div>
</div>
</div>

</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lity.js"></script>



</body>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>
</html>
