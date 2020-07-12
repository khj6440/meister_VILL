<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/resources/bh/common-css/common.css" rel="stylesheet">
<link href="/resources/bh/request-css/showRequest.css?after" rel="stylesheet">
<script>
function getSplitPrice(get) {
	var result = get.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return result;
}
function selectDate(obj) {
	var year = obj.getFullYear(); 
	var month = obj.getMonth() + 1;
	var day = obj.getDate();
	return year + "년" + month +"월"+ day + "일";
}
function getStringDate(obj) {
	var arr = obj.split("/");
	var year = arr[0];
	var month = arr[1];
	var day = arr[2];
	return year + "년" + month +"월"+ day + "일";
}

function getDateNum(obj) {
	var arr = obj.split("/");
	var year = arr[0];
	var month = arr[1] - 1;
	var day = arr[2];
	var enrollDate = new Date(year,month,day);
	return enrollDate;
}
$(function() {
	
	var price = ${request.requestPrice };
	var money = getSplitPrice(price);
	var requestDate = "${request.requestDate }";
	var projectEnd = ${request.requestProjectEnd };
	var boardEnd = ${request.requestBoardEnd };
	var enrollDate = getDateNum(requestDate);
	enrollDate.setDate(enrollDate.getDate() + projectEnd);
	var enrollDateString = selectDate(enrollDate);
	$(".request-detail-basic-info").append("<div><img class='basic-info-img' src='/resources/upload/homeImg/korea-money.png'><span class='fo-si-17 fo-we-bo'>예상 금액&nbsp;&nbsp;&nbsp;&nbsp;</span><span class='no-font'>"+money+"원</span></div>");
	$(".request-detail-basic-info").append("<div><img class='basic-info-img' src='/resources/upload/homeImg/clock.png'><span class='fo-si-17 fo-we-bo'>프로젝트 마감 날짜&nbsp;&nbsp;&nbsp;&nbsp;</span><span class='no-font'>"+enrollDateString+"</span></div>");
	var enrollDate = getDateNum(requestDate);
	var thisDay = getDateNum(requestDate);
	enrollDate.setDate(enrollDate.getDate() + boardEnd)
	var enrollDateString = selectDate(enrollDate);
	$(".request-detail-basic-info2").append("<div><img class='basic-info-img' src='/resources/upload/homeImg/edit.png'><span class='fo-si-17 fo-we-bo'>모집 마감&nbsp;&nbsp;&nbsp;&nbsp;</span><span class='no-font'>"+enrollDateString+"</span></div>");
	console.log(thisDay);
	console.log(enrollDate);
	var dDay = ((enrollDate - thisDay) / (24*60*60*1000));
	console.log(dDay);
	if(dDay > 0 && dDay < 5) {
		$("#dDayArea").append("<div style='text-align:center;'><span class='fo-si-17 fo-we-bo d-day-point'>D-DAY&nbsp;&nbsp;&nbsp;&nbsp;"+dDay+"</span></div>");
	} else if(dDay == 0) {
		$("#dDayArea").append("<div style='text-align:center;'><span class='fo-si-17 fo-we-bo d-day-red'>D-DAY</span></div>");
	} else {
		$("#dDayArea").append("<div style='text-align:center;'><span class='fo-si-17 fo-we-bo d-day-point'>D-DAY&nbsp;&nbsp;&nbsp;&nbsp;"+dDay+"</span></div>");
	}
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header2.jsp"/>
 <div class="container">
    <div class="row" style="width:1110px; padding-top: 30px;">
      <!-- Post Content Column -->
      <div class="col-lg-8">
        <!-- Author --><br>
        <div style="display:flex;">
        <span style="width:50%;">
        <span class="fo-si-25 fo-we-bo">${request.requestTitle }</span>
        <p class="fo-si-13 no-font">${request.requestCategory1 } > ${request.requestCategory2 }</p>
        </span>
        <span id="dDayArea" style="width:50%; text-align:right; margin-top: 30px; margin-left: 350px;">
        
        </span>
        </div>
        <!-- Preview Image -->
        <!-- Post Content -->
        <hr><br>
        <div class="request-detail-basic-info">
        </div>
        <div class="request-detail-basic-info2">
        <div><img class="basic-info-img" src="/resources/upload/homeImg/clock.png"><span class="fo-si-17 fo-we-bo">등록일&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="no-font">${request.requestDate }</span></div>
        </div><br><br>
        
        <div class="main-content">
         <p class="fo-si-16 fo-we-bo">< 준비 상황 ></p>
        <div class="main-contents no-font">
        ${request.requestNow }
        </div><br><br>
        <p class="fo-si-16 fo-we-bo">< 원하는 형태></p>
        <div class="main-contents no-font">
        ${request.requestWantform }
        </div><br><br>
        <p class="fo-si-16 fo-we-bo">< 원하는 기능 ></p>
        <div class="main-contents no-font">
        ${request.requestWantskill }
        </div><br><br>
        <p class="fo-si-16 fo-we-bo">< 맞춤견적 상세 내용 ></p>
        <div class="main-contents no-font">
        ${request.requestContent }
        </div><br>
        </div>	<br><br><br><br><br>
        </div>
              <!-- Sidebar Widgets Column -->
      <div class="col-md-4 border-1px-solid">
       <br>
        <p class="fo-si-18 fo-we-bo">클라이언트</p>
        <hr>
		
        <!-- Search Widget -->
       <div class="card my-4 card-shadow">
        	<div class="card-body" style="text-align:center;">
        		<div class="card-profile">
        			<img style="width: 100px;height:100px;object-fit: cover;border-radius: 70%; margin-bottom:15px;" src="/resources/upload/memberImg/${member.memberImg }">
        			<h5>${member.memberNickname }</h5>
        		</div>
        		<hr style="width:50px;border:0; height: 3px;background-color:#FFBC42;">
        		<div class="card-time">
        			<c:if test="${empty sessionScope.member.memberNo }">
        				<h5 class="fo-si-13">로그인 후 문의 가능합니다</h5>
        			</c:if>
        			<c:if test="${not empty sessionScope.member.memberNo }">
        				<h5 class="fo-si-13">마이스터 전화 : ${member.memberPhone }</h5>
        				<h5 class="fo-si-13">연락 가능한 시간 : ${member.memberTime }</h5>
        			</c:if> 
        			<hr>
        		</div>
        		<div class="card-Info">
        		<h5 style="text-align:left;" class="fo-si-15 fo-we-bo">마이스터 소개</h5>
        		<p class="fo-si-14 no-font" style="text-align:left;">${member.memberIntro }</p>
        		</div>
        	</div>

      </div>

        <!-- Categories Widget -->
        <div class="card my-4 card-shadow">
          <div class="card-body">
            <div class="row" style="padding:15px;">
               <br><br>
               <c:if test="${sessionScope.member.memberLevel ne 1 }">
               <img src="/resources/upload/homeImg/forbidden.png" style="width:17px; height:17px; margin-top:5px; margin-right:8px;"><p class="fo-si-16" style="color:red;">전문가만 지원 가능합니다</p>
               	<button class="btn fo-si-14" style="width:100%; height:50px; background-color:#FFBC42; font-weight:bold;" disabled>견적 신청 불가</button>
               </c:if>
               <c:if test="${sessionScope.member.memberLevel eq 1 }">
           		<button class="btn fo-si-14" style="width:100%; height:50px; background-color:#FFBC42; font-weight:bold;">맞춤 견적 신청</button>
            	</c:if>
            </div>
          </div>
        </div>
    </div>
    <!-- /.row -->
        </div>
        <br><br><br><br><br><br>


    </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/bh/sell-css/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/bh/sell-css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>