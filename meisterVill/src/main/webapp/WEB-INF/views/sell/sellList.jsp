<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 판매글 리스트</title>
  <!-- Bootstrap core CSS -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="/resources/bh/sell-css/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/bh/sell-css/css/heroic-features.css?after" rel="stylesheet">
   <link href="/resources/bh/common-css/common.css" rel="stylesheet">
   <link href="/resources/bh/sell-css/sellList.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script>
  	$(function() {
  		var reqPage = ${reqPage};
  		var memberNo = "${sessionScope.member.memberNo}";
  		var keyWord = "${keyWord}";
  		var sellNo = new Array();
  		if(memberNo != "") {
	  		$.ajax({
				url : "/meister/sell/getPick.do",
				type : "get",
				data : {memberNo : memberNo},
				success : function(data) {
					for(var i = 0; i < data.length; i++) {
						sellNo[i] = data[i];
					}
				}
			});
  		}
  		
  		$.ajax({
  			url : "/meister/sell/getSellList.do?reqPage="+reqPage,
			data : {keyWord : keyWord},
			success : function(data) {
				var number = data["number"];
				html = "";
				page = "";
				for (var i = 0; i < number; i++) {
					html += "<div class='col-lg-3 col-md-6 mb-4'>";
	  				html += "<div class='card' style='height: 400px; cursor:pointer;' onclick='showList("+data["sell"+i].sellNo+");'>";
	  				html += "<div class='imgbox' style='overflow:hidden;' >";
	  				html += "<img class='card-img-top' src='/resources/upload/sellImg/"+data["sell"+i].sellImg+"'>";
	  				html += "</div>";
	  				html += "<c:if test='${not empty sessionScope.member.memberNo}'>";
	  				for (var j = 0; j < sellNo.length; j++) {
	  					if(sellNo[j] == data["sell"+i].sellNo) {
	 						html += "<img class='pick_button' src='/resources/upload/homeImg/InHeart.png' style='cursor:pointer' onclick='pick(this,"+data["sell"+i].sellNo+")'>";
	  					}
	  				}
	  				html += "<img class='pick_button' src='/resources/upload/homeImg/heart.png' style='cursor:pointer' onclick='pick(this,"+data["sell"+i].sellNo+")'>";
	 				html += "<div class='card-body' overflow:hidden; padding: 5px;'>";
	 				html += "<h4 class='card-title'>"+data["member"+i].memberNickname+"</h4>";
	 				html += "<p class='card-text'>"+data["sell"+i].sellTitle+"</p>";
	 				html += "</div>";
	 				html += "</div>";
	 				html += "</div>";
	  				html += "</c:if>";
	  				html += "<c:if test='${empty sessionScope.member.memberNo}'>";
	  				html += "<div class='card-body'>";
	  				html += "<h4 class='card-title'>"+data["member"+i].memberNickname+"</h4>";
	  				html += "<p class='card-text'>"+data["sell"+i].sellTitle+"</p>";
	  				html += "</div>";
	  				html += "</div>";
	  				html += "</div>";
	  				html += "</c:if>";
				}
			page += "<div class='pageNavi'>"+data["pageNavi"]+"</div>";
			$("#sell").append(html);
			$(".sellList-pageNavi").append(page);
		}
  		});
  		$(".navbar-click").click(function() {
  			keyWord = $(this).parent().text();
  			location.href="/meister/employ/showList.do?reqPage=1&&keyWord="+keyWord;
  		});
  	 });
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header2.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <!-- Jumbotron Header -->
    <header class="jumbotron my-4" style="width:1100px; background-image: url('/resources/upload/homeImg/ad3.png'); background-size: cover;" >
    </header>
    <div class="sell-content" style="display:flex; width:1100px">
    <nav class="sell_side_list" style="width:20%; padding-right:25px;">
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
     <div class="sellList-content" style="width:80%" >
       
    <div class="row text-center card-shadow" id="sell">
      <br><br><br><br><br><br><br>
       </div>
       <div class="sellList-pageNavi" style="margin: 0 auto; width: 300px; text-align:center; padding-top:100px;">
    	</div>
    	<br><br><br>
    </div>
    <!-- /.row -->
    
	</div>
  </div>
  <!-- /.container -->
    <!-- Bootstrap core JavaScript -->
  <script src="/resources/bh/sell-css/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/bh/sell-css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
	    
    function pick(get, sellNo) {
    	event.stopPropagation();
    	var memberNo = "${sessionScope.member.memberNo}";
    	if ($(get).attr("src") == "/resources/upload/homeImg/heart.png") {
            $(get).attr("src","/resources/upload/homeImg/InHeart.png");
            $(function() {
		        $.ajax({
			    url : "/meister/sell/pickingSell.do",
                data : {memberNo : memberNo, sellNo : sellNo},
                success : function(data) {
                }
               });
            });   
        } else {
            $(get).attr("src","/resources/upload/homeImg/heart.png");
            $(function() {
		        $.ajax({
			    url : "/meister/sell/canclePickingSell.do",
                data : {sellNo : sellNo, memberNo : memberNo},
                success : function(data) {
                }
               });
            });   
        }
    }
    function showList(sellNo) {
<<<<<<< HEAD
    	location.href="/meister/sell/showList.do?sellNo="+sellNo+"&memberNo="+${sessionScope.member.memberNo};
=======
    	location.href="/meister/sell/showList.do?sellNo=" + sellNo;
>>>>>>> 75497a85e0172d314cf770a424460b4f2fc50671
    }
    </script>
</body>
</html>