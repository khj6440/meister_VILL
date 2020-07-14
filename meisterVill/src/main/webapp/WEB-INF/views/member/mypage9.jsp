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
<script src="/resources/sell-css/vendor/jquery/jquery.min.js"></script>
<script
	src="/resources/sell-css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	color: #4D4D4D;
}

.my_main_container {
	width: 1200px;
	overflow: hidden;
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
	box-shadow: 1px 1px 1px lightgray;
	margin-top: 20px;
	width: 100%;
	height: 40px;
	border-radius: 30px;
	border: 1px solid lightgray;
	background-color: white;
	width: 100%;
}

.my_transform_btn:hover {
	background-color: rgb(243, 244, 248);
	border: 1px solid darkgray;
}

.my_menubar {
	width: 100%;
	border-top: 1px solid black;
}

.my_navi {
	padding: 5px;
}

.my_navi li {
	list-style: none;
}

.my_menu {
	cursor: pointer;
}

.my_menu_span {
	height: 30px;
	font-weight: bold;
}

.my_menu {
	padding-top: 15px;
	padding-bottom: 15px;
	width: 100%;
	font-size: 18px;
}

.my_menu_span:hover {
	font-weight: bold;
	color: gray;
}

.my_sub_menu {
	box-shadow: 1px 1px 1px lightgray;
	border: 1px solid darkgray;
	padding-left: 20px;
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	border-radius: 5px;
	background-color: rgb(239, 239, 239);
}

.my_menu .my_sub_menu {
	display: none;
}

.my_sub_menu li {
	margin-bottom: 10px;
}

.my_sub_menu li a {
	text-decoration: none;
	font-size: 15px;
	color: #4D4D4D;
	padding: 5px;
}

.my_sub_menu li a:hover {
	font-weight: bold;
	color: #FFBC42;
}

.click {
	color: #FFBC42;
}

.my_sub_container2 {
	margin-top: 45px;
	width: 70%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}

.project_content {
	border: 1px solid lightgray;
	width: 90%;
	margin: 0 auto;
	margin-bottom: 30px;
}

.project_null {
	font-weight: bold;
	margin: 0 auto;
	width: 70%;
	height: 80%;
	margin-top: 30px;
	text-align: center;
	line-height: 2;
}

.project_margin {
	margin-top: 45px;
	text-align: center;
}

.null_img {
	width: 100px;
	height: 100px;
}

.list_null {
	margin: 0 auto;
}

.project_write_img {
	margin-top: 30px;
	width: 70px;
	height: 70px;
	opacity: 0.8;
	margin-left: 5px;
}

.project_request_write {
	box-shadow: 3px 3px 3px lightgray;
	margin-top: 20px;
	margin-bottom: 20px;
	border: none;
	width: 250px;
	height: 50px;
	border-radius: 5px;
	border: none
}

.project_request_write:hover {
	background-color: #FFBC42;
	color: white;
	font-weight: bold;
}

.selectPage {
	border: 1px solid #eeeeee;
	font-weight: bold;
	padding: 12px;
	padding-top: 6px;
	padding-botton: 6px;
}

.btn {
	border: 1px solid #eeeeee;
}

.btn:hover {
	color: #7DC947;
}

a {
	color: black;
}

.select-li {
	color: FFBC42;
	font-weight: bold;
}

.sh_list_div {
	margin-top: 5px;
	margin-bottom: 10px;
	width: 750px;
	height: 150px;
	border: 1px solid #FFBC42;
	border-radius: 3px;
	overflow: hidden;
	box-sizing: content-box;
	text-align: center;
}

.sh_list_div1 {
	border-right: 1px dotted gray;
	box-sizing: border-box;
	width: 70%;
	height: 100%;
	float: left;
}

.sh_list_div2 {
	padding-top: 10px;
	box-sizing: border-box;
	float: left;
	width: 30%;
	height: 100%;
	text-align: center;
	line-height: 1.5;
}
.sh_list_title {
	font-size: 20px;
	margin: 0 auto;
	line-height: 7;
}
.sh_list_title >a{
color : #4D4D4D;
}
.sh_list_title> a:hover{
	color : #FFBC42;
}

