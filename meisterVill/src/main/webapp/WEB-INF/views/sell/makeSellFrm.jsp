<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매글 작성</title>
  <!-- Bootstrap core CSS -->
  <link href="/resources/bh/sell-css/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/bh/sell-css/css/heroic-features.css?after" rel="stylesheet">
  <link href="/resources/bh/sell-css/makeSell.css" rel="stylesheet">
   <link href="/resources/bh/common-css/common.css" rel="stylesheet">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script>
  /**
   * 
   */

  var price = false;
  var fix = false;
  var period = false;
  var opt = true;
  var optCount = 0;
  var fileNum = 0;
  $(function() {
	$("#uploadImg").on("change", handleImgFileSelect);
  	$("#cate1").change(function() {
  		if (this.value == "it") {
  			$("#itCate2").css("display","block");
  			$("#desingCate2").css("display","none");
  		} else {
  			$("#desingCate2").css("display","block");
  			$("#itCate2").css("display","none");
  		}
  	});
  	$('#inputTitle').keyup(function (e){
          var content = $(this).val();

          $('#titleCounter').html(content.length);
          if(content.length > 10) {
          	$("#checkTitle").css("display","none");
          } else {
          	$("#checkTitle").css("display","block");
          }
      });
  	$('#inputContent').keyup(function (e){
  	    var content = $(this).val();
  	    $('#contentCounter').html(content.length);
  	    if(content.length > 100) {
  	    	$("#checkContent").css("display","none");
  	    } else {
  	    	$("#checkContent").css("display","block");
  	    }
  	});
  	$('#inputFix').keyup(function (e){
  	    var content = $(this).val();
  	    $('#remakeCounter').html(content.length);
  	    if(content.length > 20) {
  	    	$("#checkRemake").css("display","none");
  	    } else {
  	    	$("#checkRemake").css("display","block");
  	    }
  	});
      $("#priceBox").blur(function(){
      	if($(this).val() >= 5000) {
      		price = true;
      		$(this).css("border","1px solid #e6e6e6");
      	} else {
      		$(this).css("border","1px solid red");
      	}
      });
      $("#fixBox").blur(function(){
      	if($(this).val() >= 1 || $(this).val() == "0") {
      		fix = true;
      		$(this).css("border","1px solid #e6e6e6");
      		$("#fixSpan").css("display","none");
      	} else {
      		$(this).css("border","1px solid red");
      		$("#fixSpan").css("display","inline");
      	}
      });
      $("#periodBox").blur(function(){
      	if($(this).val() >= 1) {
      		period = true;
      		$(this).css("border","1px solid #e6e6e6");
      		$("#periodSpan").css("display","none");
      	} else {
      		$(this).css("border","1px solid red");
      		$("#periodSpan").css("display","inline");
      	}
      });
  });
   function checkNext1() {
	   var valueSkill = $("span[class=meta-skill]");
	   var data = "";
	   if($("#cate1").val() == "design") {
		  $("input[name=sellCategory2]").val($("#desingCate2").val());
	   } else {
		   $("input[name=sellCategory2]").val(("#itCate2").val());
	   }
	   for(var i=0; i < valueSkill.length; i++) {
			if(i == valueSkill.length-1) {
				data += valueSkill[i].innerText;
			} else {
				data += valueSkill[i].innerText+"/";
			}
		}
		
  	if($("#checkTitle").css("display") == "none") {
  		if (valueSkill.length == 0) {
			$(".skill-input").focus();
			return;
		}
  		$("input[name=sellSkill]").val(data);
  		$("#first").css("display","none");
  		$("#second").css("display","block");
  	}
  } 
  function checkPre2() {
  	$(this).css("display","none");
  	$("#first").css("display","block");
  	$("#second").css("display","none");
  }
  $(document).ready(function() {
  	$(".option-title").bind("blur", function() {
  		$(".option-title").blur();
  	});
  	$(".option-content").bind("blur", function() {
  		$(".option-title").blur();
  	});
  	$(".option-price").bind("blur", function() {
  		$(".option-title").blur();
  	});
  	$(".option-period").bind("blur", function() {
  		$(".option-title").blur();
  	});
  });
  function checkNext2() {
  	if(price == false) {
  		$("#priceBox").css("border","1px solid red");
  	} else {
  		$("#priceBox").css("border","1px solid #e6e6e6;");
  	}
  	if(fix == false) {
  		$("#fixBox").css("border","1px solid red");
  	} else {
  		$("#fixBox").css("border","1px solid #e6e6e6;");
  	}
  	if(period == false) {
  		$("#periodBox").css("border","1px solid red");
  	} else {
  		$("#periodBox").css("border","1px solid #e6e6e6;");
  	}
  	if(opt == false) {
  		$(".option-title").trigger("blur");
  		$(".option-content").trigger("blur");
  		$(".option-price").trigger("blur");
  		$(".option-period").trigger("blur");
  		for (var i = 0; i < $(".option-title").get().length; i++) {
  			if ($(".option-title").get()[i].style.border != "1px solid red" && 
  				$(".option-content").get()[i].style.border != "1px solid red" &&
  				$(".option-price").get()[i].style.border != "1px solid red" &&
  				$(".option-period").get()[i].style.border != "1px solid red" ) {
  				opt = true;
  			} else {
  				opt = false;
  				break;
  			}
  		}
  	}
  
  	if(price == true && fix == true && period && true && opt == true) {
  		if (optCount > 0) {
  			$(function() {
  				var list = new Array();
  				var optionTitle1 = new Array();
  				var optionContent1 = new Array();
  				var optionPrice1 = new Array();
  				var optionPlusDate1 = new Array();
  				for (var i = 0; i < optCount; i++) {
	  				optionTitle1.push($(".option-title")[i].value);
	  				optionContent1.push($(".option-content")[i].value);
	  				optionPrice1.push($(".option-price")[i].value);
	  				optionPlusDate1.push($(".option-period")[i].value);
	  				var sellNo = ${sellNo };
  				}
  				var data = {optionTitle : optionTitle1, optionContent : optionContent1, optionPrice : optionPrice1, optionPlusDate : optionPlusDate1, sellNo : sellNo};
  				 jQuery.ajaxSettings.traditional = true;
  				$.ajax({
  					url : "/meister/sell/insertOpt.do",
  					type : "get",
  					data : data,
  					success : function(data) {
  						if(data == "1") {
  							console.log("옵션 저장 완료");
  							$("#second").css("display","none");
  							$("#third").css("display","block");
  						} else {
  							console.log("저장 오류")
  						}
  					}
  				});
  			});
  		} else {
  			$("#second").css("display","none");
  			$("#third").css("display","block");
  		}
  	} else {
  		console.log("nogo");
  	}
  }

  	function checkNext3() {
    	if($("#checkContent").css("display") == "none" && $("#checkRemake").css("display") == "none") {
    		 var valueContent = $("#inputContent").val();
    		 var valueFix = $("#inputFix").val();
    		valueContent = valueContent.replace(/(?:\r\n|\r|\n)/g, '<br/>');
    		valueFix = valueFix.replace(/(?:\r\n|\r|\n)/g, '<br/>');
    		$("input[name=sellContent]").val(valueContent);
    		$("input[name=sellFix]").val(valueFix);
    		$("#third").css("display","none");
    		$("#fourth").css("display","block");
    	}
    }
    function checkPre3() {
    	$(this).css("display","none");
    	$("#second").css("display","block");
    	$("#third").css("display","none");
    }
    
  function makeOpt() {
  	optCount += 1;
  	opt = false;
  	html4 ="";
  	html4 += "<li><div class='col-xs-4'>맞춤 옵션</div><div class='col-xs-8'>";
  	html4 += "<div style='background-color:#fafafa; border:solid #e6e6e6 1px !important; padding:25px;'>";
  	html4 += "<div class='row'><div class='col-xs-2 opt-cation'>제목</div><div class='col-xs-10'><input type='text' name='optionTitle' class='input-boxs option-box option-title' placeholder='제목을 입력해주세요.' required>";
  	html4 += "<span class='close' onclick='closeOpt(this);' style='position: relative; right: 20px;'>&times;</span>";
  	html4 += "</div></div>";
  	html4 += "<div class='row'><div class='col-xs-2 opt-cation'>설명</div><div class='col-xs-10'><input type='text' name='optionContent' class='input-boxs option-box option-content' placeholder='옵션에 대한 설명을 써주세요.'></div></div>";
  	html4 += "<div class='row'><div class='col-xs-2 opt-cation'>추가금액</div><div class='col-xs-4'><input type='text' name='optionPrice' class='input-boxs option-box opt-price-box option-price' style='width:150px; position:absolute;' placeholder='최소 1000원'><span style='left: 130px; bottom: 6px;' class='input-span'>원</span></div>";
  	html4 += "<div class='col-xs-2' style='font-size:13px; font-weight:bold; padding-left:10px;'>추가작업일</div><div class='col-xs-4'><input type='text' name='optionPlusDate' class='input-boxs option-box option-period' style='width:150px; position:absolute;'><span style='left: 130px; bottom: 6px;' class='input-span'>일</span></div></div>";
  	html4 += "</div></div></li>";
  	$("#more-option-area").append(html4);
  }
  function closeOpt(where) {
  	$(where).parents("li").remove();
  }
  $(document).on("blur",".option-title",function(){
  	if($(this).val() != "") {
  		$(this).css("border","1px solid #e6e6e6");
  	} else {
  		$(this).css("border","1px solid red");
  	}
  });
  $(document).on("blur",".option-content",function(){
  	if($(this).val() != "") {
  		$(this).css("border","1px solid #e6e6e6");
  	} else {
  		$(this).css("border","1px solid red");
  	}
  });
  $(document).on("blur",".option-price",function(){
  	if($(this).val() >= 1000) {
  		$(this).css("border","1px solid #e6e6e6");
  	} else {
  		$(this).css("border","1px solid red");
  	}
  });
  $(document).on("blur",".option-period",function(){
  	if($(this).val() >= 1) {
  		$(this).css("border","1px solid #e6e6e6");
  	} else {
  		$(this).css("border","1px solid red");
  	}
  });
  function insertMainImg() {
  	$("#uploadImg").trigger("click");
  }
  function uploadMultiImg() {
	html = "";
	html += "<input type='file' name='files' style='display:none;' class='files"+fileNum+"'>";
	$("#plusImgArea").append(html);
	$("input[name=files]").on("change", handleImgFileSelect2);
  	$(".files"+fileNum).trigger("click");
  	fileNum += 1;
  }
  function handleImgFileSelect(e) {
	  var files = e.target.files;
	  var filesArr = Array.prototype.slice.call(files);
	  
	  filesArr.forEach(function(f) {
		  if(!f.type.match("image.*")) {
			  alert("이미지 확장자만 가능합니다");
			  return;
		  }
		  var fileSize = files.size;
		  var maxSize = 1024 * 1024;
		  if(fileSize > maxSize) {
		      alert("파일용량을 초과하였습니다.");
		      return;
		  }
		    
		  var file  = files[0];
		  var _URL = window.URL || window.webkitURL;
		  var img = new Image();
		    
		  img.src = _URL.createObjectURL(file);
		  img.onload = function() {
		      if(img.width > 652 || img.height > 488) {
		          alert("이미지 가로 652px, 세로 488px로 맞춰서 올려주세요.");
		          $("input[id=file1]").val("");
		          return;
		      }
		      sel_file = f;
			  var reader = new FileReader();
			  reader.onload = function(e) {
				  $(".main-img").attr("src", e.target.result);
			  }
			  reader.readAsDataURL(f);
		  }
	  });
  }
  var imgNum = 0;
  var divNum = 0;
  var fileNames ="";
  var fileArr="";
  function handleImgFileSelect2(e) {
	  var files = e.target.files;
	  var filesArr = Array.prototype.slice.call(files);
	  
	  filesArr.forEach(function(f) {
		  if(!f.type.match("image.*")) {
			  alert("이미지 확장자만 가능합니다");
			  return;
		  }
		  var fileSize = files.size;
		  var maxSize = 1024 * 1024;
		  if(fileSize > maxSize) {
		      alert("파일용량을 초과하였습니다.");
		      return;
		  }
		  var file  = files[0];
		  fileArr += file+"/";
		  fileNames += file.name+"/";
		  var _URL = window.URL || window.webkitURL;
		  var img = new Image();
		  img.src = _URL.createObjectURL(file);
		  img.onload = function() {
		      if(img.width > 652 || img.height > 488) {
		          alert("이미지 가로 652px, 세로 488px로 맞춰서 올려주세요.");
		          $("input[id=file1]").val("");
		          return;
		      }
		      sel_file = f;
		      var reader = new FileReader();
			  reader.onload = function(e) {
				  if(imgNum == 8 && divNum==3) {
					  $("#inputButton").css("display","none");
				  }
				  if(imgNum % 3 == 0) {
					  divNum += 1;
					  html6 ="";
					  html6 +="<div class='plus-img-div"+divNum+"' style='display: flex;'>";
					  html6 +="</div>"
					  $("#plusImgArea").append(html6);
				  }
				  if(imgNum == 0) {
					  html5 = "";
					  html5 += "<div class='plus-img-area'>";
					  html5 += "<img class='plus-img"+imgNum+"'>";
					  html5 += "</div>";
					  $(".plus-img-div"+divNum+"").append(html5);
					  $(".plus-img"+imgNum+"").attr("src", e.target.result);
					  imgNum += 1;
				  } else {
					  html5 = "";
					  html5 += "<div class='plus-img-area'>";
					  html5 += "<img class='plus-img"+imgNum+"'>";
					  html5 += "</div>";
					  $(".plus-img-div"+divNum+"").append(html5);
					  $(".plus-img"+imgNum+"").attr("src", e.target.result);
					  imgNum += 1;
				  }
				  if(imgNum > 0) {
					  $("#closeBtn").css("display","inline");
				  }
			  }
			  reader.readAsDataURL(f);
		  }
	  });
  }
 $(function() {
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

  </script>
</head>
<body>
<form action="/meister/sell/insertSell.do" method="post" enctype="multipart/form-data" id="updateSell">
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
<div class="container">
<header class="jumbotron my-4" style="width:1100px;">
</header>
<div class="sell-content card-shadow" style="display:flex;">
<div class="col-xs-9" id="first">
<div class="panel">
<ul class="list-style">
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">서비스 제목</p>
</div>
<div class="col-xs-9">
<div>
<div class="wrap">
<input type="text" name="sellNo" value="${sellNo }" style="display:none;">
<input type="text" name="sellWriter" value="${sessionScope.member.memberNo }" style="display:none">
<input type="text" id="inputTitle" name="sellTitle" class="form-control border-radius-0" maxlength="36" style="border-radius:0; height:50px;"placeholder="예)보기 깔끔한 사이틀르 만들어 드립니다">
</div>
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkTitle" style="color:red; font-size:12px;"><img class="reportImg" src="/resources/upload/homeImg/report.png">&nbsp;최소 10글자 이상 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="titleCounter"></span>
&nbsp;/&nbsp;36글자수
</div></div></div></div></div>
</li><hr>
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
<select id="cate1" name="sellCategory1" class="input-sm" style="width:80%; height:40px; border: 1px solid #e6e6e6; font-size:14px;">
<option value="design">디자인</option>
<option value="it">IT · 프로그래밍</option>
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
<input type="text" name="sellCategory2" style="display:none;">
</div></div>
</div></div></div>
</li>
<li>
<div class="row" style="padding:10px;">
<div class="col-xs-3">
<p class="fo-we-bo">사용 기술</p>
</div>
<div class="col-xs-9">
<div style="display:grid;">
<span class="fo-si-12">사용된 기술을 입력해주세요.</span>
</div>
<div>
<input type="text" placeholder="추가할 기술을 입력해주세요." class="skill-input">
</div>
<div class="input-skill-area" style="display:inline-block;"></div>
</div>
</div>
<input name="sellSkill" style="display:none;">
</li>
</ul>
</div>
<div style="width:100%; padding:20px;">
<button type="button" class="btn btn-lg next-button" onclick="checkNext1()">다음 단계</button>
</div>
</div>
<div class="col-xs-9" id="second" style="display:none;">
<p class="fo-we-bo">가격 설정</p>
<div class="panel">
<ul class="list-style more-option-area" style="padding: 0">
<li><div class="col-xs-4"><p class="fo-we-bo">금액</p></div><div class="col-xs-8"><input type="text" id="priceBox" name="sellPrice" placeholder="최소 5000원" class="input-boxs"><span class="input-span">원</span></div></li>
<li><div class="col-xs-4"><p class="fo-we-bo">상업적 이용</p></div><div class="col-xs-8"><input type="checkbox" name="sellOpt1" class="check-box"></div></li>
<li><div class="col-xs-4"><p class="fo-we-bo">소스코드 제공</p></div><div class="col-xs-8"><input type="checkbox" name="sellOpt2" class="check-box"></div></li>
<li><div class="col-xs-4"><p class="fo-we-bo">맞춤 디자인 제공</p></div><div class="col-xs-8"><input type="checkbox" name="sellOpt3" class="check-box"></div></li>
<li><div class="col-xs-4"><p class="fo-we-bo">수정 횟수</p></div><div class="col-xs-8"><input type="text" id="fixBox" name="sellOptFix" class="input-boxs"><span class="input-span">회</span><span id="fixSpan">최소 0회 이상 작성해주세요</span></div></li>
<li><div class="col-xs-4"><p class="fo-we-bo">작업 기간</p></div><div class="col-xs-8"><input type="text" id="periodBox" name="sellPeriod" class="input-boxs"><span class="input-span">일</span><span id="periodSpan">최소 1일 이상 작성해주세요</span></div></li>
</ul>
</div><br><br>
<p class="fo-we-bo">추가 옵션</p>
<div class="panel">
<ul class="list-style more-option-area" id="more-option-area" style="padding: 0">
<li><a style="text-decoration:none; margin:0 auto; color:#4D4D4D; font-size: 14px; line-height:18px; cursor:pointer;" href="java:script(0)" onclick="makeOpt();"><img style="width:12px; height:12px;" src="/resources/upload/homeImg/more.png">&nbsp;맞춤옵션 추가</a></li>
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
</div>
<div class="col-xs-9" id="third" style="display:none;">
<div class="panel">
<ul class="list-style">
<li>
<div class="col-xs-4"><p class="fo-we-bo">서비스 설명</p></div>
<div class="col-xs-8">
<div>
<textarea id="inputContent" rows="15" wrap="hard" class="text-area"></textarea>
</div>
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkContent" style="color:red; font-size:12px;"><img class="reportImg" src="/resources/upload/homeImg/report.png">&nbsp;최소 100글자 이상 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="contentCounter"></span>
&nbsp;/&nbsp;최소 100글자
</div></div>
</div>
<input type="text" name="sellContent" style="display:none;">
</li>

<li>
<div class="col-xs-4"><p class="fo-we-bo">수정 및 재진행 안내</p></div>
<div class="col-xs-8">
<div>
<textarea id="inputFix" rows="10" wrap="hard" class="text-area" placeholder="의뢰인은 가격정보란에 기재된 수정횟수를 기준으로 작업물 발송을 취소할 수 있습니다. 기본제공 횟수를 초과한 추가 수정에 따른 추가금이 발생하 경우, 이를 명시후 추가옵션을 설정해주세요."></textarea>
</div>
<input type="text" name="sellFix" style="display:none;">
<div style="display:flex;">
<div class="col-xs-9">
<span id="checkRemake" style="color:red; font-size:12px;"><img class="reportImg" src="/resources/upload/homeImg/report.png">&nbsp;최소 20글자 이상 입력해주세요.</span>
</div>
<div class="col-xs-3 font-gray" >
<span id="remakeCounter"></span>
&nbsp;/&nbsp;최소 20글자
</div></div>
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
</div>

<div class="col-xs-9" id="fourth" style="display:none;" >
<div class="panel">
<ul class="list-style">
<li>
<div class="col-xs-3"><p class="fo-we-bo">메인 이미지 등록</p></div>
<div class="col-xs-9">
<div style="padding: 5px;border: 1px solid #dedede;margin: 3px 1%;">
<img src="/resources/upload/homeImg/mainImg.png" class="main-img" onclick="insertMainImg();">
<input type="file" style="display:none;" name="sellImgFile" id="uploadImg"></div>
</div>
</li>
<li>
<div class="col-xs-3"><p class="fo-we-bo">상세 이미지 등록<p style="font-size:12px;">(선택)</p>
</div>
<div class="col-xs-9">
<div id="plusImgArea" style="positon:absolute;">
</div>
<div id="inputButton">
<img src="/resources/upload/homeImg/plusImg.png" class="plus-img" onclick="uploadMultiImg();" id="plusImgButton">
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
<button type="button" class="btn btn-lg next-button" onclick="finishSell();">작성 완료</button>
</div>
</div>
</div>
<div class="col-xs-3"></div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/sellFinishModal.jsp"/>
<button id="sellBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#sellModal" style="display:none;">
</button> 
</form>
</body>
<script>
function finishSell() {
	var mainImg = $("#uploadImg").val();
	if(mainImg == "") {
		alert("메인이미지를 등록해주세요");
		return;
	}
	$("#sellBtn").trigger("click");
}
</script>
</html>