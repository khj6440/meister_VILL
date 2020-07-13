<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/resources/bh/common-css/common.css" rel="stylesheet">
<link href="/resources/bh/employ-css/showEmploy.css?after" rel="stylesheet">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header2.jsp"/>
 <div class="container">
    <div class="row" style="width:1110px; padding-top: 30px;">
      <!-- Post Content Column -->
      <div class="col-lg-8">
        <!-- Author -->
        <br>
        <div>
        <span class="fo-si-25 fo-we-bo">${employ.employTitle }</span>
        <p class="fo-si-13 no-font">${employ.employCategory1 } > ${employ.employCategory2 }</p>
        </div>
        <!-- Preview Image -->
        <!-- Post Content -->
        <hr>
        <br>
        <div class="employ-detail-basic-info">
        <div><img class="basic-info-img" src="/resources/upload/homeImg/korea-money.png"><span class="fo-si-17 fo-we-bo">예상 금액&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="no-font">${employ.employPrice }원</span></div>
        <div><img class="basic-info-img" src="/resources/upload/homeImg/clock.png"><span class="fo-si-17 fo-we-bo">예상 기간&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="no-font">${employ.employPeriod }일</span></div>
        <div><img class="basic-info-img" src="/resources/upload/homeImg/edit.png"><span class="fo-si-17 fo-we-bo">모집 마감&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="no-font">${employ.employBoardEnd }</span></div>
        </div>
        <div class="employ-detail-basic-info2">
        <div><img class="basic-info-img" src="/resources/upload/homeImg/clock.png"><span class="fo-si-17 fo-we-bo">예상 시작일&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="no-font">${employ.employStartDate }</span></div>
        <div><img class="basic-info-img" src="/resources/upload/homeImg/clock.png"><span class="fo-si-17 fo-we-bo">등록일&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="no-font">20${employ.employEnrollDate }</span></div>
        </div>
        <br><br>
        <p class="fo-si-18 fo-we-bo">프로젝트 내용</p>
        <p class="no-font">[ 본 프로젝트는 클라이언트가 마이스터 이용요금을 부담합니다. ]</p>
        <p class="no-font">[ 클라이언트가 직접 발주한 프로젝트입니다. ]</p>
        <br>
        <div class="main-content">
        <p class="fo-si-16 fo-we-bo">< 프로젝트 상세 내용 ></p>
        <div class="main-contents no-font">
        ${employ.employContent }
        </div>
        </div>
        <br><hr>
        <p class="fo-si-16 fo-we-bo">관련 기술</p>
        <div style="display:flex;">
		 <c:forEach items="${employ.employSkill }" var="s">
		 	<div class="meta">${s }</div>
		 </c:forEach>
		 </div>
		 <br>
		 <br>
		 <br>
		 <br>
		 <br>
		 <br>
		 <br>
		 <br>
		 <br>
		 <br>
        </div>
        <br><hr>
        <hr>
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
               	<button class="btn fo-si-14" style="width:100%; height:50px; background-color:#FFBC42; font-weight:bold;" disabled>프로젝트 지원 불가</button>
               </c:if>
               <c:if test="${sessionScope.member.memberLevel eq 1 }">
           		<button class="btn fo-si-14" style="width:100%; height:50px; background-color:#FFBC42; font-weight:bold;">프로젝트 지원</button>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>