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
.select-li{
	color : FFBC42;
	font-weight: bold;
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
			var memberNickname = "${sessionScope.member.memberNickname}";
			var memberLevel = "${sessionScope.member.memberLevel}";
			console.log(memberLevel);
			if (memberLevel == 1) {
				$.ajax({
							url : "/meister/member/selectAllEmploy.do",
							data : {
								reqPage : reqPage,
								memberNo : memberNo,
								memberNickname : memberNickname
							},
							success : function(data) {
								var emplist = ${list};
								var num = emplist.number;
								console.log(emplist);
								console.log(num);
								html = "";
								page = "";
								if (num == 0) {
									html += "<div class='project_margin'>";
									html += "<div class='list_null'>";
									html += "<span>";
									html += "등록된 프로젝트 모집글이 없습니다.";
									html += "</span>";
									html += "<br>";
									html += "<span>프로젝트 모집글을 작성하여 모집해보세요!</span>";
									html += "<br>";
									html += "<img class='project_write_img' src='/upload/common/service.png'>";
									html += "<br>";
									html += "<button type='button' class='project_request_write' onclick='location.href='#''>프로젝트 모집글 작성하기</button>";
									html += "</button>";
									html += "</div>";
									html += "</div>";

									$(".employ_list").append(html);

								} else {
									for (var i = 0; i < num; i++) {
										html += "<div>";
										html += "<div class='card' style='height: 200px; margin-bottom : 10px; 'onclick='showList("
												+ emplist["employ" + i]["employvo"].employTitle
												+ ");'>";
										html += "<div>";
										html += "<h4 class='card-text'>"
												+ emplist["employ" + i]["employvo"].employTitle
												+ "</h4>";
										html += "</div>";
										html += "</div>";
									}
									page += "<div class='pageNavi'>"
											+ emplist["pageNavi"] + "</div>";
									$(".employ_list").append(html);
									$(".list-pageNavi").append(page);
								}

							},
							error : function() {
								console.log("페이징 ajax 실패");
							}

						});
			} else {
				$.ajax({
							url : "/meister/member/selectAllRequest.do",
							data : {
								reqPage : reqPage,
								memberNo : memberNo,
								memberNickname : memberNickname
							},
							success : function(data) {
								var reqlist = ${list2};
								var num = reqlist.number;
								console.log(reqlist);
								console.log(num);
								html = "";
								page = "";
								if (data == null) {
									html += "<div class='project_margin'>";
									html += "<span>";
									html += "등록된 프로젝트 모집글이 없습니다.";
									html += "</span>";
									html += "<br>";
									html += "<span>프로젝트 모집글을 작성하여 모집해보세요!</span>";
									html += "<br>";
									html += "<img class='project_write_img' src='upload/common/service.png'>";
									html += "<br>";
									html += "<button type='button' class='project_request_write' onclick='location.href='#''>프로젝트 모집글 작성하기</button>";
									html += "</button>";
									html += "</div>";

									$(".request_list").append(html);

								} else {
									for (var i = 0; i < num; i++) {
										html += "<div>";
										html += "<div class='card' style='height: 200px; margin-bottom : 10px; 'onclick='showList2("
												+ reqlist["request" + i]["requestvo"].requestTitle
												+ ");'>";
										html += "<div>";
										html += "<h4 class='card-text'>"
												+ reqlist["request" + i]["requestvo"].requestTitle
												+ "</h4>";
										html += "</div>";
										html += "</div>";
									}
									page += "<div class='pageNavi'>"
											+ reqlist["pageNavi"] + "</div>";
									$(".request_list").append(html);
									$(".list-pageNavi").append(page);
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
						<img src="/upload/common/unnamedimg.png" class="my_profile_img">
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
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=3&memberLevel=1&employappro=0">요청중</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=3&memberLevel=1&employappro=2">비승인</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=0&memberLevel=1&employappro=1">모집중</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=1&memberLevel=1">진행중</a></li>
										<li><a
											href="/meister/member/selectAllEmploy.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&employstatus=2&memberLevel=1">마감</a></li>

									</ul></li>

								<li class="my_menu"><span class="my_menu_span">보낸견적</span>
									<ul class="my_sub_menu">
										<li><a href="/meister/member/mypage5.do">전체</a></li>
										<li><a href="/meister/member/mypage6.do">대기중</a></li>
										<li><a href="/meister/member/mypage7.do">채택</a></li>
										<li><a href="/meister/member/mypage8.do">마감</a></li>

									</ul></li>
								<li class="my_menu"><span class="my_menu_span">판매관리</span>
									<ul class="my_sub_menu">
										<li><a href="/meister/member/mypage9.do">전체</a></li>
										<li><a href="/meister/member/mypage10.do">진행중</a></li>
										<li><a href="/meister/member/mypage11.do">완료</a></li>
										<li><a href="/meister/member/mypage12.do">취소</a></li>

									</ul></li>
								<li class="my_menu"><span class="my_menu_span">나의
										서비스</span>
									<ul class="my_sub_menu">
										<li><a href="/meister/member/mypage13.do">전체</a></li>
										<li><a href="/meister/member/mypage14.do">판매중</a></li>
										<li><a href="/meister/member/mypage15.do">판매중지</a></li>
										<li><a href="/meister/member/mypage16.do">비승인</a></li>

									</ul></li>
							</c:if>
							<c:if test="${sessionScope.member.memberLevel== 0 }">
								<li class="my_menu"><span class="my_menu_span">나의
										견적요청</span>
									<ul class="my_sub_menu">
										<li><a
											href="/meister/member/selectAllRequest.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&memberNickname='${sessionScope.member.memberNickname}'&memberLevel=0">전체</a></li>
										<li><a href="/meister/member/selectAllEmploy.do">승인대기중</a></li>
										<li><a href="/meister/member/selectAllEmploy.do">요청중</a></li>
										<li><a href="/meister/member/selectAllEmploy.do">마감</a></li>
										<li><a href="/meister/member/selectAllEmploy.do">비승인</a></li>
									</ul></li>

								<li class="my_menu"><span class="my_menu_span">구매 관리</span>
									<ul class="my_sub_menu">
										<li><a href="/meister/member/mypage5.do">전체</a></li>
										<li><a href="/meister/member/mypage6.do">진행중</a></li>
										<li><a href="/meister/member/mypage7.do">수정요청</a></li>
										<li><a href="/meister/member/mypage8.do">완료</a></li>
										<li><a href="/meister/member/mypage8_1.do">평가 미작성</a></li>
										<li><a href="/meister/member/mypage8_2.do">취소</a></li>

									</ul></li>
								<li class="my_menu"><span class="my_menu_span"> <a
										style="color: #4D4D4D; text-decoration: none;"
										href="/meister/member/mypage9.do">찜한 목록</a></span></li>
								<li class="my_menu"><span class="my_menu_span">쿠폰</span>
									<ul class="my_sub_menu">
										<li><a href="/meister/member/mypage13.do">전체</a></li>
										<li><a href="/meister/member/mypage14.do">사용가능한 쿠폰</a></li>
										<li><a href="/meister/member/mypage15.do">마감된 쿠폰</a></li>

									</ul></li>
							</c:if>
						</ul>
					</div>

					<!--  -->
				</div>
			</div>

			<div class="my_sub_container2">
				<c:if test="${sessionScope.member.memberLevel == 1 }">
					<div class="my_project">
						<h5 style="margin-left: 40px;">프로젝트 모집글 관리</h5>
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
						<h5 style="margin-left: 40px;">나의 견적요청</h5>
						<div class="project_content">
							<div class="request_list"></div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	<!-- </form> -->

	<script>
		$(document).ready(function() {

			$('.my_sub_menu').eq(0).show();

			/* $(".my_sub_menu li").click(function() {
				
				var selected = $(this).find("a").hasClass("select-li");
				console.log(selected);
				$("my_sub_menu li").removeClass("select-li");
				if (!selected) {
					$(this).find("a").addClass("select-li");
				}

			});
 */
			
			$('.my_sub_menu').find("a").first().css("color", "#FFBC42");
			$('.my_sub_menu').find("a").first().css("font-weight", "bold"); 
			
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
		function showList(EmployNo) {
			location.href = "/meister/employ/showList.do?EmployNo=" + EmployNo;
		}
		function showList2(RequestNo) {
			location.href = "/meister/request/showList2.do?Request="
					+ RequestNo;
		}
	</script>
</body>
</html>