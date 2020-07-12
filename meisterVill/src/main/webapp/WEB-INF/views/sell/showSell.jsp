<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이스터 판매글</title>
  <!-- Bootstrap core CSS -->
  <link href="/resources/sell-css/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/sell-css/css/heroic-features.css?after" rel="stylesheet">
  <link href="/resources/showSell-css/showSell.css?after" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
function goLocation(where) {
	switch(where.text) {
	case  "이미지" :
		var position = $("#imgContent").offset();
		console.log(position);
		$("body").animate({scrollTop:position, top}, 500);
	break;
	case  "취소 · 환불규정" :
		
	break;
	case  "서비스 평가" :
		
	break;
	}
}

	$(function() {
		var sellNo = ${sell.sellvo.sellNo};
		var memberNo = 2;
		$.ajax({
			url : "/meister/review/selectReview.do?sellNo="+sellNo,
			data : "json",
			success : function(data) {
				html="";
				html2="";
				var point = 0;
				var pointArange = 0;
				for (var i = 0 ; i < data.length; i++) {
					html += "<div class='media-body' style='display:flex;'>";
					html += "<div>";
					html += "<img class='d-flex mr-3 rounded-circle' style='width:70px; height:70px;' src='/resources/upload/memberImg/"+data[i].reviewvo.reviewWriterImg+"'>";
					html += "</div>";
					html += "<div>";
					html += "<div style='color:#9a9ba7'>";
					html += ""+data[i].reviewvo.reviewDate+"&nbsp;&nbsp;";
					for (var q = 0; q < data[i].reviewvo.reviewPoint; q++) {
						html += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/full-star.png'>";
					}
					for (var p = 0; p < 5 - data[i].reviewvo.reviewPoint; p++) {
						html += "<img style='width:15px; height:15px;' src='/resources/upload/homeImg/bin-star.png'>";
					}
					html += "</div>";
					html += "<div>";
					html += "<div style='color:#9a9ba7'>";
					html += "</div>";
					html += "<br>";
					html += ""+data[i].reviewvo.reviewContent+"<br>";
					html += "<div style='color:#9a9ba7; font-size: 13px;'>";
					html += ""+data[i].reviewvo.reviewWriter;
					html += "</div>";
					html += "</div>";
					html += "</div>";
					html += "</div>";
					html += "<hr>";
					point += data[i].reviewvo.reviewPoint;
					pointArange = point / data.length;
				}
				html2 += "<div style='margin: 0 auto; display: flex;'>";
				html2 += "<h1 style='line-height: 100px;'>"+pointArange.toFixed(1)+"</h1>";
				html2 += "<div>";
				html2 += "<div style='padding-top:25px; padding-left:20px;'>";
				for (var i = 0; i < Math.floor(pointArange); i++) {
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
				html2 += "<div>";
				html2 += "<h5 style='font-size:15px;'>"+data.length+"개의 후기 갯수</h5>";
				html2 += "</div>";
				html2 += "</div>";
				html2 += "</div>";
				html2 += "</div>";
				$("#review-area").append(html);
				$("#pointView").append(html2);
			}
		});
		$(".picking").click(function() {
			$.ajax({
				url : "/meister/sell/pickingSell.do",
				type : "get",
				data : {memberNo : memberNo, sellNo : sellNo},
				success : function(data) {
					html3 = "";
					if(data =="1") {
						html3 += "<div>";
				       	html3 += "<p style='font-size:14px; text-align:right; cursor:pointer;' id='canclePicking2'><img src='/resources/upload/homeImg/InHeart.png' style='width:15px;'> 찜하기</p>";
				        html3 += "</div>";
					}
					$("#pickArea").html(html3);
				}
			});
		});
		$("#canclePicking2").click(function() {
			console.log("why");
			$.ajax({
				url : "/meister/sell/canclePickingSell.do",
				type : "get",
				data : {memberNo : memberNo, sellNo : sellNo},
				success : function(data) {
				}
			});
		});
		
		
	});
	
	 
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <div class="container">
    <div class="row" style="width:1200px;">
      <!-- Post Content Column -->
      <div class="col-lg-8" style="width:730px;">
        <!-- Author -->
        <br>
        
        <p>${sell.sellvo.sellCategory1 } > ${sell.sellvo.sellCategory2 }</p>
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="/resources/upload/sellImg/${sell.sellvo.sellImg }">
        <!-- Post Content -->
        <hr>
        <div id="navbar">
		  <a href="javascript:void(0);" onclick="goLocation(this);" data-target="#mainContent" id="po1">상세페이지</a>
		  <a href="javascript:void(0);" onclick="goLocation(this);">이미지</a>
		  <a href="javascript:void(0);" onclick="goLocation(this);">취소 · 환불규정</a>
		  <a href="javascript:void(0);" onclick="goLocation(this);">서비스 평가</a>
		</div>
	<script>
		window.onscroll = function() {myFunction()};
		var navbar = document.getElementById("navbar");
		var sticky = navbar.offsetTop;
		function myFunction() {
		  if (window.pageYOffset >= sticky) {
		    navbar.classList.add("sticky")
		  } else {
		    navbar.classList.remove("sticky");
		  }
		}
	</script>
        <br><br>
        <h4 style="font-weight:bold;" id="mainContent">서비스 설명</h4>
        <br>
        <div class="multiImg-box">
        	${sell.sellvo.sellContent }
        </div>
        <br><hr><br>
        <div class="multiImg-box">
        <h4 style="font-weight:bold;">사용 기술</h4>
        <div style="display:flex;">
        
        <c:if test="${empty skill }">
        	<h4>기술없음</h4>
        </c:if>
        
        <c:if test="${!empty skill }">
		 <c:forEach items="${skill }" var="s">
		 	<div class="meta">${s }</div>
		 </c:forEach>
		 </c:if>
		 </div>
        </div>
        <br><hr>
        <div class="multiImg-box" id="imgContent">
        <br><br>
        <c:forEach items="${multiImg }" var="i">
			<img class="img-fluid rounded" src="/resources/upload/multiImg/${i}" style="margin-bottom:20px;">
		</c:forEach>
        </div>
        <hr>
		<h5 style="font-weight:bold;">상세 후기</h5><br><br>
		<div style="width:100%; height:100px; background-color:#f8f9fa; display:flex;" id="pointView">
		</div>
		<br><br>
        <div class="media mb-4" id="review-area" style="display:block;">
          </div>
        </div>
        <br><br><br><br><br><br>
      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">
       <br>
        <p></p>
		
        <!-- Search Widget -->
        <div class="card my-4" style="border: 0px;">
        <div id="pickArea">
     <%--    <c:if test="${sessionScope.member.memberNo != sell.pickvo.memberNo}">
       	<p style="font-size:14px; text-align:right; cursor:pointer;" class="picking"><img src="/resources/upload/homeImg/heart.png" style="width:15px;"> 찜하기</p>
        </c:if>
        <c:if test="${sessionScope.member.memberNo == sell.pickvo.memberNo}">
       	<p style="font-size:14px; text-align:right; cursor:pointer;" class="picking"><img src="/resources/upload/homeImg/InHeart.png" style="width:15px;"> 찜하기</p>
        </c:if> --%>
        </div>
        <div class="card-body">
          <h4>${sell.sellvo.sellTitle }</h4><br>
          <h5 style="text-align:right">${sell.sellvo.sellPrice }원 </h5>
          <h5 style="text-align:right; font-size:10px;">(VAT 포함 가격)</h5>
        </div>
         </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header" style="background-color:#f8f9fa;">Option </h5>
          <div class="card-body">
            <div class="row" style="padding:15px;">
           		<span><img src="/resources/upload/homeImg/check.png" style="width:11px;"> ${sell.sellvo.sellOpt1 }</span>
               <span><img src="/resources/upload/homeImg/check.png" style="width:11px;"> ${sell.sellvo.sellOpt2 }</span>
               <span><img src="/resources/upload/homeImg/check.png" style="width:11px;"> ${sell.sellvo.sellOpt3 }</span><br><br>
               <span><img src="/resources/upload/homeImg/calendar.png" style="width:15px;"> 작업 소요일 : ${sell.sellvo.sellPeriod }일 &nbsp;&nbsp;&nbsp;<img src="/resources/upload/homeImg/settings.png" style="width:16px;"> 수정 횟수 : ${sell.sellvo.sellOptFix }회</span>
               <br><br>
           		<button class="btn fo-si14" onclick="location.href='/meister/sell/order.do?sellNo=${sell.sellvo.sellNo }&memberNo=${sessionScope.member.memberNo}'" style="width:100%; height:50px; background-color:#FFBC42; font-weight:bold;">구매하기</button>
            </div>
          </div>
        </div>
        <div class="card my-4">
         <div class="card-body" style="display:flex;">
         <img src="/resources/upload/homeImg/protect.png" style="margin-right:10px; width:30px;">
         <h5 class="fo-si13">마이스터을 통해 결제하면 거래 완료시까지 결제 대금을 안전하게 보호 받을 수 있습니다.</h5>
         </div>
        </div>
        <!-- Side Widget -->
        <div class="card my-4">
        	<div class="card-body" style="text-align:center;">
        		<div class="card-profile">
        			<img style="width: 100px;height:100px;object-fit: cover;border-radius: 70%; margin-bottom:15px;" src="/resources/upload/memberImg/${sell.membervo.memberImg }">
        			<h5>${sell.membervo.memberNickname }</h5>
        		</div>
        		<hr style="width:50px;border:0; height: 3px;background-color:#FFBC42;">
        		<div class="card-time">
        			<c:if test="${empty sessionScope.member.memberNo }">
        				<h5 class="fo-si13">로그인 후 문의 가능합니다</h5>
        			</c:if>
        			<c:if test="${not empty sessionScope.member.memberNo }">
        				<h5 class="fo-si13">마이스터 전화 : ${sell.membervo.memberPhone }</h5>
        				<h5 class="fo-si13">연락 가능한 시간 : ${sell.membervo.memberTime }</h5>
        			</c:if> 
        			<hr>
        		</div>
        		<div class="card-Info">
        		<h5 style="text-align:left; font-size:15px; font-weight:bold;">전문가 소개</h5>
        		<h5 class="fo-si14" style="text-align:left;">${sell.membervo.memberIntro }</h5>
        		</div>
        	</div>

      </div>

    </div>
    <!-- /.row -->

    </div>
  <!-- /.container -->
	</div>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/sell-css/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/sell-css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>