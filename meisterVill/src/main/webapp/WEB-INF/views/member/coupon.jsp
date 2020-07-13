<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="/resources/yr/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="content-box-yr">
        <div class="coupon-wrapper">
            <div class="coupon-pg-title">
                쿠폰
            </div>

            <div class="coupon-pg-content-box">

                <div class="coupon-content">

                    <div class="coupon-title-box">
                        <div class="coupon-img">
                            <img src="/resources/yr/imgs/coupon.png" width="100px;">
                        </div>
                        <div class="coupon-titles">
                            <div>쿠폰 제목</div>
                            <div>
                                <div>쿠폰 금액</div>
                                <div>종료일</div>
                            </div>
                        </div>
                        <div class="coupon-arrow">
                            <a href="javascript:void(0)">
                                <i class="fa fa-chevron-down fa-4x" aria-hidden="true"></i>
                                <i class="fa fa-chevron-up fa-4x" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                    <div class="coupon-content-box">
                        <div>쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용</div>
                        <button class="btn btn-yr-normal-gray">쿠폰 받기</button>
                    </div>

                </div>
                <div class="coupon-content">

                    <div class="coupon-title-box">
                        <div class="coupon-img">
                            <img src="/resources/yr/imgs/coupon.png" width="100px;">
                        </div>
                        <div class="coupon-titles">
                            <div>쿠폰 제목</div>
                            <div>
                                <div>쿠폰 금액</div>
                                <div>종료일</div>
                            </div>
                        </div>
                        <div class="coupon-arrow">
                            <a href="javascript:void(0)">
                                <i class="fa fa-chevron-down fa-4x" aria-hidden="true"></i>
                                <i class="fa fa-chevron-up fa-4x" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                    <div class="coupon-content-box">
                        <div>쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용</div>
                        <button class="btn btn-yr-normal-gray">쿠폰 받기</button>
                    </div>

                </div>
                <div class="coupon-content">

                    <div class="coupon-title-box">
                        <div class="coupon-img">
                            <img src="/resources/yr/imgs/coupon.png" width="100px;">
                        </div>
                        <div class="coupon-titles">
                            <div>쿠폰 제목</div>
                            <div>
                                <div>쿠폰 금액</div>
                                <div>종료일</div>
                            </div>
                        </div>
                        <div class="coupon-arrow">
                            <a href="javascript:void(0)">
                                <i class="fa fa-chevron-down fa-4x" aria-hidden="true"></i>
                                <i class="fa fa-chevron-up fa-4x" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                    <div class="coupon-content-box">
                        <div>쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용</div>
                        <button class="btn btn-yr-normal-gray">쿠폰 받기</button>
                    </div>

                </div>
                <div class="coupon-content">

                    <div class="coupon-title-box">
                        <div class="coupon-img">
                            <img src="/resources/yr/imgs/coupon.png" width="100px;">
                        </div>
                        <div class="coupon-titles">
                            <div>쿠폰 제목</div>
                            <div>
                                <div>쿠폰 금액</div>
                                <div>종료일</div>
                            </div>
                        </div>
                        <div class="coupon-arrow">
                            <a href="javascript:void(0)">
                                <i class="fa fa-chevron-down fa-4x" aria-hidden="true"></i>
                                <i class="fa fa-chevron-up fa-4x" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                    <div class="coupon-content-box">
                        <div>쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용쿠폰내용</div>
                        <button class="btn btn-yr-normal-gray">쿠폰 받기</button>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        $(".coupon-arrow").children().click(function() {
            console.log($(this));
            var index = $(".coupon-arrow").last().index();
            console.log("last" + index);
            var index2 = $(this).index();
            var status = $(this).parent().parent().next().css("display");
            console.log(status);
            if (status == "none") {

                $(this).children("i").eq(0).css("display", "none");
                $(this).children("i").eq(1).css("display", "block");
                $(this).parent().parent().next().css("display","block");
                if (index == index2) {
                    $(this).parent().parent().css("border-bottom-left-radius", "0px");
                    $(this).parent().parent().css("border-bottom-right-radius", "0px");
                    $(this).parent().parent().next().css("border-bottom-left-radius", "8px");
                    $(this).parent().parent().next().css("border-bottom-right-radius", "8px");
                }
            } else if(status=="block") {
                
                $(this).children("i").eq(0).css("display", "block");
                $(this).children("i").eq(1).css("display", "none");
                $(this).parent().parent().next().css("display","none");
                if (index == index2) {
                    $(this).parent().parent().css("border-bottom-left-radius", "8px");
                    $(this).parent().parent().css("border-bottom-right-radius", "8px");
                    $(this).parent().parent().next().css("border-bottom-left-radius", "0px");
                    $(this).parent().parent().next().css("border-bottom-right-radius", "0px");
                }
            }

        });

    </script>

    <style>
        .content-box-yr {
            width: 100%;
            height: auto;
            padding-bottom: 10%;
            color: #4d4d4d;
        }

        .coupon-wrapper {
            width: 951px;
            height: auto;
            margin: 0 auto;
        }

        .coupon-pg-title {
            margin-top: 50px;
            margin-bottom: 100px;
            font-size: 24px;
            font-weight: 900;
            color: #4d4d4d;
            text-shadow: 0px 0px 1px #4d4d4d;
        }

        .coupon-pg-content-box {
            width: 100%;
        }

        .coupon-content {
            width: 100%;

        }

        .coupon-title-box {
            width: 100%;
            height: auto;
            overflow: hidden;
            padding: 30px;
            border: 1px solid #dbdbdb;
        }

        .coupon-content:first-child>.coupon-title-box {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .coupon-content:last-child>.coupon-title-box {
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
        }

        .coupon-title-box>div {
            float: left;
        }

        .coupon-titles {
            margin-left: 30px;
            width: 650px;
            font-weight: 900;
        }

        .coupon-titles>div:first-child {
            font-size: 20px;
            margin-bottom: 40px;
        }

        .coupon-titles>div:last-child>div {
            float: left;
            margin-right: 30px;
        }

        .coupon-img {
            width: 100px;
        }

        .coupon-content-box {
            clear: left;
            background-color: #dbdbdb;
        }

        .coupon-arrow {
            margin-top: 20px;
        }

        .coupon-content-box {
            width: 100%;
            height: auto;
            overflow: hidden;
            padding: 30px;
            text-align: center;

            display: none;
        }

        .coupon-content-box>div {
            margin-bottom: 20px;
            text-align: justify;
        }

        .coupon-content-box>button {
            width: 450px;
            height: 45px;
            margin: 0 auto;
        }

        .coupon-arrow i {
            color: #4d4d4d;
        }

        .coupon-arrow>a:hover {
            text-decoration: none;
        }

        .coupon-arrow i:last-child {
            display: none;
        }

    </style>
</body>

</html>
