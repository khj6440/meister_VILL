<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login Modal</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Viga&display=swap" rel="stylesheet">

    <!--yr css-->
    <link rel="stylesheet" href="/resources/yr/css/header_css.css" type="text/css">
    <link rel="stylesheet" href="/resources/yr/css/login_modal_css.css" type="text/css">
</head>

<body>

    <!-- The Modal -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal Header -->

                <div class="modal-header">
                    <img src="/resources/yr/imgs/meistervill_01.png" width="20%">
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
                                <form id="loginFrm" action="/meister/member/loginMember.do" method="post">
                                    <input type="text" name="memberEmail" class="login-input input-yr-normal" placeholder="이메일을 입력하세요"><br>
                                    <input type="password" name="memberPw" class="login-input input-yr-normal" placeholder="비밀번호를 입력하세요"><br>
                                    <div class="login-msg-box">msg</div>
                                    <input type="button" class="btn btn-insert btn-in-modal" value="로그인">
                                    <div class="login-chk-dv">
                                        <div>

                                            <input type="checkbox" name="loginMaintain" value="loginMaintain" id="login-maintain">
                                            <span>
                                                <label class="lm-la" for="login-maintain">
                                                    <img src="/resources/yr/imgs/chkbox.png" id="checked-yellow" width="20px" height="20px">
                                                    <img src="/resources/yr/imgs/chkbox_none2.png" id="checked-none" width="20px" height="20px">
                                                    로그인 유지</label>
                                            </span>
                                        </div>

                                        <div>
                                            <a href="/meister/member/forgetIdPw.do">아이디·비밀번호 찾기</a>
                                        </div>
                                    </div>

                                </form>
                            </div>


                            <div class="login-line"></div>
                            <div class="login-msg">
                                <h4>지금 회원가입시</h4>
                                <h4>1만원 할인 쿠폰 지급!</h4>

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
    <style>
        .input-yr-normal {
            border: 2px solid #eeeeee;
            box-shadow: 0px 0px 2px #eee;
            outline: 0 none;
            border-radius: 5px;
            padding-left: 3%;
            padding-right: 3%;
        }

        .input-yr-normal:focus {
            border: 2px solid #ffbc42;
            box-shadow: 0px 0px 3px #ffbc42;
        }

        #loginFrm {
            width: 100%;
            text-align: center;
        }

        .login-msg-box {
            width: 100%;
            height: 50px;
            text-align: center;
            color: #D00C0A;
            line-height: 50px;
            font-size: 15px;
        }

        .login-msg>h4 {
            font-weight: 700;
        }

        .login-chk-dv>div:first-child {
            float: left;
            line-height: 45px;
            margin-left: 20px;
        }

        .login-chk-dv>div:last-child {
            float: right;
            line-height: 45px;
            margin-right: 20px;
        }

    </style>

    <script type="text/javascript">
        $(function() {
            $(".btn-in-modal").click(function() {

                var memberEmail = $("input[name=memberEmail]").val();
                var memberPw = $("input[name=memberPw]").val();
                var loginMaintain = $("input[type=checkbox]").val();
                if (memberEmail == "" || memberPw == "") {
                    $(".login-msg-box").html("이메일과 패스워드를 입력해주세요.")
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
        });

    </script>


</body>

</html>
