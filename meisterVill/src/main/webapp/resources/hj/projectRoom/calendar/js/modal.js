'use strict';
$(document)
		.ready(
				function() {
					document.querySelector('.sweet-1').onclick = function() {
						swal("Here's a message!", "It's pretty, isn't it?")
					};
					document.querySelector('.alert-success-msg').onclick = function() {
						swal("Good job!", "You clicked the button!", "success");
					};
					document.querySelector('.alert-confirm').onclick = function() {
						swal(
								{
									title : "Are you sure?",
									text : "Your will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonClass : "btn-danger",
									confirmButtonText : "Yes, delete it!",
									closeOnConfirm : false
								},
								function() {
									swal(
											"Deleted!",
											"Your imaginary file has been deleted.",
											"success");
								});
					};
					document.querySelector('.alert-success-cancel').onclick = function() {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this imaginary file!",
									type : "warning",
									showCancelButton : true,
									confirmButtonClass : "btn-danger",
									confirmButtonText : "Yes, delete it!",
									cancelButtonText : "No, cancel plx!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										swal(
												"Deleted!",
												"Your imaginary file has been deleted.",
												"success");
									} else {
										swal(
												"Cancelled",
												"Your imaginary file is safe :)",
												"error");
									}
								});
					};
					document.querySelector('.alert-prompt').onclick = function() {
						swal({
							title : "Select Start",
							text : "시작일을 선택해주세요",
							type : "input",
							showCancelButton : true,
							closeOnConfirm : false,
							inputPlaceholder : "Write something"
						}, function(inputValue) {
							if (inputValue === false)
								return false;
							if (inputValue === "") {
								swal.showInputError("값을 입력해주세요!");
								return false
							}
							startDate=inputValue;
							endDate();
							

						});
					};

					$('#openBtn').on('click', function() {
						$('#myModal').modal({
							show : true
						})
					});
					$(document)
							.on(
									'show.bs.modal',
									'.modal',
									function(event) {
										var zIndex = 1040 + (10 * $('.modal:visible').length);
										$(this).css('z-index', zIndex);
										setTimeout(function() {
											$('.modal-backdrop').not(
													'.modal-stack').css(
													'z-index', zIndex - 1)
													.addClass('modal-stack');
										}, 0);
									});
				});