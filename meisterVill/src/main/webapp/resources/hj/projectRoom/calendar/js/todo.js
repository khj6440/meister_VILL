'use strict';
$(document)
		.ready(
				function() {
					$('button#create-task').on(
							'click',
							function() {
								$(".md-form-control").removeClass("md-valid");
								if ('.nothing-message') {
									$('.nothing-message').hide('slide', {
										direction : 'left'
									}, 300)
								}
								;
								var task = $('input[name=task-insert]').val();
								if (task.length == 0) {
									alert('please enter a task');
								} else {
									var newTask = '<li>' + '<p>' + task
											+ '</p>' + '</li>'
									$('#task-list').append(newTask);
									$('input').val('');
									$('#controls').fadeIn();
									$('.task-headline').fadeIn();

								}
							});
					$(document).on('click', 'li', function() {
						$(this).toggleClass('complete');
					});
					$(document).on('dblclick', '#task-container li',
							function() {
								$(this).remove();
							});
					$('button#clear-all-tasks').on('click', function() {
						$('#task-list li').remove();
						$('.task-headline').fadeOut();
						$('#controls').fadeOut();
						$('.nothing-message').show('fast');
					});
					$(".icofont icofont-ui-delete").on("click", function() {
						$(this).parent().parent().parent().fadeOut();
					});
					var i = 7;
					$("#add-btn")
							.on(
									"click",
									function() {
										$(".md-form-control").removeClass(
												"md-valid");
										var task = $('.add_task_todo').val();
										if (task == "") {
											alert("please enter task");
										} else {
											var add_todo = $('<div class="to-do-list" id="'
													+ i
													+ '"><div class="checkbox-fade fade-in-primary"><label class="check-task"><input type="checkbox" onclick="check_task('
													+ i
													+ ')" id="checkbox'
													+ i
													+ '"><span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span><span>'
													+ task
													+ '</span></label></div><div class="f-right"><a onclick="delete_todo('
													+ i
													+ ');" href="#!" class="delete_todolist"><i class="icofont icofont-ui-delete" ></i></a></div></div>');
											i++;
											$(add_todo).appendTo(".new-task")
													.hide().fadeIn(300);
											$('.add_task_todo').val('');
										}
									});
					$(".delete_todolist").on("click", function() {
						$(this).parent().parent().fadeOut();
					});
					$(".save_btn")
							.on(
									"click",
									function() {
										$(".md-form-control").removeClass(
												"md-valid");
										var saveTask = $('.save_task_todo')
												.val();
										if (saveTask == "") {
											alert("please enter task");
										} else {
											var pNum = $("#pNum").val();
											var mNick = $("#mNick").val();
											$
													.ajax({
														url : "/meister/project/insertTodo.do",
														data : {
															projectNo : pNum,
															pNoticeWriter : mNick,
															pNoticeContent : saveTask
														},
														type : "POST",
														success : function(
																result2) {
															let today = new Date();
															let year = today
																	.getFullYear();
															let month = (today
																	.getMonth() + 1) < 10 ? "0"
																	+ (today
																			.getMonth() + 1)
																	: today
																			.getMonth() + 1;
															let day = today
																	.getDate() < 10 ? "0"
																	+ today
																			.getDate()
																	: today
																			.getDate();
															let hours = today
																	.getHours() < 10 ? "0"
																	+ today
																			.getHours()
																	: today
																			.getHours(); // 시
															let minutes = today
																	.getMinutes() < 10 ? "0"
																	+ today
																			.getMinutes()
																	: today
																			.getMinutes(); // 분

															var add_todo = $('<div  style="height:42px" class="to-do-label" id="'
																	+ result2
																	+ '"><div class="checkbox-fade fade-in-primary"><label class="check-task"><input type="checkbox" onclick="check_label('
																	+ i
																	+ ')" id="checkbox'
																	+ i
																	+ '"><span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span><span class="task-title-sp">'
																	+ saveTask
																	+ '</span><span style="margin-left: 25px;"  class="float-right hidden-phone"><i class="icofont icofont-ui-delete delete_todo" onclick="delete_todo('
																	+ result2
																	+ ');"></i></span><span class="float-right">'
																	+ year
																	+ "-"
																	+ month
																	+ "-"
																	+ day
																	+ "/"
																	+ hours
																	+ ":"
																	+ minutes
																	+ '</span></label></div></div>');
															i++;
															$(add_todo)
																	.prependTo(
																			".task-content")
																	.hide()
																	.fadeIn(300);
															$('.save_task_todo')
																	.val('');
															$("#flipFlop")
																	.modal(
																			'hide');
														},

														error : function() {
															console
																	.log("ajax 실패");
														}
													});
											/*
											 * insertTodo(saveTask);
											 * setTimeout(function(){ let today =
											 * new Date(); let year =
											 * today.getFullYear(); let month =
											 * (today.getMonth() + 1) < 10 ? "0" +
											 * (today.getMonth() + 1) :
											 * today.getMonth() + 1; let day =
											 * today.getDate() < 10 ? "0" +
											 * today.getDate() : today
											 * .getDate(); let hours =
											 * today.getHours() < 10 ? "0" +
											 * today.getHours() : today
											 * .getHours(); // 시 let minutes =
											 * today.getMinutes() < 10 ? "0" +
											 * today.getMinutes() :
											 * today.getMinutes(); // 분
											 * 
											 * var add_todo = $('<div
											 * style="height:42px"
											 * class="to-do-label" id="' +
											 * result2 + '"><div
											 * class="checkbox-fade
											 * fade-in-primary"><label
											 * class="check-task"><input
											 * type="checkbox"
											 * onclick="check_label(' + i + ')"
											 * id="checkbox' + i + '"><span
											 * class="cr"><i class="cr-icon
											 * icofont icofont-ui-check
											 * txt-primary"></i></span><span
											 * class="task-title-sp">' +
											 * saveTask + '</span><span
											 * style="margin-left: 25px;"
											 * class="float-right hidden-phone"><i
											 * class="icofont icofont-ui-delete
											 * delete_todo"
											 * onclick="delete_todo(' + result2 +
											 * ');"></i></span><span
											 * class="float-right">'
											 * +year+"-"+month+"-"+day+"/"+hours+":"+minutes +'</span></label></div></div>');
											 * i++; $(add_todo).appendTo(
											 * ".task-content").hide()
											 * .fadeIn(300);
											 * $('.save_task_todo').val('');
											 * $("#flipFlop").modal('hide');
											 * 
											 * },700);
											 */
										}
									});
					$(".close_btn").on("click", function() {
						$('.save_task_todo').val('');
					});
					/*
					 * $(".delete_todo").on("click", function() {
					 * $("#default-Modal").modal('show'); clicked = $(this);
					 * 
					 * });
					 */
				});
