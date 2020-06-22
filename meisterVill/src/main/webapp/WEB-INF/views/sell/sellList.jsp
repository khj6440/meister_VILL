<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 판매글 리스트</title>
  <!-- Bootstrap core CSS -->
 
  <link href="/sell-css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/sell-css/css/heroic-features.css" rel="stylesheet">
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
   <style>
   		 .pick_button {
   			position: absolute;
   			right: 5px;
   			top: 5px;
   			height: 25px;
   		}
   </style>
  <script>
  	$(function() {
  		$.ajax({
  			url : "/meister/sell/getSellList.do",
			data : "json",
			success : function(data) {
				var number = data["number"];
				html = "";
				for (var i = 0; i < number; i++) {
  				html += "<div class='col-lg-3 col-md-6 mb-4'>";
  				html += "<div class='card' style='height: 400px;'>";
  				html += "<img class='card-img-top' src='/resources/upload/sellImg/"+data["sell"+i].sellImg+"'>";
  				html += "<img class='pick_button' id='pick' src='/resources/upload/homeImg/heart.png' style='cursor:pointer' onclick='pick(this,"+data["sell"+i].sellNo+")'>";
  				html += "<div class='card-body'>";
  				html += "<h4 class='card-title'>"+data["member"+i].memberNickname+"</h4>";
  				html += "<p class='card-text'>"+data["sell"+i].sellTitle+"</p>";
  				html += "</div>";
  				html += "</div>";
  				html += "</div>";
			}
			$("#sell").append(html);
		}
  		});
  	 });
  </script>
</head>
<body>
  <!-- Page Content -->
  <div class="container">
    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
    </header>
    <div class="sell_content" style="display:flex">
    <nav class="sell_side_list" style="width:20%">
    <div class="side_list_header">
    <h5>디자인</h5>
    </div>
    <div class="side_list_body">
    	<ul class="list-group list-group-flush">
  			<li class="list-group-item"><a href="#">로고 · 브랜딩</a></li>
  			<li class="list-group-item"><a href="#">북 · 앨범디자인</a></li>
		  	<li class="list-group-item"><a href="#">공간디자인</a></li>
		  	<li class="list-group-item"><a href="#">웹 · 모바일 디자인</a></li>
		  	<li class="list-group-item"><a href="#">상세 · 랜딩페이지</a></li>
		  	<li class="list-group-item"><a href="#">블로그 · SNS 디자인</a></li>
		  	<li class="list-group-item"><a href="#">게임 · VR</a></li>
		  	<li class="list-group-item"><a href="#">PPT · 인포그래픽</a></li>
		  	<li class="list-group-item"><a href="#">일러스트 · 캐리커쳐</a></li>
		  	<li class="list-group-item"><a href="#">포토샵 · 편집</a></li>
		</ul>
    </div><br>
    <div class="side_list_header">
    <h5>IT · 프로그래밍</h5>
    </div>
     <div class="side_list_body">
    	<ul class="list-group list-group-flush">
  			<li class="list-group-item"><a href="#">중 · 대형 프로젝트</a></li>
  			<li class="list-group-item"><a href="#">워드프레스</a></li>
		  	<li class="list-group-item"><a href="#">웹사이트 개발</a></li>
		  	<li class="list-group-item"><a href="#">쇼핑몰 · 커머스</a></li>
		  	<li class="list-group-item"><a href="#">모바일앱 · 웹</a></li>
		  	<li class="list-group-item"><a href="#">프로그램 개발</a></li>
		  	<li class="list-group-item"><a href="#">임베디드 HW · SW</a></li>
		  	<li class="list-group-item"><a href="#">게임</a></li>
		  	<li class="list-group-item"><a href="#">데이터베이스</a></li>
		  	<li class="list-group-item"><a href="#">블록체인</a></li>
		  	<li class="list-group-item"><a href="#">보안</a></li>
		</ul>
    </div>
    </nav>

    <!-- Page Features -->	
    <div class="row text-center" style="width:80%" id="sell">
      
    </div>
    <!-- /.row -->
	</div>
  </div>
  <!-- /.container -->
    <!-- Bootstrap core JavaScript -->
  <script src="/sell-css/vendor/jquery/jquery.min.js"></script>
  <script src="/sell-css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
    function pick(get,no) {
        if ($(get).attr("src") == "/resources/upload/homeImg/heart.png") {
            $(get).attr("src","/resources/upload/homeImg/InHeart.png");
            $(function() {
		        $.ajax({
			    url : "/meister/sell/pickList.do",
                data : {no : no},
                success : function(data) {
                	
                }
               });
            });   
        } else {
            $(get).attr("src","/resources/upload/homeImg/heart.png");
            $(function() {
		        $.ajax({
			    url : "/meister/sell/deletePickList.do",
                data : {no : no},
                success : function(data) {
                	
                }
               });
            });   
        }
    }
    </script>
</body>
</html>