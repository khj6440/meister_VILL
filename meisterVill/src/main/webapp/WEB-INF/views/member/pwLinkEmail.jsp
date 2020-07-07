<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
    <title>Insert title here</title>
</head>

<body>
    <div class="wrapper">
        <div>
            <div class="title">
                비밀번호 변경
            </div>
            <div class="btn-change">
                <form action="http://192.168.10.161/meister/member/changePw.do" method="post">
                    <input type="hidden" value="time" name="time">
                    <input type="hidden" value="memberEmail" name="memberEmail">
                    <button type="submit" id="changeBtn">비밀번호 변경하기</button>
                </form>
            </div>
            <div class="msg">
                버튼을 클릭해주세요.
            </div>
        </div>
    </div>

    <style>
        .wrapper {
            width: 600px;
            height: 400px;
            background-image: url(/resources/yr/imgs/bg-5gray.png);
            background-position: bottom;
            background-repeat: no-repeat;
            background-size: 100%;
            padding: 50px;
            margin: 100px auto;
            text-align: center;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .title {
            margin-top: 70px;
            color: #4d4d4d;
            font-size: 24px;
            font-weight: 700px;

        }

        .btn-change {
            margin-top: 30px;
            font-size: 30px;
        }

        .msg {
            margin-top: 20px;
            color: #4d4d4d;
        }

        #changeBtn{
            border-radius: 4px;
            width: 300px;
            height: 45px;
            background-color: #FFBC42;
            border: white;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 17px;
            font-weight: 700;
            outline: 0 none;
            color: white;
        }

        #changeBtn:hover {
            background-color: #ffbc42;
            box-shadow: 0px 0px 7px #FFBC42;
            color: #4D4D4D;
        }

        #changeBtn:active {
            background-color: #4d4d4d;
            color: #ffbc42;
            border-color: #FFBC42;
            box-shadow: 0px 0px 2px #FFBC42;
            outline-color: #ffbc42;
        }

    </style>
</body>

</html>
