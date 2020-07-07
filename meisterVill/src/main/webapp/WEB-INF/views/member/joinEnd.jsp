<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <link rel="stylesheet" href="/resources/yr/css/joinSuccessModal_css.css" type="text/css">
    <link rel="stylesheet" href="/resources/yr/css/joinEnd_css.css" type="text/css">
    <title>Join End</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />


    <div class="content-box-yr">
        <div class="join-content-wrapper">
            <div class="join-logo">
                <img src="/resources/yr/imgs/meistervill_01.png" width="45%">
            </div>
            <div class="jcb-step">
                <i class="fa fa-circle" aria-hidden="true"></i>
                <i class="fa fa-circle" aria-hidden="true"></i>
            </div>
            <div class="join-content-box">
				
                    <div class="jcb-title">
                        이메일
                    </div>
                    <input type="text" class="input-yr-normal jcb-mail jm-email" name="memberEmail" placeholder="이메일을 입력해주세요.">
                    <button type="button" id="btnEmail" class="btn btn-yr-normal-gray btn-mail-confirm cursor-not" disabled>이메일 인증</button><br>

                    <input type="text" class="input-yr-normal jcb-mail cursor-not" name="confirm-code" placeholder="인증번호를 입력해주세요." disabled>
                    <button type="button" id="btnConfirm" class="btn btn-yr-normal-gray btn-mail-confirm cursor-not" disabled>인증하기</button>
                    <div class="time-limit"></div>
                    <div class="check-msg-box"></div>
                    <div class="wrong-msg jcb-mail-msg"></div>
                    
                    <div class="jcb-title">
                        비밀번호
                    </div>

                    <input type="password" name="memberPw" class="input-yr-normal jcb-pw-input jm-pw" placeholder="비밀번호를 입력해주세요.">
                    <input type="password" class="input-yr-normal cursor-not jcb-pw-input" placeholder="한 번 더 입력해주세요." disabled>
                    <div class="wrong-msg jcb-pw-msg"></div>
                    <div class="jcb-title jcbt">
                        이름
                        <span class="wrong-msg2 jcb-name-msg"></span>
                    </div>

                    <input type="text" name="memberName" class="input-yr-normal jcb-name-input" placeholder="이름을 입력해주세요.">
                    <div class="jcb-title jcbt">
                        생년월일
                        <span class="wrong-msg2 jcb-hbd-msg"></span>
                    </div>

                    <input type="text" name="memberHbd" class="input-yr-normal jcb-hbd-input" placeholder="예) 1993년 7월 6일 → 19930706">
                    <div class="jcb-title jcbt">
                        닉네임
                        <span class="wrong-msg2 jcb-nick-msg"></span>
                    </div>

                    <input type="text" name="memberNickname" class="input-yr-normal jcb-nick-input" placeholder="한글, 영어 대·소문자, 숫자 10자 이내">
                    <div class="jcb-title jcbt">
                        휴대폰 번호
                        <span class="wrong-msg2 jcb-phone-msg"></span>
                    </div>

                    <input type="text" name="memberPhone" class="input-yr-normal jcb-phone-input" placeholder="'-'를 제외한 숫자만 입력하세요.">
                    <button type="button" id="btn-join-cl" class="btn btn-yr-normal btn-join-next btn-join-finish cursor-not" disabled>회원가입 완료</button>
             
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    

