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
  <link href="/resources/bh/sell-css/css/heroic-features.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
var detailCate = "";
$(function() {
	<!-- 제목 -->
	$('#inputTitle').keyup(function (e){
	    var content = $(this).val();
	    $('#titleCounter').html(content.length);
	    if(content.length > 10) {
	    	$("#checkTitle").css("display","none");
	    } else {
	    	$("#checkTitle").css("display","block");
	    }
		$('#inputTitle').focusout(function() {
			var content = $(this).val();
			if(content.length > 10) {
			$("#insertTitle").html("· " + content);
			}
		});
	});
	$("input[name=requestProjectEnd]").keyup(function() {
		  var content = $(this).val();
		  $("#insertProjectEnd").html(content + " 일");
	});
	 $("input[name=requestBoardEnd]").focusout(function() {
		  var content = $(this).val();
		  $("#insertBoardEnd").html(content + " 일");
	});
	
	
	$("#cate1").change(function() {
  		if (this.value == "IT개발") {
  			$("#insertCate1").html("· IT개발");
  			$("#itCate2").css("display","block");
  			$("#insertCate2").html($("#itCate2").val());
  			$("#desingCate2").css("display","none");
  		} else {
  			$("#insertCate1").html("· 디자인");
  			$("#desingCate2").css("display","block");
  			$("#itCate2").css("display","none");
  			 $("#insertCate2").html($("#desingCate2").val());
  		}
  	});
	$("#desingCate2").change(function() {
		$("#insertCate2").html($("#desingCate2").val());
  	});
	
	$("#itCate2").change(function() {
		 $("#insertCate2").html($("#itCate2").val());
	});
	$("#requestNow").change(function() {
		 $("#insertNow").html($(this).val());
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
	$('.form-input-wantform').keyup(function (e){
        var content = $(this).val();
        $('#contentWantform').html(content.length);
        if(content.length > 10) {
	    	$("#checkWantform").css("display","none");
	    } else {
	    	$("#checkWantform").css("display","block");
	    }
    });
	$('.form-input-wantskill').keyup(function (e){
        var content = $(this).val();
        $('#contentWantskill').html(content.length);
        if(content.length > 10) {
	    	$("#checkWantskill").css("display","none");
	    } else {
	    	$("#checkWantskill").css("display","block");
	    }
    });
	
});

function checkNext1() {
	if($("#insertCate1").html() == "") {
		$("#insertCate1").html("· 디자인");
	}
	if($("#insertCate2").html() == "") {
		$("#insertCate2").html("· 로고 · 브랜딩");
	}
	if($("#cate1").val() == "design") {
		  $("input[name=requestCategory2]").val($("#desingCate2").val());
	   } else {
		   $("input[name=requestCategory2]").val($("#itCate2").val());
	   }
	if($("#checkTitle").css("display") == "none") {
  		$("#first").css("display","none");
  		$("#second").css("display","block");
  	}
  } 
	  

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
        $("input[name=requestPrice]").val(obj.value.replace(/,/g,''));
       $("#insertPrice").html(obj.value + " 원");
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

    
function checkPre2() {
  	$(this).css("display","none");
  	$("#first").css("display","block");
  	$("#second").css("display","none");
  }
function checkNext2() {
	var data = "";
	var valueContent = $(".form-input-content").val();
	var valueNow = $("#requestNow").val();
	valueContent = valueContent.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$("#insertNow").html(valueNow);
	$("#contentCheck").css("display","inline");
	$("input[name=requestContent]").val(valueContent);
	$("#third").css("display","block");
  	$("#second").css("display","none");
}
function checkPre3() {
  	$(this).css("display","none");
  	$("#second").css("display","block");
  	$("#third").css("display","none");
  }
function checkNext3() {
	if($("#checkWantform").css("display") == "none" && $("#checkWantskill").css("display") == "none") {
	var valueWantform = $(".form-input-wantform").val();
	var valueWantskill = $(".form-input-wantskill").val();
	valueWantform = valueWantform.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$("input[name=requestWantform]").val(valueWantform);
	$("input[name=requestWantskill]").val(valueWantskill);
	
	$("#formCheck").css("display","inline");
	$("#skillCheck").css("display","inline");
	$("#fourth").css("display","block");
  	$("#third").css("display","none");
	}
}
function checkPre4() {
  	$(this).css("display","none");
  	$("#third").css("display","block");
  	$("#fourth").css("display","none");
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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <link href="/resources/bh/common-css/common.css" rel="stylesheet">
  <link href="/resources/bh/sell-css/makeSell.css" rel="stylesheet">
<form action="/meister/request/insertRequest.do" method="post" id="requestForm" >
 <div class="container">
 <header class="jumbotron my-4" style="width:1100px; background-image: url('/resources/upload/homeImg/ad2.png'); background-size: cover;" >
    </header>
<button id="myBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#requestModal" style="display:none;">
  </button>
<div class="employ-content card-shadow" style="display:flex; width:1100px;">
<div class="col-xs-9" id="first">
<div class="panel">
<ul class="list-style">
<li>
<div class="row" style="padding:10px;" >
<div class="col-xs-3">
<p class="fo-we-bo">서비스 제목</p>
</div>
<div class="col-xs-9">
<div>
<div class="wrap">
<input type="text" id="inputTitle" name="requestTitle" class="form-control border-radius-0" maxlength="30" style="border-radius:0; height:50px;"placeholder="예)B2B 미디어 커머스 모바일 플랫폼 구축">
<input type="text" name="requestContent" style="display:none;">
<input type="text" name="requestCategory2" style="display:none;">
<input type="text" name="requestWantform" style="display:none;">
<input type="text" name="requestWantskill" style="display:none;">
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
<div class="col-xs-3">
<p class="fo-we-bo">카테고리</p>
</div>
<div class="col-xs-9">
<div class="row">
<div class="col-xs-6">
<div class="font-gray" style="text-align:left;"><p class="fo-we-bo">상위 카테고리</p></div>
<div class="select-control" style="margin-top: 10px;">
<select id="cate1" name="requestCategory1" class="input-sm" style="width:80%; height:40px; border: 1px solid #e6e6e6; font-size:14px;">
<option value="디자인">디자인</option>
<option value="IT개발">IT · 프로그래밍</option>
</select>
</div></div>
<div class="col-xs-6">
<div class="font-gray" style="text-align:left;"><p class="fo-we-bo">하위 카테고리</p></div>
<div class="select-control" style="margin-top: 10px;">
<select id="desingCate2" class="input-sm" style="width:80%; height:40px; border: 1px solid #e6e6e6; font-size:14px;">
<option value="로고 · 브랜딩">로고 · 브랜딩</option>
<option value="북 · 앨범디자인">북 · 앨범디자인</option>
<option value="공간디자인">공간디자인</option>
<option value="웹 · 모바일디자인">웹 · 모바일디자인</option>
<option value="상세 · 랜딩디자인">상세 · 랜딩디자인</option>
<option value="블로그 · SNS 디자인">블로그 · SNS 디자인</option>
<option value="게임 · VR">게임 · VR</option>
<option value="PPT · 인포그래픽">PPT · 인포그래픽</option>
<option value="일러스트 · 캐리커쳐">일러스트 · 캐리커쳐</option>
<option value="포토샵 · 편집">포토샵 · 편집</option>
</select>
<select id="itCate2"  class="input-sm" style="width:80%; height:40px; border: 1px solid #e6e6e6; display:none; font-size:14px;">
<option value="중· 대형 프로젝트">중· 대형 프로젝트</option>
<option value="워드프레스">워드프레스</option>
<option value="웹사이트 개발">웹사이트 개발</option>
<option value="쇼핑몰 · 커머스">쇼핑몰 · 커머스</option>
<option value="모바일 · 웹">모바일 · 웹</option>
<option value="프로그램 개발">프로그램 개발</option>
<option value="임베디드 HW · SW">임베디드 HW · SW</option>
<option value="게임">게임</option>
<option value="데이터베이스">데이터베이스</option>
<option value="블록체인">블록체인</option>
<option value="보안">보안</option>
</select>
</div></div>
</div></div></div>
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
<p class="fo-we-bo">구체적 내용</p>
</div>
<div class="col-xs-9">
<div style="display:grid;">
<span class="fo-si-15 fo-we-bo">의뢰 사항을 구체적으로 설명해 주세요.</span>
<span class="fo-si-13">파트너가 알아야 할 유의사항(필수 사항, 전문 경험 등)도 함께 작성해주세요.</span>
</div>
<div class="form-content">
<textarea class="form-input-content"  maxlength="1300">
· 보다 정확한 견적을 위해 기능을 상세하게 작성해주세요.

· 필요한 개발언어나 개발환경을 작성해주세요.

· 연락처 기입 시 의뢰서 승인이 보류될 수 있습니다.
</textarea>
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkContent" style="color:#4D4D4D; font-size:12px;">&nbsp;1300자 이내로 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="contentCounter"></span>
&nbsp;/&nbsp;최대 1300글자
</div>
</div>
</div>
</div>
</div></li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">프로젝트 진행 상태</p>
</div>
<div class="col-xs-9">
<div style="display:grid;">
<span class="fo-si-13">프로젝트의 진행상황을 선택해주세요.</span>
</div>
<div>
<select id="requestNow" name="requestNow" class="input-sm" style="width:100%; height:40px; border: 1px solid #e6e6e6; font-size:17px;">
<option value="아이디어만 있음">아이디어만 있음</option>
<option value="기획서 보류">기획서 보류</option>
<option value="디자인 보유">디자인 보유</option>
<option value="개발환경 보유">개발환경 보유</option>
</select>
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
<p class="fo-we-bo">원하는 형태</p>
</div>
<div class="col-xs-9">
<div style="display:grid;">
<span class="fo-si-15 fo-we-bo">원하는 형태의 결과물을 작성해주세요.</span>
<span class="fo-si-13">필요한 기능이나 꼭 추가해야하는 부분이 있다면 적어주세요.</span>
</div>
<div class="form-content">
<textarea class="form-input-wantform"  maxlength="100">
</textarea>
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkWantform" style="color:red; font-size:12px;"><img class="reportImg" src="/resources/upload/homeImg/report.png">&nbsp;최소 10글자 이상 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="contentWantform"></span>
&nbsp;/&nbsp;최대 100글자
</div>
</div>
</div>
</div>
</div></li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">원하는 기능</p>
</div>
<div class="col-xs-9">
<div style="display:grid;">
<span class="fo-si-15 fo-we-bo">원하는 기능을 나열해주세요.</span>
</div>
<div class="form-content">
<input class="form-input-wantskill"  maxlength="30">
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkWantskill" style="color:red; font-size:12px;"><img class="reportImg" src="/resources/upload/homeImg/report.png">&nbsp;최소 10글자 이상 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="contentWantskill"></span>
&nbsp;/&nbsp;최대 30글자
</div>
</div>
</div>
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
<button type="button" class="btn btn-lg next-button" onclick="checkNext3();">다음 단계</button>
</div>
</div>
</div><!--second finish-->







<div class="col-xs-9" id="fourth" style="display:none;">
<div class="panel">
<ul class="list-style">
<li><div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">지출 가능 예산</p>
</div>
<div class="col-xs-9">
<span class="fo-si-13">견적에 지출 가능한 예산을 입력해 주세요.</span>
<span class="fo-si-13" style="display:flex; position:relative;"><input type="text" class="input-price"><input type="text" name="requestPrice" style="display:none;"><span class="input-won">원</span></span>
</div>
</div></li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">예상 진행 기간</p>
</div>
<div class="col-xs-9">
<span class="fo-si-13">프로젝트 진행 기간을 입력해 주세요.</span>
<span class="fo-si-13" style="display:flex; position:relative;"><input type="text" name="requestProjectEnd" class="input-date"><span class="input-won">일</span></span>
</div>
</div>
</li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">마이스터 모집 마감일</p>
</div>
<div class="col-xs-9" style="display:grid;">
<span class="fo-si-13">마이스터 모집 기간 중에도 파트너 선정과 계약 진행이 가능합니다.</span>
<span class="fo-si-13" style="display:flex; position:relative;"><input type="text" id="employEndDate" name="requestBoardEnd" class="input-date"><span class="input-won">일</span></span>
<input type="text" name="requestWriter" value="${sessionScope.member.memberNickname }" style="display:none;">
</div>
</div>
</li>

</ul>
</div>
<div style="width:100%; padding:20px; display:flex;">
<div style="width:50%;">
<button type="button" class="btn btn-lg pre-button" onclick="checkPre4();">이전 단계</button>
</div>
<div style="width:50%;">
<button type="button" class="btn btn-lg next-button" onclick="checkFinish();">작성 완료</button>
</div>
</div>
</div>

<div class="col-xs-3" id="checkInsert">
<span class="fo-si-12 fo-color">서비스 제목</span>
<div class="insert-now" id="insertTitle">
</div>
<span class="fo-si-12 fo-color">상위 카테고리</span>
<div class="insert-now" id="insertCate1"></div>
<span class="fo-si-12 fo-color">하위 카테고리</span>
<div class="insert-now" id="insertCate2"></div>
<hr>
<span class="fo-si-12 fo-color"><img id="contentCheck" src="/resources/upload/homeImg/check.png" style="display:none; width:9px;margin-right:5px;margin-bottom:3px;">내용</span>
<div class="insert-now" id="insertContent">
</div>
<span class="fo-si-12 fo-color">프로젝트 진행 상태</span>
<div class="insert-now" id="insertNow">
</div>
<hr>
<span class="fo-si-12 fo-color"><img id="formCheck" src="/resources/upload/homeImg/check.png" style="display:none; width:9px;margin-right:5px;margin-bottom:3px;">원하는 형태</span>
<div class="insert-now" id="insertWantform">
</div>
<span class="fo-si-12 fo-color"><img id="skillCheck" src="/resources/upload/homeImg/check.png" style="display:none; width:9px;margin-right:5px;margin-bottom:3px;">원하는 기술</span>
<div class="insert-now" id="insertWantskill">
</div>
<hr>
<span class="fo-si-12 fo-color">예산</span>
<div class="insert-now" id="insertPrice">
</div>
<span class="fo-si-12 fo-color">예상 진행 일 수</span>
<div class="insert-now" id="insertProjectEnd">
</div>
<span class="fo-si-12 fo-color">지원자 마감일</span>
<div class="insert-now" id="insertBoardEnd">
</div>
<hr>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/request/requestFinishModal.jsp"/>
</form>

</body>

</html>