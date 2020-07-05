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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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
</style>
</head>
<body>
	<div id="perspective" class="perspective effect-moveleft">
		<div class="side-container">
			<div class="side-wrapper">
				<p style="margin: 0;">
					<button id="showMenu" style="position: fixed; bottom: 0; right: 0;">Show
						Menu</button>
				</p>
			</div>
			<div class="nav-container">
				<section>
					<div id="top-tabs" class="tabs tabs-style-bar">
						<nav>
							<ul>
								<li><a href="#" style="background-color: #FFBC42; color: white;"><i style="margin-right: 15px" class="fas fa-home"></i><span>Home</span></a></li>
								<li><a href="index2.html" class="icon icon-box"><span>Archive</span></a></li>
								<li><a href="index3.html" class="icon icon-display"><span>Analytics</span></a></li>
								<li><a href="#" class="icon icon-upload"><span>Upload</span></a></li>
								<li><a href="#" class="icon icon-tools"><span>Settings</span></a></li>
							</ul>
						</nav>
					</div>
				</section>
			</div>


		</div>
		<nav class="outer-nav right vertical">
			<a href="index.html" class="icon-home">Home</a> 
			<a href="index2.html" class="icon-news">News</a> 
			<a href="index3.html" class="icon-image">Images</a>
			<a href="#" class="icon-upload">Uploads</a> 
			<a href="#"	class="icon-lock">Security</a>
		</nav>
	</div>
</body>
<script src="/resources/hj/projectRoom/dynamicTab/js/classie.js"></script>
<script src="/resources/hj/projectRoom/dynamicTab/js/menu.js"></script>
</html>