function delete_todo(e) {
	clicked = e;
	$("#default-Modal").modal('show');
}
$('.to-do-list input[type=checkbox]').on("click", function() {
	if ($(this).prop('checked'))
		$(this).parent().addClass('done-task');
	else
		$(this).parent().removeClass('done-task');
});
function check_task(elem) {

	if ($('#checkbox' + elem).prop('checked'))
		$('#checkbox' + elem).parent().addClass('done-task');
	else
		$('#checkbox' + elem).parent().removeClass('done-task');
}
$('.to-do-label input[type=checkbox]').on('click', function() {
	console.log("a");
	if ($(this).prop('checked')) {
		$(this).parent().addClass('done-task');
		$.ajax({
			url : "/meister/project/updateTodoDone.do",
			data : {
				pNoticeNo : $(this).parent().parent().parent().attr("id"),
			},
			type : "POST",
			success : function(data) {

			},
			error : function() {

			}
		});
	} else {
		$(this).parent().removeClass('done-task');
		$.ajax({
			url : "/meister/project/updateTodoDont.do",
			data : {
				pNoticeNo : $(this).parent().parent().parent().attr("id"),
			},
			type : "POST",
			success : function(data) {

			},
			error : function() {

			}
		});
	}
});
function check_label(elem) {
	console.log("b");
	if ($('#checkbox' + elem).prop('checked')) {
		$('#checkbox' + elem).parent().addClass('done-task');
		$.ajax({
			url : "/meister/project/updateTodoDone.do",
			data : {
				pNoticeNo :$('#checkbox' + elem).parent().parent().parent().attr("id"),
			},
			type : "POST",
			success : function(data) {

			},
			error : function() {

			}
		});
	} else {
		$('#checkbox' + elem).parent().removeClass('done-task');
		$.ajax({
			url : "/meister/project/updateTodoDont.do",
			data : {
				pNoticeNo : $('#checkbox' + elem).parent().parent().parent().attr("id"),
			},
			type : "POST",
			success : function(data) {

			},
			error : function() {

			}
		});
	}
}