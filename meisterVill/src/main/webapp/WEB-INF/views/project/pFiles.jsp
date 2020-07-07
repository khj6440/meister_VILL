<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/dynamicTab/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/dynamicTab/css/component.css" />
<link rel="stylesheet" href="/resources/hj/projectRoom/tab/demo.css">
<link rel="stylesheet" href="/resources/hj/projectRoom/tab/tabs.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/tab/tabstyles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- ----------------------------------------------------------------------------- -->
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\bootstrap\css\bootstrap.min.css">
<link
	href="/resources/hj/projectRoom/files\jquery.filer\css\jquery.filer.css"
	type="text/css" rel="stylesheet">
<link
	href="/resources/hj/projectRoom\files\jquery.filer\css\themes\jquery.filer-dragdropbox-theme.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\icon\themify-icons\themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\css2\style.css">
<script
	src="/resources/hj/projectRoom/dynamicTab/js/modernizr.custom.25376.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
* {
	margin-block-start: 0px;
	margin-block-end: 0px;
}

html, body {
	margin: 0px;
	padding: 0px;
}

.project-header {
	color: #272e38;
	top: 0;
	left: 0;
	width: 100%;
	height: 87px;
	line-height: 87px;
}

.project-header>div {
	padding-left: 30px;
	font-weight: bold;
	font-size: 28px;
	width: 300px;
	margin-left: 17%;
}
</style>
</head>
<body>

	<div id="perspective" class="perspective effect-moveleft">
		<div class="side-container">
			<div class="side-wrapper">
				<p style="margin: 0;">
					<button id="showMenu"
						style="position: fixed; bottom: 150px; right: 0; z-index: 1">Show
						Menu</button>
				</p>
			</div>
			<div class="project-header">
				<div>PROJECT ROOM</div>
			</div>
			<div class="nav-container">
				<section>
					<div id="top-tabs" class="tabs tabs-style-bar">
						<nav>
							<ul>
								<li><a href="/meister/project/home.do"><i
										style="margin-right: 15px" class="fas fa-home"></i><span>Home</span></a></li>
								<li><a href="/meister/project/chat.do"><i
										style="margin-right: 15px;" class="far fa-comments"></i><span>Chat</span></a></li>
								<li><a href="/meister/project/todo.do"><i
										style="margin-right: 15px;" class="fas fa-list-ul"></i><span>To
											do</span></a></li>
								<li><a href="/meister/project/schedule.do"><i
										style="margin-right: 15px;" class="far fa-calendar-alt"></i><span>Schedule</span></a></li>
								<li><a href="/meister/project/files.do"
									style="background-color: #FFBC42; color: white;"><i
										style="margin-right: 15px;" class="far fa-file"></i><span>Files</span></a></li>
							</ul>
						</nav>
					</div>
				</section>
			</div>


			<div class="project-content">
				<!-- Pre-loader end -->
				<div id="pcoded" class="pcoded">
					<div class="pcoded-overlay-box"></div>
					<div class="pcoded-container navbar-wrapper">
						<div class="pcoded-main-container">
							<div class="pcoded-wrapper">
								<div class="pcoded-content">
									<div class="pcoded-inner-content">
										<!-- Main-body start -->
										<div class="main-body">
											<div class="page-wrapper">
												<!-- Page-header start -->
												<div class="page-header">
													<div class="row align-items-end">
														<div class="col-lg-8">
															<div class="page-header-title">
																<div class="d-inline">
																	<h3>Project File Upload</h3>
																	<span>팀원들이 올린 파일이 공유됩니다.</span>
																</div>
															</div>
														</div>
														<div class="col-lg-4"></div>
													</div>
												</div>
												<!-- Page-header end -->
												<!-- Page-body start -->
												<div class="page-body">
													<!-- File upload card start -->
													<div class="card">
														<div class="card-header">
															<div class="card-header-right">
																<ul class="list-unstyled card-option">
																	<li><i class="feather icon-maximize full-card"></i></li>
																	<li><i class="feather icon-minus minimize-card"></i></li>
																</ul>
															</div>
														</div>
														<div class="card-block">
															<div class="sub-title">Upload Zone</div>
															<input id="myFile" type="file" name="files"	multiple="multiple">
														</div>
													</div>
													<!-- File upload card end -->
												</div>
												<!-- Page-body end -->
											</div>
										</div>
										<!-- Main-body end -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav class="outer-nav right vertical">
			<a href="/meister/project/home.do" class=""><i
				style="margin-right: 15px;" class="fas fa-home"></i>Home</a> <a
				href="/meister/project/chat.do" class=""><i
				style="margin-right: 15px;" class="far fa-comments"></i>Chat</a> <a
				href="/meister/project/todo.do" class=""><i
				style="margin-right: 15px;" class="fas fa-list-ul"></i>To do</a> <a
				href="/meister/project/schedule.do" class=""><i
				style="margin-right: 15px;" class="far fa-calendar-alt"></i>Schedule</a>
			<a href="/meister/project/files.do" class=""><i
				style="margin-right: 15px;" class="far fa-file"></i>Files</a>
		</nav>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#myFile").on('change', function() {

			console.log("test");
			
			/* 
			var form = $('#uploadForm')[0];
			var formData = new FormData(form); */
			/* $.ajax({
				url : "/meister/member/uploadChatFile2.do",
				data : formData,
				type : "POST",
				contentType : false,
				processData : false,
				success : function(data) {
					var resultList = JSON.parse(data);
					resultList.forEach(function(item, index) {
						transChat(item);
					})
				},
				error : function() {
					console.log("ajax 실패");
				}
			}); */

		})
	})
</script>


<script src="/resources/hj/projectRoom/dynamicTab/js/classie.js"></script>
<script src="/resources/hj/projectRoom/dynamicTab/js/menu.js"></script>
<!-- --------------------------------------------------------- -->
<script type="text/javascript"
	src="/resources/hj/projectRoom\files\js2\jquery.min.js"></script>
<script
	src="/resources/hj/projectRoom\files\jquery.filer\js\jquery.filer.min.js"></script>
<script
	src="/resources/hj/projectRoom\files\filer\jquery.fileuploads.init.js"
	type="text/javascript"></script>


</html>