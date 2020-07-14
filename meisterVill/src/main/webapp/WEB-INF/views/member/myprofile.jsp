<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
<!-- modal -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css"
	href="/resources/sh/dist/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.3.1/flatly/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/sh/dist/css/MultiStep.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/sh/dist/css/MultiStep-theme.min.css">
<!--  -->
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">

<style>
* {
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

.star_div_img {
	margin-top: 15px;
	margin-right: 3px;
	width: 17px;
	height: 17px;
	float: left;
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

#p_btn {
	font-weight: bold;
	color: #4D4D4D;
	border-radius: 4px;
	position: absolute;
	width: 250px;
	height: 50px;
	float: right;
	right: 0;
	bottom: 0;
	margin-right: -170px;
	margin-bottom: 40px;
	text-align: center;
	line-height: 50px;
	background-color: #FFBC42;
	border: none;
	box-shadow: 0px px 3px darkgray;
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
	margin-bottom: 70px;
}

.p_user_content_div2 {
	border: 1px solid lightgray;
	height: 500px;
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

.p_user_star2 {
	margin: 0 auto;
	background-color: rgb(243, 244, 248);
	overflow: hidden;
	box-sizing: content-box;
	height: 150px;
}

.star2_1 {
	width: 50%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	text-align: right;
	line-height: 3.5;
	font-weight: bold;
	font-size: 40px;
	padding-right: 20px;
}

.star2_2 {
	width: 50%;
	height: 100%;
	box-sizing: border-box;
	float: left;
}

.star2_2_1 {
	width: 100%;
	height: 50%;
	padding-top: 35px;
}

.star2_2_2 {
	width: 100%;
	height: 50%;
	font-weight: bold;
	padding-left: 5px;
}

.p_user_service {
	margin: 0 auto;
	text-align: center;
	cursor: pointer;
	margin-top: 100px;
}

.p_span_service {
	color: blue;
}
/* modal content1 */
.sh_modal_content_wrap {
	font-size: 15px;
	margin: 0 auto;
	width: 750px;
	height: 400px;
	overflow: hidden;
	box-sizing: content-box;
	margin-top: 20px;
}

.sh_sub_content1 {
	width: 90%;
	height: 100%;
	float: left;
	box-sizing: border-box;
	text-align: center;
	margin-left: 30px;
}

.sh_sub_content1_1 {
	width: 100%;
	height: 30%;
	box-sizing: border-box;
	margin-left: 20px;
}

.m_profile_img {
	width: 100px;
	height: 100px;
	border: 1px solid lightgray;
	border-radius: 50px;
	float: left;
	margin-left: 10px;
}

.m_nickname_box {
	width: 280px;
	height: 50px;
	float: left;
	margin-left: 20px;
	margin-top: 20px;
}

.m_nickname {
	width: 100%;
	height: 50px;
}

#member_nickname {
	width: 270px;
	height: 40px;
}

.sh_sub_content1_2 {
	margin: 0 auto;
	width: 95%;
	height: 60%;
	border: 1px solid lightgray;
	box-sizing: border-box;
	padding: 10px;
	margin-left: 10px;
	resize: none;
}

.sh_sub_content2 {
	margin: 5px;
	width: 38%;
	height: 95%;
	border: 1px solid lightgray;
	border-radius: 4px;
	float: left;
	box-sizing: border-box;
	overflow-y: scroll;
}
/* modal content2 */
.sh_modal_content_wrap_2 {
	font-size: 15px;
	margin: 0 auto;
	border: 1px solid black;
	width: 730px;
	/*width : 95%;*/
	height: 400px;
	overflow: hidden;
	box-sizing: content-box;
	margin-top: 20px;
}

.sh_sub_content1_22 {
	width: 60%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}

.sh_sub_content1_1_2 {
	width: 100%;
	height: 40%;
	box-sizing: border-box;
}

.sh_sub_content1_2_2 {
	width: 100%;
	height: 60%;
	border: 1px solid lightgray;
	box-sizing: border-box;
	padding: 10px;
}

.sh_select_field {
	width: 80%;
	position: absolute;
	word-break: break-all;
}

.sh_sub_content2_2 {
	padding: 10px;
	width: 40%;
	height: 100%;
	border: 1px solid lightgray;
	border-radius: 4px;
	float: left;
	box-sizing: border-box;
	overflow-y: scroll;
	overflow: hidden;
	position: relative;
}

/* 보유기술 css */
.sh_modal_content_wrap_333 {
	font-size: 15px;
	margin: 0 auto;
	border: 2px solid lightgray; 
	width : 730px;
	/*width : 95%;*/
	height: 400px;
	overflow: hidden;
	box-sizing: content-box;
	margin-top: 20px;
	width: 730px;
}

.sh_sub_content1_333 {
	width: 60%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}

.sh_sub_content1_1_333 {
	width: 100%;
	height: 40%;
	box-sizing: border-box;
	pading-top: 20px;
}

.sh_sub_content1_2_333 {
	width: 100%;
	height: 60%;
	border: 1px solid lightgray;
	box-sizing: border-box;
	padding: 10px;
}

.sh_sub_content2_333 {
	padding: 10px;
	width: 40%;
	height: 100%;
	border: 1px solid lightgray;
	border-radius: 4px;
	float: left;
	box-sizing: border-box;
	overflow-y: scroll;
	overflow: hidden;
	position: relative;
}

.sh_select_skill {
	width: 80%;
	position: absolute;
	word-break: break-all;
}

.select_field {
	width: 90%;
	height: 50px;
	margin-left: 20px;
	margin-top: 10px;
}
/* 학력_전공 css */
.sh_sub_content1_2_444 {
	width: 100%;
	height: 60%;
	border: 1px solid lightgray;
	box-sizing: border-box;
	padding: 10px;
}

.sh_sub_content2_444 {
	padding: 10px;
	width: 40%;
	height: 100%;
	border: 1px solid lightgray;
	border-radius: 4px;
	float: left;
	box-sizing: border-box;
	overflow-y: scroll;
	overflow: hidden;
	position: relative;
}

.sh_select_school {
	margin-top: 40px;
	width: 70%;
	position: absolute;
	word-break: break-all;
}

.select_field {
	width: 90%;
	height: 50px;
	margin-left: 20px;
	margin-top: 10px;
}

.complete_btn {
	cursor: pointer;
	margin-top: 20px;
	margin-bottom: 10px;
	border: 1px solid #FFBC42;
	color: #FFBC42;
	border-radius: 4px;
	background-color: white;
	width: 100%;
	height: 30px;
}

.complete_btn:hover {
	color: white;
	background-color: #FFBC42;
}
/* 자격증 css */
.sh_sub_content1_2_555 {
	width: 100%;
	height: 60%;
	border: 1px solid lightgray;
	box-sizing: border-box;
	padding: 10px;
}

.sh_select_license {
	margin-top: 40px;
	width: 70%;
	position: absolute;
	word-break: break-all;
}

.select_field {
	width: 90%;
	height: 50px;
	margin-left: 20px;
	margin-top: 10px;
}

.complete_btn {
	cursor: pointer;
	margin-top: 20px;
	margin-bottom: 10px;
	border: 1px solid #FFBC42;
	color: #FFBC42;
	border-radius: 4px;
	background-color: white;
	width: 100%;
	height: 30px;
}

.complete_btn:hover {
	color: white;
	background-color: #FFBC42;
}
/* career css */
.sh_modal_content_wrap_333 {
	font-size: 15px;
	margin: 0 auto;
	width: 730px;
	/*width : 95%;*/
	height: 400px;
	overflow: hidden;
	box-sizing: content-box;
	margin-top: 20px;
}

.sh_sub_content1_333 {
	width: 60%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}

.sh_sub_content1_1_444 {
	width: 100%;
	box-sizing: border-box;
}

.sh_sub_content1_2_666 {
	width: 100%;
	height: 60%;
	border: 1px solid lightgray;
	box-sizing: border-box;
	padding: 10px;
}

.sh_select_career {
	margin-top: 40px;
	width: 70%;
	position: absolute;
	word-break: break-all;
}

.select_field {
	width: 90%;
	height: 50px;
	margin-left: 20px;
	margin-top: 10px;
}

.complete_btn3 {
	cursor: pointer;
	margin-top: 20px;
	margin-bottom: 10px;
	border: 1px solid #FFBC42;
	color: #FFBC42;
	border-radius: 4px;
	background-color: white;
	width: 100%;
	height: 30px;
}

.select_career_check {
	text-align: center;
	line-height: 3;
	margin-left: 10px;
	background-color: #FFBC42;
	color: white;
	width: 90%;
	height: 40px;
	margin-bottom: -10px;
	margin-top: 10px;
}

.complete_btn3:hover {
	color: white;
	background-color: #FFBC42;
}
.intro_container{
	padding-left : 20px;
	font-size : 20px;
}
/* 서비스 페이징 */
 .p_user_service_div{
            width : 650px;
            height : 60px;
            z-index: 1;
			margin:0 auto;
			text-align: center;
			margin-left : 150px;
        }
        .p_user_service_div2{
            border: 1px solid lightgray;
            margin-left : 20px;
            text-align:center;
            margin: 0 auto;
            width : 30%;
            position: absolute;
            
        }
        .service_img_div{
            width : 30px;
            height : 30px;
            position: relative;
        }
        .pageNavi{
        	text-align: center;
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
							<img class="p_img" src="/resources/upload/common/unnamedimg.png">
						</div>
						<div class="p_user_infbox">
							<div class="p_user_nickname">${member.memberNickname }</div>
							<div class="p_user_star">
								<div class="star_div">
									<img class="star_div_img"
										src="/resources/upload/common/star-on.png"> <img
										class="star_div_img"
										src="/resources/upload/common/star-on.png"> <img
										class="star_div_img"
										src="/resources/upload/common/star-on.png"> <img
										class="star_div_img"
										src="/resources/upload/common/star-on.png"> <img
										class="star_div_img"
										src="/resources/upload/common/star-off.png"> 4.0 | 1개의
									평가
								</div>
							</div>
							<div class="p_user_project">
								<div class="p_user_project_1">1 개</div>
								<div class="p_user_project_2">총작업수</div>
							</div>

							<section id="main_content" class="inner">
								<button id="p_btn" data-toggle="modal"
									data-target="#submitModal">프로필 등록 / 수정</button>
							</section>
							<form id="profileform" style="background-color: white;"
								action="/meister/member/profileupdate.do" method="post">
								<input type="hidden" name="memberNo"
									value="${sessionScope.member.memberNo }" id="memberNo" /> <input
									type="hidden" name="memberSkill" />
								<div id="submitModal" class="multi-step"></div>
							</form>

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
						<div class="intro_container">${member.memberIntro }</div>
					</section>
					<!-- About Section-->
					<h4>서비스</h4>
					<section class="page-section text-white mb-0 p_user_content_div2"
						id="about">
						<c:if test="${not empty list }">
								<c:forEach items="${list }" var="s">
									<div class="p_user_service_div">
										<div class="p_user_service_div2"><a href="#">{s.sellTitle}</a></div>
									</div>
								</c:forEach>

								<div class="pageNavi">${pageNavi }</div>
						
						</c:if>
						<c:if test="${empty list}">
							<div class="p_user_service" onclick="location.href='#'">
								<img src="/resources/upload/common/service.png"
									style="width: 50px; height: 50px;"><br> 서비스를 등록하여
								수익을 얻어보세요!<br> <span class="p_span_service">+ 서비스
									등록하기</span>
							</div>
						</c:if>
					</section>
					<!-- Contact Section-->
					<h4 id="p_h4">받은 평가</h4>
					<section class="page-section p_user_content_div3" id="contact"
						style="margin-top: -20px;">
						<div class="container" style="margin-top: 0; padding: 0;">
							<div class="p_user_star2">
								<div class="star2_1">4.0</div>
								<div class="star2_2">
									<div class="star2_2_1">
										<img class="star_div_img"
											src="/resources/upload/common/star-on.png"> <img
											class="star_div_img"
											src="/resources/upload/common/star-on.png"> <img
											class="star_div_img"
											src="/resources/upload/common/star-on.png"> <img
											class="star_div_img"
											src="/resources/upload/common/star-on.png"> <img
											class="star_div_img"
											src="/resources/upload/common/star-off.png">
									</div>
									<div class="star2_2_2">(1개의 평가)</div>
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
										<p>${member.memberField }</p>
									</div>
								</li>
								<li>
									<div class="cbp_tmicon "></div>
									<div class="cbp_tmlabel p_timeline_div">
										<span class="p_span">보유 기술</span>
										<hr>
										<p>${member.memberSkill}</p>
									</div>
								</li>
								<li>
									<div class="cbp_tmlabel p_timeline_div">
										<span class="p_span">경력 사항</span>
										<hr>
										<c:if test="${career.typeFree ==0}">
											<h4>회사 경력</h4>
											<p>${career.companyName}·${career.companyDepartment }·${career.companyJobTitle }·${career.companyJobMon }년</p>
										</c:if>
										<c:if test="${career.typeFree == 1}">
											<p>프리랜서</p>
											<p>${career.companyJobMon}년</p>
										</c:if>
									</div>
								</li>
								<li>
									<div class="cbp_tmlabel p_timeline_div">
										<span class="p_span">학력 · 전공</span>
										<hr>
										<p>${sessionScope.member.memberSchool }·${sessionScope.member.memberMajor }·${sessionScope.member.memberGrade }</p>
									</div>
								</li>
								<li>
									<div class="cbp_tmlabel">
										<span class="p_span">보유 자격증</span>
										<hr>
										<p>${license.licenseName }·${license.licenseDate }·${license.licenseAgency }</p>
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
	<!-- maister modal -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="/resources/sh/dist/js/MultiStep.min.js"></script>

	<script>
	  
		function categoryChange(e) {
			   var s1_sub = ["웹사이트신규제작", "웹사이트개선", "모바일앱신규제작", "모바일앱개선","소프트웨어","임베디드시스템","데이터사이언스","게임"];
		       var s2_sub = ["로고디자인", "로고+명함디자인", "로고+간판디자인", "웹·모바일디자인","전단지·포스터","현수막","북커버·앨범커버","3D프린팅·도면","배너광고·카드뉴스","SNS디자인(유튜브·블로그·모두 등)","PPT·인포그래픽","포토샵편집","의류디자인","일러스트","캘리그라피"];
		        
            var d;
            var value = $('#select_menu option:selected').val();
			if(value == "IT프로그래밍")  d = s1_sub;
			else if(value == "디자인") d = s2_sub;

		        var str="";
            for(var i = 0; i<d.length;i++){
            	str+='<option class="opt" value='+d[i]+'>'+d[i]+'</option>';
                }
                $('#select_sub_menu').html(str);
			
		     }
		var str1 = "";
        var str2 = "";
        var str3 = "";
		    
		        
		        $(document).on('change', '#select_menu',function(){
		        	str1 = this.value;
		        })
		        
		        $(document).on('change', '#select_sub_menu',function(){
		        	 
	                   str2 = this.value;
	                   str3 = str1 +"/"+ str2;
	                   $('.sh_sub_content1_2_2').text(str3);
	                   $('.sh_select_field').html(str3+'<br>');
		        })
		</script>
	<script>
	
        function categoryChange2(e) {
	   var s1_sub = ["워드프레스", "HTML·CSS", "JavaScript", "Java","Python","PHP","C#","Perl","TypeScript","React","Angular","ASP.NET","Bootstrap"
                    ,"Flash","JSP","ASP","Node.js","XE","Android-Studio","Visual-Basic","Arduino","C&C++","Excel","SQL","jQuery","node.js","Unity","Visual Studio"];
       var s2_sub = ["Adobe-Photoshop", "Adobe-Dreamweaver", "AdobeFlash", "sketch-up","Sketchapp","HTML&CSS","3D-MAX","3D-CAD","CAD","v-ray"];
	   

	   var d;
            var value = $('#select_menu2 option:selected').val();
			if(value == "IT프로그래밍")  d = s1_sub;
			else if(value == "디자인") d = s2_sub;

		        
		     var str="";
	            for(var i = 0; i<d.length;i++){
	            	str+='<option class="opt" value='+d[i]+'>'+d[i]+'</option>';
	                }
	                $('#select_sub_menu2').html(str);
				
			     }
		
      
            var str4 = "";
            var str5 = "";
            var str6 = "";
        
		        $(document).on('change', '#select_menu2',function(){
		        	str4 = this.value;
                    console.log(str4);
		        })
		        
		        $(document).on('change', '#select_sub_menu2',function(){
		        	 
	                   str5 = this.value;
	                   console.log(str5);
	                   str6 = str5;
	                   $('.sh_sub_content1_2_333').text(str6);
	                   var str2 = $('#select_sub_menu2 option:selected').val();
	                   var str = $('.sh_select_skill').val();
	                   if(str==""){
							$('.sh_select_skill').val(str2);	                	   
	                   }else{
	                   $('.sh_select_skill').val(str+"/"+str2);
	                	   
	                   }
	                   
	                  $('input[name=memberSkill]').val($('.sh_select_skill').val());
	                   
	                	
	                   
	                   
	                   
	                   
		        })
		        
      
        
        $(document).on('click','#complete_btn2',function(){
        	var str11 = "";
            var str22 = "";
            var str33 = "";
            var str44 = "";
            	console.log("1111");
                str11 = $(".member_school").val();
                str22 = $(".member_major").val();
                str33 = $('#select_grade_menu option:selected').val();
                str44 = str11 + "·" + str22 + "·" + str33;
                console.log(str44);
                $('.sh_select_school').text(str44);
        })
           
      /*   $('#p_btn').on('click',function(){
	        $(".btn-next").attr('disabled',true);
        	
        });
		     */

      	/* $(document).on('click','.btn-next',function(){
      		$(".btn-next").attr('disabled',true);
      	});
		
		$(document).on('click','.btn-prev',function(){
			$('.btn-next').attr("disabled",false);			
		});
		        
		        
		$(document).on('click','#p_btn',function(){
			 $('.btn-next').attr("disabled", "disabled");
			
			 /* 자기소개 
			 
			 $('.sh_sub_content1_2_2').on('change',function(){
				 var str2 = $('.sh_sub_content1_2_2').val();
				 console.log(str2);
				 $('.btn-next').attr("disabled",false);
			 })
			 
		 }); */
		 var num = 0;
			function test(){
			 num++;
			 console.log($('#1'));
			 var id = $("#"+num).attr("id");
			 console.log(num);
			 console.log(Number(num)+1);
			 $("#"+num).attr("id",Number(num)+1);

				
		 }
	
		$(document).on('click','.btn-next',function(){
			$('#1').attr("disabled",true);
			/* $('.btn-next').attr("disabled",true); */
			var content1 = $('.sh_sub_content1_2').html();
			if(content1!=null){
				$('#1').attr("disabled", false);
			}
			 /* $(document).on('click','.sh_select_field',function(){
				$('#2').attr("disabled", false);
			});
			 */
			
			
		});
		        
    </script>
	<script>
	
	$(document).on('click','#complete_btn4',function(){
        var str55 = "";
        var str66 = "";
        var str77 = "";
        var str88 = "";
                
                str55 = $(".license_name").val();
                str66 = $(".license_date").val();
                str77 = $(".license_agency").val();
                str88 = str55 + "·" + str66 + "·" + str77;
                $('.sh_select_license').text(str88);
            });
	
	$(document).on('click','#complete_btn5',function(){
		var str000 = "";
        var str111 = "";
        var str222 = "";
        var str333 = "";
        var str444 = "";
        var str555 = "";
     			
        		str000 = $("#type_free").val();
               	console.log(str000);
               
                str111 = $(".company_name").val();
                str222 = $(".company_department").val();
                str333 = $(".company_job_title").val();
                str444 = $('#select_job_mon option:selected').val();
                
                if($("#type_free").val()==0){
                if(str111 != null && str222 != null && str333 != null && str444 != null){
                	str555 = str111 + "·" + str222 + "·" + str333 + "·" +str444;
                	console.log(str555);
                	$('.sh_select_career').html(str555+"/"+"<br>");
                }
                	
                }else{
                	 var jobDay = $('#select_job_mon option:selected').val();
                	 $('.sh_select_career').html(jobDay);
                }
            });

        $(document).on('change','#type_free',function(){
        	if($("#type_free").is(":checked")){
        		$("#type_free").val("1");
        		$(".company_name").val("");
        		$(".company_department").val("");
        		$(".company_job_title").val("");
        		
        		$(".company_name").attr("readonly","readonly");
        		$(".company_department").attr("readonly","readonly");
        		$(".company_job_title").attr("readonly","readonly");
                console.log($("#type_free").val());
            }else{
            	$("#type_free").val("0");
            	$(".company_name").removeAttr("readonly");
            	$(".company_department").removeAttr("readonly");
            	$(".company_job_title").removeAttr("readonly");
            	console.log($("#type_free").val());
            }
        	
        		
        	})

    </script>



	<script type="text/javascript">
	function readURL(input) {
	    if(input.files && input.files[0]){
	        var reader=new FileReader();
	        reader.onload=function(e){
	            $('#m_profile_img').attr('src',e.target.result);
	        };
	        reader.readAsDataURL(input.files[0]);
	    }
	}
         $(document).ready(function() {
        	

        $('#submitModal').MultiStep({
            title:'Meister 등록',
          
            data:[{
                content:`<div class='sh_modal_content_wrap_333'>
       			 <div class='sh_sub_content1'>
   				 <div class='sh_sub_content1_1'>
   				 <c:if test="${empty sessionScope.member.memberImg}">
   				 	<div class='m_profile_img'>
   				 <img id="m_profile_img" src="/resources/upload/common/unnamedimg.png" style="width:inherit; height:inherit; border-radius:50px; border:none;" />
   				 	<input type="file" name="memberImg" class="subbtn" value="${sessionScope.member.memberImg}" onchange="readURL(this)">
   				 	
       			 	</div>
       			 </c:if>
       			 <c:if test="${not empty sessionScope.member.memberImg}">
       				<div class='m_profile_img'>
       				<input type="file" name="memberImg" class="subbtn" value="${sessionScope.member.memberImg}" onchange="readURL(this)">
      			 	</div>
       			 </c:if>
                        <div class="m_nickname_box">
                        <span style="font-weight: bold; text-align : left;" >전문가 닉네임</span>
       			<div class="m_nickname">
       				<input type='text' name="memberNickname" id='member_nickname' value='${sessionScope.member.memberNickname}' style='cursor:not-allowed;'readonly>
       			</div>
                   </div>
       			</div>
                    <span style="font-weight: bold; margin-left : 10px;">자기소개</span>
       			<textarea class='sh_sub_content1_2' style='text-align:left;' name="memberIntro">${sessionScope.member.memberIntro}</textarea>
       		</div>
       		
   			</div> 
                
                `,
        
                label:'전문가 소개'
            },{
                content:` <div class='sh_modal_content_wrap_333'>
       			 <div class='sh_sub_content1_22'>
   				 <div class='sh_sub_content1_1_2'>
                       <span style="margin-left:20px;">전문 분야 및 상세 분야를 선택해주세요</span> <span style="font-size: 8px; color : #FFBC42"> 단일선택</span><br>
                        <select id="select_menu" onchange="categoryChange(this)" name="memberField1" class="select_field">
                            <option value="IT프로그래밍">IT프로그래밍</option>
                            <option value="디자인">디자인</option>
                        </select><br>
                        <select id="select_sub_menu" name="memberField2" class="select_field">
                            <option key="default-empty" hidden>상세메뉴를 선택해주세요</option>
                            
                        </select>
       			</div>
       			<div class='sh_sub_content1_2_2'>
       				선택한 전문 분야:
       			</div>
       		</div>
       		<div class='sh_sub_content2_2'>
       		  추가 항목<br>
       		└─><span class="sh_select_field">${member.memberField}</span>
       		</div> 
   </div> 
                	
                `,
                label:'전문 분야'
            },{
               content:`<div class='sh_modal_content_wrap_333'>
      			 <div class='sh_sub_content1_333'>
  				 <div class='sh_sub_content1_1_333'>
                      <span style="margin-left:20px;">분야 별 보유 기술을 선택해주세요.</span> <span style="font-size: 8px; color : #FFBC42"> 복수선택</span><br>
                       <select id="select_menu2" onchange="categoryChange2(this)" class="select_field">
                           <option value="IT프로그래밍">IT프로그래밍</option>
                           <option value="디자인">디자인</option>
                       </select><br>
                       <select id="select_sub_menu2"  class="select_field select_skill">
                           <option key="default-empty" hidden>상세메뉴를 선택해주세요</option>
                           
                       </select>
      			</div>
      			<div class='sh_sub_content1_2_333'>
      			     선택한 기술 : 
      			    	 
      			</div>
      		</div>
      		<div class='sh_sub_content2_333'>
      		  추가 기술 항목<br>
                  └─><input type="text" style="border:none;" class="sh_select_skill" name="memberSkill">
      		</div> 
  </div> 
               
               `,
               
                label:'보유 기술'
            },{
                content:`<div class='sh_modal_content_wrap_333'>
                    <div class='sh_sub_content1_333' style="width : 100%;">
                    <div class='sh_sub_content1_1_333'>
                        <span style="margin-left:20px;">최종 학력 전공을 작성해주세요</span><br>
                        <input type="text" name="memberSchool" class="select_field member_school" placeholder="학교명(ex 마이대학교)" style="height : 41px;"><br>
                        <input type="text" name="memberMajor" class="select_field member_major" placeholder="전공(ex 소프트웨어학과)" style="height : 41px; width : 62.5%;">
                        <select id="select_grade_menu" name="memberGrade" class="select_field" style="height : 45px; width : 24%;">
                            <option value="상태" selected disabled hidden>상태</option>
                            <option value="재학" >재학</option>
                            <option value="휴학" >휴학</option>
                            <option value="이수" >이수</option>
                            <option value="졸업" >졸업</option>
                        </select>
                    </div>
                    <button type="button" class="complete_btn" id="complete_btn2">확인</button>
                    <div class='sh_sub_content1_2_444'>
                        선택 학력·전공 : <br>
                        <span class="sh_select_school"></span>
                    </div>
                </div>
                
            </div>
                `,
                	label:'학력·전공'
            },{
            	content:`
            		<div class='sh_modal_content_wrap_333'>
                    <div class='sh_sub_content1_333' style="width : 100%;">
                        <div class='sh_sub_content1_1_333'>
                            <span style="margin-left:20px;">보유한 자격증을 작성해주세요</span><br>
                            <input type="text" name="licenseName" class="select_field license_name" placeholder="자격증명" style="height : 41px;"><br>
                            <input type="date" name="licenseDate" class="select_field license_date" placeholder="발급일" style="height : 41px; width : 25%;">
                            <input type="text" name="licenseAgency" class="select_field license_agency" placeholder="발급기관" style="height : 41px; width : 60.5%;">
                            
                        </div>
                        <button type="button" class="complete_btn3" id="complete_btn4">확인</button>
                        <div class='sh_sub_content1_2_555'>
                            자격증 : <br>
                            <span class="sh_select_license"></span>
                        </div>
                    </div>
                    
                </div>
            	`,
            	label:'자격증'
            },{
            	content:`
            		<div class='sh_modal_content_wrap_333'>
                    <div class='sh_sub_content1_333' style="width : 100%;">
                        <div class='sh_sub_content1_1_444'>
                            <span style="margin-left:20px;">경력사항을 작성해주세요</span><br>
                            <p class="select_career_check">프리랜서인 경우, 체크해주세요 <input type="checkbox" id="type_free" name="typeFree" value="0"  ></p><br>
                            
                            <input type="text" name="companyName" class="select_field company_name" placeholder="회사명" style="height : 41px; width : 25%; ">
                            <input type="text" name="companyDepartment" class="select_field company_department" placeholder="근무부서" style="height : 41px; width : 60.5%;">
                            <input type="text" name="companyJobTitle" class="select_field company_job_title" placeholder="직위" style="height : 41px; width : 60.5%;">
                            <select id="select_job_mon" name="companyJobMon" class="select_field " style="height : 45px; width : 24%;">
                                <option value="상태" selected disabled hidden>근무기간(년)</option>
                                <option value="1" >1년</option>
                                <option value="2">2년</option>
                                <option value="3">3년</option>
                                <option value="4">4년</option>
                                <option value="5" >5년</option>
                                <option value="6" >6년</option>
                                <option value="7" >7년</option>
                                <option value="8" >8년</option>
                                <option value="9">9년</option>
                                <option value="10">10년</option>
                                <option value="11">11년</option>
                                <option value="12">12년</option>
                            </select>
                        </div>
                        <button type="button" class="complete_btn3" id="complete_btn5">확인</button>
                        <div class='sh_sub_content1_2_666'>
                            	경력사항 : <br>
                            <span class="sh_select_career"></span>
                        </div>
                    </div>
                    
                </div>
            	`,
            	label:'경력사항'
            }],
            
            final:`'마이스터로 등록 하시겠습니까?'<br>
        		<button type="submit" class="btnupdate" >등록하기</button>
        `
            	,
            modalSize:'lg'
        });
        
        
        
        /* $("form").on("submit", function(event) {
            event.preventDefault();
            // process form
            $(document).on("click", ".btnupdate",function(){
            	 console.log($('.sh_sub_content1_2').val());
            	
            	 var formdata=new FormData($('#profileform')[0]);
            	 for (var value of formdata.values()) {
            		   console.log(value); 
            		}
            	//에이작스 쓰기
            	//data:formdata
            	$.ajax({
            		url:"/meister/member/profileupdate.do",
            		type:"get",
            		data:formdata,
            		contentType:false,
            		processData:false,
            		success:function(data){
            			console.log(data);
            		},error:function(){
            			console.log("profile update error");
            		}
            	})
            	
             }) 
         }); */
        
    });
     
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Core theme CSS (includes Bootstrap)-->

<link href="/resources/sh/css/styles.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
</html>
