<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
<link type="text/css"
	href="/resources/yr/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.au-card {
	-webkit-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
	box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
	padding: 40px;
	padding-right: 35px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	background: #fff;
	overflow: hidden;
}

.au-card--border {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.au-card--border .au-card-title {
	-webkit-border-top-left-radius: 3px;
	-moz-border-radius-topleft: 3px;
	border-top-left-radius: 3px;
	-webkit-border-top-right-radius: 3px;
	-moz-border-radius-topright: 3px;
	border-top-right-radius: 3px;
}

.au-card--border .au-card-title .bg-overlay {
	-webkit-border-top-left-radius: 3px;
	-moz-border-radius-topleft: 3px;
	border-top-left-radius: 3px;
	-webkit-border-top-right-radius: 3px;
	-moz-border-radius-topright: 3px;
	border-top-right-radius: 3px;
}

.au-card-bordered {
	border: 1px solid #e5e5e5;
	background: #fff;
	padding: 40px;
	padding-top: 42px;
	padding-right: 55px;
	margin-bottom: 40px;
}

.au-card--bg-blue {
	background-image: -moz-linear-gradient(90deg, #396afc 0%, #2948ff 100%);
	background-image: -webkit-linear-gradient(90deg, #396afc 0%, #2948ff 100%);
	background-image: -ms-linear-gradient(90deg, #396afc 0%, #2948ff 100%);
}

.au-card-top-countries {
	padding: 40px;
	padding-top: 25px;
	padding-bottom: 29px;
}

.au-card--no-shadow {
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

.au-card--no-pad {
	padding: 0;
}

.au-card-title {
	position: relative;
	padding: 40px;
	padding-top: 45px;
	padding-bottom: 47px;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
	-webkit-border-top-left-radius: 10px;
	-moz-border-radius-topleft: 10px;
	border-top-left-radius: 10px;
	-webkit-border-top-right-radius: 10px;
	-moz-border-radius-topright: 10px;
	border-top-right-radius: 10px;
	-webkit-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
	box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
}

.au-card-title .bg-overlay {
	-webkit-border-top-left-radius: 10px;
	-moz-border-radius-topleft: 10px;
	border-top-left-radius: 10px;
	-webkit-border-top-right-radius: 10px;
	-moz-border-radius-topright: 10px;
	border-top-right-radius: 10px;
}

.au-card-title h3 {
	position: relative;
	z-index: 2;
	color: #fff;
	font-weight: 400;
}

.au-card-title h3 i {
	color: #fff;
	font-size: 24px;
	margin-right: 12px;
}

.au-card--no-shadow {
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

.au-inbox-wrap {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	width: 200%;
	-webkit-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

.au-inbox-wrap.show-chat-box {
	-webkit-transform: translateX(-50%);
	-moz-transform: translateX(-50%);
	-ms-transform: translateX(-50%);
	-o-transform: translateX(-50%);
	transform: translateX(-50%);
}

.au-message__footer {
	text-align: center;
	padding-top: 35px;
	padding-bottom: 45px;
}

.au-message p {
	color: #808080;
}

.au-message-list {
	height: 424px;
	position: relative;
	overflow-y: auto;
}

.au-message__noti {
	padding: 25px 15px;
	padding-left: 40px;
	padding-bottom: 22px;
	border-bottom: 1px solid #f2f2f2;
}

.au-message__noti p {
	font-size: 14px;
}

.au-message__noti p span {
	font-weight: 600;
}

.au-message__item {
	border-bottom: 1px solid #f2f2f2;
	cursor: pointer;
	-webkit-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

.au-message__item:hover {
	background: #f7f7f7;
}

.au-message__item-inner {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-moz-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-moz-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	padding: 10px 20px;
}

.au-message__item-time {
	margin-top: 26px;
}

.au-message__item-time span {
	font-size: 14px;
	color: #808080;
}

.au-message__item-text .text {
	margin-left: 60px;
	padding: 7px 0;
	padding-left: 23px;
}

.au-message__item-text .text .name {
	font-size: 16px;
	font-weight: 600;
	color: #666;
	margin-bottom: 2px;
}

.au-message__item-text .text p {
	color: #808080;
}

@media ( max-width : 767px) {
	.au-message__item-text .text {
		margin: 0;
		padding: 0;
	}
}

.avatar-wrap {
	position: relative;
	float: left;
}

.au-message__item.unread .au-message__item-inner {
	border-left: 3px solid #999;
}

.au-message__item.unread .au-message__item-text .text .name {
	color: #333;
}

.au-message__item.unread .au-message__item-text .text p {
	color: #333;
}

.au-chat-textfield {
	padding: 40px;
	padding-top: 32px;
	padding-bottom: 50px;
}

.au-inbox-wrap {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	width: 200%;
	-webkit-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

.au-inbox-wrap.show-chat-box {
	-webkit-transform: translateX(-50%);
	-moz-transform: translateX(-50%);
	-ms-transform: translateX(-50%);
	-o-transform: translateX(-50%);
	transform: translateX(-50%);
}

.au-message {
	width: 50%;
}

.au-chat {
	width: 50%;
}

.au-chat--border .au-chat__content {
	border-left: 1px solid #e5e5e5;
	border-right: 1px solid #e5e5e5;
}

.au-chat__content {
	height: 400px;
	overflow: auto;
	padding: 30px 40px;
	padding-bottom: 0;
	position: relative;
}

.mess-time {
	font-size: 14px;
	color: #999;
}
</style>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.sidebar {
	height: 100%;
	width: 0px;
	position: fixed;
	z-index: 3001;
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
	z-index: 3000;
	color: #4D4D4D;
	padding: 5px 10px;
	border-radius: 10px;
	font-weight: bold;
}

.openbtn:hover {
	background-color: #f0f0f0;
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
	color: #666;
}

#main {
	position: fixed;
	bottom: 130px;
	right: 100px;
	z-index: 3000;
}

.get-message {
	color: #666666;
}

.unreadCnt {
	font-size: 13px;
	position: absolute;
	right: 10px;
	top: 0px;
	width: 20px;
	height: 20px;
	background-color: #FFBC42;
	border-radius: 50px;
}
</style>
<div id="mySidebar" class="sidebar">
	<div class="side_header">
		<div class="tab_title">마이스터빌 안내</div>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	</div>

	<div class="col-lg-18" style="margin-top: 10px;">
		<div class="au-card au-card--no-shadow au-card--no-pad m-b-40"
			style="margin-bottom: 0px; border-radius: 0px;">
			<div id="Cbox" class="au-inbox-wrap js-inbox-wrap">
				<div class="au-message js-list-load">
					<div class="au-message-list" style="height: 90vh;">
						<!-- messages -->
					</div>
				</div>
				<div class="au-chat">
					<button class="toList" style="outline:none;background: none; border: none;"
						onclick="backBox()">
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
	<button class="openbtn" onclick="openNav()"
		style="border: 1px solid #eeeeee; outline: none;">
		<i class="far fa-bell" style="font-size: 30px; color: #FFBC42"></i>
		<div class="unreadCnt"></div>
		<br>
		<span style="font-size: 11px;">Meister Vill</span><br>알림
	</button>
	<!-- <div>
		읽지 않은 메시지:<span> </span>
	</div>
	<button id="sendBtn">sendBtn</button> -->
</div>
<script>
	//소켓기능
	var wsMsg;
	var memberNickname = "${sessionScope.member.memberNickname}";

	function connectMsg() {
		wsMsg = new WebSocket("ws://192.168.10.15/message.do");

		wsMsg.onopen = function() {
			console.log("웹 소켓 연결 생성(msg)");
			
			$.ajax({
				url : "/meister/member/getUnreadMsgCnt.do",
				data : {
					memberNickname : "${sessionScope.member.memberNickname}"
				},
				type : "get",
				success : function(data) {
					$(".unreadCnt").html(data);
				},
				error : function() {
					console.log("ajax 실패");
				}
			})
			var msg = {
				type : "register",
				memberNickname : memberNickname
			}
			wsMsg.send(JSON.stringify(msg));
		};
		
		wsMsg.onmessage = function(e) {
			console.log(JSON.parse(e.data));
			console.log(e);
			$("#main>div>span").html(e.data);
		
		};
		
		wsMsg.onclose = function() {
			console.log("웹 소켓 연결 종료(msg)");
		};
	}
	
	$(function() {
		connectMsg();
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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

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
						console.log(data);
						$(".au-message-list").html("");
						var html = "";
						for (var i = 0; i < data.length; i++) {
							html += `<div class="au-message__item unread one_msg" num=`+data[i].msgNo+` onclick=msgDetail("`
									+ data[i].msgContent
									+ `","`
									+ data[i].msgNo	
									+ `","`
									+data[i].msgTime +`")>`;
							if(data[i].msgRead==0){
								html += `<div class="au-message__item-inner" style="border-left:5px solid #FFBC42">`;								
							}else{
								html += `<div class="au-message__item-inner" style="border-left:5px solid gray">`;								
							}		
							html += `<div class="au-message__item-text">`;
							html += `<div class="avatar-wrap">`;
							html += `<div class="avatar" style="height:100%;">`;
							html += `<img src="/resources/upload/common/none_user.png" style="margin-top:10px;width:60px;height:60px;">`;
							html += `</div>`;
							html += `</div>`;
							html += `<div class="text">`;
							html += `<div class="name" style="display: flex; justify-content: space-between; width: 260px;">`;
							html += `<span>` + data[i].msgSender + `</span>`;
						
							var result =  timeBefore(moment(data[i].msgTime, "YYYY-MM-DD/HH:mm:ss")._d);
			
							html += `<span class="msgTime" style="margin-right:25px; color: #878787; font-size: 12px;">`
									+result + `</span>`;
							html += `</div>`;
							html += `<p class="msgContent" style="color:gray;">` + data[i].msgTitle+ `</p>`;
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
	function changeTime(param){
	
	}

	function closeNav() {
		$(".sidebar").removeClass("add_transition");
		document.getElementById("mySidebar").style.width = "0";
		backBox();
	}
	function backBox() {
		$("#Cbox").removeClass("show-chat-box")
	}

	function msgDetail(msgContent,msgNo ,msgTime) {
		$("#Cbox").addClass("show-chat-box");
		$(".get-time").html(msgTime.replace("/","&ensp;&ensp;"));
		$(".get-message").html(msgContent);
		
		$.ajax({
			url : "/meister/member/readMsg.do",
			data : {
				msgNo:msgNo,
				memberNickname:"${sessionScope.member.memberNickname}"
			},
			type : "get",
			success : function(data) {
				$(".au-message__item").each(function(index,item){
					if($(item).attr("num")==msgNo){
						$(item).find(".au-message__item-inner").css("border-left","5px solid gray");
					}
				});
				$(".unreadCnt").html(data);
			},
			error : function() {
				console.log("ajax 실패");
			}
		}) 
	}
	
	function timeBefore(param){ 
		//현재시간을 가져옴 
		var now = new Date(); 
		var writeDay = new Date(param); 
		//또는 파라미터로 시간을 넘겨받아서 계산할 수도 있음.. 
		var minus; 
		var result;
		//현재 년도랑 글쓴시간의 년도 비교
		if(now.getFullYear() > writeDay.getFullYear()){ 
			minus= now.getFullYear()-writeDay.getFullYear(); 
			//두개의 차이를 구해서 표시 
			result=minus+"년 전"
		}else if(now.getMonth() > writeDay.getMonth()){ 
			//년도가 같을 경우 달을 비교해서 출력 
			minus= now.getMonth()-writeDay.getMonth(); 
			result=minus+"달 전"
		}else if(now.getDate() > writeDay.getDate()){ 
			//같은 달일 경우 일을 계산 
			minus= now.getDate()-writeDay.getDate(); 
			result=minus+"일 전"
		}else if(now.getDate() == writeDay.getDate()){ 
			//당일인 경우에는 
			var nowTime = now.getTime(); 
			var writeTime = writeDay.getTime(); 
			if(nowTime>writeTime){ 
				//시간을 비교 
				sec =parseInt(nowTime - writeTime) / 1000; 
				day = parseInt(sec/60/60/24); 
				sec = (sec - (day * 60 * 60 * 24)); 
				hour = parseInt(sec/60/60); 
				sec = (sec - (hour*60*60)); 
				min = parseInt(sec/60); 
				sec = parseInt(sec-(min*60)); 
				if(hour>0){ 
					//몇시간전인지 
					result=hour+"시간 전"
				}else if(min>0){ 
					//몇분전인지 
					result = min+"분 전";
				}else if(sec>0){ 
					//몇초전인지 계산 
					result=sec+"초 전"
				} 
			} 
		} 
		return result;
	}
</script>

<script src="/resources/hj/message/js/main.js"></script>

