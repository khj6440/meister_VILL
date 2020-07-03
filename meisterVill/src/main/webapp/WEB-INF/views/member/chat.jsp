<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->

<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicon.png">
<title>MESITER VILL | 1:1 채팅</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- This page css -->
<!-- Custom CSS -->
<link href="/resources/hj/chat/dist/css/style.min.css" rel="stylesheet">
<style>
ul.list-style-none li a:hover{
	color:#FFBC42;
}
</style>
</head>
<body>
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
	
	<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
	<jsp:include page="/WEB-INF/views/common/message2.jsp" />
	
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="padding-top: 15%; margin-left: 0px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb"
				style="margin:0 auto; width:80%; padding-left: 50px; padding-right: 50px;">
				<div class="row">
					<div class="col-7 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">Chat</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item text-muted active"
										aria-current="page">1 : 1 채팅</li>
									<li class="breadcrumb-item text-muted" aria-current="page"></li>
								</ol>
							</nav>
						</div>
					</div>
					<div class="col-5 align-self-center">
						<div class="customize-input float-right">
							<select
								class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
								<option selected>Aug 19</option>
								<option value="1">July 19</option>
								<option value="2">Jun 19</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid"
				style="width:80%; padding-left: 50px; padding-right: 50px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="row no-gutters" style="height: 780px;">
								<div class="col-lg-3 col-xl-2 border-right" style="height: 780px;">
									<div class="card-body border-bottom">
										<form>
											<input class="form-control" type="text"
												placeholder="Search Contact">
										</form>
									</div>
									<div class="scrollable position-relative"
										style="height: calc(100vh - 111px);">
										<ul class="mailbox list-style-none">
											<li>
												<div class="message-center">
													<!-- Message -->
													<c:forEach items="${list }" var="c">
														<a href="javascript:void(0)"
														class="message-item d-flex align-items-center border-bottom px-3 py-2" style="border-left: 10px solid white">
														<div class="user-img">
															<img src="/resources/upload/common/none_user.png"
																alt="user" class="img-fluid rounded-circle" width="40px">
															<span class="profile-status online float-right"></span>
														</div>
														<div class="w-75 d-inline-block v-middle pl-2">
															<h6 class="message-title mb-0 mt-1">${c.chatSender}</h6>
															<span
																class="font-12 text-nowrap d-block text-muted text-truncate">
																${c.chatContent }
																</span> <span
																class="font-12 text-nowrap d-block text-muted">
																${c.chatTime }
																</span>
														</div>
													</a>
													</c:forEach>

												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="col-lg-9  col-xl-10">
									<div style="overflow:auto;height: 700px;" id="chat-box"  class="chat-box scrollable position-relative"
										>
										<!--chat Row -->
										<ul class="chat-list list-style-none px-3 pt-3">
											
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
												<label for="myFile">파일업로드</label>
												<a class="btn-circle btn-lg btn-cyan float-right text-white transBtn"
													href="javascript:void(0)"><i class="fas fa-paper-plane"></i></a>
											</div>
											
										</div>
									</div>
									<form id="uploadForm">
										<input id="myFile" type="file" name="file" >
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
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
	<!--This page JavaScript -->
	<script>
		var clickIndex;
		function uploadFile(input){
		 	console.log(input)
			/* if (input.files && input.files[0]) {
		        var reader = new FileReader();

		        reader.onload = function (e) {
		        	console.log(e);
		           // $('#blah').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }*/
		 }
        $(function () {

            $("#myFile").on('change', function () {
              //  uploadFile(this);
              	 var form = $('#uploadForm')[0];
			     var formData = new FormData(form);
              
            	$.ajax({
					url : "/meister/member/uploadChatFile.do",
					data : formData,
					type : "POST",
					contentType : false,
				    processData : false,    
					success : function(data) {
						console.log(data);
					},
					error : function() {
						console.log("ajax 실패");
					}
				});
              	
            });
        	
        	
            $(document).on('keypress', "#textarea1", function (e) {
                if (e.keyCode == 13) {
                  $(".transBtn").click();
                }
            });
            
            $(".transBtn").click(function(){
            	var val = $("#textarea1").val();
            	console.log(val);
            })
            
            
            $(".message-center>a").click(function(){
            	$(".message-center>a").css("border-left-color","");
            	$(this).css("border-left-color","#FFBC42");

            	clickIndex = $(".message-center>a").index(this);
            });
            
            $(".message-item").click(function(){
            	var sender =$(this).find("h6").html();
            	
            	$.ajax({
					url : "/meister/member/showChat.do",
					data : {sender : sender},
					type : "get",
					success : function(data) {
						console.log(data);
						$(".chat-list").html("");
						html = "";
						for(var i=0; i<data.length; i++) {
							if("${sessionScope.member.memberNickname}"==data[i].chatSender ){
								html+=`<li class="chat-item odd list-style-none mt-3">`;
								html+=`<div class="chat-content text-right d-inline-block pl-3">`;
								html+=`<div class="box msg p-2 d-inline-block mb-1 box">`+data[i].chatContent+`</div>`
								html+=`<br></div>`;
								html+=`<div class="chat-time text-right d-block font-10 mt-1 mr-0 mb-3">`;
								var arr =  data[i].chatTime.split("/");
								html+=`<div class="chat-gap" style="display:none;">`+arr[0]+"/"+arr[1]+"/"+arr[2]+"/"+arr[3]+"/"+arr[4]+`</div> `;
								html+= (arr[3]<=12?"오전 "+arr[3] :"오후 "+(arr[3]-12) ) +":"+arr[4],
								html+=`</div></li>`;
								
							}else{
								html+=`<li class="chat-item list-style-none mt-3">`;
								html+=`<div class="chat-img d-inline-block">`;
								html+=`<img src="/resources/upload/common/none_user.png"	alt="user" class="rounded-circle" width="45">`;
								html+=`</div>`;
								html+=`<div class="chat-content d-inline-block pl-3">`;
								html+=`<h6 class="font-weight-medium">`+data[i].chatSender+`</h6>`;
								html+=`<div class="msg p-2 d-inline-block mb-1">`+data[i].chatContent+`</div>`;
								html+=`</div>`;
								html+=`<div class="chat-time d-block font-10 mt-1 mr-0 mb-3">`;
								
								var arr =  data[i].chatTime.split("/");
								html+=`<div class="chat-gap" style="display:none;">`+arr[0]+"/"+arr[1]+"/"+arr[2]+"/"+arr[3]+"/"+arr[4]+`</div> `;
								html+= (arr[3]<=12?"오전 "+arr[3] :"오후 "+(arr[3]-12) ) +":"+arr[4];

								html+=`</div>`;
								html+=`</li>`;
							}
						}
						$(".chat-list").append(html);
					},
					error : function() {
						console.log("ajax 실패");
					}
				});
            })
            
            $(".message-center>a:first-child").click();

            $('#chat-box').stop().animate({ scrollTop: $('#chat-box')[0].scrollHeight }, 100);
        });
        
        var ws;
		var memberNickname = '${sessionScope.member.memberNickname}';
		function connect() {
			ws = new WebSocket("ws://192.168.10.15/chat.do");	//protocol이 http가 아닌 ws://임
			//연결 -> 메세지 받았을 때 -> 종료
			//연결
			ws.onopen = function(){
				console.log("웹 소켓 연결 생성(chat)");
				//객체 생성
				var msg = {
						type : "register",
						memberNickname : memberNickname
				}
				//JSON으로 Object -> String으로 타입 변환해서 보내기
				// "{type : 'register', memberNickname : 'user01'}"
				ws.send(JSON.stringify(msg));
			};
			//메세지 수신
			ws.onmessage = function (e) {
		
				var data = JSON.parse(e.data);
				var html = $(".chat-list").html();
				html+=`<li class="chat-item list-style-none mt-3">`;
				html+=`<div class="chat-img d-inline-block">`;
				html+=`<img src="/resources/upload/common/none_user.png"	alt="user" class="rounded-circle" width="45">`;
				html+=`</div>`;
				html+=`<div class="chat-content d-inline-block pl-3">`;
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
				console.log("웹 소켓 연결 종료(chat)")
			};
		}
		$(function() {
			connect();
			
			$(".transBtn").click(function() {
				
				var msg = $("#textarea1").val();
			
				if(msg!==""){
					$("#textarea1").val("");
					$("#textarea1").focus();
	
					let today = new Date();
					let year = today.getFullYear();
					let month = (today.getMonth()+1)<10?"0"+(today.getMonth()+1):today.getMonth()+1;
					let day = today.getDate()<10?"0"+today.getDate():today.getDate();
					let hours = today.getHours()<10?"0"+today.getHours():today.getHours(); // 시
					let minutes = today.getMinutes()<10?"0"+today.getMinutes():today.getMinutes();  // 분
	
					var chat = $(".chat-list").html();
					chat+=`<li class="chat-item odd list-style-none mt-3">`;
					chat+=`<div class="chat-content text-right d-inline-block pl-3">`;
					var arrDate =  $(".chat-gap").last().html().split("/");
				
					if(arrDate[0]!=year || arrDate[1]!=month || arrDate[2]!= day || arrDate[4] !=minutes){
						chat+=`<div>2020</div>`;
					}
					
					chat+=`<div class="box msg p-2 d-inline-block mb-1 box">`+msg+`</div>`
					chat+=`<br></div>`;
					chat+=`<div class="chat-time text-right d-block font-10 mt-1 mr-0 mb-3">`;
					chat+=`<div class="chat-gap" style="display:none;">`+year+"/"+month+"/"+day+"/"+hours+"/"+minutes+`</div> `;
					chat+= (hours<=12?"오전 "+hours :"오후 "+(hours-12) ) +":"+minutes;
					chat+=`</div></li>`;
					
					$(".chat-list").html("");
					$(".chat-list").append(chat);
			
					$('#chat-box').stop().animate({ scrollTop: $('#chat-box')[0].scrollHeight }, 100);
					var target = $(".message-center>a").eq(clickIndex).find("h6").html();
					var sendMsg = {
							/* 이번엔 type:chat으로 보내줬기 때문에 다른 로직을 탄다. */
							type:"chat", 
							target : target,
							sender : "${sessionScope.member.memberNickname}",
							senderImg :"${sessionScope.member.memberImg }",
							sendTime : year+"/"+month+"/"+day+"/"+hours+"/"+minutes,
							msg : msg
					};
					ws.send(JSON.stringify(sendMsg));
				}
			});
		});
	
    </script>


</body>
</html>