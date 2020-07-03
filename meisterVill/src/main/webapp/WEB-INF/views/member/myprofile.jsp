<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Freelancer - Start Bootstrap Theme</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/sh/css/styles.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!--timeline css -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Blueprint: Vertical Timeline" />
<meta name="keywords"
	content="timeline, vertical, layout, style, component, web development, template, responsive" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/resources/sh/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/sh/css/component.css" />
<script src="/resources/sh/js/modernizr.custom.js"></script>
</head>
<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
	color: #4D4D4D;
}


.profile_container {
	padding-top: 20%;
}

.main_hcontainer {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

.user_container {
	border-radius: 10px;
	border: 1px solid white;
	margin-top: 40px;
	background-color: rgb(243, 244, 248);
	width: 1000px;
	height: 250px;
	margin: 0 auto;
	position: relative;
	box-sizing: content-box;
}

.user_inf_container {
	width: 1000px;
	height: 150px;
	margin-top: 50px;
	box-sizing: content-box;
}

.p_user_inf {
	position: absolute;
	width: 1000px;
	height: 150px;
	float: left;
	box-sizing: border-box;
}

.p_user_nickname {
	font-size: 25px;
	font-weight: bold;
	width: 100%;
	height: calc(100%/ 3);
	line-height: 3;
	width: 100%
}

.p_user_star {
	height: calc(100%/ 3);
	line-height: 3;
}

.p_user_project {
	height: calc(100%/ 3);
}

.p_user_project_1 {
	height: calc(100%/ 2);
}

.p_user_project_2 {
	height: calc(100%/ 2);
	font-size: 10px;
}

.p_img {
	border-radius: 100px;
	margin-left: 50px;
	box-sizing: border-box;
	width: 150px;
	height: 150px;
	float: left;
}

.p_user_infbox {
	box-sizing: border-box;
	width: 500px;
	height: 150px;
	float: left;
	padding-left: 20px;
}

.p_btn {
	font-weight: bold;
	color: #4D4D4D;
	border-radius: 4px;
	position: absolute;
	width: 250px;
	height: 50px;
	float: right;
	right: 0;
	bottom: 0;
	margin-right: 30px;
	text-align: center;
	line-height: 50px;
	background-color: #FFBC42;
	border: none;
	box-shadow: 0px px 3px darkgray;
	color: #4D4D4D;
}

.p_btn:hover {
	background-color: lightgray;
	font-weight: bold;
	color: #4D4D4D;
}

.p_content_navibox {
	margin: 0 auto;
	width: 1000px;
	overflow: hidden;
}

.container2 {
	margin: 0 auto;
}

.p_content_navi {
	border: 1px solid lightgray;
	margin-top: 100px;
	width: 70%;
}

.p_content {
	margin: 0 auto;
	width: 1000px;
	overflow: hidden;
	box-sizing: content-box;
}

.p_content1 {
	float: left;
	width: 70%;
	box-sizing: border-box;
}

.p_content2 {
	float: left;
	width: 30%;
	box-sizing: border-box;
}

.p_user_content_div {
	border: 1px solid lightgray;
	margin-bottom: 50px;
}

.p_user_content_div2 {
	border: 1px solid lightgray;
	height: 300px;
	margin-bottom: 50px;
}

.p_user_content_div3 {
	margin-bottom: 100px;
}

.p_navi_text {
	width: 150px;
}

#p_h4 {
	margin-top: 50px;
}

.p_timeline_div {
	background-color: background-color: rgb(243, 244, 248);
	margin-top: 20px;
}

