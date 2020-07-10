<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Pw Change Success</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

    <!--yr css-->

</head>

<body>
    <jsp:include page="/WEB-INF/views/member/loginModal.jsp"></jsp:include>
    <div class="container">
        <h2>Large Modal</h2>
        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#submitModal">Open Large Modal</button>



        <!-- Modal -->
        <div class="modal fade" id="submitModal" role="dialog">
            <div class="modal-dialog modal-m">
                <div class="modal-content">
                    <div class="modal-body pcsm-body">
                        <div class="modal-bg">
                            <div class="modal-btn-top">
                                <button type="button" class="close" data-dismiss="modal" onclick="location.href='/meister/member/goMain.do'">&times;</button>
                            </div>

                            <div class="pcn-result-logo">
                                <img src="/resources/yr/imgs/meistervill_01.png" width="40%">
                            </div>

                            <div class="pcn-result">
                                <p>비밀번호 변경 완료</p>
                            </div>
                            <div class="pcn-result-msg">
                                <p>새로운 비밀번호로 로그인 하세요!</p>
                            </div>

                            <div class="pcn-result-btn">
                                <a href="/" class="btn btn-yr-normal pcn-btn">메인화면 이동</a>
                                <a href="#" class="btn btn-yr-normal pcn-btn" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">로그인</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <style>
        #submitModal {
            top: 50%;
            margin-top: -200px;
        }


        .modal-content {
            border-radius: 15px;
        }

        .pcsm-body {
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
            margin-bottom: 15%;
            font-size: 16px;
            font-weight: 900;
            font-family: 'Noto Sans KR', sans-serif;
            color: #c5c6b6;
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









</body>

</html>
