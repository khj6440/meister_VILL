<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>couponListModal</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <link type="text/css" href="/resources/yr/css/couponListModal_css.css" rel="stylesheet">
</head>

<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="content-box-yr">
        <div class="container">
            <h2>Large Modal</h2>
            <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#couponListModal">
                Open modal
            </button>

            <!-- The Modal -->
            <div class="modal fade" id="couponListModal">
                <div class="modal-dialog modal-m">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">쿠폰 사용</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="modal-wrapper">
                                <div class="content-box">
                                    <div class="page-title">적용 가능한 쿠폰</div>
                                    <div class="coupon-list">
                                        <div class="one-coupon">

                                            <label>
                                                <input type="radio" value="none" name="one-coupon" id="none">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                사용 안함</label>
                                        </div>
                                        <div class="one-coupon">
                                            <label>
                                                <input type="radio" value="none" name="one-coupon">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                쿠폰이름</label>
                                            <div class="coupon-content">1000원이상 구매시 어쩌구저쩌구</div>
                                            <div class="coupon-period">20일 남음</div>
                                        </div>
                                        <div class="one-coupon">
                                            <label>
                                                <input type="radio" value="none" name="one-coupon">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                쿠폰이름</label>
                                            <div class="coupon-content">1000원이상 구매시 어쩌구저쩌구</div>
                                            <div class="coupon-period">20일 남음</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-bottom">
                                    <div class="discount-div">
                                        <div>총 할인 금액</div>
                                        <div>0원</div>
                                    </div>
                                    <div class="discount-btn">
                                        <button type="button" class="btn btn-yr-normal" id="discBtn">적용</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    
    
    <script>
        $(function(){
            var index = $("input[type=radio]").last().index();
            $("#none").change(function(){
                if($("#none:checked")){
                    for(var i=1; i<=index;i++){
                        $("input[type=checkbox]").eq(i).prop("type", "radio");
                    }
                }else{
                    for(var i=1; i<=index;i++){
                        $("input[type=checkbox]").eq(i).prop("type", "radio");
                    }
                }
            });
        });
    </script>


</body>

</html>