<!-- The Modal -->
            <div class="modal fade" id="joinResultModal">
                <div class="modal-dialog modal-m">
                    <div class="modal-content jrm-modal-content">

                        <!-- Modal body -->
                        <div class="modal-body jrm-body">
                            <div class="jrm-content-box">
                                <div class="modal-btn-top">
                                    <button type="button" class="close" onclick="location.href='/meister/member/goMain.do'" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="pcn-result-logo">
                                    <img src="/resources/yr/imgs/meistervill_01.png" width="40%">
                                </div>

                                <div class="pcn-result">
                                    <p>회원가입 완료!</p>
                                </div>
                                <div class="pcn-result-msg">
                                    <p>1만원 웰컴 쿠폰이 발급되었습니다.</p>
                                    <p>로그인 후 마이페이지에서 확인하세요!</p>
                                </div>

                                <div class="pcn-result-btn">
                                    <a href="/" class="btn btn-yr-normal pcn-btn">메인화면 이동</a>
                                    <a href="/" class="btn btn-yr-normal pcn-btn" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">로그인</a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

    <script>
        $(function() {
        	var emailCode;
        	
            var emailConfirm = 0;
            var pwConfirm = 0;
            var pwSame = 0;
            var name = 0;
            var hbd = 0;
            var nick = 0;
            var phone = 0;
			
            
            $("#btn-join-cl").click(function(){
            	//회원가입 버튼 클릭
            	var memberEmail = $(".jm-email").val();
            	var memberPw = $(".jm-pw").val();
            	var memberName = $("input[name=memberHbd]").val();
            	var memberNickname= $("input[name=memberNickname]").val();
            	var memberHbd = $("input[name=memberHbd]").val();
            	var memberPhone = $("input[name=memberPhone]").val();
            	$.ajax({
            		url: "/meister/member/joinMember.do",
            		data: {memberEmail: memberEmail, memberPw: memberPw, memberName: memberName, memberHbd: memberHbd, memberNickname:memberNickname, memberPhone:memberPhone},
            		type: "post",
            		success: function(data){
            			console.log(data);
            			if(data=="1"){
            				console.log("회원가입완료");
            				$("#joinResultModal").modal("show");
            			}else{
            				console.log("로그인 실패해서 메인으로 ㄱㄱ");
            				location.href("/");
            			}
            		},
            		error: function(){
            			console.log("ajax실패");
            		}
            		
            	});
            });
            
            $("body").mouseover(function(){
	            if(emailConfirm==1 && pwConfirm==1 && pwSame==1 && name==1 && hbd==1 && nick==1 && phone==1){
	            	$(".btn-join-finish").removeClass("cursor-not");
	            	$(".btn-join-finish").prop("disabled",false);
	            }else{
	            	$(".btn-join-finish").addClass("cursor-not");
	            	$(".btn-join-finish").prop("disabled",true);
	            }
            
            });
            //비밀번호
            $(".jcb-pw-input").eq(0).keyup(function() {
                var pw = $(".jcb-pw-input").eq(0).val();
                if (pw != "") {
                	//빈칸 아닐 때
                    var regExp = /^(?=.*[a-z])(?=.*[0-9])(?=.*[$@!%*#?])[a-z0-9$@!%*#?].{8,20}$/;
                    if (!regExp.test(pw)) {
                    	//유효X
                        $(".jcb-pw-input").eq(0).blur(function() {
                            $(this).addClass("invalid-input");
                        });
                        $(".jcb-pw-input").eq(1).addClass("cursor-not");
                        $(".jcb-pw-input").eq(1).removeClass("invalid-input");
                        $(".jcb-pw-input").eq(1).attr("disabled", true);
                        $(".jcb-pw-input").eq(1).val("");
                        $(".jcb-pw-msg").html("영문 소문자, 숫자, 특수문자 포함 8~20자리");
                        pwConfirm = 0;
                        console.log(pwConfirm);
                    } else {
                    	//유효
                        $(this).removeClass("invalid-input");
                        $(".jcb-pw-msg").html("");
                        $(".jcb-pw-input").eq(1).removeClass("cursor-not");
                        $(".jcb-pw-input").eq(1).attr("disabled",false);
                        pwConfirm = 1;
                        console.log(pwConfirm);
                    }
                }else{
                	//빈칸일때
                	$(".jcb-pw-msg").html("");
                	$(".jcb-pw-input").eq(1).addClass("cursor-not");
                    $(".jcb-pw-input").eq(1).removeClass("invalid-input");
                    $(".jcb-pw-input").eq(1).attr("disabled", true);
                    $(".jcb-pw-input").eq(1).val("");
                    pwConfirm=0;
                }
            });
            //비밀번호 확인
            $(".jcb-pw-input").eq(1).keyup(function() {
            	
                    var pw = $(".jcb-pw-input").eq(0).val();
                    var pw2 = $(".jcb-pw-input").eq(1).val();
                    if(pw2!=""){
                    	//빈칸 아닐 때
                    if (pw == pw2) {
                    	//비밀번호 같을 때
                        $(this).removeClass("invalid-input");
                        $(".jcb-pw-msg").html("");
                        pwSame = 1;
                    } else {
                    	//비밀번호 다를 때
                        $(this).addClass("invalid-input");
                        $(".jcb-pw-msg").html("비밀번호가 같지 않습니다.");
                        pwSame = 0;
                    }
                    }else{
                    	//빈칸일 때
                    	$(this).removeClass("invalid-input");
                        $(".jcb-pw-msg").html("");
                        pwSame = 0;
                    }
                
            });
            //이메일
            $(".jcb-mail").eq(0).keyup(function() {
                if ($(".jcb-mail").eq(0).val() != "") {
                	//입력창이 비어있지 않을 때
                    var regExp = /^[a-zA-Z0-9\_\-\.]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
                    var memEmail = $(".jcb-mail").eq(0).val();
                    if (!regExp.test(memEmail)) {//유효성 검사 X
                        $("input[name=memberEmail]").css("border", "1px solid #d00c0a");
                        $("input[name=memberEmail]").css("box-shadow", "0px 0px 3px #d00c0a");
                        $(".jcb-mail-msg").html("유효하지 않은 입력입니다.");
                        $(".check-msg-box").html("");
                        $("#btnEmail").prop("disabled",true);
                        $("#btnEmail").addClass("cursor-not");
                    } else { //유효성 검사 통과
                    	$.ajax({
                    		url : "/meister/member/checkEmail.do",
                    		data : {memberEmail : memEmail},
                    		type : "get",
                    		success : function(data){
                    			if(data=='0'){
                    				//중복 아님
                    				$(".check-msg-box").html("사용 가능한 이메일 입니다.");
                    				$("input[name=memberEmail]").css("border", "1px solid #eeeeee");
                                    $("input[name=memberEmail]").css("box-shadow", "none");
                                    $(".jcb-mail-msg").html("");
                                    $("#btnEmail").prop("disabled", false);
                                    $("#btnEmail").removeClass("cursor-not");
                    			}else{
                    				//중복임
                    				$(".check-msg-box").html("이미 사용중인 이메일입니다.");
                    				$("input[name=memberEmail]").css("border", "1px solid #d00c0a");
                                    $("input[name=memberEmail]").css("box-shadow", "0px 0px 3px #d00c0a");
                                    $("#btnEmail").prop("disabled",true);
                                    $("#btnEmail").addClass("cursor-not");
                    			}
                    		}
                    	});
                        

                    }
                } else {
                	//입력창이 비었을 때
                	$(".check-msg-box").html("");
                    $(".jcb-mail-msg").html("");
                    $("#btnEmail").prop("disabled", true);
                    $("#btnEmail").addClass("cursor-not");
                }
            });


            //이름
            $(".jcb-name-input").keyup(function() {
                if ($(".jcb-name-input").val() != "") {
                	//빈칸X
                    var regExp = /^[가-힣]{2,}$/;
                    if (!regExp.test($(this).val())) {
                    	//유효x
                    	
                        $(".jcb-name-msg").html("한글 2글자 이상 입력해주세요.");
                        $(".jcb-name-input").addClass("invalid-input");
                        name = 0;
                    } else {
                    	//유효 o
                        $(".jcb-name-msg").html("");
                        $(".jcb-name-input").removeClass("invalid-input");
                        name = 1;
                    }
                } else {
                	//빈칸
                    $(".jcb-name-msg").html("");
                    $(".jcb-name-input").removeClass("invalid-input");
                    name = 0;
                }

            });

            //생년월일
            $(".jcb-hbd-input").keyup(function() {
                if ($(".jcb-dbc-input").val() != "") {
                    var regExp = /^[0-9]{8}$/;
                    if (!regExp.test($(this).val())) {
                        $(".jcb-hbd-msg").html("생년월일 8자리를 입력해주세요.");
                        $(".jcb-hbd-input").addClass("invalid-input");
                        hbd = 0;
                    } else {
                        $(".jcb-hbd-msg").html("");
                        $(".jcb-hbd-input").removeClass("invalid-input");
                        hbd = 1;
                    }
                } else {
                    $(".jcb-hbd-msg").html("");
                    $(".jcb-hbd-input").removeClass("invalid-input");
                    hbd = 0;
                }

            });

            //닉네임
            $(".jcb-nick-input").keyup(function() {
                if ($(".jcb-nick-input").val() != "") {
                	//빈칸X
                    var regExp = /^[가-힣a-zA-Z0-9]{1,10}$/;
                    if (!regExp.test($(this).val())) {
                    	//유효X
                        $(".jcb-nick-msg").html("한글, 영어 대·소문자, 숫자 10자 이내");
                        $(".jcb-nick-input").addClass("invalid-input");
                        nick = 0;
                    } else {
                    	//유효O
                    	var memberNickname = $(".jcb-nick-input").val();
                    	$.ajax({
                    		url : "/meister/member/checkNickname.do",
                    		data : {memberNickname : memberNickname},
                    		type : "get",
                    		success : function(data){
                    			if(data=='0'){
                    				//중복 아님
                    				$(".jcb-nick-msg").html("사용 가능한 닉네임입니다.");
                    				$("input[name=memberNickname]").css("border", "1px solid #eeeeee");
                                    $("input[name=memberNickname]").css("box-shadow", "none");
                                    nick = 1;
                    			}else{
                    				//중복임
                    				$(".jcb-nick-msg").html("이미 사용중인 닉네임입니다.");
                    				$("input[name=memberNickname]").css("border", "1px solid #d00c0a");
                                    $("input[name=memberNickname]").css("box-shadow", "0px 0px 3px #d00c0a");
                                    nick=0;
                    			}
                    		}
                    	});        
                    }
                } else {
                	//빈칸
                    $(".jcb-nick-msg").html("");
                    $(".jcb-nick-input").removeClass("invalid-input");
                    nick = 0;
                }

            });

            //전화번호
            $(".jcb-phone-input").keyup(function() {
                if ($(".jcb-phone-input").val() != "") {
                    var regExp = /^[0-9]{11}$/;
                    if (!regExp.test($(this).val())) {
                        $(".jcb-phone-msg").html("'-'를 제외한 숫자만 입력하세요.");
                        $(".jcb-phone-input").addClass("invalid-input");
                        phone = 0;
                    } else {
                        $(".jcb-phone-msg").html("");
                        $(".jcb-phone-input").removeClass("invalid-input");
                        phone = 1;
                        console.log("이메일:" +emailConfirm);
                        console.log("비번:"+pwConfirm);
                        console.log("비확"+pwSame);
                        console.log("이름"+name);
                        console.log("닉넴"+nick);
                        console.log("생일"+hbd);
                        console.log("폰"+phone);
                    }
                } else {
                    $(".jcb-phone-msg").html("");
                    $(".jcb-phone-input").removeClass("invalid-input");
                    phone = 0;
                }

            });


            //이메일 인증
            $("#btnEmail").click(function() {
                console.log("ok");
                

                var memberEmail = $(this).prev().val();
                console.log(memberEmail);
                $.ajax({
                    url: "/meister/member/mailSend.do",
                    data: {
                        memberEmail: memberEmail
                    },
                    type: "post",
                    success: function(data) {
                    	emailCode = data;
                        $("#btnEmail").prop("disabled",true);
                    	$(".check-msg-box").html("인증메일이 발송되었습니다.");
                    	$("input[name=confirm-code]").prop("disabled", false);
                        $("input[name=confirm-code]").removeClass("cursor-not");
                        $("#btnConfirm").prop("disabled", false);
                        var min = 0; //분
                        var sec = 59;
                        intervalId = window.setInterval(function() {

                            $(".time-limit").html(min + " : " + sec);
                            if(emailConfirm==1){
                            	clearInterval(intervalId);
                            	$(".time-limit").html("");
                            }else{
                            	
                            if (min >= 0) {
                                if (sec > 0) {
                                    sec--;
                                } else {
                                	if (min == 0 && sec == 0) {
                                		if(emailConfirm==0){
                                		$(".check-msg-box").html("인증메일을 재발송하세요.");
                                		$("#btnEmail").prop("disabled",false);
                                        $("input[name=confirm-code]").prop("disabled", true);
                                        $("input[name=confirm-code]").addClass("cursor-not");
                                        $("#btnConfirm").prop("disabled", true);
                                        clearInterval(intervalId);
                                		}
                                    }else{
                                    sec = 59;
                                    min--;
                                    }
                                }
                            }
                            if (min == 0 && sec == 1) {
                                $("input[name=confirm-code]").prop("disabled", "true");
                                $("input[name=confirm-code]").addClass("cursor-not");
                                $("#btnConfirm").prop("disabled", "true");
                                clearInterval(intervalId);
                            }
                            }
                            
                        }, 1000);
                    },
                    error: function() {
                        console.log("ajax통신실패");
                    }
                });
            });
            
            //이메일 인증 버튼
            $("#btnConfirm").click(function(){
            	if(emailCode==$("input[name=confirm-code]").val()){
            		$("input[name=confirm-code]").prop("disabled", "true");
                    $("input[name=confirm-code]").addClass("cursor-not");
                    $("#btnConfirm").prop("disabled", "true");
                    $(".check-msg-box").html("인증완료");
                    emailConfirm = 1;
            	}else{
            		$(".check-msg-box").html("인증번호를 확인해주세요.");
            		emailConfirm = 0;
            	}
            });
            
        });
        
        function joinModalOpen(){
        	$("#joinResultModal").show();
        }

    </script>
</body>

</html>
