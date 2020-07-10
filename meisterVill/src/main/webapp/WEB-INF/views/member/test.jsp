<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">


    <!--slick-slider-->
    <link rel="stylesheet" type="text/css" href="/resources/yr/slick/slick.css" />
    // Add the new slick-theme.css if you want the default styling
    <link rel="stylesheet" type="text/css" href="/resources/yr/slick/slick-theme.css" />


</head>

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div class="content-box-yr">
        <div class="main-wrapper">
           
            <div class="slide-wrapper">
                
                <div class="bigbox">

                    <div class="minibox slider item1">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    <div class="minibox slider item2">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    <div class="minibox slider item1">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    <div class="minibox slider item2">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    <div class="minibox slider item1">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    <div class="minibox slider item2">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    <div class="minibox slider item1">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    <div class="minibox slider item2">
                        <div class="slide-img">
                            <img src="/resources/yr/imgs/peopleworking.jpg" width="100%">
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>
    </div>



    <style>
        
        .content-box-yr {
            width: 100%;
            height: auto;

        }

        .main-wrapper {
            width: 1700px;
            margin: 0 auto;

            border: 1px solid blue;
        }

        .slide-wrapper {
            width: 100%;
            text-align: center;
        }

        .bigbox {
            margin: 0 auto;
            height: 220px;
            width: 1500px;
            border: 1px solid green;
        }

        .minibox {
            padding: 10px;
        }

        .item1 {
            width: 200px;
            height: 220px;
            border: 1px solid #dbdbdb;
        }

        .item2 {
            width: 200px;
            height: 220px;
            border: 1px solid #ffbc42;
        }

    </style>


    <script type="text/javascript">
        $(document).ready(function() {
            $('.bigbox').slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });
        });

    </script>

    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="/resources/yr/slick/slick.min.js"></script>
</body>

</html>
