
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MEISTER VILL</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/yr/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- Custom fonts for this template -->
    <link href="/resources/yr/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/yr/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/yr/css/landing-page.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/resources/yr/css/header_css.css" type="text/css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<body>






    <style>
        .navbar-brand {
            font-size: 12px;
            font-weight: 700;
            color: #4D4D4D;
            font-family: 'Nanum Gothic Coding', monospace;

        }

        .navbar>.container {
            justify-content: flex-start;
            width: 400px;
            margin-left: 20px;
        }

        header.masthead {
            padding-top: 10px;
            padding-bottom: 10%;
        }

        header.masthead>.member-top-line {
            float: right;
            margin-right: 30px;
        }

        .header-logo-p {
            margin-top: 120px;
        }

        .row {
            margin: 0 auto;
            display: block;
        }

        .header-search-bar {
            margin-top: 20px;
        }

        .header-input-pa {
            margin: 0 auto;
        }

        .member-top-menu {
            color: #4D4D4D;
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 15px;
            font-weight: 700;

        }

        .member-top-menu:hover {
            color: #4d4d4d;
            text-decoration: none;
        }

        .btn-h-search {
            float: left;
            margin-top: 20px;
            width: 95%;
            height: 100%;
            position: relative;
        }

        .btn-h-search:last-child {
            width: 5%;
            position: absolute;
            z-index: 1;
            margin-left: -13%;
        }

        .btn-h-search>input {
            width: 100%;
            padding-right: 15%;
        }

        .btn-h-search>a>i {
            margin-top: 30%;
            color: #4D4D4D;
        }

        .member-top-menu {
            margin-left: 10px;
        }

        .member-top-line>.btn-insert, .hd-member>.btn-insert {
            margin-left: 20px;
            background-color: #FFBC42;
            border: white;
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 15px;
            font-weight: 700;
            color: white;
        }

        .member-top-line>.btn-insert:hover {
            background-color: whitesmoke;
            box-shadow: 0px 0px 7px #FFBC42;
            color: #4D4D4D;
        }
        .hd-member>.btn-insert:hover{
            background-color: whitesmoke;
            box-shadow: 0px 0px 7px #FFBC42;
            color: #4D4D4D;
        }

        .header-in-navi {
            width: 70%;
            margin: 0 auto;
            text-align: center;
        }

        .header-in-navi>div {
            float: left;
            width: 10%;
            margin-left: 20%;
            margin-right: 20%;
            margin-top: 5%;
            text-align: center;
        }

        .header-nav-menu {
            width: 100%;
            margin-top: 5%;
            position: absolute;


        }

        .header-nav-menu>ul {
            list-style: none;
            padding: 0;
            width: 80%;
            height: auto;
            margin: 0 auto;
        }

        .main-navi>li {
            display: inline-block;
            width: 30%;
            margin: 0 auto;

        }

        .nav-text {
            color: #4d4d4d;
            font-size: 16px;
            font-family: 'Nanum Gothic Coding', monospace;
            font-weight: 700;
        }

        .nav-icon {
            color: #4d4d4d;
        }

        .main-navi>li>a {
            width: 10%;
        }

        .header-nav-menu a:hover {
            text-decoration: none;
        }

        .header-nav-menu a:hover>.nav-icon>i {
            color: #FFBC42;
            transform: translateY(-40%);
            transition-duration: 0.4s;
        }






        .side-info-menu {
            z-index: 1200;
            width: 8%;
            position: fixed;
            margin-top: -17%;
        }

        .sim-div {
            width: 85%;
        }

        .sim-btn {
            width: 7%;

        }

        .sim-btn>a {
            color: #4d4d4d;
        }

        .sim-btn>a:hover {
            color: #FFBC42;
        }

        .side-info-menu>div {
            display: inline-block;
            height: 45%;
        }

        .sim-btn>a>i {
            line-height: 100%;
        }

        .sim-div>div {
            width: 100%;

            text-align: center;
            padding: 12%;
            background-color: #4d4d4d;
        }

        .sim-div>div:first-child {
            border-top-right-radius: 10px;
        }

        .sim-div>div:last-child {
            border-bottom-right-radius: 10px;
        }

        .sim-div a {
            width: 100%;
            height: 100%;
            color: aliceblue;

        }

        .sim-div a:hover {
            text-decoration: none;
            color: #FFBC42;
        }

        .sim-open {
            margin-left: 0px;
            transition-duration: 0.7s;
        }

        .sim-close {
            margin-left: -7%;
            transition-duration: 0.7s;
        }




        .normal-header {
            position: fixed;
            z-index: 1000;

        }

        .n-header {
            background-color: white;
            border-top: 0.5px solid lightgray;
        }

        .static-top {
            background-color: #f8f9fa;
            width: 100%;
        }

        

        .normal-header {
            display: none;
        }
        
        .member-top-line>.btn-insert:active{
            background-color: #FFBC42;
            color: #4d4d4d;
            border-color: #FFBC42;
            box-shadow: 0px 0px 2px #FFBC42;
        }
        
        .hd-member>.btn-insert:active{
            background-color: #FFBC42;
            color: #4d4d4d;
            border-color: #FFBC42;
            box-shadow: 0px 0px 2px #FFBC42;
        }
        
        .normal-header{
        	width: 100%;
        }


    </style>
    <div class="normal-header">
                <!-- Navigation -->

                <nav class="navbar navbar-light bg-light static-top">
                    <div class="container">
                        <a class="navbar-brand" href="#">맞춤견적</a>
                        <a class="navbar-brand" href="#">커뮤니티</a>
                        <a class="navbar-brand" href="#">마이스터</a>
                        <a class="navbar-brand" href="#">프로젝트</a>

                    </div>
                </nav>

                <!-- Masthead -->

                <div class="n-header">
                    <div class="hd-menu">
                        <div class="hd hd-logo">
                            <a href="#">
                                <img src="/resources/yr/imgs/meistervill_01.png">
                            </a>
                        </div>
                        <div class="hd hd-search">
                            <div class="hdsc">
                                <span class="hdsc-icon"><a href="#"><i class="fa fa-search"></i></a></span>
                                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="Search..." />
                            </div>
                        </div>
                        <div class="hd hd-member">
                            <a class="member-top-menu" href="#">마이스터 등록</a>
                            <a class="member-top-menu" href="#">로그인</a>
                            <a class="btn btn-insert" href="#">무료 회원가입</a>
                        </div>
                    </div>
                    <div class="hd-category">
                        <ul>
                            <li><a href="#">IT/Programming</a></li>
                            <li><a href="#">Design</a></li>
                        </ul>
                    </div>
                </div>
            </div>
    
    
    
    
    
    <div class="header-scr">
        <!-- Navigation -->
        <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="#">맞춤견적</a>
                <a class="navbar-brand" href="#">커뮤니티</a>
                <a class="navbar-brand" href="#">마이스터</a>
                <a class="navbar-brand" href="#">프로젝트</a>

            </div>
        </nav>

        <!-- Masthead -->
        <header class="masthead text-center pic-header">
            <div class="member-top-line">
                <a class="member-top-menu" href="#">마이스터 등록</a>
                <a class="member-top-menu" href="#">로그인</a>
                <a class="btn btn-insert" href="#">무료 회원가입</a>
            </div>
            <!--    <div class="overlay"></div>-->

            <div class="container">

                <div class="row">

                    <div class="col-xl-9 mx-auto header-logo-p">
                        <a href="#"><img class="logo-p" src="/resources/yr/img/meistervill_01.png" width="70%"></a>
                    </div>
                    <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                        <form>
                            <div class="form-row">
                                <div class="col-12 col-md-9 mb-2 mb-md-0 header-input-pa header-search">
                                    <div class="btn-h-search">
                                        <input type="text" class="form-control form-control-lg header-l-search-input" name="keyword" placeholder="Search..."></div>
                                    <span class="btn-h-search">
                                        <a href="#"><i class="fa fa-2x fa-search"></i></a>
                                    </span>
                                </div>

                            </div>
                        </form>
                    </div>

                </div>

            </div>
            <div class="header-nav-menu">
                <ul class="main-navi">
                    <li>
                        <a href="#">
                            <div class="nav-icon">
                                <i class="fa fa-2x fa-desktop" aria-hidden="true"></i>
                            </div>
                            <div class="nav-text">
                                IT/Programming
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="nav-icon">
                                <i class="fa fa-2x fa-paint-brush" aria-hidden="true"></i>
                            </div>
                            <div class="nav-text">
                                Design
                            </div>
                        </a>
                    </li>
                </ul>
            </div>





            


        </header>
    </div>

    <div class="side-info-menu sim-close">

        <div class="sim-div">
            <div class="sim-notice-div">
                <a href="#">
                    <div class="sim-icon">
                        <i class="fa fa-2x fa-sticky-note" aria-hidden="true"></i>
                    </div>
                    <div class="sim-text">Notice</div>
                </a>
            </div>
            <div class="sim-qna-div">
                <a href="#">
                    <div class="sim-icon">
                        <i class="fa fa-2x fa-question-circle" aria-hidden="true"></i>
                    </div>
                    <div class="sim-text">QnA</div>
                </a>
            </div>
            <div class="sim-ask-div">
                <a href="#">
                    <div class="sim-icon">
                        <i class="fa fa-2x fa-commenting" aria-hidden="true"></i>
                    </div>
                    <div class="sim-text">Ask</div>
                </a>
            </div>
        </div>
        <div class="sim-btn">
            <a href="javascript:void(0);"><i class="fa fa-4x fa-caret-right" aria-hidden="true"></i></a>
        </div>

    </div>


    <!-- Icons Grid -->
    <section class="features-icons bg-light text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                        <div class="features-icons-icon d-flex">
                            <i class="icon-screen-desktop m-auto text-primary"></i>
                        </div>
                        <h3>Fully Responsive</h3>
                        <p class="lead mb-0">This theme will look great on any device, no matter the size!</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                        <div class="features-icons-icon d-flex">
                            <i class="icon-layers m-auto text-primary"></i>
                        </div>
                        <h3>Bootstrap 4 Ready</h3>
                        <p class="lead mb-0">Featuring the latest build of the new Bootstrap 4 framework!</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="features-icons-item mx-auto mb-0 mb-lg-3">
                        <div class="features-icons-icon d-flex">
                            <i class="icon-check m-auto text-primary"></i>
                        </div>
                        <h3>Easy to Use</h3>
                        <p class="lead mb-0">Ready to use with your own content, or customize the source files!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Image Showcases -->
    <section class="showcase">
        <div class="container-fluid p-0">
            <div class="row no-gutters">

                <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/bg-showcase-1.jpg');"></div>
                <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                    <h2>Fully Responsive Design</h2>
                    <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
                </div>
            </div>
            <div class="row no-gutters">
                <div class="col-lg-6 text-white showcase-img" style="background-image: url('img/bg-showcase-2.jpg');"></div>
                <div class="col-lg-6 my-auto showcase-text">
                    <h2>Updated For Bootstrap 4</h2>
                    <p class="lead mb-0">Newly improved, and full of great utility classes, Bootstrap 4 is leading the way in mobile responsive web development! All of the themes on Start Bootstrap are now using Bootstrap 4!</p>
                </div>
            </div>
            <div class="row no-gutters">
                <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/bg-showcase-3.jpg');"></div>
                <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                    <h2>Easy to Use &amp; Customize</h2>
                    <p class="lead mb-0">Landing Page is just HTML and CSS with a splash of SCSS for users who demand some deeper customization options. Out of the box, just add your content and images, and your new landing page will be ready to go!</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="testimonials text-center bg-light">
        <div class="container">
            <h2 class="mb-5">What people are saying...</h2>
            <div class="row">
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="img/testimonials-1.jpg" alt="">
                        <h5>Margaret E.</h5>
                        <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="img/testimonials-2.jpg" alt="">
                        <h5>Fred S.</h5>
                        <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="img/testimonials-3.jpg" alt="">
                        <h5>Sarah W.</h5>
                        <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="call-to-action text-white text-center">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto">
                    <h2 class="mb-4">Ready to get started? Sign up now!</h2>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                    <form>
                        <div class="form-row">
                            <div class="col-12 col-md-9 mb-2 mb-md-0">
                                <input type="email" class="form-control form-control-lg" placeholder="Enter your email...">
                            </div>
                            <div class="col-12 col-md-3">
                                <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
                    <ul class="list-inline mb-2">
                        <li class="list-inline-item">
                            <a href="#">About</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">Contact</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">Terms of Use</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">Privacy Policy</a>
                        </li>
                    </ul>
                    <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2020. All Rights Reserved.</p>
                </div>
                <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mr-3">
                            <a href="#">
                                <i class="fab fa-facebook fa-2x fa-fw"></i>
                            </a>
                        </li>
                        <li class="list-inline-item mr-3">
                            <a href="#">
                                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="fab fa-instagram fa-2x fa-fw"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>


    <script>
        $(function() {
            $(".fa-caret-right").click(function() {
                if ($(".side-info-menu").hasClass("sim-open")) {
                    $(".side-info-menu").removeClass("sim-open");
                    $(".side-info-menu").addClass("sim-close");
                } else {
                    $(".side-info-menu").removeClass("sim-close");
                    $(".side-info-menu").addClass("sim-open");
                }

            });




            var didScroll;//스크롤이 작동했는지 여부
            var lastScrollTop = 0;
            var delta = 5;//동작 구현이 시작되는 위치
            var navHeight = $(".pic-header").outerHeight();//네비 높이
            console.log(navHeight);

            $(window).scroll(function(event) {//스크롤이 작동하면 이벤트 시작
                didScroll = true;//스크롤 작동 true
                console.log("scrolled");
            });
            setInterval(function() {//반복해서 검사함
                console.log("didscroll"+didScroll);
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;
                    
                }
            }, 250);


            function hasScrolled() {
                var st = $(this).scrollTop();//현재 스크롤 위치
                console.log("st"+st);
                console.log("last="+lastScrollTop);
//                if (Math.abs(lastScrollTop - st) <= delta) {//동작 구현 시작되는 위치보다 스크롤 위치가 작을 때
//                    console.log("!");
//                   return;
//                }
                if (lastScrollTop < st && st > navHeight) {
//                    $(".pic-header").css("display", "none");
                    $(".normal-header").css("display", "block");
                } else {
                    if (st < navHeight) {
//                        $(".pic-header").css("display", "block");
                        $(".normal-header").css("display", "none");
                    }else{
                       return;
                    }
                }
//                lastScrollTop = st;
                
            }
            
            
            
        });

    </script>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>




</body>


</html>

