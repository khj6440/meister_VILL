<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집글 작성</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="/resources/bh/sell-css/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/resources/bh/sell-css/css/heroic-features.css?after" rel="stylesheet">
<link href="/resources/bh/request-css/requestList.css" rel="stylesheet">
<link href="/resources/bh/common-css/common.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<style>
</style>
<script>
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

function getDate(obj) {
	var arr = obj.split("/");
	var year = arr[0];
	var month = arr[1] - 1;
	var day = arr[2];
	var enrollDate = new Date(year,month,day);
	return enrollDate;
}
  	$(function() {
  		var keyWord = "${keyWord}";
  		var reqPage = ${reqPage};
  		$.ajax({
  			url : "/meister/request/getRequestList.do",
			data : {reqPage:reqPage,keyWord : keyWord},
			success : function(data) {
			 	var number = data["number"];
				var skill ="";
			 	html = "";
				page = "";
				for (var i = 0; i < number; i++) {
					skill = data['request'+i].requestSkill;
	  				html += "<div class='col-lg-12 col-md-12 mb-2'>";
	  				html += "<div class='card' style='height: 200px; margin-top: 10px; cursor:pointer;' onclick='showList("+data["request"+i].requestNo+");'>";
	  				html += "<div class='card-body'>";
	  				html += "<div><h4 class='card-title fo-si-20 fo-we-bo'>"+data["request"+i].requestTitle+"</h4></div>";
	  				html += "<div><span class='fo-si-15 fo-we-bo span-border' style='border-left:none;'>&#8361; 예상 금액 </span>"+data["request"+i].requestPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원 ";
	  				var enrollDate = getDate(data["request"+i].requestDate);
	  				enrollDate.setDate(enrollDate.getDate() + data["request"+i].requestBoardEnd);
	  				var enrollDateString = selectDate(enrollDate);
	  				html += "<span class='fo-si-15 fo-we-bo span-border'>프로젝트 모집 마감 날짜 </span>"+enrollDateString+" ";
	  				var sysdate = getStringDate(data["request"+i].requestDate);
	  				html += "<span class='fo-si-14 fo-we-bo span-border'>등록일자 </span>"+sysdate+" ";
	  				var sysdateDate = getDate(data["request"+i].requestDate);
					var dDay = (enrollDate - sysdateDate) / (24*60*60*1000);
					console.log(dDay);
					if(dDay > 0 && dDay < 5) {
					html += "<span class='fo-si-14 fo-we-bo span-border d-day-red'>D-DAY "+dDay+"</span>";
					} else if (dDay == 0) {
					html += "<span class='fo-si-14 fo-we-bo span-border d-day-red'>D-day</span>";
					} else {
						html += "<span class='fo-si-14 fo-we-bo span-border d-day-point'>D-DAY "+dDay+"</span>";	
					}
	  				html +="</div>";
	  				html += "<div class='fo-si-13' style='height:5em; overflow:hidden; padding: 5px;'>"+data["request"+i].requestContent.split('<br/>').join("\r\n")+"</div>";
	  				html += "<div><span class='fo-si-13 fo-we-bo span-border' style='border-left:none;'>"+data["request"+i].requestCategory1+" > "+data["request"+i].requestCategory2+"</span>";
					html += "</span>";
	  				html += "</div>";
	  				html += "</div>";
	  				html += "</div>";
	  				html += "</div>";
				}
			page += "<div class='pageNavi'>"+data["pageNavi"]+"</div>";
			$("#request").append(html);
			$(".requestList-pageNavi").append(page); 
		}
  		});
  		$(".navbar-click").click(function() {
  			keyWord = $(this).parent().text();
  			location.href="/meister/request/showList.do?reqPage=1&&keyWord="+keyWord;
  		});
  	 });
  	
  	function showList(no) {
  		location.href="/meister/request/showOneList.do?requestNo="+no;
  	}
  </script>
<body>
<jsp:include page="/WEB-INF/views/common/header2.jsp"/>
<div class="container">
    <!-- Jumbotron Header -->
     <header class="jumbotron my-4" style="width:1100px; background-image: url('/resources/upload/homeImg/ad3.png'); background-size: cover;" >
    </header>

    <div class="request-content" style="display:flex; width:1100px">
    <nav class="request_side_list" style="width:20%; padding-right:15px;">
    <div class="side_list_header" style="border-bottom:2px solid #FFBC42;">
    <h5>디자인</h5>
    </div>
    <div class="side_list_body">
    	<ul class="list-group list-group-flush">
  			<li class="list-group-item"><span class="navbar-click">로고 · 브랜딩</span></li>
  			<li class="list-group-item"><span class="navbar-click">북 · 앨범디자인</span></li>
		  	<li class="list-group-item"><span class="navbar-click">공간디자인</span></li>
		  	<li class="list-group-item"><span class="navbar-click">웹 · 모바일 디자인</span></li>
		  	<li class="list-group-item"><span class="navbar-click">상세 · 랜딩페이지</span></li>
		  	<li class="list-group-item"><span class="navbar-click">블로그 · SNS 디자인</span></li>
		  	<li class="list-group-item"><span class="navbar-click">게임 · VR</span></li>
		  	<li class="list-group-item"><span class="navbar-click">PPT · 인포그래픽</span></li>
		  	<li class="list-group-item"><span class="navbar-click">일러스트 · 캐리커쳐</span></li>
		  	<li class="list-group-item"><span class="navbar-click">포토샵 · 편집</span></li>
		</ul>
    </div><br>
    <div class="side_list_header" style="border-bottom:2px solid #FFBC42;">
    <h5>IT · 프로그래밍</h5>
    </div>
     <div class="side_list_body">
    	<ul class="list-group list-group-flush">
  			<li class="list-group-item"><span class="navbar-click">중 · 대형 프로젝트</span></li>
  			<li class="list-group-item"><span class="navbar-click">워드프레스</span></li>
		  	<li class="list-group-item"><span class="navbar-click">웹사이트 개발</span></li>
		  	<li class="list-group-item"><span class="navbar-click">쇼핑몰 · 커머스</span></li>
		  	<li class="list-group-item"><span class="navbar-click">모바일앱 · 웹</span></li>
		  	<li class="list-group-item"><span class="navbar-click">프로그램 개발</span></li>
		  	<li class="list-group-item"><span class="navbar-click">임베디드 HW · SW</span></li>
		  	<li class="list-group-item"><span class="navbar-click">게임</span></li>
		  	<li class="list-group-item"><span class="navbar-click">데이터베이스</span></li>
		  	<li class="list-group-item"><span class="navbar-click">블록체인</span></li>
		  	<li class="list-group-item"><span class="navbar-click">보안</span></li>
		</ul>
    </div>
    </nav>

    <!-- Page Features -->	
     <div class="requestList-content" >
      <div class="select-content">
      	<ul>
      		<li><a href="#">기본정렬</a></li>｜<li><a href="#">금액 높은 순</a></li>｜<li><a href="#">시간 순</a></li>
      	</ul>
      </div>
    <div class="row text-center" id="request">
      
       </div>
       <div class="requestList-pageNavi" style="margin: 0 auto; width: 300px; text-align:center; padding-top:100px;">
    	</div>
    	<br><br><br>
    </div>
   
    <!-- /.row -->
	</div>
  </div>
    <script src="/resources/bh/sell-css/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/bh/sell-css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>