<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                                <input type="checkbox" class="a-coupon" value="0" name="none-coupon" id="none1">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                <span>사용안함</span>
                                            </label>
                                        </div>
                                        
                                        <c:forEach items="${coupons }" var="cp">
                                        	<div class="one-coupon coupons">
                                            <label>
                                                <input type="checkbox" class="a-coupon real-coupon" value="${cp.couponMoney }">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                <span value="${cp.couponNo }">${cp.couponName }</span>
                                            </label>                                            
                                            <div class="coupon-content">${cp.couponContent }</div>
                                            <div class="coupon-period">${cp.couponEnd }까지 사용가능</div>
                                        </div>
                                        </c:forEach>
                                        
                                        
                                        
                                        <!-- 반복부분 -->
                                        <!-- <div class="one-coupon coupons">
                                            <label>
                                                <input type="checkbox" class="a-coupon" value="100">
                                                <i class="fa fa-check-circle-o chk-circle" aria-hidden="true"></i>
                                                <span>쿠폰이름1</span>
                                            </label>
                                            <div class="coupon-content">1000원이상 구매시 어쩌구저쩌구</div>
                                            <div class="coupon-period">20일 남음</div>
                                        </div>
                                        
                                        
                                        <!-- 반복부분끝 -->
                                        
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
            $("#none1").prop("checked",true);
        	
        	//체크박스
            $("#none1").change(function() {
            	console.log("ckbox")
                if ($("#none1:checked")) {
                	console.log("논 체크");
                    $(".coupons").children("label").children("input").prop("checked", false);
                    $(".coupons").children("label").children("input").next().next().removeClass("chk");
                }
            });
            $(".coupons").children("label").children("input").change(function() {
            	$("#none1").prop("checked", false);
                $("#none1").next().next().removeClass("chk");
            });
            

            $("input[type=checkbox]").change(function() {
                if ($(this).is(":checked")) {
                    $(this).next().next().addClass("chk");
                }else{
                    $(this).next().next().removeClass("chk");
                }
            });
        });

    </script>
    
    


</body>

</html>
