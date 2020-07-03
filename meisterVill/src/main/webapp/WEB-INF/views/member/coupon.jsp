<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="content-box-yr">
        <div class="coupon-wrapper">
            <div class="coupon-pg-title">
                쿠폰
            </div>

            <div class="coupon-pg-content-box">
                <div class="coupon-ad">

                </div>
                <div class="coupon-content">
                    <div class="coupon-box">
                        <div class="coupon-title-box">
                            <div class="coupon-img"></div>
                            <div class="coupon-titles"></div>
                            <div class="coupon-arrow"></div>
                        </div>
                        <div class="coupon-content-box">
                            <div class="coupon-content"></div>
                            <button class="btn btn-yr-normal-gray"></button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <style>
        .content-box-yr {
            width: 70%;
            height: auto;
            padding-bottom: 10%;
            margin-left: 5%;

            border: 1px solid red;
        }

        .coupon-wrapper {
            width: 100%;
            height: auto;

            border: 1px solid blue;
        }

        .coupon-pg-title {
            margin-left: 10%;
            font-size: 24px;
            font-weight: 900;
            color: #4d4d4d;
            text-shadow: 0px 0px 1px #4d4d4d;
        }

    </style>
</body>

</html>
