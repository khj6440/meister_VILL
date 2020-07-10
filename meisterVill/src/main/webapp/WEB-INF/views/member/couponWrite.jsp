<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <title>Coupon Write</title>


</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!--데이트피커-->
    <link href="/resources/yr/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- Air datepicker css -->
    <script src="/resources/yr/js/datepicker.js"></script> <!-- Air datepicker js -->
    <script src="/resources/yr/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->




    <div class="content-box-yr">
        <div class="coupon-form">
            <div class="page-title">
                쿠폰 이벤트 작성
            </div>
            <form action="/meister/member/couponMake.do" method="post">
                <table>
                    <tr>
                        <th>쿠폰 이름</th>
                        <td>
                            <input type="text" name="couponName" class="input-yr-normal">
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰 기한</th>
                        <td>
                            <input type="text" name="couponName" class="input-yr-normal">
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰 금액</th>
                        <td>
                            <input type="text" name="couponName" class="input-yr-normal">
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰 이벤트 종료일</th>
                        <td>
                            <input type="text" id="datepicker" name="couponLimitTime" class="input-yr-normal">
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰 내용</th>
                        <td>
                            <input type="text" name="couponName" class="input-yr-normal">
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰 이미지</th>
                        <td>
                            <input type="text" name="couponName" class="input-yr-normal">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <style>
        .content-box-yr {
            width: 951px;
            height: auto;
            margin: 0 auto;
            border: 1px solid red;
        }

        .page-title {
            margin-top: 50px;
            margin-bottom: 100px;
            font-size: 24px;
            font-weight: 900;
            color: #4d4d4d;
            text-shadow: 0px 0px 1px #4d4d4d;

        }
        .coupon-form>form{
            width: 100%;
            border: 1px solid #dbdbdb;
            border-radius: 8px;
            padding: 30px;
        }

    </style>

    <script>
        $("#datepicker").datepicker({
            dateFormat: 'yyyy/mm/dd',
            language: 'ko',
            minDate: new Date()
//            timepicker: true
            //            timeFormat: "hh:ii"
        });

    </script>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
