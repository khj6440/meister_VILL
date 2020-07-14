<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Meister Center</title>
    <link rel="stylesheet" href="/resources/yr/css/meisterList_css.css" type="text/css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div class="content-box-yr">
        <div class="page-title">
            마이스터 센터
        </div>
        <div class="content-box">
            <div class="search-line">
                <div class="keyword-search">
                    <span class="hdsc-icon"><a href="#"><i class="fa fa-search"></i></a></span>
                    <input type="text" name="keyword" class="form-control form-control-sm" placeholder="Search...">
                </div>
                <div class="lg-range">
                    <select name="category1">
                        <option value="iTP">IT/Programming</option>
                        <option value="design">Design</option>
                    </select>
                </div>
                <div class="sm-range">
                    <select name="category2">
                        <option value="00">00</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                    </select>
                </div>
            </div>
            <div class="search-range">
                <select name="mcrange">
                    <option value="review">후기순</option>
                    <option value="star">별점순</option>
                    <option value="recent">최근 활동순</option>
                </select>
            </div>
            
            <div class="meisters-box">
                <table>
            <!-- 반복영역 -->
            <c:forEach items="${meisters }" var="m">
                    <tr>
                        <td>
                            <div class="m-profile">
                            	<div class="pf-img">
                                     <c:if test="${m.memberImg eq null }">
                                         <a href="#">
                                             <img src="/resources/yr/imgs/profile_img2.png" width="100%">
                                         </a>
                                     </c:if>
                                     <c:if test="${m.memberImg ne null }">
                                         <a href="#">
                                             <img src="/resources/upload/memberImg/${m.memberImg }" width="100%">
                                         </a>
                                    </c:if>
                                 </div>
                            </div>
                            <div class="m-info">
                                <div class="m-name">{m.memberNickname}</div>
                                <div class="m-introduce">{m.memberIntro}</div>
                                <div class="m-star">
                                	<!-- for (var i = 0; i < Math.floor(pointArange); i++) {
					html2 += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/full-star.png'>";
				}
				if ((pointArange.toFixed(1)) % (Math.floor(pointArange)) == 0) {
					for (var p = 0; p < 5 - Math.floor(pointArange); p++) {
						html2 += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/bin-star.png'>";
					}
				} else {
					html2 += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/half-star.png'>";
					for (var p = 0; p < 5 - Math.floor(pointArange) - 1; p++) {
						html2 += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/bin-star.png'>";
					}
				}
                      -->           
                                
                                
                                
                                
                                	<%-- <c:if test="${m.reviewPoint eq 0 }">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint > 0 && m.reviewPoint <1}">
                                    <img src="/resources/yr/imgs/star_half.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint eq 1 }">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint > 1 && m.reviewPoint <2}">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_half.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint eq 2 }">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint > 2 && m.reviewPoint <3}">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_half.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint eq 3}">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint >3 && m.review <4}">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_half.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint eq 4}">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_none.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint > 4 && m.reviewPoint <5}">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_half.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if>
									<c:if test="${m.reviewPoint eq 5}">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
									<span>{m.reviewPoint}</span>
									</c:if> --%>
                                </div>
                                <div class="m-review">
                                    <div class="mre-icon">
                                        <img src="/resources/yr/imgs/review.png" width="25px;">
                                    </div>
                                    <div class="mre-writer">${m.reviewWriter }</div>
                                    <div class="mre-review">${m.reviewContent }</div>
                                </div>
                            </div>
                        </td>
                    </tr>
           <!-- 반복영역끝 -->
                </table>
            </div>
           </c:forEach>
           
           
           
           
           
            <div class="m-btn-more">
                <button type="button" class="btn btn-yr-normal-gray" id="btn-more">더보기</button>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


	<script>
		$(document).ready(function(){
			fn_more(1);
		});
		function fn_more(start){
			var param = {start:start};
			$.ajax({
				url: "/meister/member/meisterMore.do",
				data : param,
				type: "post",
				dataType: "json",
				success: function(data){
					var html = "";
					for (var i=0; i<data.length;i++){
						html += "<tr>";
						html += "<td>";"
						html += "<div class='m-profile'>";
                       	html += "<div class='pf-img'>";
                        html += "<c:if test='"+data.[i].memberImg+"== null'>";
                        html += "<a href='#'>";
                        html += "<img src='/resources/yr/imgs/profile_img2.png' width='100%'>";
                        html += "</a>";
                        html += "</c:if>";
                        html += "<c:if test='"+data[i].memberImg+"!=null'>";
                        html += "<a href='#'>";
                        html += "<img src='/resources/upload/memberImg/${sessionScope.member.memberImg }' width='100%'>";
                        html += "</a>";
                        html += "</c:if>";
                        html += "</div>";
                        html += "</div>";
                        html += "<div class='m-info'>";
                        html += "<div class='m-name'>"+data[i].memberNickname+"</div>";
                        html += "<div class='m-introduce'>"+data[i].memberIntro+"</div>";
                        html += "<div class='m-star'>";
                        html += "for (var i = 0; i < Math.floor("+data[i].reviewPoint+")); i++) {";
        				html += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/full-star.png'>}";
    					html += "if ((pointArange.toFixed(1)) % (Math.floor("+data[i].reviewPoint+")) == 0) {";
    					html += "for (var p = 0; p < 5 - Math.floor(pointArange); p++) {
    						html2 += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/bin-star.png'>";
    					}
    				} else {
    					html2 += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/half-star.png'>";
    					for (var p = 0; p < 5 - Math.floor(pointArange) - 1; p++) {
    						html2 += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/bin-star.png'>";
    					}
    				}"
					}
				}
			});
		}
		$(function(){
			
			$("#btn-more").click(function(){
				$.ajax({
					url:"/moreMeister",
					data: {},
				});
			});
		});
	</script>
    
</body>

</html>
