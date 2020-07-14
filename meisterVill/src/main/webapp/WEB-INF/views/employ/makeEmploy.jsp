<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="/resources/bh/sell-css/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
  <link href="/resources/bh/sell-css/css/heroic-features.css?after" rel="stylesheet">

<!--데이트피커-->
<link href="/resources/bh/date-picker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker css -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
var detailCate = "";
$(function() {
	$('#inputTitle').keyup(function (e){
	    var content = $(this).val();
	
	    $('#titleCounter').html(content.length);
	    if(content.length > 10) {
	    	$("#checkTitle").css("display","none");
	    } else {
	    	$("#checkTitle").css("display","block");
	    }
	});
	$(".cate-img-div").click(function() {
		$(".cate-img-div").css("border","1px solid #dedede");
		$(this).css("border","1px solid #FFBC42");
		$("input[name=employCategory1]").val($(this).attr("value"));
		if($("input[name=employCategory1]").val() == "it") {
			$("#designDetail").css("display","none");
			$("#itDetail").css("display","block");
		} else {
			$("#itDetail").css("display","none");
			$("#designDetail").css("display","block");
		}
	});
	$("span[class=meta]").click(function() {
		if($(this).css("background-color") == "rgb(255, 188, 66)") {
			$(this).css("background-color","#f2f3f7");
			$(this).removeClass("select");
		} else {
			$(this).css("background-color","#FFBC42");
			$(this).addClass("select");
		}
	});
	$('.form-input-content').keyup(function (e){
        var content = $(this).val();
        $('#contentCounter').html(content.length);
        if(content.length > 1300) {
        	$("#checkTitle").css("display","none");
        } else {
        	$("#checkTitle").css("display","block");
        }
    });
	$(".skill-input").keydown(function(key) {
		if(key.keyCode == 13) {
			 event.preventDefault();
			var value = $(this).val();
			if(value != "") {
				$(this).val("");
				var html = "";
				html += "<span class='meta-skill' onclick='deleteSkill(this);'>"+value+"</span>";
				$(".input-skill-area").append(html);
			}
		}
	});
});
$(function() {
	 $("#projectStartDate").datepicker({
         dateFormat: 'yyyy/mm/dd',
         language: 'ko',
         minDate: new Date()
     });
	 $("#employEndDate").datepicker({
          dateFormat: 'yyyy/mm/dd',
          language: 'ko',
          minDate: new Date()
      });
});

$(function(){
    $(".input-price").on('keyup keydown',function(){
        inputNumberFormat(this);
    });
    $(".input-date").on('keyup keydown',function(){
		var sReturn = cf_getNumberOnly(this.value);
		$(this).val(sReturn);
	});
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
        $("input[name=employPrice]").val(obj.value.replace(/,/g,''));
        console.log($("input[name=employPrice]").val());
    }
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
    function cf_getNumberOnly(str) {
        var len = str.length;
        var sReturn = "";

        for (var i=0; i<len; i++){
            if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
                sReturn += str.charAt(i);
            }
        }
        return sReturn;
    }
});

    
function deleteSkill(get) {
	get.remove();
}
function checkNext1() {
	if($("#checkTitle").css("display") == "none" && $("input[name=employCategory1]").val() ) {
		var span = $("span[class='meta select']");
		for(var i = 0; i < span.length; i++) {
			if(i == span.length-1) {
				detailCate += span[i].innerText;
			} else {
				detailCate += span[i].innerText+" / ";
				}
			}
		$("input[name=employCategory2]").val(detailCate);
		$("#first").css("display","none");
  		$("#second").css("display","block");
  	}
}
function checkPre2() {
  	$(this).css("display","none");
  	$("#first").css("display","block");
  	$("#second").css("display","none");
  }
function checkNext2() {
	var data = "";
	var valueSkill = $("span[class=meta-skill]");
	console.log(valueSkill.length);
	if (valueSkill.length == 0) {
		$(".skill-input").focus();
		return;
	}
	
	var valueContent = $(".form-input-content").val();
	valueContent = valueContent.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	
	for(var i=0; i < valueSkill.length; i++) {
		if(i == valueSkill.length-1) {
			data += valueSkill[i].innerText;
		} else {
			data += valueSkill[i].innerText+"/";
		}
	}
	$("input[name=employContent]").val(valueContent);
	$("input[name=employSkill]").val(data);
	$("#third").css("display","block");
  	$("#second").css("display","none");
}
function checkPre3() {
  	$(this).css("display","none");
  	$("#second").css("display","block");
  	$("#third").css("display","none");
  }
