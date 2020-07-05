<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">

    <title>MEISTER VILL</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/yr/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- Custom fonts for this template -->
    <link href="/resources/yr/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/yr/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/yr/css/landing-page.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Viga&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <!--내css-->

    <link rel="stylesheet" href="/resources/yr/css/header_css.css" type="text/css">
    <link rel="stylesheet" href="/resources/yr/css/login_modal_css.css" type="text/css">
    <link rel="stylesheet" href="/resources/yr/css/main_header_css.css" type="text/css">
    <link rel="stylesheet" href="/resources/yr/css/login_header_css.css" type="text/css">

</head>

<body>


    <!--헤더-->

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
                    <a href="/">
                        <img src="/resources/yr/imgs/meistervill_01.png">
                    </a>
                </div>
                <div class="hd hd-search">
                    <div class="hdsc">
                        <span class="hdsc-icon"><a href="#"><i class="fa fa-search"></i></a></span>
                        <input type="text" name="keyword" class="form-control form-control-sm" placeholder="Search..." />
                    </div>
                </div>


                <c:if test="${empty sessionScope.member }">
                    <div class="hd hd-member">
                        <a class="member-top-menu" href="#">마이스터 등록</a>
                        <a class="member-top-menu" href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                        <a class="btn btn-insert" href="/meister/member/join.do">무료 회원가입</a>
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.member }">


                    <div class="member-top-menu hd-hver1 normal-hd-list">

                        <ul class="hd-profile-boundary1">
                            <li class="hd-profile-img1">
                                <a href="#">
                                    <img src="/resources/yr/imgs/profile_img2.png" width="100%">
                                </a>

                                <ul class="hd-profile-menu1">
                                    <li id="none" name="hd-menu1"><a href="#">프로필 관리</a></li>
                                    <li name="hd-menu1"><a href="#">마이스터 등록</a></li>
                                    <li name="hd-menu1"><a href="#">찜한 서비스</a></li>
                                    <li name="hd-menu1"><a href="#">쿠폰</a></li>
                                    <li name="hd-menu1"><a href="/meister/member/logout.do">로그아웃</a></li>

                                </ul>
                            </li>
                        </ul>

                    </div>
                    <div class="member-top-line1 normal-mtl">
                        <a class="member-top-menu" href="#">마이페이지</a>
                        <a class="member-top-menu" href="#">메세지</a>
                    </div>


                </c:if>




            </div>
            <div class="hd-category">
                <ul>
                    <li><a href="/meister/sell/sellList.do?reqPage=1">IT/Programming</a></li>
                    <li><a href="#">Design</a></li>
                </ul>
            </div>
        </div>
    </div>



<<<<<<< HEAD
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
                            <a class="member-top-menu" href="/meister/admin/loginFrm.do">로그인</a>
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
    
    
    
    
    
=======
>>>>>>> e68f3dca71154b8511ce468bf983a27010a113ec
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
<<<<<<< HEAD
            <div class="member-top-line">
                <a class="member-top-menu" href="#">마이스터 등록</a>
                <a class="member-top-menu" href="/meister/admin/loginFrm.do">로그인</a>
                <a class="btn btn-insert" href="#">무료 회원가입</a>
            </div>
            <!--    <div class="overlay"></div>-->
=======
            <c:if test="${empty sessionScope.member }">
                <div class="member-top-line">
                    <a class="member-top-menu" href="#">마이스터 등록</a>
                    <a class="member-top-menu" href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                    <a class="btn btn-insert" href="/meister/member/join.do">무료 회원가입</a>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.member }">
                <div class="member-top-menu hd-hver1" href="#">

                    <ul class="hd-profile-boundary1">
                        <li class="hd-profile-img1">
                            <c:if test="${sessionScope.member.memberImg eq null }">
                                <a href="#">
                                    <img src="/resources/yr/imgs/profile_img2.png" width="100%">
                                </a>
                            </c:if>
                            <c:if test="${sesssionScope.member.memberImg ne null }">
                                <a href="#">
                                    <img src="/upload/member/${sessionScope.member.memberImg })" width="100%">
                                </a>
                            </c:if>

                            <ul class="hd-profile-menu1">
                                <li id="none" name="hd-menu1"><a href="#">프로필 관리</a></li>
                                <li name="hd-menu1"><a href="#">마이스터 등록</a></li>
                                <li name="hd-menu1"><a href="#">찜한 서비스</a></li>
                                <li name="hd-menu1"><a href="#">쿠폰</a></li>
                                <li name="hd-menu1"><a href="/meister/member/logout.do">로그아웃</a></li>

                            </ul>
                        </li>
                    </ul>

                </div>
                <div class="member-top-line1">
                    <a class="member-top-menu" href="#">마이페이지</a>
                    <a class="member-top-menu" href="#">메세지</a>
                </div>
