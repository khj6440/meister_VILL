<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <title>Join Member Input</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />


    <div class="content-box-yr">
        <div class="join-content-wrapper">
            <div class="join-logo">
                <img src="/resources/yr/imgs/meistervill_01.png" width="45%">
            </div>
            <div class="jcb-step">
                <i class="fa fa-circle" aria-hidden="true"></i>
                <i class="fa fa-circle" aria-hidden="true"></i>
            </div>
            <div class="join-content-box">


                <form action="/meister/member/joinInput.do" method="post">
                    <form action="#" method="post">
                        <div class="jcb-title">
                            이메일
                        </div>
                        <input type="text" class="input-yr-normal jcb-mail" name="memberEmail" placeholder="이메일을 입력해주세요.">
                        <button class="btn btn-yr-normal-gray btn-mail-confirm">이메일 인증</button>
                    </form>
                    <form action="#" method="post">
                        <input type="text" class="input-yr-normal jcb-mail" name="confirm-code" placeholder="인증번호를 입력해주세요.">
                        <button class="btn btn-yr-normal-gray btn-mail-confirm">인증하기</button>
                        <div class="time-limit"></div>
                    </form>
                    <div class="jcb-mail-msg"></div>
                    <div class="jcb-title">
                        비밀번호
                    </div>
                    <input type="password" name="memberPw" class="input-yr-normal jcb-pw-input" placeholder="비밀번호를 입력해주세요.">
                    <input type="password" class="input-yr-normal cursor-not jcb-pw-input" placeholder="한 번 더 입력해주세요." disabled>
                    <div class="jcb-pw-msg"></div>
                    <button type="submit" class="btn btn-yr-normal btn-join-next btn-join-finish">회원가입 완료</button>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    


    <style>
        .content-box-yr {
            width: 30%;
            height: auto;
            margin: 0 auto;
        }

        .join-content-wrapper {
            text-align: center;
            height: 670px;
            padding: 10%;
            padding-left: 15%;
            padding-right: 15%;
            margin-top: 10%;
            margin-bottom: 10%;

            border: 1px solid #dbdbdb;
            border-radius: 10px;
            overflow: hidden;
        }

        .jcb-step {
            margin-top: 3%;
            margin-bottom: 3%;
        }

        .jcb-step>i {
            margin-left: 1%;
            margin-right: 1%
        }

        .jcb-step>i:last-child {
            color: #ffbc42;
        }

        .jcb-title {
            font-size: 17px;
            font-weight: 900;
            color: #4d4d4d;
            margin-top: 3%;
            margin-bottom: 3%;
            text-align: justify;
        }

        .join-content-box {
            width: 100%;
        }

        .join-content-box input {
            width: 100%;
            height: 45px;
            margin-top: 1%;
            margin-bottom: 1%;
            font-size: 13px;
        }

        .jcb-mail {
            padding-right: 27%;
            position: relative;
            z-index: 5;
        }

        .btn-mail-confirm {
            font-size: 13px;
            width: 100px;
            height: 35px;
            position: absolute;
            z-index: 10;

            margin-left: -105px;
            margin-top: 9px;
        }

        .btn-join-finish {
            width: 100%;
            height: 45px;
        }

        .jcb-mail-msg,
        .jcb-pw-msg {
            width: 100%;
            height: 50px;
            color: #D00C0A;
            font-weight: 700;
            font-size: 13px;

        }

        .invalid-input {
            border: 2px solid #D00C0A;
            box-shadow: 0px 0px 3px #D00C0A;
            outline: 0 none;
        }

        .cursor-not {
            cursor: not-allowed;

        }

    </style>
    
    <script>
        $(function() {
            var emailConfirm = 0;
            var pwConfirm = 0;
            var pwSame = 0;

            //비밀번호
            $(".jcb-pw-input").eq(0).keyup(function() {
                var pw = $(".jcb-pw-input").eq(0).val();
                if (pw != "") {
                    var regExp = /^(?=.*[a-z])(?=.*[0-9])(?=.*[$@!%*#?])[a-z0-9$@!%*#?].{8,20}$/;
                    if (!regExp.test(pw)) {
                        $(".jcb-pw-input").eq(0).blur(function(){
                            $(this).addClass("invalid-input");
                        });
                        $(".jcb-pw-input").eq(1).addClass("cursor-not");
                        $(".jcb-pw-input").eq(1).removeClass("invalid-input");
                        $(".jcb-pw-input").eq(1).attr("disabled", "true");
                        $(".jcb-pw-input").eq(1).val("");
                        $(".jcb-pw-msg").html("영문 소문자, 숫자, 특수문자 포함 8~20자리")
                        pwConfirm = 0;
                        console.log(pwConfirm);
                    } else {
                        $(this).removeClass("invalid-input");
                        $(".jcb-pw-msg").html("");
                        $(".jcb-pw-input").eq(1).removeClass("cursor-not");
                        $(".jcb-pw-input").eq(1).removeAttr("disabled");
                        pwConfirm = 1;
                        console.log(pwConfirm);
                    }
                }
            });
            $(".jcb-pw-input").eq(1).keyup(function() {
                if (pwConfirm == 1) {
                    var pw = $(".jcb-pw-input").eq(0).val();
                    var pw2 = $(".jcb-pw-input").eq(1).val();
                    if (pw == pw2) {
                        $(this).removeClass("invalid-input");
                        $(".jcb-pw-msg").html("");
                        pwSameame = 1;
                    } else {
                        $(this).addClass("invalid-input");
                        $(".jcb-pw-msg").html("비밀번호가 같지 않습니다.");
                        pwSame = 0;
                    }
                }
            });
            $(".jcb-mail").eq(0).keyup(function(){
                if ($(".jcb-mail").eq(0).val() != "") {
                    var regExp = /^[a-zA-Z0-9\_\-\.]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
                    var memEmail = $(".jcb-mail").eq(0).val();
                    if (!regExp.test(memEmail)) {
                        $("input[name=memberEmail]").css("border", "1px solid #d00c0a");
                        $("input[name=memberEmail]").css("box-shadow", "0px 0px 3px #d00c0a");
                        $(".jcb-mail-msg").html("유효하지 않은 입력입니다.");
                    } else {
                        $("input[name=memberEmail]").css("border", "1px solid #eeeeee");
                        $("input[name=memberEmail]").css("box-shadow", "none");
                        $(".jcb-mail-msg").html("");
                       
                    }
                }else{
                    $(".jcb-mail-msg").html("");
                }
            });
            
        });

    </script>
</body>

</html>
