<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title>慕课平台管理系统  </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${pageContext.request.contextPath }/static/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css" />
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
		
		<script src="${pageContext.request.contextPath }/static/assets/js/ace-extra.min.js"></script>
		
		<script src="${pageContext.request.contextPath }/static/js/jquery-1.9.1.min.js"></script>        
		
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/assets/js/typeahead-bs2.min.js"></script>
		
		<script src="${pageContext.request.contextPath }/static/assets/js/ace-elements.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/assets/js/ace.min.js"></script>
        <script src="${pageContext.request.contextPath }/static/assets/layer/layer.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/static/assets/laydate/laydate.js" type="text/javascript"></script>
        
        
<script type="text/javascript">	


 $(function(){ 
 var cid = $('#nav_list> li>.submenu');
	  cid.each(function(i){ 
       $(this).attr('id',"Sort_link_"+i);
   
    })  
 })
 jQuery(document).ready(function(){ 	
    $.each($(".submenu"),function(){
	var $aobjs=$(this).children("li");
	var rowCount=$aobjs.size();
	var divHeigth=$(this).height();
    $aobjs.height(divHeigth/rowCount);	  	
  }); 
    //初始化宽度、高度    
    $("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140); 
	 
	$(".sidebar").height($(window).height()-99); 
    var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
	
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140);
	$(".sidebar").height($(window).height()-99); 
	
	var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
  });
    $(".iframeurl").click(function(){
                var cid = $(this).attr("name");
				var cname = $(this).attr("title");
                $("#iframe").attr("src",cid).ready();
				$("#Bcrumbs").attr("href",cid).ready();
				$(".Current_page a").attr('href',cid).ready();	
                $(".Current_page").attr('name',cid);
				$(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();	
				$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();	
				$("#parentIfour").html(''). css("display","none").ready();		
      });
    
		
});
/*********************点击事件*********************/
$( document).ready(function(){
  $('#nav_list').find('li.home').click(function(){
	$('#nav_list').find('li.home').removeClass('active');
	$(this).addClass('active');
  });	
												

//时间设置
  function currentTime(){ 
    var d=new Date(),str=''; 
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+= d.getSeconds()+'秒'; 
    return str; 
} 
window.setInterval(function(){$('#time').html(currentTime)},1000); 
//修改密码
  $('#Exit_system').on('click', function(){

      layer.confirm('是否确定退出慕课平台管理系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="${pageContext.request.contextPath}/admin/quit";
        
    });
});
})
</script>	
<script>


</script>
	</head>
	<body>
		<div class="navbar navbar-default" id="navbar">
        <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<h1><font color="white">慕课平台管理系统<span id="test"></span></font></h1>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
			   <div class="navbar-header pull-right" role="navigation">
               <ul class="nav ace-nav">	
                <li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span  class="time" style="color:	#A6FFA6"><em id="time"></em></span>
								
								<span class="user-info"><small>	${sessionScope.login_user.name }</small>	</span>
								<i class="icon-caret-down"></i>
							</a>
							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								
								<li><a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
							</ul>
						</li>
	                   
					
					</ul>
                <!-- <div class="right_info">
                 
                   <div class="get_time" ><span id="time" class="time"></span>欢迎光临,管理员</span></div>
					<ul class="nav ace-nav">	
						<li><a href="javascript:ovid(0)" class="change_Password">修改密码</a></li>
                        <li><a href="javascript:ovid(0)" id="Exit_system">退出系统</a></li>
                       
					</ul>
				</div>-->
                </div>
			</div>
		</div>
		<div class="main-container" id="main-container">
        <script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar">
<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
                     <div style="background-color:	#E8FFC4;">
					
栏目导航(<font color="red">管理员端</font>)		
						</div>
						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>
							<span class="btn btn-info"></span>
							<span class="btn btn-warning"></span>
							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->
					<ul class="nav nav-list" id="nav_list">
				     
					
                  <li>
					<a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span class="menu-text"> 用户管理</span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                    <li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath }/admin/toadduser" title="用户账号分配"  class="iframeurl"><i class="icon-double-angle-right"></i>用户账号分配</a></li>
                                      <li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath }/admin/userList" title="查看账号列表"  class="iframeurl"><i class="icon-double-angle-right"></i>查看账号列表</a></li>
                  
                   </ul>
				  
                        	<li><a href="#" class="dropdown-toggle"><i class="icon-user"></i><span class="menu-text"> 课程管理</span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
															<li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath }/course/toAddCourse" title="课程添加" class="iframeurl"><i class="icon-double-angle-right"></i>课程添加</a></li>
								<li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath }/course/adminSLCourse" title="审核课程" class="iframeurl"><i class="icon-double-angle-right"></i>审核课程</a></li>
								<li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath }/course/tokjupload" title="课件上传" class="iframeurl"><i class="icon-double-angle-right"></i>课件上传</a></li>


							</ul>
						</li>   
                        

						<li><a href="#" class="dropdown-toggle"><i class="icon-user"></i><span class="menu-text"> 反馈管理</span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath }/feedback/feedbackList" title="查看用户反馈" class="iframeurl"><i class="icon-double-angle-right"></i>查看用户反馈</a></li>
								
							</ul>
						</li>



						<li><a href="#" class="dropdown-toggle"><i class="icon-user"></i><span class="menu-text"> 日志管理</span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath }/log/findAll" title="查看操作日志" class="iframeurl"><i class="icon-double-angle-right"></i>查看操作日志</a></li>

							</ul>
						</li>

					
							</ul>
						
					</ul>
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
                    <script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
				<div class="main-content">
                <script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="index.jsp">首页</a>
							</li>
							<li class="active"><span class="Current_page iframeurl"></span></li>
                            <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
							<li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
						</ul>
					</div>
                    
                 <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;"name="iframe" frameborder="0" src="${pageContext.request.contextPath }/other/other">  </iframe>
				 

<!-- /.page-content -->
				</div><!-- /.main-content -->	
                
                  <div class="ace-settings-container" id="ace-settings-container">
                      <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                          <i class="icon-cog bigger-150"></i>
                      </div>
  
                      <div class="ace-settings-box" id="ace-settings-box">
                          <div>
                              <div class="pull-left">
                                  <select id="skin-colorpicker" class="hide">
                                      <option data-skin="default" value="#438EB9">#438EB9</option>
                                      <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                      <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                      <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                  </select>
                              </div>
                              <span>&nbsp; 选择皮肤</span>
                          </div>
  
                          <div>
                              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                              <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                          </div>
  
                          <div>
                              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                              <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                          </div>
  
                          <div>
                              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                              <label class="lbl" for="ace-settings-add-container">
                                  切换窄屏
                                  <b></b>
                              </label>
                          </div>
                      </div>
                  </div><!-- /#ace-settings-container -->		
	</div><!-- /.main-container-inner -->
			
		</div>
		<script>
            function funSum(){

                $.ajax({

                    type: "GET",

                    url: "${pageContext.request.contextPath}/access/sum",



                    success: function (data) {
                        layer.alert('接口总共调用次数为:'+data, {
                            icon: 1,
                            skin: 'layui-layer-molv'
                        });
                    }
                });



            }
		</script>


	</body>
</html>