>>>>>>> e68f3dca71154b8511ce468bf983a27010a113ec

            </c:if>


            <!--    <div class="overlay"></div>-->
            <div class="container">

                <div class="row">

                    <div class="col-xl-9 mx-auto header-logo-p m-img">
                        <a href="/"><img class="logo-p" src="/resources/yr/img/meistervill_01.png" width="63%"></a>
                    </div>
                    <div class="col-md-10 col-lg-8 col-xl-7 mx-auto m-img2">
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
                        <a href="/meister/sell/sellList.do?reqPage=1">
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
    <div>


        <a href="/meister/member/changePw.do">비밀번호 변경</a><br>
        <a href="/meister/member/pwChangeSuccessModalTest.do">비밀번호변경완료 모달테스트</a><br>
        <a href="/meister/member/joinSuccessModalTest.do">회원가입완료 모달테스트</a><br>
        <a href="/meister/member/loginModalTest.do">로그인 모달테스트</a><br>
        <a href="/meister/member/forgetIdPwTest.do">아이디.비번찾기테스트</a><br>
        <a href="/meister/member/joinEnd.do">회원가입 정보입력</a><br>
        <a href="/meister/member/coupon.do">쿠폰</a><br>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>

        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>

        <p>!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- The Modal -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal Header -->

                <div class="modal-header">
                    <img src="resources/yr/imgs/meistervill_01.png" width="20%">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>


                <!-- Modal body -->
                <div class="modal-body">

                    <div class="login-pic-div">
                        <div class="login-input-box">
                            <div class="login-title-dv">
                                LOGIN
                            </div>
                            <div class="login-input-dv">
                                <form action="/meister/member/loginMember.do" id="loginFrm" method="post">
                                    <input type="text" name="memberEmail" class="login-input" placeholder="이메일을 입력하세요"><br>
                                    <input type="password" name="memberPw" class="login-input" placeholder="비밀번호를 입력하세요"><br>
                                    <div class="login-msg-box"></div>
                                    <input type="button" class="btn btn-insert btn-in-modal" value="로그인">
                                    <div class="login-chk-dv">
                                        <div>

                                            <input type="checkbox" name="loginMaintain" value="true" id="login-maintain">
                                            <span>
                                                <label class="lm-la" for="login-maintain">
                                                    <img src="/resources/yr/imgs/chkbox.png" id="checked-yellow" width="20px" height="20px">
                                                    <img src="/resources/yr/imgs/chkbox_none2.png" id="checked-none" width="20px" height="20px">
                                                    로그인 유지</label>
                                            </span>
                                        </div>
                                        <div>
                                            <a href="/meister/member/forgetIdPw.do">아이디·비밀번호 찾기</a></div>
                                    </div>

                                </form>
                            </div>


                            <div class="login-line"></div>
                            <div class="login-msg">
                                <h6>지금 회원가입시</h6>
                                <h6>1만원 할인 쿠폰 지급!</h6>



                                <a href="#" class="btn btn-insert btn-log-ins">회원가입</a>
                               

                            </div>
                        </div>

                        <div class="login-input-div">

                        </div>
                        <img src="/resources/yr/imgs/background-balance-business-commerce-583846.jpg" width="100%">

                    </div>

                </div>
            </div>
        </div>
    </div>



    <script>
        $(function() {
            $(".btn-in-modal").click(function() {

                var memberEmail = $("input[name=memberEmail]").val();
                var memberPw = $("input[name=memberPw]").val();
                var loginMaintain = $("input[type=checkbox]").val();
                if (memberEmail == "" || memberPw == "") {
                    $(".login-msg-box").html("이메일과 패스워드를 입력해주세요.");
                } else {
                    $.ajax({
                        url: "/meister/member/checkLogin.do",
                        data: {
                            memberEmail: memberEmail,
                            memberPw: memberPw,
                            loginMaintain: loginMaintain
                        },
                        type: "post",
                        success: function(data) {
                            console.log("success");
                            console.log("성공:"+data.memberEmail);
                            var ajaxEmail = data.memberEmail;
                            var ajaxPw = data.memberPw;

                            if (data == null) {
                                $(".login-msg-box").html("해당하는 계정이 없습니다.");
                            } else {
                                if (memberPw != ajaxPw) {
                                    $(".login-msg-box").html("패스워드가 맞지 않습니다.");
                                } else {

                                    $("#loginFrm").submit();
                                }
                            }
                        },
                        error: function() {
                            console.log("ajax통신 실패");
                        }
                    });
                }

            });

            $("input[type=text]").focusin(function() {
                $(this).css("box-shadow", "0px 0px 3px #FFBC42");
                $(this).css("border-color", "#FFBC42");
            });
            $("input[type=text]").blur(function() {
                $(this).css("box-shadow", "none");
                $(this).css("border-color", "#ced4da");
            });

            $("input[type=password]").focusin(function() {
                $(this).css("box-shadow", "0px 0px 3px #FFBC42");
                $(this).css("border-color", "#FFBC42");
            });
            $("input[type=password]").blur(function() {
                $(this).css("box-shadow", "none");
                $(this).css("border-color", "#ced4da");
            });





            $(".fa-caret-right").click(function() {
                if ($(".side-info-menu").hasClass("sim-open")) {
                    $(".side-info-menu").removeClass("sim-open");
                    $(".side-info-menu").addClass("sim-close");
                } else {
                    $(".side-info-menu").removeClass("sim-close");
                    $(".side-info-menu").addClass("sim-open");
                }

            });




            var didScroll; //스크롤이 작동했는지 여부
            var lastScrollTop = 0;
            var delta = 5; //동작 구현이 시작되는 위치
            var navHeight = $(".pic-header").outerHeight(); //네비 높이
            console.log(navHeight);

            $(window).scroll(function(event) { //스크롤이 작동하면 이벤트 시작
                didScroll = true; //스크롤 작동 true
                console.log("scrolled");
            });
            setInterval(function() { //반복해서 검사함
                console.log("didscroll" + didScroll);
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;

                }
            }, 250);


            function hasScrolled() {
                var st = $(this).scrollTop(); //현재 스크롤 위치
                console.log("st" + st);
                console.log("last=" + lastScrollTop);
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
                    } else {
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