function checkFinish() {
	var inputDate = $(".input-date");
	var inputPrice = $(".input-price");
	if(inputPrice.val() == "") {
		$(".input-price").focus();
		return;
	} else {
		for(var i = 0; i < inputDate.length; i++) {
			if(inputDate[i].value == "") {
				inputDate[i].focus();
				return;
			}	
		}
	} 
	$("#myBtn").trigger("click");
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header2.jsp"/>
  <link href="/resources/bh/common-css/common.css" rel="stylesheet">
  <link href="/resources/bh/sell-css/makeSell.css" rel="stylesheet">
  <script src="/resources/bh/date-picker/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/resources/bh/date-picker/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
<form action="/meister/employ/insertProject.do" method="post" id="projectForm" >
 <div class="container">
 <header class="jumbotron my-4" style="width:1100px; background-image: url('/resources/upload/homeImg/ad2.png'); background-size: cover;" >
    </header>

<button id="myBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#employModal" style="display:none;">
  </button>
<div class="employ-content card-shadow ">
<div class="col-xs-9" id="first">
<div class="panel">
<ul class="list-style">
<li>
<div class="row" style="padding:10px;" >
<div class="col-xs-3">
<p class="fo-we-bo">프로젝트 제목</p>
</div>
<div class="col-xs-9">
<div>
<div class="wrap">
<input type="text" id="inputTitle" name="employTitle" class="form-control border-radius-0" maxlength="30" style="border-radius:0; height:50px;"placeholder="예)B2B 미디어 커머스 모바일 플랫폼 구축">
<input name="employCategory1" style="display:none;">
<input name="employCategory2" style="display:none;">
<input name="employContent" style="display:none;">
<input name="employSkill" style="display:none;">
</div>
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkTitle" style="color:red; font-size:12px;"><img class="reportImg" src="/resources/upload/homeImg/report.png">&nbsp;최소 10글자 이상 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="titleCounter"></span>
&nbsp;/&nbsp;30글자수
</div></div></div></div></div>
</li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-12">
<p class="fo-we-bo" style="margin-bottom:0px;">프로젝트 카테고리</p>
<span class="fo-si-13">해당하는 카테고리를 입력해주세요.</span>
</div>
<div class="col-xs-12" style="display:flex;margin-top:30px;">
<div class="cate-img">
<div class="cate-img-div" value="it">
<img src="/resources/upload/homeImg/itImg.png">
</div>
</div>
<div class="cate-img">
<div class="cate-img-div" value="design">
<img src="/resources/upload/homeImg/design.png">
</div>
</div>
</div>
<br><br>
<div class="cate-detail-area" style="margin-top: 20px;">
<div id="itDetail">
	<span name="" class="meta">중 · 대형 프로젝트</span>
	<span class="meta">워드프레스</span>
	<span class="meta">웹사이트 개발</span>
	<span class="meta">쇼핑몰 · 커머스</span>
	<span class="meta">모바일앱 · 웹</span>
	<span class="meta">프로그램 개발</span>
	<span class="meta">임베디드 HW · SW</span>
	<span class="meta">게임</span>
	<span class="meta">데이터베이스</span>
	<span class="meta">블록체인</span>
	<span class="meta">보안</span>
</div>
<div id="designDetail">
	<span class="meta">로고 · 브랜딩</span>
	<span class="meta">북 · 앨범디자인</span>
	<span class="meta">공간디자인</span>
	<span class="meta">웹 · 모바일 디자인</span>
	<span class="meta">상세 · 랜딩페이지</span>
	<span class="meta">블로그 · SNS 디자인</span>
	<span class="meta">게임 · VR</span>
	<span class="meta">PPT · 인포그래픽</span>
	<span class="meta">일러스트 · 캐리커쳐</span>
	<span class="meta">포토샵 · 편집</span>
</div>
</div>
</div>
</li>
</ul>
</div>
<div style="width:100%; padding:20px;">
<button type="button" class="btn btn-lg next-button" onclick="checkNext1();">다음 단계</button>
</div>
</div>
<div class="col-xs-9" id="second" style="display:none;">
<div class="panel">
<ul class="list-style">
<li><div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">상세 업무 내용</p>
</div>
<div class="col-xs-9">
<div style="display:grid;">
<span class="fo-si-13">업무 내용을 상세하게 적성해주실수록, 더 적합한 파트너를 만날 수 있습니다.</span>
<span class="fo-si-13">파트너가 알아야 할 유의사항(필수 사항, 전문 경험 등)도 함께 작성해주세요.</span>
</div>
<br>
<div class="form-content">
<textarea class="form-input-content"wrap="hard"  maxlength="1300">
<프로젝트의 현재 상황>
예시) 프로젝트의 목적, 현재 준비 상황, 진행 계획 등

