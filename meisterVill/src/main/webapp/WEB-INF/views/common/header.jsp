<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Bootstrap core CSS -->
    <link type="text/css" href="/resources/yr/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link type="text/css" href="/resources/yr/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="/resources/yr/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link type="text/css" href="/resources/yr/css/landing-page.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/yr/css/header_css.css">
    

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>



<body>
    
    <header>
<!-- Bootstrap core JavaScript -->
   
    <script src="/resources/yr/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script>
        $(function() {
            $(".fa-caret-right").click(function() {
                if ($(".side-info-menu").hasClass("sim-open")) {
                    $(".side-info-menu").removeClass("sim-open");
                    $(".side-info-menu").addClass("sim-close");
                } else if ($(".side-info-menu").hasClass("sim-close")) {
                    $(".side-info-menu").removeClass("sim-close");
                    $(".side-info-menu").addClass("sim-open");
                }
            });



            var didScroll;
            var lastScrollTop = 0;
            var delta = 5;
            var navHeight = $(".normal-header").outerHeight();

            $(window).scroll(function(event) {
                didScroll = true;
            });
            setInterval(function() {
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;
                }
            }, 250);


            function hasScrolled() {
                var st = $(this).scrollTop();
                if (Math.abs(lastScrollTop - st) <= delta) {
                    return;
                }
                if (st > lastScrollTop && st > navHeight) {
                    $(".normal-header").removeClass("nav-down").addClass("nav-up");
                } else {
                    if (st + $(window).height() < $(document).height()) {
                        $(".normal-header").removeClass("nav-up").addClass("nav-down");
                    }
                }
                lastScrollTop = st;
            }



        });

    </script>
    <style>
        .hd-member>.btn-insert {
            margin-left: 20px;
            background-color: #FFBC42;
            border: white;
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 15px;
            font-weight: 700;
            color: white;
        }
        .hd-member>.btn-insert:hover{
            background-color: whitesmoke;
            box-shadow: 0px 0px 7px #FFBC42;
            color: #4D4D4D;
        }
        
        
        .hd-member>.btn-insert:active{
            background-color: #FFBC42;
            color: #4d4d4d;
            border-color: #FFBC42;
            box-shadow: 0px 0px 2px #FFBC42;
        }
        
        
        
        
        .hd-profile-boundary{
        margin-left: 9%;
        float: right;
        margin-top: -4%;
        height: 60px;
    }
    .hd-profile-img {
        width: 50px;
        height: 50px;

        border-radius: 50%;
        overflow: hidden;
        position: relative;
    }

    .hd-profile-menu {
        position: absolute;
        margin-top: 1.5%;
        margin-left: 20.5%;
        margin-right: 0px;
        width: 7%;
        display: none;
    }

    .hd-profile-menu>ul {
        list-style: none;
        padding-left: 0px;
        width: 150%;
    }

    .hd-profile-menu>ul>li {
        text-align: center;
        height: 45px;
    }

    .hd-profile-menu>ul>li>a {
        color: #4d4d4d;
        font-size: 13px;
        font-weight: 700;
        font-family: 'Nanum Gothic Coding', monospace;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 45px;
        background-color: #eeeeee;
        opacity: 0.7;
        box-shadow: 0px 0px 2px #4d4d4d;
    }

    .hd-profile-menu>ul>li[name="hd-menu"]:first-child>a {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .hd-profile-menu>ul>li[name="hd-menu"]:last-child>a {
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }


    .hd-profile-menu>ul>li>a:hover {
        text-decoration: none;
        color: #FFBC42;
    }

    .hd-hver:hover>.hd-profile-menu {
        display: block;
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
                <c:if test="${empty sessionScope }">
                <div class="hd hd-member">
                    <a class="member-top-menu" href="#">마이스터 등록</a>
                    <a class="member-top-menu" href="#">로그인</a>
                    <a class="btn btn-insert" href="#">무료 회원가입</a>
                </div>
                </c:if>
                
                <c:if test="${not empty sessionScope }">
                	<div class="hd hd-member">
                    <a class="member-top-menu" href="#">마이페이지</a>
                    <a class="member-top-menu" href="#">메세지</a>
                    <span class="member-top-menu hd-hver" href="#">
                        <div class="hd-profile-boundary">
                        <c:if test="${sessionScope.member.memberImg == null}">
                            <div class="hd-profile-img">
                                <a href="#"><img src="/resources/yr/imgs/profile_img2.png" width="100%"></a>
                            </div>
                            </c:if>
                            <c:if test="${sessionScope.member.memberImg != null}">
                            <div class="hd-profile-img">
                                <a href="#"><img src="/upload/member/${sessionScope.member.memberImg }" width="100%"></a>
                            </div>
                            </c:if>
                        </div>
                        <div class="hd-profile-menu">
                            <ul>
                                <li id="none" name="hd-menu"><a href="#">프로필 관리</a></li>
                                <li name="hd-menu"><a href="#">마이스터 등록</a></li>
                                <li name="hd-menu"><a href="#">찜한 서비스</a></li>
                                <li name="hd-menu"><a href="#">쿠폰</a></li>
                                <li name="hd-menu"><a href="#">로그아웃</a></li>

                            </ul>
                        </div>
                    </span>

                </div>
                </c:if>
            </div>
            <div class="hd-category">
                <ul>
                    <li><a href="#">IT/Programming</a></li>
                    <li><a href="#">Design</a></li>
                </ul>
            </div>
        </div>
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
            <a href="#"><i class="fa fa-4x fa-caret-right" aria-hidden="true"></i></a>
        </div>

    </div>


</header>



</body>

</html>
