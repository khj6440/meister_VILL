<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!----------------------------------------------------->
<link href="/resources/hj/chat/dist/css/style.min.css" rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

ul.list-style-none li a:hover {
	color: #FFBC42;
}

#sendLabel {
	cursor: pointer;
}

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
			<div class="side-wrapper">
				<p style="margin: 0;">
					<button id="showMenu"
						style="z-index: 1; position: fixed; bottom: 150px; right: 0;">Show
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
								<li><a href="/meister/project/home.do?projectNo=${projectNo }"><i
										style="margin-right: 15px" class="fas fa-home"></i><span>Home</span></a></li>
								<li><a href="/meister/project/chat.do?projectNo=${projectNo }"
									style="background-color: #FFBC42; color: white;"><i
										style="margin-right: 15px;" class="far fa-comments"></i><span>Chat</span></a></li>
								<li><a href="/meister/project/todo.do"><i
										style="margin-right: 15px;" class="fas fa-list-ul"></i><span>To
											do</span></a></li>
								<li><a href="/meister/project/schedule.do"><i
										style="margin-right: 15px;" class="far fa-calendar-alt"></i><span>Schedule</span></a></li>
								<li><a href="/meister/project/files.do"><i
										style="margin-right: 15px;" class="far fa-file"></i><span>Files</span></a></li>
							</ul>
						</nav>
					</div>
				</section>
			</div>


			<div class="project-content">
				<!-- ============================================================== -->
				<!-- Preloader - style you can find in spinners.css -->
				<!-- ============================================================== -->
				<div class="preloader">
					<div class="lds-ripple">
						<div class="lds-pos"></div>
						<div class="lds-pos"></div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- Main wrapper - style you can find in pages.scss -->
				<!-- ============================================================== -->


				<div id="main-wrapper" data-theme="light" data-layout="vertical"
					data-navbarbg="skin6" data-sidebartype="full"
					data-sidebar-position="fixed" data-header-position="fixed"
					data-boxed-layout="full">
					<!-- ============================================================== -->
					<!-- Page wrapper  -->
					<!-- ============================================================== -->
					<div class="page-wrapper"
						style="padding-top: 0px; margin-left: 0px;">
						<!-- ============================================================== -->
						<!-- Bread crumb and right sidebar toggle -->
						<!-- ============================================================== -->
						<div class="page-breadcrumb"
							style="margin: 0 auto; width: 80%; padding-left: 50px; padding-right: 50px;">
							<div class="row">
								<div class="col-7 align-self-center">
									<h2
										class="page-title text-truncate text-dark font-weight-medium mb-1"
										style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; border-bottom: 4px solid #FFBC42;">그룹
										채팅</h2>

								</div>
								<div class="col-5 align-self-center"></div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- End Bread crumb and right sidebar toggle -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- Container fluid  -->
						<!-- ============================================================== -->
						<div class="container-fluid"
							style="width: 80%; padding-left: 50px; padding-right: 50px;">
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="row no-gutters" style="border: 1px solid #bdbdbd;">
											<div class="col-lg-3 col-xl-2 border-right"
												style="height: 780px;">
												<div class="card-body border-bottom">
													<select name="select"
														class="form-control form-control-warning fill">
														<option value="opt2">ALL</option>
														<option value="opt3">Online</option>
														<option value="opt8">Offline</option>
													</select>
												</div>
												<div class="scrollable position-relative"
													style="height: calc(100vh - 111px);">
													<ul class="mailbox list-style-none">
														<li>
															<div class="message-center">
																<!-- Message -->
																<c:forEach items="${members }" var="m">
																	<c:if
																		test="${m.memberNickname != sessionScope.member.memberNickname }">
																		<a href="javascript:void(0)"
																			class="message-item d-flex align-items-center border-bottom px-3 py-2"
																			style="border-left: 10px solid white">
																			<div class="user-img">
																				<c:if test="${empty m.memberImg }">
																					<img src="/resources/upload/common/none_user.png"
																						alt="user" class="img-fluid rounded-circle"
																						width="40px">
																				</c:if>
																				<c:if test="${not empty m.memberImg }">
																					<img
																						src="/resources/upload/memberImg/${m.memberImg}"
																						alt="user" class="img-fluid rounded-circle"
																						width="40px">
																				</c:if>
																				<span class="profile-status online float-right"></span>
																			</div>
																			<div class="w-75 d-inline-block v-middle pl-2">
																				<h6 class="message-title mb-0 mt-1">${m.memberNickname}</h6>
																				<span
																					class="font-12 text-nowrap d-block text-muted text-truncate">
																					${m.memberName } </span> <span
																					class="font-12 text-nowrap d-block text-muted">
																					${m.memberPhone } </span>
																			</div>
																		</a>
																	</c:if>
																</c:forEach>

															</div>
														</li>
													</ul>
												</div>
											</div>
											<div class="col-lg-9  col-xl-10"
												style="border: 1px solid #bdbdbd;">
												<div
													style="height: 700px; border-bottom: 1px solid #bdbdbd;"
													id="chat-box" class="chat-box scrollable position-relative">
													<!--chat Row -->
													<ul class="chat-list list-style-none px-3 pt-3">
														<c:forEach items="${chats}" var="c">
															<c:if
																test="${c.PChatSender == sessionScope.member.memberNickname}">
																<li class="chat-item odd list-style-none mt-3"
																	style="word-break: break-all; text-align: right;">
																	<div
																		class="chat-content text-right d-inline-block pl-3"
																		style="width: 70%;">
																		<div class="box msg p-2 d-inline-block mb-1 box">${c.PChatContent}</div>
																		<br>
																	</div>
																	<div
																		class="chat-time text-right d-block font-10 mt-1 mr-0 mb-3">
																		<div class="chat-gap" style="display: none;">${c.PChatTime}</div>
																		<c:forTokens items="${c.PChatTime }" delims="/"
																			var="item" varStatus="status">
																			<c:if test="${status.index ==3 }">
																				<c:if test="${item <=12 }">
																				오전 ${item  }
																			</c:if>
																				<c:if test="${item > 12 }">
																				오후 ${item-12}
																			</c:if>
																			</c:if>
																			<c:if test="${status.index==4 }">
																			: ${item}
																		</c:if>
																		</c:forTokens>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${c.PChatSender != sessionScope.member.memberNickname}">
																<li class="chat-item list-style-none mt-3"
																	style="word-break: break-all; text-align: left;">
																	<div class="chat-img d-inline-block">
																		<img src="/resources/upload/common/none_user.png"
																			alt="user" class="rounded-circle" width="45">
																	</div>
																	<div class="chat-content d-inline-block pl-3"
																		style="width: 70%;">
																		<h6 class="font-weight-medium">${c.PChatSender }</h6>
																		<div class="msg p-2 d-inline-block mb-1">${c.PChatContent}</div>
																	</div>
																	<div class="chat-time d-block font-10 mt-1 mr-0 mb-3">
																		<div class="chat-gap" style="display: none;">${c.PChatTime }</div>
																		<c:forTokens items="${c.PChatTime }" delims="/"
																			var="item" varStatus="status">
																			<c:if test="${status.index ==3 }">
																				<c:if test="${item <=12 }">
																				오전 ${item  }
																			</c:if>
																				<c:if test="${item > 12 }">
																				오후 ${item-12}
																			</c:if>
																			</c:if>
																			<c:if test="${status.index==4 }">
																			: ${item}
																		</c:if>
																		</c:forTokens>
																	</div>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</div>
												<div class="card-body border-top">
													<div class="row">
														<div class="col-9">
															<div class="input-field mt-0 mb-0">
																<input id="textarea1" placeholder="Type and enter"
																	class="form-control border-0" type="text">
															</div>
														</div>
														<div class="col-3">
															<label id="sendLabel" for="myFile">파일업로드</label> <a
																class="btn-circle btn-lg btn-cyan float-right text-white transBtn"
																href="javascript:void(0)" onclick="transChat()"><i
																class="fas fa-paper-plane"></i></a>
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<form id="uploadForm">
							<input style="display: none;" id="myFile" type="file" name="file"
								multiple="multiple">
						</form>
						<!-- ============================================================== -->
						<!-- End Container fluid  -->
						<!-- ============================================================== -->
					</div>
					<!-- ============================================================== -->
					<!-- End Page wrapper  -->
					<!-- ============================================================== -->
				</div>
			</div>

		</div>
		<nav class="outer-nav right vertical">
			<a href="/meister/project/home.do?projectNo=${projectNo }" class=""><i
				style="margin-right: 15px;" class="fas fa-home"></i>Home</a> <a
				href="/meister/project/chat.do?projectNo=${projectNo }" class=""><i
				style="margin-right: 15px;" class="far fa-comments"></i>Chat</a> <a
				href="/meister/project/todo.do" class=""><i
				style="margin-right: 15px;" class="fas fa-list-ul"></i>To do</a> <a
				href="/meister/project/schedule.do" class=""><i
				style="margin-right: 15px;" class="far fa-calendar-alt"></i>Schedule</a>
			<a href="/meister/project/files.do" class=""><i
				style="margin-right: 15px;" class="far fa-file"></i>Files</a>
		</nav>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		var obj = $("#chat-box");

		//drop 영역에 들어오면
		obj.on('dragenter dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '2px solid #FFBC42');
		});
		//drop 영역에서 나가면
		obj.on('dragleave', function(e) {
			$(this).css('border', 'none'); //div의 border를 점선으로 변경
			e.preventDefault();
		});

		obj.on("drop", function(e) {
			e.preventDefault();
			$(this).css('border', 'none');
			var files = e.originalEvent.dataTransfer.files;
			var formData = new FormData();

			for (var i = 0; i < files.length; i++) {
				formData.append('file', files[i]);
			}

			$.ajax({
				url : "/meister/member/uploadChatFile2.do",
				data : formData,
				type : "POST",
				contentType : false,
				processData : false,
				enctype : 'multipart/form-data',
				success : function(data) {
					console.log("통신성공")
					var resultList = JSON.parse(data);
					resultList.forEach(function(item, index) {
						transChat(item);
					})
				},
				error : function() {
					console.log("ajax 실패");
				}
			});
		});

		$("#myFile").on('change', function() {

			var form = $('#uploadForm')[0];
			var formData = new FormData(form);
			$.ajax({
				url : "/meister/member/uploadChatFile2.do",
				data : formData,
				type : "POST",
				contentType : false,
				processData : false,
				success : function(data) {
					var resultList = JSON.parse(data);
					resultList.forEach(function(item, index) {
						transChat(item);
					})
				},
				error : function() {
					console.log("ajax 실패");
				}
			});

		});

		$(document).on('keypress', "#textarea1", function(e) {
			if (e.keyCode == 13) {
				transChat();
			}
		});

		$('#chat-box').stop().animate({
			scrollTop : $('#chat-box')[0].scrollHeight
		}, 300);

	});

	function transChat(param) {

		var msg = "";

		if (param == undefined) {
			msg = $("#textarea1").val();
		} else {
			var arr = param.split(":");
			var extensions = [ ".jpg", ".gif", ".png", ".JPG", ".PNG", ".GIF" ];
			msg = `<a href="/meister/member/chatFileDownload.do?filename=`
					+ arr[0] + `&filepath=` + arr[1] + `"style="color:red;">`;
			msg += arr[0];

			for (var i = 0; i < extensions.length; i++) {
				if (arr[0].substring(arr[0].lastIndexOf(".")) == extensions[i]) {
					msg += `<br>`;
					msg += `<img style="width:300px;height:220px;" src="/resources/upload/chat/`+arr[1]+`">`;
					break;
				}
			}
			msg += `</a>`;
			console.log("msg:" + msg)
		}

		if (msg !== "" || param != undefined) {
			$("#textarea1").val("");
			$("#textarea1").focus();

			let today = new Date();
			let year = today.getFullYear();
			let month = (today.getMonth() + 1) < 10 ? "0"
					+ (today.getMonth() + 1) : today.getMonth() + 1;
			let day = today.getDate() < 10 ? "0" + today.getDate() : today
					.getDate();
			let hours = today.getHours() < 10 ? "0" + today.getHours() : today
					.getHours(); // 시
			let minutes = today.getMinutes() < 10 ? "0" + today.getMinutes()
					: today.getMinutes(); // 분

			var chat = $(".chat-list").html();
			chat += `<li class="chat-item odd list-style-none mt-3" style="word-break:break-all;text-align:right;">`;
			chat += `<div class="chat-content text-right d-inline-block pl-3" style="width:70%;">`;
			var arrDate = $(".chat-gap").last().html().split("/");

			if (arrDate[0] != year || arrDate[1] != month || arrDate[2] != day
					|| arrDate[4] != minutes) {
				chat += `<div>2020</div>`;
			}
			chat += `<div class="box msg p-2 d-inline-block mb-1 box">` + msg
					+ `</div>`
			chat += `<br></div>`;
			chat += `<div class="chat-time text-right d-block font-10 mt-1 mr-0 mb-3">`;
			chat += `<div class="chat-gap" style="display:none;">` + year + "/"
					+ month + "/" + day + "/" + hours + "/" + minutes
					+ `</div> `;
			chat += (hours <= 12 ? "오전 " + hours : "오후 " + (hours - 12)) + ":"
					+ minutes;
			chat += `</div></li>`;

			$(".chat-list").html("");
			$(".chat-list").append(chat);

			$('#chat-box').stop().animate({
				scrollTop : $('#chat-box')[0].scrollHeight
			}, 300);
			/* var target = $(".message-center>a").eq(clickIndex).find("h6").html(); */

			var sendMsg = {
				/* 이번엔 type:chat으로 보내줬기 때문에 다른 로직을 탄다. */
				type : "pChat",
				projectNo : "${projectNo}",
				sender : "${sessionScope.member.memberNickname}",
				senderImg : "${sessionScope.member.memberImg }",
				sendTime : year + "/" + month + "/" + day + "/" + hours + "/"
						+ minutes,
				msg : msg
			};
			console.log("채팅침");
			ws.send(JSON.stringify(sendMsg));
		}

	}
	
	
	var ws;
	var memberNickname = '${sessionScope.member.memberNickname}';
	function connect() {
		ws = new WebSocket("ws://192.168.10.15/projectChat.do");	//protocol이 http가 아닌 ws://임
		//연결 -> 메세지 받았을 때 -> 종료
		//연결
		ws.onopen = function(){
			console.log("웹 소켓 연결 생성(project chat)");
			//객체 생성
			var msg = {
					type : "register",
					memberNickname : memberNickname,
					projectNo: "${projectNo}"
			}
			//JSON으로 Object -> String으로 타입 변환해서 보내기
			// "{type : 'register', memberNickname : 'user01'}"
			ws.send(JSON.stringify(msg));
		};
		//메세지 수신
		ws.onmessage = function (e) {
	
			console.log("msg수신:"+e.data)
			var data = JSON.parse(e.data);
			var html = $(".chat-list").html();
			html+=`<li class="chat-item list-style-none mt-3" style="word-break:break-all;text-align:left;">`;
			html+=`<div class="chat-img d-inline-block">`;
			html+=`<img src="/resources/upload/common/none_user.png"	alt="user" class="rounded-circle" width="45">`;
			html+=`</div>`;
			html+=`<div class="chat-content d-inline-block pl-3" style="width:70%;">`;
			html+=`<h6 class="font-weight-medium">`+data.sender+`</h6>`;
			html+=`<div class="msg p-2 d-inline-block mb-1">`+data.msg+`</div>`;
			html+=`</div>`;
			html+=`<div class="chat-time d-block font-10 mt-1 mr-0 mb-3">`
			
			var arr = data.sendTime.split("/");
			html+=`<div class="chat-gap" style="display:none;">`+arr[0]+"/"+arr[1]+"/"+arr[2]+"/"+arr[3]+"/"+arr[4]+`</div> `;
			html+= (arr[3]<=12?"오전 "+arr[3] :"오후 "+(arr[3]-12) ) +":"+arr[4];
			
			html+=`</div>`;
			html+=`</li>`;
			
			$(".chat-list").html("");
			$(".chat-list").append(html);
			$('#chat-box').stop().animate({ scrollTop: $('#chat-box')[0].scrollHeight }, 300);
	
		};

		//종료
		ws.onclose = function () {
			console.log("웹 소켓 연결 종료(project chat)")
		};
	}
	

	$(function() {
		connect();
		/* transChat(); */

		$(".jFiler-row").css("display","none");
	});
</script>

<script src="/resources/hj/projectRoom/dynamicTab/js/classie.js"></script>
<script src="/resources/hj/projectRoom/dynamicTab/js/menu.js"></script>

<!-- --------------------------------------------- -->
<script src="/resources/hj/chat/assets/libs/jquery/dist/jquery.min.js"></script>
<script
	src="/resources/hj/chat/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script
	src="/resources/hj/chat/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/resources/hj/chat/dist/js/app-style-switcher.js"></script>
<script src="/resources/hj/chat/dist/js/feather.min.js"></script>
<script
	src="/resources/hj/chat/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/resources/hj/chat/dist/js/sidebarmenu.js"></script>
<script src="/resources/hj/chat/dist/js/custom.min.js"></script>

</html>