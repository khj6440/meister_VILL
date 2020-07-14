<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>MEISTER | CALENDAR</title>

<style>
* {
	margin-block-start: 0px;
	margin-block-end: 0px;
}

html, body {
	margin: 0px;
	padding: 0px;
}
</style>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Quicksand:500,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/hj/projectRoom/calendar/css/waves.min.css"
	type="text/css" media="all">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/feather.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/icofont.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/fullcalendar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/fullcalendar.print.css"
	media='print'>
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/pages.css">

<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/sweetalert.css">
<style>
.pcoded-content {
	background-color: #F6F7FB;
}
</style>
</head>
<body>

	<div class="loader-bg">
		<div class="loader-bar"></div>
	</div>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<div class="pcoded-content">
						<div class="page-header card">
							<div class="row align-items-end">
								<div class="col-lg-8">
									<div class="page-header-title">
										<div class="d-inline">
											<h2>PROJECT SCHEDULE</h2>
											<span style="color: #919aa3;">팀원들과 일정을 공유합니다.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="pcoded-inner-content full-calender">
							<div class="main-body" style="min-width: 800px;">
								<div class="page-wrapper">
									<div class="page-body">
										<div class="card">
											<div class="card-header">
												<h5>Calendar</h5>
											</div>
											<div class="card-block">
												<div class="row">
													<div class="col-xl-2 col-md-12">
														<div id="external-events">
															<h6 class="m-b-30 m-t-20">Events</h6>
														</div>
														<button type="button" id="addBtn"
															class="btn btn-primary alert-prompt m-b-10"
															onclick="if (!window.__cfRLUnblockHandlers) return false; _gaq.push(['_trackEvent', 'example', 'try', 'alert-prompt']);"
															data-cf-modified-d28fd8086f5eb18f81d8672a-=""><i
																		class="icofont icofont-plus"></i>추가하기</button>
													</div>
													<div class="col-xl-10 col-md-12">
														<div id='calendar'></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="page-error">
								<div class="card text-center">
									<div class="card-block">
										<div class="m-t-10">
											<i class="icofont icofont-warning text-white bg-c-yellow"></i>
											<h4 class="f-w-600 m-t-25">Not supported</h4>
											<p class="text-muted m-b-0">화면 크기가 너무 작습니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					ㅋ
				</div>
			</div>
		</div>
	</div>

	<button style="display: none;" type="button"
		class="btn btn-primary sweet-1 m-b-10"
		onclick="if (!window.__cfRLUnblockHandlers) return false; _gaq.push(['_trackEvent', 'example', 'try', 'sweet-1']);"
		data-cf-modified-d28fd8086f5eb18f81d8672a-="">Basic</button>
	<button style="display: none;" type="button"
		class="btn btn-success alert-success-msg m-b-10"
		onclick="if (!window.__cfRLUnblockHandlers) return false; _gaq.push(['_trackEvent', 'example', 'try', 'alert-success']);"
		data-cf-modified-d28fd8086f5eb18f81d8672a-="">Success</button>
	<button style="display: none;" type="button"
		class="btn btn-warning alert-confirm m-b-10"
		onclick="if (!window.__cfRLUnblockHandlers) return false; _gaq.push(['_trackEvent', 'example', 'try', 'alert-confirm']);"
		data-cf-modified-d28fd8086f5eb18f81d8672a-="">Confirm</button>
	<button style="display: none;" type="button"
		class="btn btn-danger alert-success-cancel m-b-10"
		onclick="if (!window.__cfRLUnblockHandlers) return false; _gaq.push(['_trackEvent', 'example', 'try', 'alert-success-cancel']);"
		data-cf-modified-d28fd8086f5eb18f81d8672a-="">Success or
		Cancel</button>
	<c:forEach items="${schedules }" var="s"></c:forEach>
	<script>
		var startDate;
		var endDate;
		var arr = [];
		
		$(function(){
			<c:forEach items="${schedules }" var="s">
				if("${s.PScheduleWriter}"!="${sessionScope.member.memberNickname}"){
					var obj={
							title : "[${s.PScheduleContent}]-"+"${s.PScheduleWriter}",
							start : "${s.PScheduleStart}",
							end : "${s.PScheduleEnd}",
							borderColor : "#6c757d",
							backgroundColor : "#f7f7f7",
							textColor : "black",
						};
				}else{
					var obj={
							title : "[${s.PScheduleContent}]",
							start : "${s.PScheduleStart}",
							end : "${s.PScheduleEnd}",
							borderColor : "#ffbc42",
							backgroundColor : "#f7f7f7",
							textColor : "black",
					};
				}
				arr.push(obj); 
			</c:forEach>
			
			$(".fc-event-container").click(function(){
				console.log($(this).css("border-color"));
				console.log("z")
			})
				
			$(".fc-event").click(function(){
				console.log($(this).css("border-color"));
				console.log("z")
			})
		});
		
		function clickAddBtn() {
			start = $("#start").val();
			end = $("#end").val();
			$("#addBtn").click();
		}

		function endDate() {
			swal({
				title : "Select End",
				text : "종료일을 선택해주세요(해당일 00시 기준)",
				type : "input",
				showCancelButton : true,
				closeOnConfirm : false,
				inputPlaceholder : "Write something"
			}, function(inputValue) {
				console.log(inputValue);
				if (inputValue === false)
					return false;
				if (inputValue === "") {
					swal.showInputError("값을 입력해주세요!");
					return false
				}
				endDate = inputValue;
				addTask();

			});
		}
		function addTask() {
			swal({
				title : "ADD Schedule",
				text : "내용을 선택해주세요",
				type : "prompt",
				showCancelButton : true,
				closeOnConfirm : false,
				inputPlaceholder : "Write something"
			}, function(inputValue) {
				console.log(inputValue);
				if (inputValue === false)
					return false;
				if (inputValue === "") {
					swal.showInputError("값을 입력해주세요!");
					return false
				}
				var task = inputValue;
				//swal("Added!", "추가: " + task, "success");
				swal({
					title : "Added!",
					type : "success"
				}, function() {
					console.log(task+ startDate,endDate);
					location.href="/meister/project/insertSchedule.do?projectNo="+${projectNo}+"&pScheduleContent="+task+"&pScheduleStart="+startDate+"&pScheduleEnd="+endDate;
				});

			});

		}
	
	</script>

	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/jquery.min.js"></script>
	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/jquery-ui.min.js"></script>
	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/popper.min.js"></script>
	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/bootstrap.min.js"></script>

	<script src="/resources/hj/projectRoom/calendar/js/waves.min.js"
		type="5abfe82e91da83887fe68972-text/javascript"></script>

	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/jquery.slimscroll.js"></script>

	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/modernizr.js"></script>
	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/css-scrollbars.js"></script>

	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/classie.js"></script>

	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/moment.min-2.js"></script>
	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/fullcalendar.min.js"></script>

	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/calendar.js"></script>
	<script src="/resources/hj/projectRoom/calendar/js/pcoded.min.js"
		type="5abfe82e91da83887fe68972-text/javascript"></script>
	<script
		src="/resources/hj/projectRoom/calendar/js/vertical-layout.min.js"
		type="5abfe82e91da83887fe68972-text/javascript"></script>
	<script
		src="/resources/hj/projectRoom/calendar/js/jquery.mcustomscrollbar.concat.min.js"
		type="5abfe82e91da83887fe68972-text/javascript"></script>
	<script type="5abfe82e91da83887fe68972-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/script.js"></script>

	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"
		type="5abfe82e91da83887fe68972-text/javascript"></script>

	<script type="d28fd8086f5eb18f81d8672a-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/sweetalert.min.js"></script>
	<script type="d28fd8086f5eb18f81d8672a-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/modal.js"></script>
	<script
		src="/resources/hj/projectRoom/calendar/js/rocket-loader.min.js"
		data-cf-settings="d28fd8086f5eb18f81d8672a-|49" defer=""></script>
	<script type="d28fd8086f5eb18f81d8672a-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/modaleffects.js"></script>
	<script type="5abfe82e91da83887fe68972-text/javascript">

  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	<script
		src="/resources/hj/projectRoom/calendar/js/rocket-loader.min.js"
		data-cf-settings="5abfe82e91da83887fe68972-|49" defer=""></script>

</body>

</html>
