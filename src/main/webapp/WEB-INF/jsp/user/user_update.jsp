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


<title>宿舍列表</title>
</head>
	<body>
<div style="margin-left:30%;">
<div class=" clearfix">
 <div id="add_brand" class="clearfix">
 <br/>
 <br/>
 <br/>
 <h3 >&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <font color="red">修改个人资料</font></h3><br/>
 <div class="left_add">
    <form action="${pageContext.request.contextPath }/user/updateuser" method="post" >
                <li class=" clearfix"><label class="label_name"><i>*</i>请输入手机号</label>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input name="telephone" value="${login_user.telephone }" type="text" class="add_text" style="width:220px"/></li>
    <br/><br/>
            <li class=" clearfix"><label class="label_name"><i>*</i>请输入职位</label>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  <input name="position" type="text" value="${login_user.position }" class="add_text" style="width:220px"/></li>
    <br/><br/>
   <br/>
 
   
    	<input type="submit" value="确定修改"  class="btn btn-xs btn-success" style="margin-left:13%;">
    </form>
    ${message }
 </div>
 </div>
</body>
</html>
<script>
	/*******添加广告*********/
	$('#ads_add').on(
			'click',
			function() {
				layer.open({
					type : 1,
					title : '添加广告',
					maxmin : true,
					shadeClose : false, //点击遮罩关闭层
					area : [ '800px', '' ],
					content : $('#add_ads_style'),
					btn : [ '提交', '取消' ],
					yes : function(index, layero) {
						var num = 0;
						var str = "";
						$(".add_adverts input[type$='text']").each(
								function(n) {
									if ($(this).val() == "") {

										layer.alert(str += ""
												+ $(this).attr("name")
												+ "不能为空！\r\n", {
											title : '提示框',
											icon : 0,
										});
										num++;
										return false;
									}
								});
						if (num > 0) {
							return false;
						} else {
							layer.alert('添加成功！', {
								title : '提示框',
								icon : 1,
							});
							layer.close(index);
						}
					}
				});
			})
</script>
<script type="text/javascript">
	function updateProgress(file) {
		$('.progress-box .progress-bar > div').css('width',
				parseInt(file.percentUploaded) + '%');
		$('.progress-box .progress-num > b').html(
				SWFUpload.speed.formatPercent(file.percentUploaded));
		if (parseInt(file.percentUploaded) == 100) {
			// 如果上传完成了
			$('.progress-box').hide();
		}
	}

	function initProgress() {
		$('.progress-box').show();
		$('.progress-box .progress-bar > div').css('width', '0%');
		$('.progress-box .progress-num > b').html('0%');
	}

	function successAction(fileInfo) {
		var up_path = fileInfo.path;
		var up_width = fileInfo.width;
		var up_height = fileInfo.height;
		var _up_width, _up_height;
		if (up_width > 120) {
			_up_width = 120;
			_up_height = _up_width * up_height / up_width;
		}
		$(".logobox .resizebox").css({
			width : _up_width,
			height : _up_height
		});
		$(".logobox .resizebox > img").attr('src', up_path);
		$(".logobox .resizebox > img").attr('width', _up_width);
		$(".logobox .resizebox > img").attr('height', _up_height);
	}

	var swfImageUpload;
	$(document).ready(
			function() {
				var settings = {
					flash_url : "Widget/swfupload/swfupload.swf",
					flash9_url : "Widget/swfupload/swfupload_fp9.swf",
					upload_url : "upload.php",// 接受上传的地址
					file_size_limit : "5MB",// 文件大小限制
					file_types : "*.jpg;*.gif;*.png;*.jpeg;",// 限制文件类型
					file_types_description : "图片",// 说明，自己定义
					file_upload_limit : 100,
					file_queue_limit : 0,
					custom_settings : {},
					debug : false,
					// Button settings
					button_image_url : "Widget/swfupload/upload-btn.png",
					button_width : "95",
					button_height : "30 ",
					button_placeholder_id : 'uploadBtnHolder',
					button_window_mode : SWFUpload.WINDOW_MODE.TRANSPARENT,
					button_cursor : SWFUpload.CURSOR.HAND,
					button_action : SWFUpload.BUTTON_ACTION.SELECT_FILE,

					moving_average_history_size : 40,

					// The event handler functions are defined in handlers.js
					swfupload_preload_handler : preLoad,
					swfupload_load_failed_handler : loadFailed,
					file_queued_handler : fileQueued,
					file_dialog_complete_handler : fileDialogComplete,
					upload_start_handler : function(file) {
						initProgress();
						updateProgress(file);
					},
					upload_progress_handler : function(file, bytesComplete,
							bytesTotal) {
						updateProgress(file);
					},
					upload_success_handler : function(file, data, response) {
						// 上传成功后处理函数
						var fileInfo = eval("(" + data + ")");
						successAction(fileInfo);
					},
					upload_error_handler : function(file, errorCode, message) {
						alert('上传发生了错误！');
					},
					file_queue_error_handler : function(file, errorCode,
							message) {
						if (errorCode == -110) {
							alert('您选择的文件太大了。');
						}
					}
				};
				swfImageUpload = new SWFUpload(settings);
			});
	jQuery(function($) {
		var colorbox_params = {
			reposition : true,
			scalePhotos : true,
			scrolling : false,
			previous : '<i class="fa fa-chevron-left"></i>',
			next : '<i class="fa fa-chevron-right"></i>',
			close : '&times;',
			current : '{current} of {total}',
			maxWidth : '100%',
			maxHeight : '100%',
			onOpen : function() {
				document.body.style.overflow = 'hidden';
			},
			onClosed : function() {
				document.body.style.overflow = 'auto';
			},
			onComplete : function() {
				$.colorbox.resize();
			}
		};

		$('.table-striped [data-rel="colorbox"]').colorbox(colorbox_params);
		$("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");

	})
</script>
</script>
<script>
	jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 2, 3, 4, 5, 7, 8, ]
			} // 制定列不参与排序
			]
		});

		$('table th input:checkbox').on(
				'click',
				function() {
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
							function() {
								this.checked = that.checked;
								$(this).closest('tr').toggleClass('selected');
							});

				});

		$('[data-rel="tooltip"]').tooltip({
			placement : tooltip_placement
		});
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table')
			var off1 = $parent.offset();
			var w1 = $parent.width();

			var off2 = $source.offset();
			var w2 = $source.width();

			if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
				return 'right';
			return 'left';
		}
	})
</script>