<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <jsp:include page="/WEB-INF/views/common/message.jsp" />
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
<title>MEISTER VILL | PROJECT</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/resources/hj/test/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/hj/test/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/hj/test/css/fontAwesome.css">
<link rel="stylesheet" href="/resources/hj/test/css/light-box.css">
<link rel="stylesheet" href="/resources/hj/test/css/templatemo-main.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

<script
	src="/resources/hj/test/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
	<div class="sequence">
		<div class="seq-preloader">
			<svg width="39" height="16" viewBox="0 0 39 16"
				xmlns="http://www.w3.org/2000/svg" class="seq-preload-indicator">
				<g fill="#F96D38">
				<path class="seq-preload-circle seq-preload-circle-1"
					d="M3.999 12.012c2.209 0 3.999-1.791 3.999-3.999s-1.79-3.999-3.999-3.999-3.999 1.791-3.999 3.999 1.79 3.999 3.999 3.999z" />
				<path class="seq-preload-circle seq-preload-circle-2"
					d="M15.996 13.468c3.018 0 5.465-2.447 5.465-5.466 0-3.018-2.447-5.465-5.465-5.465-3.019 0-5.466 2.447-5.466 5.465 0 3.019 2.447 5.466 5.466 5.466z" />
				<path class="seq-preload-circle seq-preload-circle-3"
					d="M31.322 15.334c4.049 0 7.332-3.282 7.332-7.332 0-4.049-3.282-7.332-7.332-7.332s-7.332 3.283-7.332 7.332c0 4.05 3.283 7.332 7.332 7.332z" /></g></svg>
		</div>

	</div>


	<nav>
		<div class="logo">
			<img src="/resources/yr/imgs/meistervill_01.png" alt="">
		</div>
		<div class="mini-logo">
			<img src="/resources/yr/imgs/meistervill_01.png" width="100%" height="100%" alt="">
		</div>
		<ul>
			<li><a href="#1"><i class="fa fa-home"></i> <em>Home</em></a></li>
			<li><a href="#2"><i class="fa fa-comments"></i> <em>Chat</em></a></li>
			<li><a href="#3"><i class="fa fa-list-ul"></i> <em>To DO</em></a></li>
			<li><a href="#4"><i class="fa fa-calendar-check-o"></i> <em>Schedule</em></a></li>
			<li><a href="#5"><i class="fa fa-file-text-o"></i> <em>Files</em></a></li>
		</ul>
	</nav>

	<div class="slides">
		<div class="slide" id="1">
			<div class="content first-content">
				<iframe src="/meister/project/home.do?projectNo=${projectNo}"
					style="width: 100%; height: 100%;" frameborder="0"></iframe>
			</div>
		</div>
		<div class="slide" id="2">
			<div class="content second-content">
				<iframe src="/meister/project/chat.do?projectNo=${projectNo}"
					style="width: 100%; height: 100%;" frameborder="0"></iframe>
			</div>
		</div>
		<div class="slide" id="3">
			<div class="content third-content">
				<iframe src="/meister/project/todo.do?projectNo=${projectNo }"
					style="width: 100%; height: 100%;" frameborder="0"></iframe>
			</div>
		</div>
		<div class="slide" id="4">
			<div class="content fourth-content">
				<iframe src="/meister/project/schedule.do?projectNo=${projectNo }"
					style="width: 100%; height: 100%;" frameborder="0"></iframe>
			</div>
		</div>
		<div class="slide" id="5">
			<div class="content fifth-content">
				<iframe src="/meister/project/files.do?projectNo=${projectNo}"
					style="width: 100%; height: 100%;" frameborder="0"></iframe>
			</div>
		</div>
	</div>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="/resources/hj/test/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="/resources/hj/test/js/vendor/bootstrap.min.js"></script>
	<script src="/resources/hj/test/js/datepicker.js"></script>
	<script src="/resources/hj/test/js/plugins.js"></script>
	<script src="/resources/hj/test/js/main.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
/*     $(document).ready(function() {
        // navigation click actions 
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow');         
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
            event.preventDefault();
            $('#main-nav').toggleClass("open");
        });
    }); */
    // scroll function
  /*   function scrollToID(id, speed){
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    } */
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
    </script>
</body>
</html>