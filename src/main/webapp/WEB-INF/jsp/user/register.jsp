<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="renderer" content="webkit">
	<title>慕课平台管理系统</title>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/html5shiv.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/respond.min.js"></script>
	<![endif]-->
	<script src="${pageContext.request.contextPath}/static/layui/layer.js" charset="utf-8"></script>

	<script type="text/javascript">
        $(function () {
            //在layui中使用layer
            layui.use(['layer'], function () {
                var layer = layui.layer;

                //layer.msg(content, options, end) - 提示框
                layer.msg("纯文本提示");
            })
        })

	</script>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/bootstrap.theme.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/font-awesome.min.css?v=1" />
	<!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/font-awesome-ie7.min.css" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/skin/css/login.css" />
</head>
<body style="background-image: url(/admin/public/get_bing_wallpaper.html)">
<!--[if lt IE 9]>
<div class="alert alert-warning"
	 style="position: absolute; z-index:99999; left:0; top:0; width:100%; font-size:14px;">注意：您的浏览器<strong>版本过低</strong>，无法正常使用本系统。
	建议您更换一个浏览器使用，如360浏览器、火狐浏览器、搜狗浏览器、百度浏览器等。如果您的计算机上没有安装以上浏览器，建议您通过这里 <a href="http://browsehappy.com/">下载一个更好的浏览器</a>
	来提升用户体验.
</div>
<![endif]-->
<div class="header">
	<div class="container text-right">
		<a href="${pageContext.request.contextPath }/index" ><i class="icon icon-home"></i> 我要登录</a>

		<a href="javascript:void(0);" onclick="setHome(this,window.location);"><i class="icon icon-home"></i> 设为主页</a>
		<a href="javascript:void(0);" id="addFavorite" onclick="addFavorite(this);"><i class="icon icon-heart"></i> 加入收藏</a>
		<span class="fl"><a href="${pageContext.request.contextPath }/admin"><i class="icon icon-desktop"></i> 我是管理员</a></span>
	</div>
</div>


<script>
    layer.msg('hello');
</script>


<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<h1>慕课平台管理系统</h1>
			<div class="login-box">
				<form action="${pageContext.request.contextPath }/user/register" method="post" id="frmLogin" class="form-horizontal">
					<h5 align="center"><font color="red">	${message }</font></h5>
					<hr/>
					<div class="form-group">
						<label class="col-sm-2 control-label">帐号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="account" placeholder="帐号">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password1" placeholder="密码">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password2" placeholder="请再一次重复输入密码">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name" placeholder="姓名">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label>
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-success">立即注册</button>
							<button type="reset" class="btn btn-default">重置</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/skin/js/jquery.artDialog.js?skin=blue"></script>
<script type="text/javascript">

    function addFavorite(obj) {
        var aUrls = document.URL.split("/");
        var vDomainName = "http://" + aUrls[2] + "/";
        var description = obj.title;
        try {
            window.external.AddFavorite(vDomainName, description);
        } catch (e) {
            window.sidebar.addPanel(description, vDomainName, "");
        }
        return false;
    }

    function setHome(obj,url){
        try{
            obj.style.behavior = 'url(#default#homepage)';
            obj.setHomePage(url);
        }catch(e){
            if(window.netscape){
                try{
                    netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
                }catch(e){
                    alert('抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车\n\n然后将[signed.applets.codebase_principal_support]的值设置为true，双击即可。');
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage',url);
            }else{
                alert('抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【' + url + '】设置为首页。');
            }
        }
    }

    $(document).ready(function() {
        $('.fn_myReload').click(function() {
            var _url = "${pageContext.request.contextPath }/DrawImage" + "?nocache=" + new Date().getTime();
            $("#checkCode").attr('src', _url);
            return false;
        });
        $('.imgcode').click(function() {
            var _url = "${pageContext.request.contextPath }/DrawImage" + "?nocache=" + new Date().getTime();
            $("#checkCode").attr('src', _url);
            return false;
        });

        $("#checkCode").attr('src', "${pageContext.request.contextPath }/DrawImage" + "?nocache=" + new Date().getTime());

        $('#frmLogin').submitForm({
            before: function() {
                var me = this.element[0];
                if (!$.trim(me.nickname.value).length) {

                    $.dialog.alert('请输入帐号！', function(){
                        me.nickname.focus();
                    });
                    return false;
                }
                if (!me.password.value.length) {

                    $.dialog.alert('请输入密码！', function(){
                        me.password.focus();
                    });
                    return false;
                }
                if (!me.verify.value.length) {

                    $.dialog.alert('请输入验证码！', function(){
                        me.verify.focus();
                    });
                    return false;
                }
                pending = $.dialog.pending('登陆中，请稍后...');
            },
            success: function(data) {
                $.parseCode(data);
            },
            error: function(data) {
                $.dialog.alert(data.info, function() {
                    $('#frmLogin').parseFormError(data);
                });
            },
            after: function() {
                pending.close();
            }
        });
    });
</script>

</body>
</html>