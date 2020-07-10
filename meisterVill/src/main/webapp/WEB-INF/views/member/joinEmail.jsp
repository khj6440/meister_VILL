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
                이메일 인증 번호
            </div>
            <div class="number">
                123456
            </div>
            <div class="msg">
                정확하게 입력 해 주세요.
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
            margin:100px auto;
            text-align: center;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .title{
            margin-top: 70px;
            color: #4d4d4d;
            font-size: 24px;
            font-weight: 700px;
            
        }
        .number{
            margin-top: 30px;
            font-size: 30px;
        }
        .msg{
            margin-top: 20px;
        }

    </style>
</body>

</html>