.sh_list_category {
	font-size: 12px;
}
</style>
</head>
<body>
	<%
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
	%>
	<script>
		$(function() {

			var reqPage = ${reqPage};
			var memberNo = "${sessionScope.member.memberNo}";
			var memberLevel = "${sessionScope.member.memberLevel}";
			console.log(memberLevel);
			if (memberLevel == 1) {
				$.ajax({
							url : "/meister/member/selectAllSell.do",
							data : {
								reqPage : reqPage,
								memberNo : memberNo
							},
							success : function(data) {
								var selllist = ${list};
								var num = selllist.number;
								console.log(selllist);
								console.log(num);
								html = "";
								page = "";
								if (num == 0) {
									html += "<div class='project_margin'>";
									html += "<div style='margin-top : 100px;'>";
									html += "<img class= 'null_img' src='/resources/upload/common/warning.png'></div>";
									html += "<span style= 'line-height : 10;'>요청글에 대한 이력이 없습니다.</span><br>";
									html += "</div>";

									$(".employ_list").html(html);

								} else {
									for (var i = 0; i < num; i++) {
										html += "<div class='sh_list_div'>";
										html += " <div class='sh_list_div1'>";
										html += "<div class='sh_list_title'><a style='text-decoration: none;' href='#'>"
												+ selllist["sell" + i]["sellvo"].sellTitle
												+ "</a></div><br>";
										html += "</div>";
										html += "<div class='sh_list_div2'>";
										html += "<span>카테고리</span><br>";
										html += "<span class='sh_list_category'>"
												+ selllist["sell" + i]["sellvo"].sellCategory1
												+ ">"
												+ selllist["sell" + i]["sellvo"].sellCategory2
												+ "</span><br>";
										html += "<hr>";
										html += "<span>진행/작업 기간</span><br>";
										 html += "<span class='sh_list_category'>"
												+ selllist["sell" + i]["sellvo"].sellPeriod
												+ "까지"; 
										html += "</span>";
										html += "</div>";
										html += "</div>";
									}
									page += "<div class='pageNavi'>"
											+ selllist["pageNavi"] + "</div>";
									$(".employ_list").html(html);
									$(".list-pageNavi").html(page);
								}

							},
							error : function() {
								console.log("페이징 ajax 실패");
							}

						});
			}

			$(".my_transform_btn").click(function() {

				var Nickname = "${sessionScope.member.memberNickname}";
				var level = "${sessionScope.member.memberLevel}";
				$.ajax({
					url : "/meister/member/transformMember.do",
					data : {
						Nickname : Nickname,
						level : level,
						reqPage : reqPage
					},
					type : "get",
					success : function(data) {
						if (data == '0') {
							console.log("의뢰인 전환 성공");
							location.reload();

						} else if (data == '1') {
							console.log("마이스터 전환 성공");
							location.reload();
						}
					},
					error : function() {
						console.log("ajax 실패");
					}
				});
			});

		});
	</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section class="mypage_container" style="padding-top: 15%;">
		<input type="hidden" name="member" value="${sessionScope.member }">
		<div class="my_main_container">
			<div class="my_sub_container1">
				<div class="my_profile">
					<div class="my_img">
						<img src="/resources/upload/common/unnamedimg.png"
							class="my_profile_img">
					</div>
					<div class="my_profile_sub">
						<span class="my_nickname">${sessionScope.member.memberNickname }</span>
						<div class="my_transform">
							<c:if test="${sessionScope.member.memberLevel == 1 }">
								<button class="my_transform_btn" type="submit">의뢰인으로 전환</button>
							</c:if>
							<c:if test="${sessionScope.member.memberLevel == 0 }">
								<button class="my_transform_btn" type="submit">마이스터로 전환</button>
							</c:if>
						</div>
					</div>
				</div>
				<c:if test="${sessionScope.member.memberLevel == 1 }">
					<h4 style="margin-bottom: 10px;">마이스터</h4>
				</c:if>
				<c:if test="${sessionScope.member.memberLevel == 0 }">
					<h4 style="margin-bottom: 10px;">의뢰인</h4>
				</c:if>
				<div class="my_menubar">
					<div class="my_navi">
						<ul style="margin-left: -40px;">
							<c:if test="${sessionScope.member.memberLevel == 1 }">
								<li class="my_menu"><span class="my_menu_span">프로젝트
										모집글 관리</span>
									<ul class="my_sub_menu">
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=3&memberLevel=1&employappro=3">전체</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=0&memberLevel=1&employappro=0">요청중</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=2&memberLevel=1&employappro=2">비승인</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=0&memberLevel=1&employappro=1">모집중</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=1&memberLevel=1&employappro=1">진행중</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=2&memberLevel=1&employappro=1">마감</a></li>

									</ul></li>

								<li class="my_menu"><span class="my_menu_span">보낸견적</span>
									<ul class="my_sub_menu">
										<li><a
											href="/meister/member/selectAllRequestRe.do?memberNo=${sessionScope.member.memberNo }&reqPage=1">전체</a></li>
										<li><a href="#">대기중</a></li>
										<li><a href="#">채택</a></li>
										<li><a href="#">마감</a></li>

									</ul></li>
								<li class="my_menu"><span class="my_menu_span">판매관리</span>
									<ul class="my_sub_menu">
										<li><a
											href="/meister/member/selectAllSell.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&sellstatus=3&sellappro=3">전체</a></li>
										<li><a
											href="/meister/member/selectAllSell.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&sellstatus=0&sellappro=0">승인요청중</a></li>
										<li><a
											href="/meister/member/selectAllSell.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&sellstatus=1&sellappro=2">비승인</a></li>
										<li><a
											href="/meister/member/selectAllSell.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&sellstatus=0&sellappro=1">판매중</a></li>
										<li><a
											href="/meister/member/selectAllSell.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&sellstatus=2&sellappro=2">삭제</a></li>

									</ul></li>

							</c:if>
							<c:if test="${sessionScope.member.memberLevel== 0 }">
								<li class="my_menu"><span class="my_menu_span">나의
										견적요청</span>
									<ul class="my_sub_menu">
										<li><a
											href="/meister/member/selectAllRequest.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&requeststatus=3&memberLevel=0&requestappro=3">전체</a></li>
										<li><a
											href="/meister/member/selectAllRequest.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&requeststatus=0&memberLevel=0&requestappro=0">승인대기중</a></li>
										<li><a
											href="/meister/member/selectAllRequest.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&requeststatus=0&memberLevel=0&requestappro=2">비승인</a></li>
										<li><a
											href="/meister/member/selectAllRequest.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&requeststatus=1&memberLevel=0&requestappro=1">요청중</a></li>
										<li><a
											href="/meister/member/selectAllRequest.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&requeststatus=2&memberLevel=0&requestappro=1">완료</a></li>

									</ul></li>

								<li class="my_menu"><span class="my_menu_span">구매 관리</span>
									<ul class="my_sub_menu">
										<li><a href="#">전체</a></li>
										<li><a href="#">진행중</a></li>
										<li><a href="#">수정요청</a></li>
										<li><a href="#">완료</a></li>
										<li><a href="#">취소</a></li>

									</ul></li>
								<!-- <li class="my_menu"><span class="my_menu_span">쿠폰</span>
									<ul class="my_sub_menu">
										<li><a href="/meister/member/mypage13.do">전체</a></li>
										<li><a href="/meister/member/mypage14.do">사용가능한 쿠폰</a></li>
										<li><a href="/meister/member/mypage15.do">마감된 쿠폰</a></li>

									</ul></li>
								<li class="my_menu"><span class="my_menu_span"> <a
										style="color: #4D4D4D; text-decoration: none;"
										href="#">찜한 목록</a></span></li> -->
							</c:if>
						</ul>
					</div>

					<!--  -->
				</div>
			</div>

			<div class="my_sub_container2">
				<c:if test="${sessionScope.member.memberLevel == 1 }">
					<div class="my_project">
						<h5 style="margin-left: 40px;">판매글 관리</h5>
						<div class="project_content">
							<div class="employ_list"></div>
							<div class="list-pageNavi"
								style="margin: 0 auto; width: 300px; text-align: center; padding-top: 50px; padding-bottom: 20px;">
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${sessionScope.member.memberLevel == 0 }">
					<div class="my_project">
						<!-- <h5 style="margin-left: 40px;">찜한 목록</h5>
						<div class="project_content">
							<div class="request_list"></div>
							<div class="list-pageNavi"
								style="margin: 0 auto; width: 300px; text-align: center; padding-top: 50px; padding-bottom: 20px;">
							</div>
						</div> -->
					</div>
				</c:if>
			</div>
		</div>
	</section>
	<!-- </form> -->

	<script>
		$(document).ready(
				function() {

					$('.my_sub_menu').eq(2).show();
					$('.my_sub_menu').eq(2).find("a").first().css("color",
							"#FFBC42");
					$('.my_sub_menu').eq(2).find("a").first().css(
							"font-weight", "bold");

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
		function showSellList(sellNo) {
			location.href = "/meister/sell/showList.do?sellNo=" + sellNo;
		}
	</script>
</body>
</html>