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
<script
	src="/resources/hj/projectRoom/dynamicTab/js/modernizr.custom.25376.js"></script>

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
			<div class="side-wrapper" >
				<p style="margin: 0;" >
					<button id="showMenu" style="position: fixed; bottom:150px; right: 0;">Show
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
								<li><a href="/meister/project/home.do" ><i style="margin-right: 15px" class="fas fa-home"></i><span>Home</span></a></li>
								<li><a href="/meister/project/chat.do"><i style="margin-right: 15px;"class="far fa-comments"></i><span>Chat</span></a></li>
								<li><a href="/meister/project/todo.do" ><i style="margin-right: 15px;"class="fas fa-list-ul"></i><span>To do</span></a></li>
								<li><a href="/meister/project/schedule.do"><i style="margin-right: 15px;"class="far fa-calendar-alt"></i><span>Schedule</span></a></li>
								<li><a href="/meister/project/files.do"  style="background-color: #FFBC42; color: white;"><i style="margin-right: 15px;"class="far fa-file"></i><span>Files</span></a></li>
							</ul>
						</nav>
					</div>
				</section>
			</div>
			
			
			<div class="project-content">
       			 <div style="width: 100%;">test</div>
    		</div>

		</div>
		<nav class="outer-nav right vertical">
			<a href="/meister/project/home.do" class=""><i style="margin-right: 15px;" class="fas fa-home"></i>Home</a> 
			<a href="/meister/project/chat.do" class=""><i style="margin-right: 15px;"class="far fa-comments"></i>Chat</a> 
			<a href="/meister/project/todo.do" class=""><i style="margin-right: 15px;"class="fas fa-list-ul"></i>To do</a>
			<a href="/meister/project/schedule.do" class=""><i style="margin-right: 15px;"class="far fa-calendar-alt"></i>Schedule</a> 
			<a href="/meister/project/files.do"	class=""><i style="margin-right: 15px;"class="far fa-file"></i>Files</a>
		</nav>
	</div>
</body>
<script src="/resources/hj/projectRoom/dynamicTab/js/classie.js"></script>
<script src="/resources/hj/projectRoom/dynamicTab/js/menu.js"></script>
</html>