.p_span {
	font-size: 15px;
	font-weight: bold;
}
.p_user_star2{
	margin : 0 auto;
	background-color : rgb(243, 244, 248);
	overflow : hidden;
	box-sizing: content-box;
	height : 150px;
}
.star2_1{
	width : 50%;
	height : 100%;
	box-sizing: border-box;
	float : left;
	text-align : right;
	line-height: 3.5;
	font-weight: bold;
	font-size: 40px;
	padding-right : 20px;
	
}
.star2_2{
	width : 50%;
	height : 100%;
	box-sizing: border-box;
	float : left;
}
.star2_2_1{
	width : 100%;
	height : 50%;
	padding-top : 50px;
}
.star2_2_2{
	width : 100%;
	height : 50%;
	font-weight: bold;
	padding-left : 5px;
}
.p_user_service{
	margin : 0 auto;
	text-align : center;
	cursor : pointer;
}
.p_span_service{
	color : blue;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section class="profile_container">
		<div class="main_hcontainer">
			<div class="user_container">
				<div class="user_inf_container">

					<div class="p_user_inf">
						<div>
							<img class="p_img" src="/upload/admin/unnamedimg.png">
						</div>
						<div class="p_user_infbox">
							<div class="p_user_nickname">${m.memberNickname }</div>
							<div class="p_user_star">
								<div class="star_div">
									<img src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png"> 0.0 | 0개의
									평가
								</div>
							</div>
							<div class="p_user_project">
								<div class="p_user_project_1">0 개</div>
								<div class="p_user_project_2">총작업수</div>
							</div>
							<button onclick="location.href='#'" type="button" class="p_btn">프로필
								등록 / 수정</button>
						</div>

					</div>
				</div>
			</div>
			<div class="p_content_navibox">
				<div class="p_content_navi">
					<nav class="navbar navbar-expand-lg text-uppercase p_navivar"
						id="mainNav">
						<div class="container2">
							<button
								class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold text-white rounded"
								style="background-color: lightgray;" type="button"
								data-toggle="collapse" data-target="#navbarResponsive"
								aria-controls="navbarResponsive" aria-expanded="false"
								aria-label="Toggle navigation">
								Menu <i class="fas fa-bars"></i>
							</button>
							<div class="collapse navbar-collapse" id="navbarResponsive">
								<ul class="navbar-nav ml-auto"
									style="width: 100%; text-align: center; margin: 0 auto;">
									<li class="nav-item mx-0 mx-lg-1 p-border"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger p_navi_text"
										href="#portfolio">소개</a></li>
									<li class="nav-item mx-0 mx-lg-1 p-border"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger p_navi_text"
										href="#about">서비스</a></li>
									<li class="nav-item mx-0 mx-lg-1 p-border"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger p_navi_text"
										href="#contact">받은 평가</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<div class="p_content">

				<div class="p_content1">
					<!-- nav -->

					<!-- Portfolio Section-->
					<h4 id="p_h4">소개</h4>
					<section class="page-section portfolio p_user_content_div"
						id="portfolio">
						<div class="container">${m.memberIntro }</div>
					</section>
					<!-- About Section-->
					<h4>서비스</h4>
					<section class="page-section text-white mb-0 p_user_content_div2"
						id="about">
							<div class="p_user_service" onclick ="location.href='#'">
								<img src="/upload/common/service.png" style="width : 50px; height : 50px;"><br>
								서비스를 등록하여 수익을 얻어보세요!<br>
								<span class="p_span_service">+ 서비스 등록하기</span>
							</div>
						
					</section>
					<!-- Contact Section-->
					<h4 id="p_h4">받은 평가</h4>
					<section class="page-section p_user_content_div3" id="contact">
						<div class="container">
							<div class="p_user_star2">
								<div class="star2_1"> 0.0</div>
								<div class="star2_2">
									<div class="star2_2_1">
										<img src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png"> <img
										src="/upload/common/star-off.png">
									</div>
									<div class="star2_2_2">(0개의 평가)</div>
								</div>
								
							</div>
						</div>
					</section>

				</div>
				<div class="p_content2">
					<div class="container2">
						<div class="main">
							<ul class="cbp_tmtimeline">
								<li>
									<div class="cbp_tmicon "></div>
									<div class="cbp_tmlabel p_timeline_div">
										<span class="p_span">전문 분야 및 상세 분야</span>
										<hr>
										<p>${m.memberField }</p>
									</div>
								</li>
								<li>
									<div class="cbp_tmicon "></div>
									<div class="cbp_tmlabel p_timeline_div">
										<span class="p_span">보유 기술</span>
										<hr>
										<p>${m.memberSkill}</p>
									</div>
								</li>
								<li>
									<div class="cbp_tmlabel p_timeline_div">
										<span class="p_span">경력 사항</span>
										<hr>
										<p>${list.companyName}</p>
										
									</div>
								</li>
								<li>
									<div class="cbp_tmlabel p_timeline_div">
										<span class="p_span">학력 · 전공</span>
										<hr>
										<p>내용</p>
									</div>
								</li>
								<li>
									<div class="cbp_tmlabel">
										<span class="p_span">보유 자격증</span>
										<hr>
										<p>내용</p>
									</div>
								</li>


							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- Masthead-->


	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="/resources/sh/assets/mail/jqBootstrapValidation.js"></script>
	<script src="/resources/sh/assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/sh/js/scripts.js"></script>
	<script>
		
	</script>
</body>
</html>
