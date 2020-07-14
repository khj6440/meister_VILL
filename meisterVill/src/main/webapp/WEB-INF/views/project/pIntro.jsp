<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- --------------------------------------------------------------------------- -->
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono"
	rel="stylesheet">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/css/magnific-popup.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/css/jquery-ui.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/hj/projectRoom/home/css/aos.css">

<link rel="stylesheet"
	href="/resources/hj/projectRoom/home/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap"
	rel="stylesheet">


<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
* {
	margin-block-start: 0px;
	margin-block-end: 0px;
	font-family: 'Noto Sans KR', sans-serif;
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
/* ---------------------------- */
.card-container {
	background-color: #fafafa;
	border-radius: 5px;
	box-shadow: 0px 10px 20px -10px rgba(0, 0, 0, 0.75);
	padding-top: 30px;
	position: relative;
	width: 200px;
	text-align: center;
	position: relative;
}

.card-container .pro {
	color: #231E39;
	background-color: #FEBB0B;
	border-radius: 3px;
	font-size: 14px;
	font-weight: bold;
	padding: 3px 7px;
	position: absolute;
	top: 30px;
	left: 30px;
}

.card-container .round {
	border: 1px solid #cccccc;
	border-radius: 50%;
	padding: 7px;
	background: #cccccc;
}

button.primary {
	background-color: #ffbc42;
	border: 1px solid #ffbc42;
	border-radius: 3px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 10px 25px;
}

button.primary.ghost {
	background-color: transparent;
	color: #02899C;
}

.skills {
	text-align: left;
	padding: 15px;
	margin-top: 30px;
}

.skills ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.skills ul li {
	border: 1px solid #e6e6e6;
	border-radius: 2px;
	display: inline-block;
	font-size: 12px;
	margin: 0 7px 7px 0;
	padding: 7px;
	background-color: #e6e6e6;
}
</style>
</head>
<body>
	<div id="perspective" class="perspective effect-moveleft">
		<div class="side-container">
			<div class="project-content" style="">
				<div class="site-wrap">
					<div class="site-mobile-menu">
						<div class="site-mobile-menu-header">
							<div class="site-mobile-menu-close mt-3">
								<span class="icon-close2 js-menu-toggle"></span>
							</div>
						</div>
						<div class="site-mobile-menu-body"></div>
					</div>

				</div>
				<div class="site-section site-hero inner"
					style="margin-top:50px;margin-bottom: 0px; padding-bottom: 0px; /* background-image: url('/resources/upload/project/bg2.jpg');  background-repeat: no-repeat; background-size: 100% 100%;*/">

					<div class="container">
						<div class="row align-items-center">
							<div class="col-md-10">
								<span style="font-size: 20px; color: grey;" d-block mb-3
									caption" data-aos="fade-up">PROJECT</span>
								<div style="font-size: 40px; font-weight: bold"
									class="d-block mb-4" data-aos="fade-up" data-aos-delay="100">${project.employTitle }</div>
							</div>
						</div>
					</div>
				</div>

				<div class="site-section" style="padding-top: 2em;">
					<div class="container">
						<div class="row mb-5">
							<div class="col-lg-4 ">
								<div class="site-section-heading" data-aos="fade-up"
									data-aos-delay="100">
									<h2 style="font-size: 30px; color: black;">ABOUT PROJECT</h2>
								</div>
							</div>

						</div>
						<div style="margin-bottom: 30px;" class="row">
							<div class="col-md-4" data-aos="fade-up" data-aos-delay="400"
								style="border-right: 1px solid #ffbc42;">
								<span class="" style="border-bottom: 2px solid #FFBC42">Detail</span>
							</div>
							<div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
								<div>${project.employCategory1 }</div>
								<div>${project.employCategory2 }</div>
							</div>
						</div>

						<div style="margin-bottom: 30px;" class="row">
							<div class="col-md-4" data-aos="fade-up" data-aos-delay="400"
								style="border-right: 1px solid #ffbc42;">
								<span class="" style="border-bottom: 2px solid #FFBC42">Skills</span>
							</div>
							<div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
								<p>${project.employSkill }</p>
							</div>
						</div>


						<div style="margin-bottom: 30px;" class="row">
							<div class="col-md-4" data-aos="fade-up" data-aos-delay="400"
								style="border-right: 1px solid #ffbc42;">
								<span class="" style="border-bottom: 2px solid #FFBC42">budget</span>
							</div>
							<div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
								<p>${project.employPrice }</p>
							</div>
						</div>

						<div style="margin-bottom: 30px;" class="row">
							<div class="col-md-4" data-aos="fade-up" data-aos-delay="400"
								style="border-right: 1px solid #ffbc42;">
								<span class="" style="border-bottom: 2px solid #FFBC42">Project
									Start</span>
							</div>
							<div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
								<p>${project.projectStart }~~</p>
							</div>
						</div>

					</div>
				</div>


				<div class="site-section" style="padding-top: 2em;">
					<div class="container">
						<div class="row mb-5 justify-content-center" style="justify-content: none;">
							<div class="col-lg-4 mb-5">
								<div class="site-section-heading" data-aos="fade-up"
									data-aos-delay="100">
									<h2 style="font-size: 30px; color: black;">PROJECT MEMBER</h2>
								</div>
							
							</div>
						</div>
						<div class="row" style="justify-content: space-between;">
							<c:forEach items="${members }" var="m">
								<%-- <div class="col-md-6 col-lg-4 mb-5 mb-lg-5" data-aos="fade-up"
									data-aos-delay="100"
									style="border-radius: 10px; border: 2px solid #dedede; padding: 30px; max-width: 29%; box-shadow: 2px 2px 2px grey">
									<div class="testimony text-center">
										<figure>
											<c:if test="${empty m.memberImg }">
												<img src="/resources/upload/common/none_user.png"
													alt="Image" class="img-fluid">
											</c:if>
											<c:if test="${not empty m.memberImg }">
												<img src="/resources/upload/memberImg/${m.memberImg}"
													alt="Image" class="img-fluid">
											</c:if>
										</figure>
										<blockquote
											style="border: 1px solid gray; padding: 10px; border-radius: 10px;">
											<div
												style="font-weight: bold; font-size: 20px; margin-top: 0;"
												class="author mb-0">${m.memberName }</div>
											<div class="text-muted mb-4">${m.memberNickname }</div>
											<div>${m.memberEmail }</div>
											<div>${m.memberPhone }</div>

										</blockquote>
									</div>
								</div> --%>
								<div class="card-container col-md-6 col-lg-4 mb-5 mb-lg-5"
									data-aos="fade-up" data-aos-delay="100"
									style="max-width: 29%; border-radius: 10px; border: 2px solid #dedede; box-shadow: 2px 2px 2px grey;">
									<img class="round" style="width: 150px; height: 150px;"
										src="/resources/upload/common/none_user.png" alt="user" />
									<h3>${m.memberName }</h3>
									<h6>${m.memberNickname }</h6>
									<div>${m.memberPhone }</div>
									<div class="skills">
										<h6>Skills</h6>
										<ul>
									<c:forTokens items="${m.memberSkill }" delims="/" var="item" varStatus="status">
											<li>${item}</li>
									</c:forTokens>
										</ul>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
<script>
	$(function() {
	
	})
</script>

<!-------------------------------------------------------------------------------  -->
<script src="/resources/hj/projectRoom/home/js/jquery-3.3.1.min.js"></script>
<script
	src="/resources/hj/projectRoom/home/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/hj/projectRoom/home/js/jquery-ui.js"></script>
<script src="/resources/hj/projectRoom/home/js/popper.min.js"></script>
<script src="/resources/hj/projectRoom/home/js/bootstrap.min.js"></script>
<script src="/resources/hj/projectRoom/home/js/owl.carousel.min.js"></script>
<script src="/resources/hj/projectRoom/home/js/jquery.stellar.min.js"></script>
<script src="/resources/hj/projectRoom/home/js/jquery.countdown.min.js"></script>
<script
	src="/resources/hj/projectRoom/home/js/jquery.magnific-popup.min.js"></script>
<script
	src="/resources/hj/projectRoom/home/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/hj/projectRoom/home/js/aos.js"></script>

<script src="/resources/hj/projectRoom/home/js/main.js"></script>
</html>