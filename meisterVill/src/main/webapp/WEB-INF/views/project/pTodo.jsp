<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../favicon.ico">
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
	href="/resources/hj/projectRoom/calendar/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/hj/projectRoom/calendar/css/pages.css">



<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<style>
* {
	margin-block-start: 0px;
	margin-block-end: 0px;
}

html, body {
	margin: 0px;
	padding: 0px;
	height: 100%;
}
.task-content2:hover{
	cursor: not-allowed;
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

			<div class="pcoded-main-container" style="background-color: #F6F7FB;">
				<div class="pcoded-wrapper">
					<div class="pcoded-content">
						<div class="page-header card">
							<div class="row align-items-end">
								<div class="col-lg-8">
									<div class="page-header-title">
										<div class="d-inline">
											<h2>PROJECT To Do List</h2>
											<span style="color: #919aa3;">팀원들과 할 일을 공유합니다.</span>
										</div>
									</div>
								</div>
								<div>
								 <c:if test="${empty pickDate  }">
								 	<input value="2020-07-13" id="pickDay" type="date">
								 </c:if>
								 <c:if test="${not empty pickDate  }">
								 	<input value="${pickDate}" id="pickDay" type="date">
								 
								 </c:if>
								<button class="btn" onclick="getTodoList()">검색</button></div>
							</div>
						</div>

						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-header">
														<h5>My To Do List</h5>
													</div>
													<div class="card-block">
														<section class="task-panel tasks-widget">
															<div class="panel-body">
																<div class="task-content">
																	<c:forEach items="${todoList }" var="t">
																		<c:if
																			test="${t.PNoticeWriter eq sessionScope.member.memberNickname }">
																			<div class="to-do-label" id=${t.PNoticeNo }>
																				<div class="checkbox-fade fade-in-primary">
																				<c:if test="${t.PNoticeDone eq 0 }">
																					<label class="check-task" > 
																						<input	type="checkbox" > 
																				</c:if>
																				<c:if test="${t.PNoticeDone eq 1 }">
																					<label class="check-task done-task" > 
																					<input	type="checkbox" checked="checked" > 
																				</c:if>
																					<span class="cr">
																						<i	class="cr-icon icofont icofont-ui-check txt-primary"></i>
																					</span> <span class="task-title-sp">${t.PNoticeContent}</span>
																						<span style="margin-left: 25px;" class="float-right hidden-phone"> <i
																							class="icofont icofont-ui-delete delete_todo" onclick="delete_todo(${t.PNoticeNo})"></i>
																					</span>
																					<span class="float-right">${t.PNoticeDate }</span>
																						
																					</label>
																				</div>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
																<div>
																	<a
																		class="btn btn-primary btn-add-task waves-effect waves-light m-t-10"
																		href="#" data-toggle="modal" data-target="#flipFlop"><i
																		class="icofont icofont-plus"></i> Add New Tasks</a>
																</div>
															</div>
														</section>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-header">
														<h5>Team To Do List</h5>
													</div>
													<div class="card-block">
														<section class="task-panel tasks-widget">
															<div class="panel-body">
																<div class="task-content2">
																	<c:forEach items="${todoList }" var="t">
																		<c:if
																			test="${t.PNoticeWriter ne sessionScope.member.memberNickname }">
																			<div class="to-do-label">
																				<div class="checkbox-fade fade-in-primary">
																				<c:if test="${t.PNoticeDone eq 0 }">
																					<label class="check-task"> 
																					<input	type="checkbox" value="" disabled="disabled">

																				</c:if>
																				<c:if test="${t.PNoticeDone eq 1 }">
																					<label class="check-task done-task"> 
																					<input	type="checkbox" checked="checked" value="" disabled="disabled">

																				</c:if>
																																								
																						<span class="cr"> <i
																							class="cr-icon icofont icofont-ui-check txt-primary"></i>
																					</span> <span class="task-title-sp">${t.PNoticeContent }</span>
																					
																						<span style="float: right;margin-left: 25px;" class="task-title-sp">작성자
																							: ${t.PNoticeWriter }</span>
																							<span class="float-right">${t.PNoticeDate }</span>
																					</label>
																				</div>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
															</div>
														</section>
													</div>
												</div>

											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div id="styleSelector"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="flipFlop" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="modalLabel">Add new todo</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12">
							<div class="form-material">
								<div class="right-icon-control">
									<form class="form-material">
										<div class="form-group form-primary">
											<input type="text" name="task-insert"
												class="form-control save_task_todo" required=""> <span
												class="form-bar"></span> <label class="float-label">Create
												your task list</label>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="save_btn btn btn-primary">Save</button>
					<button type="button" class="btn btn-default close_btn"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="default-Modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">DELETE TO DO</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h5>삭제 확인</h5>
					<p>삭제 하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default waves-effect "
						data-dismiss="modal">Close</button>
					<button onclick="deleteTodo();" type="button"
						class="btn btn-primary waves-effect waves-light ">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>
	<input id="pNum" style="display: none" value="${projectNo }">
	<input id="mNick" style="display: none" value="${sessionScope.member.memberNickname}">
	<script type="text/javascript">
		function getTodoList(){
			var value = $("#pickDay").val();
			location.href="/meister/project/todo2.do?projectNo="+${projectNo}+"&date="+value;
		}
	</script>
	<script type="text/javascript">
		var num = 0;
		var clicked=null;
		var result2;
		function deleteTodo(){
			$.ajax({
				url : "/meister/project/deleteTodo.do",
				data : {
					pNoticeNo : clicked,
				},
				type : "POST",
				success : function(data) {
					if(data>0){
						$('#' + clicked).fadeOut();
						clicked= null;
					}else{
						alert("실패")
					}
				},
				error : function() {
					console.log("ajax 실패");
				}
			});
			$("#default-Modal").modal('hide');		
		}
		/* function insertTodo(saveTask) {
			var result=0;
			$.ajax({
				url : "/meister/project/insertTodo.do",
				data : {
					projectNo : "${projectNo}",
					pNoticeWriter : "${sessionScope.member.memberNickname}",
					pNoticeContent : saveTask
				},
				type : "POST",
				success : function(data) {
					result2=data;
				},
				error : function() {
					console.log("ajax 실패");
				}
			});
			
		} */
		
	</script>

	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/jquery.min.js"></script>
	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/jquery-ui.min.js"></script>
	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/popper.min.js"></script>
	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/bootstrap.min.js"></script>

	<script src="/resources/hj/projectRoom/calendar/js/waves.min.js"
		type="e9351a8aaabbca07704238a6-text/javascript"></script>

	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/jquery.slimscroll.js"></script>

	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/modernizr.js"></script>
	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/css-scrollbars.js"></script>

	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/todo.js"></script>
	<script src="/resources/hj/projectRoom/calendar/js/pcoded.min.js"
		type="e9351a8aaabbca07704238a6-text/javascript"></script>
	<script
		src="/resources/hj/projectRoom/calendar/js/vertical-layout.min.js"
		type="e9351a8aaabbca07704238a6-text/javascript"></script>
	<script
		src="/resources/hj/projectRoom/calendar/js/jquery.mcustomscrollbar.concat.min.js"
		type="e9351a8aaabbca07704238a6-text/javascript"></script>

	<script type="e9351a8aaabbca07704238a6-text/javascript"
		src="/resources/hj/projectRoom/calendar/js/script.js"></script>

	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"
		type="e9351a8aaabbca07704238a6-text/javascript"></script>
	<script type="e9351a8aaabbca07704238a6-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	<script
		src="/resources/hj/projectRoom/calendar/js/rocket-loader.min.js"
		data-cf-settings="e9351a8aaabbca07704238a6-|49" defer=""></script>
</body>
</html>