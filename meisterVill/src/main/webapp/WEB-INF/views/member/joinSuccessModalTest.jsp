<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Join Result</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <div class="content-box-yr">
        <div class="container">
            <h2>Extra Large Modal</h2>
            <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginResultModal">
                Open modal
            </button>
            <style>
                #loginResultModal {
                    top: 50%;
                    margin-top: -200px;
                }


                .modal-content {
                    border-radius: 15px;
                }

                .jrm-body {
                    /*background-image: url(/resources/yr/imgs/bg-5gray.png);
            background-position: bottom center;
            background-repeat: no-repeat;
            background-size: 100%;*/
                    background-color: white;
                    padding: 10%;
                    border-radius: 15px;
                    height: 400px;
                    position: relative;
                }

                .modal-btn-top {
                    margin-top: -7%;
                    margin-left: 83%;
                    float: right;
                    position: absolute;

                }

                .pcn-result {
                    text-align: center;
                    margin-bottom: 1%;
                    font-size: 26px;
                    font-weight: 900;
                    font-family: 'Noto Sans KR', sans-serif;
                    color: #4d4d4d;
                }

                .pcn-result-msg {
                    text-align: center;
                    margin-bottom: 10%;
                    font-size: 16px;
                    font-weight: 900;
                    font-family: 'Noto Sans KR', sans-serif;
                    color: #c5c6b6;
                }

                .pcn-result-msg>p:first-child {
                    margin-bottom: 0;
                }

                .pcn-result-logo {
                    text-align: center;
                    margin-bottom: 10%;
                }

                .pcn-result-btn {
                    text-align: center;
                    width: 100%;
                }

                .pcn-btn {
                    width: 35%;
                    height: 45px;
                    margin: 1%;
                    line-height: 35px;
                    font-size: 15px;
                }

            </style>

            <!-- The Modal -->
            <div class="modal fade" id="loginResultModal">
                <div class="modal-dialog modal-m">
                    <div class="modal-content jrm-modal-content">

                        <!-- Modal body -->
                        <div class="modal-body jrm-body">
                            <div class="jrm-content-box">
                                <div class="modal-btn-top">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="pcn-result-logo">
                                    <img src="/resources/yr/imgs/meistervill_01.png" width="40%">
                                </div>

                                <div class="pcn-result">
                                    <p>회원가입 완료!</p>
                                </div>
                                <div class="pcn-result-msg">
                                    <p>1만원 웰컴 쿠폰이 발급되었습니다.</p>
                                    <p>로그인 후 마이페이지에서 확인하세요!</p>
                                </div>

                                <div class="pcn-result-btn">
                                    <a href="/" class="btn btn-yr-normal pcn-btn">메인화면 이동</a>
                                    <a href="/" class="btn btn-yr-normal pcn-btn" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">로그인</a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
