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
                        	<c:if test="${empty member.memberImg }">
                            <img src="/resources/yr/imgs/profile_img2.png" width="70%">
                            </c:if>
                            <c:if test="${not empty member.memberImg }">
                            <img src="/resources/upload/memberImg/${member.memberImg }" width="70%">
                            </c:if>
                        </div>
                        <div>${sell.sellWriter }</div>
                        
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
                        <td>${sell.option1 }</td>
                        <td rowspan="100%">${sell.sellPeriod }</td>
                        <td rowspan="100%" class="basic-price">${sell.sellPrice } 원</td>
                    </tr>
                    <tr>
                        <td>${sell.option2 }</td>
                    </tr>
                    <tr>
                        <td>${sell.option3 }</td>
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
                                <input type="checkbox" value="${options.optionNo }">
                                ${opt.optionTitle }</label>
                        </td>
                        <td>${opt.optionPlusDate }</td>
                        <td>${opt.optionPrice } 원</td>
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
                            <tr>
                                <td>적용중인 쿠폰1</td>
                                <td>500원</td>
                            </tr>
                            <tr>
                                <td>적용중인 쿠폰2</td>
                                <td>100원</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="ct-price">
                    <div class="total-price">
                        <div>총 서비스 금액</div>
                        <div>$</div>
                    </div>

                    <div class="coupon-price">
                        <div>┗ 쿠폰</div>
                        <div>600원</div>
                    </div>
                    <div class="payment-price">
                        <div>총 결제금액</div>
                        <div>400원</div>
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
        <button type="button" class="btn btn-yr-normal btn-charge">결제하기</button>
    </div>
    
    <script>
    	$(function(){
            $("#couponModalBtn").click(function(){
                var memberEmail = "${sessionScope.member.memberNo}";
                $.ajax({
                	url:"/meister/member/couponMoalOpen.do",
                	data: {memberNo:memberNo},
                	success: function(data){
                		html="";
                		for(var i=0; i<data.length;i++){
                			html += "<label><input type='radio' value='"+data[i].couponIssuedNo"'> "+data[i].couponIssuedTitle+"</label><br>";
                		}
                		$("#noneCoupon").after(html);
                	},
                	error:function(){
                		console.log("ajax통신실패");
                	}
                });
            });
        });
    </script>



    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/member/couponListModal.jsp"/>

</body>

</html>
