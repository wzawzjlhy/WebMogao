
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/video-js.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #191919
        }
        .m {
            width: 960px;
            height: 400px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 100px;
        }
    </style>
</head>

<body>
<div class="m">
    <video id="my-video" class="video-js" controls preload="auto" width="960" height="400"
           poster="${pageContext.request.contextPath}/img/m.png" data-setup="{}">
        <source src="file:///${course.cpath}" type="video/mp4">

        <p class="vjs-no-js"> To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a> </p>
    </video>
    <script src="${pageContext.request.contextPath}/js/video.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/zh-CN.js"></script>
    <script type="text/javascript">
        var myPlayer = videojs('my-video');
        videojs("my-video").ready(function(){
            var myPlayer = this;
            myPlayer.play();
        });

    </script>
</div>
</body>
</html>