<상세한 업무 내용>
예시) 앱의 용도, Android? iOS?, 작업 분량, 주요 기능 List, 필요한 조건 등

<참고자료 / 유의사항>
예시) 참고 앱, 기타 유의사항 등
</textarea>
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkContent" style="color:#4D4D4D; font-size:12px;">&nbsp;1300자 이내로 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="contentCounter"></span>
&nbsp;/&nbsp;최소 1300글자
</div>
</div>
</div>
</div>
</div></li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">관련 기술</p>
</div>
<div class="col-xs-9">
<div style="display:grid;">
<span class="fo-si-12">더 적합한 파트너가 프로젝트를 찾고 지원할 수 있도록 프로젝트와 관련된 기술을 입력해주세요.</span>
</div>
<div>
<input type="text" placeholder="추가할 기술을 입력해주세요." class="skill-input">
</div>
<div class="input-skill-area" style="display:inline-block;"></div>
</div>
</div>
</li>
</ul>
</div>
<div style="width:100%; padding:20px; display:flex;">
<div style="width:50%;">
<button type="button" class="btn btn-lg pre-button" onclick="checkPre2();">이전 단계</button>
</div>
<div style="width:50%;">
<button type="button" class="btn btn-lg next-button" onclick="checkNext2();">다음 단계</button>
</div>
</div>
</div><!--second finish-->
<div class="col-xs-9" id="third" style="display:none;">
<div class="panel">
<ul class="list-style">
<li><div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">지출 가능 예산</p>
</div>
<div class="col-xs-9">
<span class="fo-si-13">프로젝트에 지출 가능한 예산을 입력해 주세요.</span>
<span class="fo-si-13" style="display:flex; position:relative;"><input type="text" class="input-price"><input type="text" name="employPrice" style="display:none;"><span class="input-won">원</span></span>
</div>
</div></li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">예상 시작일</p>
</div>
<div class="col-xs-9" style="display:grid;">
<span class="fo-si-13">파트너가 프로젝트에 착수하는 날짜입니다.</span>
<span class="fo-si-13">해당 날짜에 프로젝트 시작이 가능한 파트너들이 지원하게 됩니다.</span>
<div class="select-date-area">
<span class="fo-si-13" style="display:flex; position:relative;"><input type="text" id="projectStartDate" name="employStartDate" class="input-date"><span class="input-won">일</span></span>
</div>
</div>
</div>
</li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">예상 진행 기간</p>
</div>
<div class="col-xs-9">
<span class="fo-si-13">프로젝트 진행 기간을 입력해 주세요.</span>
<span class="fo-si-13" style="display:flex; position:relative;"><input type="text" name="employPeriod" class="input-date"><span class="input-won">일</span></span>
</div>
</div>
</li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">지원자 모집 마감일</p>
</div>
<div class="col-xs-9" style="display:grid;">
<span class="fo-si-13">지원자를 모집하는 기간은 최대 14일까지 가능합니다.</span>
<span class="fo-si-13">지원자 모집 기간 중에도 파트너 선정과 계약 진행이 가능합니다.</span>
<span class="fo-si-13" style="display:flex; position:relative;"><input type="text" id="employEndDate" name="employBoardEnd" class="input-date"><span class="input-won">일</span></span>
<input type="text" name="employWriter" value="${sessionScope.member.memberNo }" style="display:none;">
</div>
</div>
</li>

</ul>
</div>
<div style="width:100%; padding:20px; display:flex;">
<div style="width:50%;">
<button type="button" class="btn btn-lg pre-button" onclick="checkPre3();">이전 단계</button>
</div>
<div style="width:50%;">
<button type="button" class="btn btn-lg next-button" onclick="checkFinish();">작성 완료</button>
</div>
</div>
</div>

</div>
</div>
<jsp:include page="/WEB-INF/views/employ/employFinishModal.jsp"/>
</form>
<br><br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>