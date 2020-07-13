<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link type="text/css" href="/resources/yr/css/order_css.css" rel="stylesheet">


    <!-- 아임포트 -->
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header2.jsp"></jsp:include>

    <div class="content-box">
        <div class="page-title">
            주문하기
        </div>
        <div class="order-table">
            <div class="ot-info">
                <div class="oti-1">
                    <img src="/resources/yr/imgs/freddie-marriage-vSchPA-YA_A-unsplash.jpg" width="200px">
                </div>
                <div class="oti-2">
                    <div class="order-title">${sell.sellTitle }</div>
                    <div class="order-member">
                        <div>
                            <c:if test="${seller.memberImg eq null}">
                                <img src="/resources/yr/imgs/profile_img2.png" width="70%">
                            </c:if>
                            <c:if test="${seller.memberImg ne null}">
                                <img src="/resources/upload/memberImg/${member.memberImg }" width="70%">
                            </c:if>
                        </div>
                        <div>${seller.memberNickname }</div>

                    </div>
                </div>
            </div>
            <div class="ot-basic">
                <table class="otb-table">
                    <tr>
                        <th>기본항목</th>
                        <th>작업일</th>
                        <th>가격</th>
                    </tr>
                    <tr>
                        <td>${sell.sellOpt1 }</td>
                        <td rowspan="100%">${sell.sellPeriod }</td>
                        <td rowspan="100%" class="basic-price">${sell.sellPrice } 원</td>
                    </tr>
                    <tr>
                        <td>${sell.sellOpt2 }</td>
                    </tr>
                    <tr>
                        <td>${sell.sellOpt3 }</td>
                    </tr>
                </table>
            </div>
            <div class="ot-option">
                <table class="oto-table">

                    <tr>
                        <th>옵션항목</th>
                        <th>작업일</th>
                        <th>가격</th>
                    </tr>
                    <c:forEach items="${options }" var="opt">
                        <tr>
                            <td>
                                <label>
                                    <input type="checkbox" value="${opt.optionPrice}" class="plusOptChk">
                                    ${opt.optionTitle }</label>
                            </td>
                            <td>${opt.optionPlusDate }</td>
                            <td value="${opt.optionNo }" class="optPrice">${opt.optionPrice } 원</td>
                        </tr>

                    </c:forEach>

                </table>
            </div>
        </div>
        <div class="charge-table">
            <div class="ct-header">
                결제금액
            </div>
            <div class="ct-coupon">
                <div class="ct-calculate">
                    <div class="ct1">
                        <div class="available-coupon">사용가능한 쿠폰</div>
                        <div class="coupon-cnt">(${couponCnt })</div>
                        <button type="button" id="couponModalBtn" class="btn btn-yr-normal-gray" data-toggle="modal" data-target="#couponListModal">쿠폰선택</button>
                    </div>
                    <div class="ct2">
                        <table id="coupon-table">


                            <!-- 반복부분 -->
                            <!-- <tr>
                              <td>적용중인 쿠폰2</td>
                                <td>100원</td>
                            </tr> -->


                        </table>
                    </div>
                </div>
                <div class="ct-price">
                    <div class="total-price">
                        <div>총 서비스 금액</div>
                        <div>${sell.sellPrice }원</div>
                    </div>

                    <div class="coupon-price">
                        <div>┗ 쿠폰</div>
                        <div>0원</div>
                    </div>
                    <div class="payment-price">
                        <div>총 결제금액</div>
                        <div>
                            <div class="won">원</div>
                            <div class="thePay">${sell.sellPrice }</div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="tax-box">
            <div class="tax-header">
                세금계산서
            </div>
            <div class="tax-content">
                <div>· 개인 전문가이므로 세금계산서 발행이 불가능합니다.</div>
                <div>· 현금 영수증(사업자지출증빙) / 신용카드 매입전표는 <b>매입세액공제 사용이 불가능</b>합니다. <b>[매입세액공제 안내]</b> <i class="fa fa-question-circle" aria-hidden="true"></i>
                    <div>
                        신용카드 영수증/현금영수증(지출증빙용)을 발급받으셨더라도 중개업체인 "마이스터빌"의 이름으로 발행이 되어 매입세액 공제를 받지 못합니다. 거래주체인 "전문가"이름으로 발행된 세금계산서만이 매입세액공제가 가능합니다.
                    </div>
                </div>
                <div>· 현금영수증 / 신용카드 영수증은 개인 소득 공제용으로만 사용하실 수 있습니다.</div>
            </div>
        </div>
        <button type="button" id="payBtn" class="btn btn-yr-normal btn-charge">결제하기</button>
    </div>

    <script>
        $(function() {
                    var sellPr = Number(${sell.sellPrice});
                    var totalDiscount = 0;
                    var totalPr = Number(sellPr - totalDiscount);
                    

                    $("body").mouseover(function() {
                    	console.log("??"+totalPr)
                        console.log("!!" + Number(sellPr - totalDiscount))
                        $(".payment-price").children("div").eq(1).children().eq(1).html(Number(sellPr - totalDiscount));

                    });


                    //옵션 추가
                    $(".plusOptChk").change(function() {

                        console.log("가격" + sellPr);
                        console.log("옵션" + $(this).val());
                        if ($(this).is(":checked")) {
                        	var qq = $(".plusOptChk:checked").parent().parent().siblings(".optPrice").attr("value");
                        	console.log("--"+qq);
                            sellPr += Number($(this).val());
                            console.log("더하기" + sellPr);
                        } else {
                            sellPr -= Number($(this).val());
                            console.log("빼기" + sellPr);
                        }
                        $(".total-price").children("div").eq(1).html(sellPr + "원");
                    });

                    $("#couponModalBtn").click(function() {
                        $("#couponListModal").modal("show");

                    });

                    //쿠폰 금액 합산
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
                        //쿠폰적용 버튼 클릭
                        var arrCouponName = $(".chk");
                        for (var i = 0; i < arrCouponName.length; i++) {
                            console.log("**" + arrCouponName.eq(i).html());
                            console.log("쿠폰번호"+arrCouponName.eq(i).val());
                        }
                        var arrCouponPrice = $(".chk").siblings("input");
                        for (var i = 0; i < arrCouponPrice.length; i++) {
                            console.log("##" + arrCouponPrice.eq(i).val());
                        }
                        var html2 = "";
                        for (var i = 0; i < arrCouponName.length; i++) {
                            html2 += "<tr><td>" + arrCouponName.eq(i).html() + "</td>";
                            console.log("쿠폰명" + arrCouponName.eq(i));
                            html2 += "<td>" + arrCouponPrice.eq(i).val() + "원</td></tr>";
                            console.log("쿠폰가격" + arrCouponPrice.eq(i));
                        }
                        $(".ct2").children().append(html2);
                        $(".coupon-price").children().eq(1).html(totalDiscount + "원");
                        $("#couponListModal").modal("hide");

                    });
                    
                    //결제하기
                    $("#payBtn").click(function() {
                        var price1 = $(".thePay").html();
                        var d = new Date();
                        var memName = "${member.memberName}";
                        var sellTitle = "${sell.sellTitle}";
                        var orderMemberNo = ${member.memberNo};
                        var orderBoardNo = ${sell.sellNo};
                        console.log("날짜" + date);
                        var date = d.getFullYear() + "" + (d.getMonth() + 1) + "" + d.getDate() + "" + d.getHours() + "" + d.getMinutes() + "" + d.getSeconds();
                        var optionNo = $(".plusOptChk:checked").parent().parent().siblings(".optPrice").attr("value");
                        var couponNo = $(".chk").attr("value");
                        if(optionNo!=null){
                            console.log("옵션리스트"+optionNo);
                            	
                            }
                            if(couponNo!=null){
                            	
                            console.log("쿠폰리스트"+couponNo);
                            }
                        IMP.init("imp73883772");
                        IMP.request_pay({
                            //결제시 구매에 대한 정보를 모듈에 전달 (결제창에 내 정보가 뜨는 단계)
                            merchant_uid: ${sell.sellNo} + '' + date, //상점 거래 아이디
                            name: "${sell.sellTitle}",
                            amount: price1, //금액
                            buyer_email: '${member.memberEmail}',
                            buyer_name: '${member.memberName}',
                            buyer_tel: '${member.memberPhone}',
                            buyer_addr: '마이스터빌',
                            buyer_postcode: '01234'
                        }, function(rsp) {
                            //결제 후 결제 결과 처리
                            if (rsp.success) {
                            	console.log("성공했습니까?");
                            	var memberEmail = "${member.memberEmail}";
                            	/* var orderMemberNo = ${member.memberNo};
                            	var orderBoardNo = ${sell.sellNo};
                            	var sellTitle = "${sell.sellTitle}";
                            	var price = $(".thePay").html(); */
                            	
                            	console.log(memberEmail);
                            	console.log(orderMemberNo);
                            	console.log(orderBoardNo);
                            	console.log(sellTitle);
                            	console.log(price1);
                                //결제를 성공했을 때 해당하는 정보를 읽어옴
                                var allData = {orderMemberNo: orderMemberNo, orderBoardNo: orderBoardNo, sellTitle: sellTitle, memberEmail:memberEmail, price:price1, optionNo:optionNo, couponNo:couponNo }
                                $.ajax({
                                	url: "/meister/sell/purchaseSuccess.do",
                                	data : allData,
                                	traditional: true,
                                	type: "post",
                                	success: function(data){
                                		console.log("ajax~~"+data);
                                		if(data=="1"){
				                           location.href="/meister/sell/sellEnd.do?orderBoardNo=${sell.sellNo}&orderMemberNo=${member.memberNo}&memberEmail=${member.memberEmail}&sellTitle=${sell.sellTitle}&price=$('.thePay').html()";
                                			
                                		}else{
                                			console.log("실패");
                                		}
			                            
                                	},error: function(){
                                		console.log("ajax실패");
                                	}
                                });
                            } else {
                                //결제를 실패 했을 때(어떤 사유..)
                                console.log("에러내용 : " + rsp.error_msg);
                            }
                        });


                    });
        });

    </script>



    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/order/couponListModal.jsp" />

</body>

</html>
