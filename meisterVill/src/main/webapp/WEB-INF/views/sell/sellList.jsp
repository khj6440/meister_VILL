<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 판매글 리스트</title>
  <!-- Bootstrap core CSS -->
  <link href="/resources/sell-css/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/sell-css/css/heroic-features.css?after" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
 		.pick_button {
 			position: absolute;
 			right: 5px;
 			top: 5px;
 			height: 25px;
 		}
 		.btn {
 			border: 1px solid #eeeeee;
 		}
 		.btn:hover {
 			color : #7DC947;
 		}
 		.selectPage {
 			border: 1px solid #eeeeee;
 			font-weight : bold;
 			padding : 12px;
 			padding-top : 6px;
 			padding-botton : 6px;
 		}
 		.card-img-top{
 			transform: scale(1);
			-webkit-transform: scale(1);
			-moz-transform: scale(1);
			-ms-transform: scale(1);
			-o-transform: scale(1);
			transition: all 0.3s ease-in-out; 
		}
		.card-img-top:hover {
			transform: scale(1.2);
			-webkit-transform: scale(1.2);
			-moz-transform: scale(1.2);
			-ms-transform: scale(1.2);
			-o-transform: scale(1.2);
		}
		a {
			color:black;
		}
</style>
  <script>
  	$(function() {
  		var reqPage = ${reqPage};
  		$.ajax({
  			url : "/meister/sell/getSellList.do?reqPage="+reqPage,
			data : "json",
			success : function(data) {
				var number = data["number"];
				html = "";
				page = "";
				for (var i = 0; i < number; i++) {
  				html += "<div class='col-lg-3 col-md-6 mb-4'>";
  				html += "<div class='card' style='height: 400px; cursor:pointer;' onclick='showList("+data["sell"+i].sellNo+");'>";
  				html += "<div class='imgbox' style='overflow:hidden;'>";
  				html += "<img class='card-img-top' src='/resources/upload/sellImg/"+data["sell"+i].sellImg+"'>";
  				html += "</div>";
  				html += "<c:if test='${not empty sessionScope.member.memberNo}'>";
  				html += "<img class='pick_button' id='pick' src='/resources/upload/homeImg/heart.png' style='cursor:pointer' onclick='pick(this,"+data["sell"+i].sellNo+")'>";
  				html += "<div class='card-body'>";
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
  	 });
  </script>
</head>
<body>
  <!-- Page Content -->
  <div class="container">
    <!-- Jumbotron Header -->
    <header class="jumbotron my-4" style="width:1100px">
    </header>
    <div class="sell-content" style="display:flex; width:1100px">
    <nav class="sell_side_list" style="width:20%; padding-right:15px;">
    <div class="side_list_header" style="border-bottom:2px solid #FFBC42;">
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
    <div class="side_list_header" style="border-bottom:2px solid #FFBC42;">
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
     <div class="sellList-content" style="width:80%" >
       
    <div class="row text-center" id="sell">
      
       </div>
       <div class="sellList-pageNavi" style="margin: 0 auto; width: 300px; text-align:center; padding-top:100px;">
    
    	</div>
    </div>
   
    <!-- /.row -->
	</div>
  </div>
  <!-- /.container -->
    <!-- Bootstrap core JavaScript -->
  <script src="/resources/sell-css/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/sell-css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
    function showList(sellNo) {
    	location.href="/meister/sell/showList.do?sellNo=" + sellNo;
    }
    </script>
</body>
</html>