"use strict";
$(document).ready(
		function() {
			setTimeout(function() {
				var today = new Date();
				let year = today.getFullYear();
				let month = (today.getMonth() + 1) < 10 ? "0"
						+ (today.getMonth() + 1) : today.getMonth() + 1;
				let day = today.getDate() < 10 ? "0" + today.getDate() : today
						.getDate();
				$('#calendar').fullCalendar({
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaWeek,agendaDay,listMonth'
					},
					defaultDate : year + "-" + month + "-" + day,
					navLinks : true,
					businessHours : true,
					editable : false,
					droppable : false,
					drop : function() {
						if ($('#checkbox2').is(':checked')) {
							$(this).remove();
						}
					},
					events : arr
				});
				$(".fc-right").remove();
			}, 350);
			
			$(".fc-event-container").click(function(){
				console.log($(this).css("border-color"));
				console.log("z")
			})
			
		});
$(document).ready(function(){
	$(".fc-event-container").click(function(){
				console.log($(this).css("border-color"));
				console.log("z")
	});
})