<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <!-- Bootstrap core CSS -->
  <link href="/resources/sell-css/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/sell-css/css/heroic-features.css?after" rel="stylesheet">
  <link href="/resources/showSell-css/showSell.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<meta charset="UTF-8">
<title>공지사항</title>
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


        <br><br>
        <h4 style="font-weight:bold;" id="mainContent">서비스 설명</h4>
        <br>
        <div class="multiImg-box">
        	${sell.sellvo.sellContent }
        </div>
        <br><hr><br>
        <div class="multiImg-box">
        <h4 style="font-weight:bold;">사용 기술</h4>

        </div>
        <br><hr>
        <div class="multiImg-box" id="imgContent">
        <br><br>

			<img class="img-fluid rounded" src="/resources/upload/multiImg/${i}" style="margin-bottom:20px;">

        </div>
        <hr>

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
           		<!-- <button class="btn fo-si14" style="width:100%; height:50px; background-color:#FFBC42; font-weight:bold;">구매하기</button> -->
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

        				<h5 class="fo-si13">로그인 후 문의 가능합니다</h5>


        				<h5 class="fo-si13">마이스터 전화 : ${sell.membervo.memberPhone }</h5>
        				<h5 class="fo-si13">연락 가능한 시간 : ${sell.membervo.memberTime }</h5>
        		
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



</body>
</html>