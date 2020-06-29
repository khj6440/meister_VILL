<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Fontfaces CSS-->
<link href="/resources/hj/message/css/font-face.css" rel="stylesheet"
	media="all">
<link
	href="/resources/hj/message/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="/resources/hj/message/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="/resources/hj/message/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="/resources/hj/message/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<link href="/resources/hj/message/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="/resources/hj/message/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link href="/resources/hj/message/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="/resources/hj/message/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link href="/resources/hj/message/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link href="/resources/hj/message/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="/resources/hj/message/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<link href="/resources/hj/message/css/theme.css" rel="stylesheet"
	media="all">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.sidebar {
	height: 100%;
	width: 400px;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: white;
	border: 1px solid rgb(204, 203, 203);
	overflow-x: hidden;
	/* padding-top: 30px; */
}

.add_transition {
	transition: 0.5s;
}

.side_header {
	width: 100%;
	height: 50px;
	line-height: 50px;
}

.side_header>span {
	border-bottom: 1px solid red;
	height: 50px;
	line-height: 50px;
}

.sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	border: 1px solid #e6e6e6;
	display: block;
	transition: 0.3s;
}

.sidebar .closebtn:hover {
	color: #FFBC42;
}

.sidebar .closebtn {
	position: absolute;
	top: -10px;
	right: 20px;
	font-size: 28px;
	border: none;
	margin-left: 50px;
}

.openbtn {
	font-size: 13px;
	cursor: pointer;
	background-color: white;
	color: #4D4D4D;
	padding: 5px 10px;
	border-radius: 10px;
	font-weight: bold;
}

.openbtn:hover {
	background-color: #FFBC42;
}

.toList {
	margin-left: 20px;
	border-radius: 5px;
	height: 30px;
	font-size: 14px;
	color: #878787;
}

@media screen and (max-height: 450px) {
	.sidebar {
		padding-top: 15px;
	}
	.sidebar a {
		font-size: 18px;
	}
}

.tab_title {
	text-align: center;
	font-weight: bold;
	border-bottom: 3px solid #FFBC42;
	width: 50%;
	height: 45px;
}
</style>
<div id="mySidebar" class="sidebar">
	<div class="side_header">
		<div class="tab_title">마이스터빌 안내</div>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	</div>

	<div class="col-lg-18" style="margin-top: 10px;">
		<div class="au-card au-card--no-shadow au-card--no-pad m-b-40" style="margin-bottom:0px;">
			<div id="Cbox" class="au-inbox-wrap js-inbox-wrap">
				<div class="au-message js-list-load">
					<div class="au-message-list"
						style="height: 80vh;">
						<!-- messages -->
					</div>
					<div class="au-message__footer">
						<button class="au-btn au-btn-load js-load-btn">load more</button>
					</div>
				</div>
				<div class="au-chat">
					<button class="toList" onclick="backBox()">
						<i aria-hidden="true" class="fa fa-arrow-left"></i> 목록으로 돌아가기
					</button>
					<div class="au-chat__content">
						<div class="send-mess-wrap">
							<span class="mess-time get-time"></span>
							<div class="get-message"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<div id="main">
	<button class="openbtn" onclick="openNav()">
		Meister Vill<br>알림
	</button>
	<div>
		읽지 않은 메시지:<span> </span>
	</div>
	<button id="sendBtn">sendBtn</button>
</div>
<script>
	//소켓기능
	var ws;
	var memberNickname = "${sessionScope.member.memberNickname}";

	function connect() {
		ws = new WebSocket("ws://192.168.10.15/message.do");

		ws.onopen = function() {
			console.log("웹 소켓 연결 생성(msg)");
			var msg = {
				type : "register",
				memberNickname : memberNickname
			}
			ws.send(JSON.stringify(msg));
		};
		
		ws.onmessage = function(e) {
			console.log(JSON.parse(e.data));
			console.log(e);
			$("#main>div>span").html(e.data);
		};
		
		ws.onclose = function() {
			console.log("웹 소켓 연결 종료(msg)");
		};
	}
	
	
	$(function() {
		connect();
		$("#sendBtn").click(function() {
			var sendMsg = {
				type : "msg",
				target : "user02",
				sender : "관리자",
				msgTitle:"test-title",
				msgContent:"test-content"
			}
			ws.send(JSON.stringify(sendMsg));
			//location.reload();
		});

	})
</script>

<script>
	//일반 기능
	function openNav() {
		$(".sidebar").addClass("add_transition");
		document.getElementById("mySidebar").style.width = "400px";

		$
				.ajax({
					url : "/meister/member/getMessage.do",
					data : {
						memberNickname : "${sessionScope.member.memberNickname}"
					},
					type : "get",
					success : function(data) {
						$(".au-message-list").html("");
						var html = "";
						for (var i = 0; i < data.length; i++) {
							html += `<div class="au-message__item unread one_msg" onclick=msgDetail("`
									+ data[i].msgContent
									+ `","`
									+ data[i].msgTime + `")>`;
							html += `<div class="au-message__item-inner" style="border-left:5px solid #FFBC42">`;
							html += `<div class="au-message__item-text">`;
							html += `<div class="avatar-wrap">`;
							html += `<div class="avatar">`;
							html += `<img src="/resources/upload/common/none_user.png">`;
							html += `</div>`;
							html += `</div>`;
							html += `<div class="text">`;
							html += `<div class="name" style="display: flex; justify-content: space-between; width: 260px;">`;
							html += `<span>` + data[i].msgSender + `</span>`;
							html += `<span class="msgTime" style="margin-right:25px; color: #878787; font-size: 12px;">`
									+ data[i].msgTime + `</span>`;
							html += `</div>`;
							html += `<p class="msgContent">` + data[i].msgTitle
									+ `</p>`;
							html += `</div>`;
							html += `</div>`;
							html += `</div>`;
							html += `</div>`;
						}
						$(".au-message-list").append(html);
					},
					error : function() {
						console.log("ajax 실패");
					}
				});
	}

	function closeNav() {
		$(".sidebar").removeClass("add_transition");
		document.getElementById("mySidebar").style.width = "0";
		backBox();
	}
	function backBox() {
		$("#Cbox").removeClass("show-chat-box")
	}

	function msgDetail(msgContent, msgTime) {
		$("#Cbox").addClass("show-chat-box");
		$(".get-time").html(msgTime);
		$(".get-message").html(msgContent);
	}
</script>
<!-- Jquery JS-->
<script src="/resources/hj/message/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="/resources/hj/message/vendor/bootstrap-4.1/popper.min.js"></script>
<script
	src="/resources/hj/message/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="/resources/hj/message/vendor/slick/slick.min.js"></script>
<script src="/resources/hj/message/vendor/wow/wow.min.js"></script>
<script src="/resources/hj/message/vendor/animsition/animsition.min.js"></script>
<script
	src="/resources/hj/message/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script
	src="/resources/hj/message/vendor/counter-up/jquery.waypoints.min.js"></script>
<script
	src="/resources/hj/message/vendor/counter-up/jquery.counterup.min.js"></script>
<script
	src="/resources/hj/message/vendor/circle-progress/circle-progress.min.js"></script>
<script
	src="/resources/hj/message/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/hj/message/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="/resources/hj/message/vendor/select2/select2.min.js"></script>
<!-- Main JS-->
<script src="/resources/hj/message/js/main.js"></script>

