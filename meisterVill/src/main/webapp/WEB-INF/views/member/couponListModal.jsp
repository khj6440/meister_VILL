<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>couponListModal</title>
    <meta charset="utf-8">


    <link type="text/css" href="/resources/yr/css/couponListModal_css.css?after" rel="stylesheet">
</head>

<body>


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
                                <div class="content-box-m">
                                    <div class="page-title">적용 가능한 쿠폰</div>
                                    <div class="coupon-list">
                                        <div class="one-coupon">

                                            <label>
                                                <input type="checkbox" class="a-coupon" value="0" name="none-coupon" id="none" checked>
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                <span>사용안함</span>
                                            </label>
                                        </div>
                                        <div class="one-coupon coupons">
                                            <label>
                                                <input type="checkbox" class="a-coupon" value="100">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                <span>쿠폰이름1</span>
                                            </label>
                                            <div class="coupon-content">1000원이상 구매시 어쩌구저쩌구</div>
                                            <div class="coupon-period">20일 남음</div>
                                        </div>
                                        <div class="one-coupon coupons">
                                            <label>
                                                <input type="checkbox" class="a-coupon" value="1000">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                <span>쿠폰이름2</span>
                                            </label>
                                            <div class="coupon-content">1000원이상 구매시 어쩌구저쩌구</div>
                                            <div class="coupon-period">20일 남음</div>
                                        </div>
                                        <div class="one-coupon coupons">
                                            <label>
                                                <input type="checkbox" class="a-coupon" value="500">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                <span>쿠폰이름3</span>
                                            </label>
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



    <script>
        $(function() {
            $("#none").change(function() {
                if ($("#none:checked")) {
                    $(".coupons").children("label").children("input").prop("checked", false);
                }
            });
            $(".coupons").children("label").children("input").change(function() {
                $("#none").prop("checked", false);
            });

            $("input[type=checkbox]").change(function() {
                if ($(this).is(":checked")) {
                    $(this).next().next().addClass("chk");
                }else{
                    $(this).next().next().removeClass("chk");
                }
            });


            //쿠폰 금액 합산
            var totalDiscount = 0;
            $(".a-coupon").change(function() {
                console.log("시작");
                var index = $(".a-coupon").index($(this));
                console.log(index);
                if ($(this).is(":checked")) {
                    console.log("dd");
                    //체크
                    if (index == 0) {
                        console.log("0");
                        totalDiscount = 0;
                    } else {
                        console.log("0아님");
                        totalDiscount += Number($(this).val());
                    }
                } else {
                    totalDiscount -= Number($(this).val());
                }
                console.log(totalDiscount);
                $(".discount-div").children().eq(1).html("");
                $(".discount-div").children().eq(1).html(totalDiscount + "원");
            });

            $("#discBtn").click(function() {
                var arrCouponName = $(".chk");
                for(var i=0;i<arrCouponName.length;i++){
                    console.log("**" + arrCouponName.eq(i).html());
                }
                var arrCouponPrice = $(".chk").siblings("input");
                for(var i=0;i<arrCouponPrice.length;i++){
                    console.log("##"+arrCouponPrice.eq(i).val());
                }
                $.ajax({
                	url: "/meister/member/couponApply.do",
                	data: {arrCouponName:arrCouponName, arrCouponPrice:arrCouponPrice, totalDiscount:totalDiscount},
                	type: "post",
                	success: function(data){
                		var html= "";
                		console.log("success");
                		console.log(data.totalDiscount);
                		$("#couponListModal").modal("hide");
                		for(var i=0; i<data.arrCouponName.length;i++){
	                		html +="<tr><td>"+data.arrCouponName[i]+"</td>";
	                        html +="<td>"+data.arrCouponPrice[i]+"</td></tr>";          			
                		}
                		$(".ct2").children("tbody").append(html);
                        $(".coupon-price").children().eq(1).html(data.totalDiscount);
                	},
                	error: function(){
                		console.log("ajax 통신 실패");
                	}
                });
            });
        });

    </script>
    
    


</body>

</html>
