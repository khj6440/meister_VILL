<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <title>Purchase Success</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


    <div class="content-box-yr">
        <div class="bg-box">
            <div class="page-title">구매완료</div>
            <div class="content-box">

                <div class="recipe">
                    <div><b>구매내역</b></div>
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <td>1</td>
                        </tr>
                        <tr>
                            <th>구매회원번호</th>
                            <td>11</td>
                        </tr>
                        <tr>
                            <th>회원이메일</th>
                            <td>11</td>
                        </tr>
                        <tr>
                            <th>상품</th>
                            <td>11</td>
                        </tr>
                        <tr>
                            <th>주문일자</th>
                            <td>11</td>
                        </tr>
                        <tr>
                            <th>구매금액</th>
                            <td>11</td>
                        </tr>

                    </table>
                </div>

            </div>
            <div class="btn-div">
                <button type="button" class="btn btn-yr-normal-gray">메인화면</button>
                <button type="button" class="btn btn-yr-normal-gray">마이페이지</button>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <style>
        .content-box-yr {
            width: 921px;
            height: auto;
            margin: 0 auto;
        }

        .bg-box {
            widows: 100%;
            padding: 50px;
            background-image: url(/resources/yr/imgs/yellowbg.png);
            background-position: top;
            background-repeat: no-repeat;
            background-size: 100%;


        }

        .page-title {
            font-size: 24px;
            font-weight: 900;
            text-shadow: 0px 0px 3px white;
            margin-left: 500px;

            font-family: 'Noto Sans KR', sans-serif;
        }

        .content-box {
            width: 60%;
            height: auto;
            margin-top: 20px;
            margin-left: 300px;
            background-color: white;
            opacity: 0.8;
            border-radius: 8px;
            padding: 30px;
            font-size: 17px;

            font-family: 'Noto Sans KR', sans-serif;

        }

        .recipe {
            width: 100%;
        }

        .recipe>div {
            font-size: 22px;
            margin-bottom: 10px;
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
        }

        .recipe>table {
            width: 100%;
        }

        .recipe>table>tbody>tr>th {
            font-size: 17px;
            width: 50%;
            color: #4d4d4d;
            font-family: 'Noto Sans KR', sans-serif;
            height: 32px;
            line-height: 32px;
            font-weight: 900;
            text-align: right;
            padding-right: 30px;
        }

        .recipe>table>tbody>tr>td {
            font-size: 17px;
            color: #4d4d4d;
            text-align: left;
            width: 50%;
            padding-left: 30px;
        }

        .btn-div {
            text-align: center;
            width: 100%;
            margin-top: 20px;
            margin-left: 150px;

        }

        .btn-div>button {
            width: 150px;
            height: 40px;
            opacity: 1;

        }

        .btn-div>button:first-child {
            margin-right: 30px;
        }

    </style>
</body>

</html>
