<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!-- ----------------------------------------------------------------------------- -->
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\bootstrap\css\bootstrap.min.css">
<link
	href="/resources/hj/projectRoom/files\jquery.filer\css\jquery.filer.css"
	type="text/css" rel="stylesheet">
<link
	href="/resources/hj/projectRoom\files\jquery.filer\css\themes\jquery.filer-dragdropbox-theme.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\icon\themify-icons\themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\css2\style.css">
<script
	src="/resources/hj/projectRoom/dynamicTab/js/modernizr.custom.25376.js"></script>
<!-- ----------------------------------------------------------------------------- -->
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\css2\jquery.mCustomScrollbar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\icon\icofont\css\icofont.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\files\icon\feather\css\feather.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom\timeline\style.css">


<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
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
	<jsp:include page="/WEB-INF/views/common/message.jsp"/>
	<div id="perspective" class="perspective effect-moveleft">
		<div class="side-container">
			<div class="side-wrapper">
				<p style="margin: 0;">
					<button id="showMenu"><i class="fas fa-bars"></i></button>
				</p>
			</div>
			<div class="project-header">
				<div>PROJECT ROOM</div>
			</div>
			<div class="nav-container">
				<%-- <section>
					<div id="top-tabs" class="tabs tabs-style-bar">
						<nav>
							<ul>
								<li><a
									href="/meister/project/home.do?projectNo=${projectNo }"><i
										style="margin-right: 15px" class="fas fa-home"></i><span>Home</span></a></li>
								<li><a
									href="/meister/project/chat.do?projectNo=${projectNo }"><i
										style="margin-right: 15px;" class="far fa-comments"></i><span>Chat</span></a></li>
								<li><a
									href="/meister/project/todo.do?projectNo=${projectNo }"><i
										style="margin-right: 15px;" class="fas fa-list-ul"></i><span>To
											do</span></a></li>
								<li><a
									href="/meister/project/schedule.do?projectNo=${projectNo }"><i
										style="margin-right: 15px;" class="far fa-calendar-alt"></i><span>Schedule</span></a></li>
								<li><a
									href="/meister/project/files.do?projectNo=${projectNo }"
									style="background-color: #FFBC42; color: white;"><i
										style="margin-right: 15px;" class="far fa-file"></i><span>Files</span></a></li>
							</ul>
						</nav>
					</div>
				</section> --%>
			</div>


			<div class="project-content">
				<!-- Pre-loader end -->
				<div id="pcoded" class="pcoded">
					<div class="pcoded-overlay-box"></div>
					<div class="pcoded-container navbar-wrapper">
						<div class="pcoded-main-container">
							<div class="pcoded-wrapper">
								<div class="pcoded-content">
									<div class="pcoded-inner-content">
										<!-- Main-body start -->
										<div class="main-body">
											<div class="page-wrapper"
												style="padding-left: 18%; padding-right: 18%">
												<!-- Page-header start -->
												<div class="page-header">
													<div class="row align-items-end">
														<div class="col-lg-8">
															<div class="page-header-title">
																<div class="d-inline">
																	<h4>Project File Upload</h4>
																	<span>팀원들이 올린 파일이 공유됩니다.</span>
																</div>
															</div>
														</div>
														<div class="col-lg-4"></div>
													</div>
												</div>
												<!-- Page-header end -->
												<!-- Page-body start -->
												<div class="page-body">
													<!-- File upload card start -->
													<div class="card">
														<div class="card-header">
															<div class="sub-title" style="font-weight: 500;">Upload
																Zone</div>
															<div class="card-header-right">
																<ul class="list-unstyled card-option">
																	<li><i class="feather icon-minus minimize-card"></i></li>
																</ul>
															</div>
														</div>
														<div class="card-block">
															<form id="uploadForm">
																<input id="myFile" type="file" name="file[]"
																	multiple="multiple">
															</form>
														</div>
													</div>
													<!-- File upload card end -->
												</div>
												<!-- Page-body end -->
											</div>

										</div>
										<!-- Main-body end -->
										<div class="main-body">
											<div class="page-wrapper"
												style="padding-left: 18%; padding-right: 18%; padding-top: 0px;">
												<!-- Page-body start -->
												<div class="page-body">
													<div class="row">
														<div class="col-sm-12" style="min-width: 475px;">
															<div class="card">
																<div class="card-header">
																	<h5>Timeline</h5>
																</div>
																<div class="card-block">
																	<div class="main-timeline">
																		<div class="cd-timeline cd-container">
																			<c:forEach items="${files}" var="f">
																				<c:set var="length"
																					value="${fn:length(f.PFilename)}" />
																				<c:set var="result"
																					value="${fn:toLowerCase(fn:substring(f.PFilename,length-3,length))}" />
																				<c:choose>
																					<c:when
																						test="${result == 'png' || result =='jpg' ||result=='gif'}">
																						<!-- cd-timeline-block -->
																						<div class="cd-timeline-block">
																							<div class="cd-timeline-icon bg-primary">
																								<i class="icofont icofont-image"></i>
																							</div>
																							<!-- cd-timeline-img -->
																							<div class="cd-timeline-content card_main"
																								style="border-radius: 10px; box-shadow: 2px 2px 2px gray;">
																								<div class="p-20" style="cursor: pointer;"
																									onclick="projectFileDownload('${f.PFilename}','${f.PFilepath }')">
																									<h6 style="font-weight: bold;font-size: 13px;">${f.PFilename }</h6>

																									<img
																										src="/resources/upload/project/file/${f.PFilepath}"
																										style="height: 150px; border-radius: 10px; border: 1px solid #e8e8e8;"
																										class="img-fluid width-100" alt="">
																								</div>
																								<span class="cd-date">${f.PFileWriter }</span> <span
																									class="cd-details">${f.PFileTime }</span>
																							</div>
																							<!-- cd-timeline-content -->
																						</div>
																					</c:when>
																					<c:otherwise>
																						<!-- cd-timeline-block -->
																						<div class="cd-timeline-block">
																							<div style="background-color: #c48a1f;"
																								class="cd-timeline-icon ">
																								<i class="icofont icofont-ui-file"></i>
																							</div>
																							<!-- cd-timeline-img -->
																							<div class="cd-timeline-content card_main"
																								style="border-radius: 10px">
																								<div
																									class="media bg-white d-flex p-10 d-block-phone"
																									style="border-radius: 10px; cursor: pointer; box-shadow: 2px 2px 2px gray;"
																									onclick="projectFileDownload('${f.PFilename}','${f.PFilepath }')">
																									<div class="media-left media-middle col-xs-12">
																											<div
																												style="background: #fcefc7; border-radius: 10px; width: 50px; height: 50px; line-height: 50px; text-align: center;">
																												<img class="media-object img-fluid"
																													src="/resources/upload/common/fileImg.png"
																													style="width: 50%; height: 50%;" alt="">
																											</div>
																									</div>
																									<div class="media-body">
																										<div class="f-15 f-bold m-b-5" style="font-weight: bold;font-size: 13px;">${f.PFilename }</div>
																										<div class="f-13 text-muted" style="font-size: 12px;">Download
																											File</div>
																									</div>
																								</div>
																								<span class="cd-date">${f.PFileWriter }</span> <span
																									class="cd-details">${f.PFileTime }</span>
																							</div>
																							<!-- cd-timeline-content -->
																						</div>
																					</c:otherwise>
																				</c:choose>
																			</c:forEach>
																		</div>
																		<!-- cd-timeline -->
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- Page-body end -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav class="outer-nav right vertical">
			<a href="/meister/project/home.do?projectNo=${projectNo }" class=""><i
				style="margin-right: 15px;" class="fas fa-home"></i>Home</a> <a
				href="/meister/project/chat.do?projectNo=${projectNo }" class=""><i
				style="margin-right: 15px;" class="far fa-comments"></i>Chat</a> <a
				href="/meister/project/todo.do?projectNo=${projectNo }" class=""><i
				style="margin-right: 15px;" class="fas fa-list-ul"></i>To do</a> <a
				href="/meister/project/schedule.do?projectNo=${projectNo }" class=""><i
				style="margin-right: 15px;" class="far fa-calendar-alt"></i>Schedule</a>
			<a href="/meister/project/files.do?projectNo=${projectNo }" class=""><i
				style="margin-right: 15px;" class="far fa-file"></i>Files</a>
		</nav>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
		$(window).scroll(function(){ 
		    var height = $(document).scrollTop(); 
		    if(height > 300){ 
		    	$('.page-body').eq(0).css({"position":"fixed","top":"0","z-index":"1000","right":"0"}); 
				    
		    }else{ 
		      $('.page-body').eq(0).css({'position':"relative"}); 
		    } 
		});
		
		$("#myFile").on(
				'change',
				function() {
					var form = $('#uploadForm')[0];
					var formData = new FormData(form);
					formData.append("projectNo", "${projectNo}");
					formData.append("pFileWriter",
							"${sessionScope.member.memberNickname}");
					$.ajax({
						url : "/meister/project/uploadProjectFile.do",
						data : formData,
						type : "POST",
						contentType : false,
						processData : false,
						success : function(data) {
							var resultList = JSON.parse(data);
							resultList.forEach(function(item, index) {
								var arr = item.split(":");
								var ext = arr[0].substring(arr[0].lastIndexOf(".")).toLowerCase();
								var result="";
								
								if(ext==".jpg" || ext==".png" || ext==".gif"){
									result+=`<div class="cd-timeline-block">`;
									result+=`<div class="cd-timeline-icon bg-primary">`;
									result+=`<i class="icofont icofont-image"></i>`;
									result+=`</div>`;
									result+=`<div class="cd-timeline-content card_main" `;
									result+=`style="border-radius: 10px; box-shadow: 2px 2px 2px gray;">`;
									result+=`<div class="p-20" style="cursor: pointer;" onclick="projectFileDownload('`;
									result+=arr[0]+`','`+arr[1]+`')">`;
									result+=`<h6 style="font-weight: bold;font-size: 13px;">`+arr[0]+`</h6>`;
									result+=`<img src="/resources/upload/project/file/`+arr[1]+`"`;
									result+=` style="height: 150px; border-radius: 10px; border: 1px solid #e8e8e8;" class="img-fluid width-100">`;
									result+=`</div>`;
									result+=`<span class="cd-date">`+"${sessionScope.member.memberNickname}"+`</span>`;
									result+=`<span class="cd-details">`;
									result+= getNow();
									result+=`</span>`;
									result+=`</div></div>`;
								}else{
									result+=`<div class="cd-timeline-block">`;
									result+=`<div style="background-color: #c48a1f;" class="cd-timeline-icon ">`;
									result+=`<i class="icofont icofont-ui-file"></i>`;
									result+=`</div>`;
									result+=`<div class="cd-timeline-content card_main"	style="border-radius: 10px">`;
									result+=`<div class="media bg-white d-flex p-10 d-block-phone"`;
									result+=` style="border-radius: 10px; cursor: pointer; box-shadow: 2px 2px 2px gray;" onclick="projectFileDownload('`;
									result+=arr[0]+`','`+arr[1]+`')">`;
									result+=`<div class="media-left media-middle col-xs-12">`;
									result+=`<div style="background: #fcefc7; border-radius: 10px; width: 50px; height: 50px; line-height: 50px; text-align: center;">`;
									result+=`<img class="media-object img-fluid" src="/resources/upload/common/fileImg.png"	style="width: 50%; height: 50%;">`;
									result+=`</div></div>`;
									result+=`<div class="media-body">`;
									result+=`<div class="f-15 f-bold m-b-5" style="font-weight: bold;font-size: 13px;">`+arr[0]+`</div>`;
									result+=`<div class="f-13 text-muted" style="font-size: 12px;">Download	File</div>`;
									result+=`</div></div>`;
									result+=`<span class="cd-date">`+"${sessionScope.member.memberNickname}"+`</span>`;
									result+=`<span class="cd-details">`;
									result+=getNow();
									result+=`</span>`;
									result+=`</div></div>`;
								}
								
								
								$(".cd-container").prepend(result);
							}) 
						},
						error : function() {
							console.log("ajax 실패");
						}
					});

				})
	})
	function uploadFiles(files) {

		var formData = new FormData();

		for (var i = 0; i < files.length; i++) {
			formData.append('file[]', files[i]);
		}
		formData.append("projectNo", "${projectNo}");
		formData.append("pFileWriter", "${sessionScope.member.memberNickname}");

		$.ajax({
			url : "/meister/project/uploadProjectFile.do",
			data : formData,
			type : "POST",
			contentType : false,
			processData : false,
			enctype : 'multipart/form-data',
			success : function(data) {
				var resultList = JSON.parse(data);
				resultList.forEach(function(item, index) {
					var arr = item.split(":");
					var ext = arr[0].substring(arr[0].lastIndexOf(".")).toLowerCase();
					var result="";
					
					if(ext==".jpg" || ext==".png" || ext==".gif"){
						result+=`<div class="cd-timeline-block">`;
						result+=`<div class="cd-timeline-icon bg-primary">`;
						result+=`<i class="icofont icofont-image"></i>`;
						result+=`</div>`;
						result+=`<div class="cd-timeline-content card_main" `;
						result+=`style="border-radius: 10px; box-shadow: 2px 2px 2px gray;">`;
						result+=`<div class="p-20" style="cursor: pointer;" onclick="projectFileDownload('`;
						result+=arr[0]+`','`+arr[1]+`')">`;
						result+=`<h6 style="font-weight: bold;font-size: 13px;">`+arr[0]+`</h6>`;
						result+=`<img src="/resources/upload/project/file/`+arr[1]+`"`;
						result+=` style="height: 150px; border-radius: 10px; border: 1px solid #e8e8e8;" class="img-fluid width-100">`;
						result+=`</div>`;
						result+=`<span class="cd-date">`+"${sessionScope.member.memberNickname}"+`</span>`;
						result+=`<span class="cd-details">`;
						result+= getNow();
						result+=`</span>`;
						result+=`</div></div>`;
					}else{
						result+=`<div class="cd-timeline-block">`;
						result+=`<div style="background-color: #c48a1f;" class="cd-timeline-icon ">`;
						result+=`<i class="icofont icofont-ui-file"></i>`;
						result+=`</div>`;
						result+=`<div class="cd-timeline-content card_main"	style="border-radius: 10px">`;
						result+=`<div class="media bg-white d-flex p-10 d-block-phone"`;
						result+=` style="border-radius: 10px; cursor: pointer; box-shadow: 2px 2px 2px gray;" onclick="projectFileDownload('`;
						result+=arr[0]+`','`+arr[1]+`')">`;
						result+=`<div class="media-left media-middle col-xs-12">`;
						result+=`<div style="background: #fcefc7; border-radius: 10px; width: 50px; height: 50px; line-height: 50px; text-align: center;">`;
						result+=`<img class="media-object img-fluid" src="/resources/upload/common/fileImg.png"	style="width: 50%; height: 50%;">`;
						result+=`</div></div>`;
						result+=`<div class="media-body">`;
						result+=`<div class="f-15 f-bold m-b-5" style="font-weight: bold;font-size: 13px;">`+arr[0]+`</div>`;
						result+=`<div class="f-13 text-muted" style="font-size: 12px;">Download	File</div>`;
						result+=`</div></div>`;
						result+=`<span class="cd-date">`+"${sessionScope.member.memberNickname}"+`</span>`;
						result+=`<span class="cd-details">`;
						result+=getNow();
						result+=`</span>`;
						result+=`</div></div>`;
					}
					
					
					$(".cd-container").prepend(result);
				}) 
			},
			error : function() {
				console.log("ajax 실패");
			}
		});
	}
	
	function projectFileDownload(filename, filepath) {
		location.href = "/meister/project/projectFileDownload.do?filename="
				+ filename + "&filepath=" + filepath;
	}
	
	function getNow(){
		let today = new Date();
		let year = today.getFullYear();
		let month = (today.getMonth() + 1) < 10 ? "0"
				+ (today.getMonth() + 1) : today.getMonth() + 1;
		let day = today.getDate() < 10 ? "0" + today.getDate() : today
				.getDate();
		let hours = today.getHours() < 10 ? "0" + today.getHours() : today
				.getHours(); // 시
		let minutes = today.getMinutes() < 10 ? "0" + today.getMinutes()
				: today.getMinutes();
		let seconds = today.getSeconds() <10 ? "0" +today.getSeconds() : today.getSeconds(); 
		
		return year+"-"+month+"-"+day+"/"+hours+":"+minutes+":"+seconds;
		
	}
	
	
</script>
<script src="/resources/hj/projectRoom/dynamicTab/js/classie.js"></script>
<script src="/resources/hj/projectRoom/dynamicTab/js/menu.js"></script>
<!-- --------------------------------------------------------- -->
<script type="text/javascript"
	src="/resources/hj/projectRoom\files\js2\jquery.min.js"></script>
<script type="text/javascript"
	src="/resources/hj/projectRoom\files\js2\script.js"></script>
<script
	src="/resources/hj/projectRoom\files\jquery.filer\js\jquery.filer.min.js"></script>
<script
	src="/resources/hj/projectRoom\files\filer\jquery.fileuploads.init.js"
	type="text/javascript"></script>


</html>