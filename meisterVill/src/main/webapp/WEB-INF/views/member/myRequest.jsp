<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">




<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	color: #4D4D4D;
}

.my_main_container {
	border: 1px solid black;
	width: 1200px;
	overflow: hidden;
	height: 1200px;
	margin: 0 auto;
	box-sizing: content-box;
}

.my_sub_container1 {
	width: 30%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	overflow: hidden;
}

.my_profile {
	width: 100%;
	height: 30%;
	padding: 50px;
	overflow: hidden;
}

.my_img {
	border-radius: 100px;
	border: 1px solid lightgray;
	width: 150px;
	height: 150px;
	margin: 0 auto;
}

.my_profile_img {
	width: 150px;
	height: 150px;
	margin: 0 auto;
	border-radius: 100px;
}

.my_profile_sub {
	margin-top: 20px;
	width: 100%;
	height: 50%;
	text-align: center;
}

.my_nickname {
	margin: 0 auto;
	width: 100px;
	text-weight: bold;
	font-size: 20px;
}

.my_transform {
	margin: 0 auto;
	text-align: center;
}

.my_transform_btn {
	margin-top: 20px;
	width: 100%;
	height: 40px;
	border-radius: 30px;
	border: 1px solid lightgray;
	background-color: white;
	width: 100%;
	text-decoration: none;
	color : #4D4D4D;
}

.my_transform_btn:hover {
	background-color: rgb(243, 244, 248);
	border: 1px solid darkgray;
}

.my_menubar {
	width: 100%;
	border-top : 1px solid black;
	
}
.my_navi{
	padding : 5px;
}
.my_navi li{
	list-style : none;
}
.my_menu {
	cursor : pointer;
}
.my_menu_span{
	height : 30px;
}
.my_menu{
	padding-top : 15px;
	padding-bottom : 15px;
	width : 100%;
	font-size : 18px;
}
.my_menu_span:hover{
	font-weight: bold;
	color : gray;
}

.my_sub_menu{
	border : 1px solid black;
	padding-left: 20px;
	margin-top : 10px;
    margin-left: 10px;
    margin-right: 10px;
    border-radius: 5px;
    background-color : rgb(243, 244, 248);
}
.my_menu .my_sub_menu {
	display: none;
}
.my_sub_menu li{
	margin-bottom: 10px;
}
.my_sub_menu li a{
	text-decoration: none;
	font-size : 15px;
	color : #4D4D4D;
}
.my_sub_menu li a:hover{
	font-weight: bold;
}
.my_click{
	background-color : lightgray;
}
.my_sub_container2 {
	border: 1px solid red;
	width: 70%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section class="mypage_container" style="padding-top: 15%;">
		<div class="my_main_container">
			<div class="my_sub_container1">
				<div class="my_profile">
					<div class="my_img">
						<img src="/upload/common/unnamedimg.png" class="my_profile_img">
					</div>
					<div class="my_profile_sub">
						<span class="my_nickname">${m.memberNickname }</span>
						<div class="my_transform">
							<c:if test="${m.memberLevel == 1 }">
								<button class="my_transform_btn" onclick="location.href='#'">의뢰인으로 전환</button>
							</c:if>
							<c:if test="${m.memberLevel == 0 }">
								<button class="my_transform_btn" onclick="location.href='#'">마이스터로 전환</button>
							</c:if>
						</div>
					</div>
				</div>
				
					<h4 style="margin-bottom : 10px;">마이 마이스터</h4>
				<div class="my_menubar">
					
					<div class="my_navi">
						<ul style="margin-left : -40px;">
							<li class="my_menu"><span class="my_menu_span">프로젝트 모집글 관리</span>
								<ul class="my_sub_menu">
									<li><a href="/meister/member/mypage.do">전체</a></li>
									<li><a href="#">작성한 프로젝트</a></li>
									<li><a href="#">진행중</a></li>
									<li><a href="#">마감</a></li>
									
								</ul>
							</li>

							<li class="my_menu"><span class="my_menu_span">보낸견적</span>
								<ul class="my_sub_menu">
									<li><a href="/myRequest.do">전체</a></li>
									<li><a href="#">대기중</a></li>
									<li><a href="#">채택</a></li>
									<li><a href="#">마감</a></li>
									
								</ul>
							</li>
							<li class="my_menu"><span class="my_menu_span">판매관리</span>
								<ul class="my_sub_menu">
									<li><a href="#">전체</a></li>
									<li><a href="#">진행중</a></li>
									<li><a href="#">완료</a></li>
									<li><a href="#">취소</a></li>
									
								</ul>
							</li>
							<li class="my_menu"><span class="my_menu_span">나의 서비스</span>
								<ul class="my_sub_menu">
									<li><a href="#">전체</a></li>
									<li><a href="#">판매중</a></li>
									<li><a href="#">판매중지</a></li>
									<li><a href="#">비승인</a></li>
									
								</ul>
							</li>
						</ul>
					</div>

					<!--  -->
				</div>
			</div>

			<div class="my_sub_container2"></div>
		</div>
	</section>


	<script>
		$(document).ready(function() {
	
			$('.my_sub_menu').eq(1).show();
			
			// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
			$(".my_menu").click(function() {
				var submenu = $(this).find("ul");
				
				// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
				if (submenu.is(":visible")) {
					submenu.slideUp();
				} else {
					submenu.slideDown();
				} 
					
			});
			
		});
		
	</script>

</body>
</html>