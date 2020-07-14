<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>


</head>

<body>
 <div class="content-box-yr">
        <div class="container">
            

            <!-- Modal -->
        <div class="modal fade" id="orderModal" role="dialog">
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
                                <p>구매 완료</p>
                            </div>
                            <div class="pcn-result-msg">
                                <p>구매해주셔서 감사합니다.</p>
                            </div>

                            <div class="pcn-result-btn">
                                <a href="/" class="btn btn-yr-normal pcn-btn">메인화면 이동</a>
                                <a href="#" class="btn btn-yr-normal pcn-btn" data-dismiss="modal">마이페이지</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>
    </div>

    
    
    
    
    <style>
        
        #modalX{
            margin-right:30px;
            
        }
        .content-box-yr {
            width: 921px;
            height: auto;
            margin: 0 auto;
        }

        .bg-box {
            width: 100%;
            height: 435px;
            padding-top: 20px;
            background-image: url(/resources/yr/imgs/yellowbg.png);
            background-position: top;
            background-repeat: no-repeat;
            background-size: 100%;
            border-radius: 5px;


        }

        .page-title {
            font-size: 24px;
            font-weight: 900;
            text-shadow: 0px 0px 3px white;
            text-align: center;

            font-family: 'Noto Sans KR', sans-serif;
        }

        .content-box {
            width: 60%;
            height: auto;
            
            margin: 20px auto;
            background-color: white;
            opacity: 0.8;
            border-radius: 8px;
            padding: 20px;
            font-size: 14px;

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
            margin: 20px auto;

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
