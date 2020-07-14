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
																	<div class="to-do-label">
																		<div class="checkbox-fade fade-in-primary">
																			<label class="check-task"> <input
																				type="checkbox" value=""> <span class="cr">
																					<i
																					class="cr-icon icofont icofont-ui-check txt-primary"></i>
																			</span> <span class="task-title-sp">Lorem Ipsum Dolor
																					Sit Amet</span> <span class="float-right hidden-phone">
																					<i class="icofont icofont-ui-delete delete_todo"></i>
																			</span>
																			</label>
																		</div>
																	</div>
																	<div class="to-do-label">
																		<div class="checkbox-fade fade-in-primary">
																			<label class="check-task"> <input
																				type="checkbox" value=""> <span class="cr">
																					<i
																					class="cr-icon icofont icofont-ui-check txt-primary"></i>
																			</span> <span class="task-title-sp">Lorem Ipsum Dolor
																					Sit Amet</span> <span class="float-right hidden-phone">
																					<i class="icofont icofont-ui-delete delete_todo"></i>
																			</span>
																			</label>
																		</div>
																	</div>
																	<div class="to-do-label">
																		<div class="checkbox-fade fade-in-primary">
																			<label class="check-task"> <input
																				type="checkbox" value=""> <span class="cr">
																					<i
																					class="cr-icon icofont icofont-ui-check txt-primary"></i>
																			</span> <span class="task-title-sp">Lorem Ipsum Dolor
																					Sit Amet</span> <span class="float-right hidden-phone">
																					<i class="icofont icofont-ui-delete delete_todo"></i>
																			</span>
																			</label>
																		</div>
																	</div>
																	<div class="to-do-label">
																		<div class="checkbox-fade fade-in-primary">
																			<label class="check-task"> <input
																				type="checkbox" value=""> <span class="cr">
																					<i
																					class="cr-icon icofont icofont-ui-check txt-primary"></i>
																			</span> <span class="task-title-sp">Lorem Ipsum Dolor
																					Sit Amet</span> <span class="float-right hidden-phone">
																					<i class="icofont icofont-ui-delete delete_todo"></i>
																			</span>
																			</label>
																		</div>
																	</div>
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
																<div class="task-content">
																	<c:forEach items="${todoList }" var="t">
																		<div class="to-do-label">
																			<div class="checkbox-fade fade-in-primary">
																				<label class="check-task"> <input
																					type="checkbox" value=""> <span class="cr">
																						<i
																						class="cr-icon icofont icofont-ui-check txt-primary"></i>
																				</span> <span class="task-title-sp">${t.PNoticeContent }</span>
																				</label>
																			</div>
																		</div>
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