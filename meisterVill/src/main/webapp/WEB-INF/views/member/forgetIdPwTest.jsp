<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <title>Forget Id and Pw Test</title>


</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <link rel="stylesheet" href="/resources/yr/css/forgetIdPw_css.css" type="text/css">
    <div class="content-box-yr">

        <div class="fg-box">
            <div class="fg-id-box">
                <div class="fib-header">아이디 찾기</div>


                <div class="fib-content ajax-fib">
                    <div class="fib-userName">
                        000님의 아이디는
                    </div>
                    <div class="fib-userEmail">
                        000
                    </div>
                    <div class="fib-resultEnd">
                        입니다.
                    </div>
                    <div class="fib-result-logo">
                        <img src="/resources/yr/imgs/logo.png" width="20%">
                    </div>
                </div>


            </div>
            <div class="fg-pw-box">
                <div class="fpb-header">비밀번호 찾기</div>


                <div class="fpb-content ajax-fpb">
                    <div class="fib-userEmail">
                        000
                    </div>

                    <div class="fpb-resultEnd1">
                        으로 비밀번호 변경 URL이
                    </div>
                    <div class="fpb-resultEnd2">
                        전송되었습니다.
                    </div>
                    <div class="fib-result-logo">
                        <img src="/resources/yr/imgs/logo.png" width="20%">
                    </div>
                </div>
                
                
            </div>
        </div>
    </div>
    <style>
        .ajax-fib>div,
        .ajax-fpb {
            text-align: center;

        }

        .fib-userName,
        .fib-userEmail,
        .fib-resultEnd {
            font-size: 22px;
            font-weight: 900;
            color: #4d4d4d;
            margin-bottom: 5%;
        }

        .fib-userEmail {
            font-size: 17px;
            margin-bottom: 5%;
        }

        .fib-resultEnd {
            font-size: 22px;
            margin-bottom: 10%;
        }

        .fpb-resultEnd1 {
            margin-bottom: 2%;
            font-size: 22px;
            font-weight: 900;
            color: #4d4d4d;
        }

        .fpb-resultEnd2 {
            margin-bottom: 13%;
            font-size: 22px;
            font-weight: 900;
            color: #4d4d4d;
        }

    </style>



    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        var name = 0;
        var phone = 0;
        var email = 0;


        $(function() {
                $(".fginput").focusin(function() {
                    $(this).addClass("focusinput");
                });
                $(".fginput").blur(function() {
                    $(this).removeClass("focusinput");
                });



                //유효성 검사    
                $("input[name=memberName]").blur(function() {
                    var memName = $("input[name=memberName]").val();
                    if (memName != "") {
                        var regExp = /^[가-힣]{1,6}$/;

                        if (!regExp.test(memName)) {
                            $("input[name=memberName]").css("border", "1px solid #d00c0a");
                            $("input[name=memberName]").css("box-shadow", "0px 0px 3px #d00c0a");
                            $(".fib-msg").html("유효하지 않은 입력입니다.");
                            name = 0;
                        } else {
                            $("input[name=memberName]").css("border", "1px solid #eeeeee");
                            $("input[name=memberName]").css("box-shadow", "none");
                            if (phone == 1) {
                                $(".fib-msg").html("");
                            }

                            name = 1;
                        }
                    } else {
                        $(".fib-msg").html("");
                        name = 0;
                    }
                });

                $("input[name=memberPhone]").blur(function() {
                    if ($("input[name=memberPhone]").val() != "") {
                        var regExp = /^[0-9]{11}$/;
                        var memPhone = $("input[name=memberPhone]");
                        if (!regExp.test(memPhone.val())) {
                            $("input[name=memberPhone]").css("border", "1px solid #d00c0a");
                            $("input[name=memberPhone]").css("box-shadow", "0px 0px 3px #d00c0a");
                            $(".fib-msg").html("유효하지 않은 입력입니다.");
                            phone = 0;
                        } else {
                            $("input[name=memberPhone]").css("border", "1px solid #eeeeee");
                            $("input[name=memberPhone]").css("box-shadow", "none");
                            if (name == 1) {
                                $(".fib-msg").html("");
                            }

                            phone = 1;
                        }
                    } else {
                        phone = 0;
                        $(".fib-msg").html("");
                    }
                });
                $(".jcb-mail").blur(function() {
                    if ($(".jcb-mail").val() != "") {
                        var regExp = /^[a-zA-Z0-9\_\-\.]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
                        var memEmail = $(".jcb-mail").eq(0).val();
                        if (!regExp.test(memEmail)) {
                            $("input[name=memberEmail]").css("border", "1px solid #d00c0a");
                            $("input[name=memberEmail]").css("box-shadow", "0px 0px 3px #d00c0a");
                            $(".fpb-msg").html("유효하지 않은 입력입니다.");
                            email = 0;
                        } else {
                            $("input[name=memberEmail]").css("border", "1px solid #eeeeee");
                            $("input[name=memberEmail]").css("box-shadow", "none");
                            $(".fpb-msg").html("");
                            email = 1;
                        }
                    } else {
                        email = 0;
                        $(".fpb-msg").html("");
                    }

                });
                $(".fg-btn-email").click(function() {
                        var memberName = $("input[name=memberName]").val();
                        var memberPhone = $("input[name=memberPhone]").val();
                        var html = "";
                        if (name == 1 && phone == 1) {
                            $.ajax({

                                url: "/meister/member/findEmail.do",
                                data: {
                                    memberName: memberName,
                                    memberPhone: memberPhone
                                },
                                succeess: function(data) {

                                },
                                error: function() {
                                    console.log("ajax통신 실패");
                                }
                            });
                        } else {
                            $(".fib-msg").html("유효하지 않은 입력입니다.");
                        }
                    }
                })


            //        function funcId() {
            //            if (name == 1 && phone == 1) {
            //                return true;
            //            } else {
            //                $(".fib-msg").html("유효하지 않은 입력입니다.");
            //                return false;
            //            }
            //        };
            //
            //        function funcPw() {
            //            if (email == 1) {
            //                return true;
            //            } else {
            //                return false;
            //            }
        }

    </script>

</body>

</html>
