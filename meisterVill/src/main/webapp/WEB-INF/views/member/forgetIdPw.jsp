<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <title>Forget Id and Pw</title>


</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <link rel="stylesheet" href="/resources/yr/css/forgetIdPw_css.css" type="text/css">
    <div class="content-box-yr">

        <div class="fg-box">
            <div class="fg-id-box">
                <div class="fib-header">아이디 찾기</div>
                <div class="fib-content">
                    
                        <input type="text" class="fginput fib-contents" name="memberName" placeholder="이름"><br>
                        <input type="text" class="fginput fib-contents" name="memberPhone" placeholder="휴대전화번호 ('-'생략)">
                        <div>
                            <p class="fib-msg"></p>
                        </div>
                        <button type="button" class="btn btn-yr-normal fg-btn fg-btn-email">이메일 찾기</button>
                </div>
            </div>
            <div class="fg-pw-box">
                <div class="fpb-header">비밀번호 찾기</div>
                <div class="fpb-content">
                    
                        <input type="text" id="memberEmailInput" class="fginput fpb-contents input-yr-normal jcb-mail" name="memberEmail" placeholder="이메일">

                        <div>
                            <p class="fpb-msg"></p>
                        </div>
                        <p class="fpb-msg2">마이스터빌 가입 시 등록했던 이메일로</p>
                        <p class="fpb-msg2">비밀번호 변경 URL이 전송됩니다.</p>
                        <button type="button" id="findPw" class="btn btn-yr-normal fg-btn">비밀번호 찾기</button>
                    
                </div>
            </div>
        </div>
    </div>



    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        var name = 0;
        var phone = 0;
        var email = 0;
        
        
        $(function() {
        	//이메일 인증
            $("#findPw").click(function(){
            	console.log("ok");
            	var memberEmail = $("#memberEmailInput").val();
            	var html="";
            	console.log(memberEmail);
            	$.ajax({
            		url : "/meister/member/checkLogin.do",
            		data : {memberEmail:memberEmail},
            		type : "post",
            		success : function(data){
            			console.log("success");
            			console.log("이메일존재"+data);
            			/* if(data!=null){ */
            				//이메일 있음
            				$.ajax({
            					url : "/meister/member/mailSendLink.do",
                        		data : {memberEmail:memberEmail},
                        		type : "post",
                        		success : function(data){
                        			console.log("success-notnull");
                        			console.log("받아온 이메일"+data);
                        			html+= "<div class='fpb-content ajax-fpb'>";
                                	html+="<div class='fib-userEmail'>";
                                    html+=data+"</div>";
                                html+="<div class='fpb-resultEnd1'> 으로 비밀번호 변경 URL이</div>";
                                 html+="<div class='fpb-resultEnd2'>전송되었습니다.</div>";
                                html+="<div class='fib-result-logo'>";
                                    html+="<img src='/resources/yr/imgs/logo.png' width='20%'></div></div>";
                                    $(".fpb-content").html("");
                            		$(".fpb-header").after(html);
                        		},
                        		error : function(){
                        			console.log("ajax통신실패");
                        		}
            				});
            			/* }else{
            				//이메일 없음
            				
            				console.log("success-null");
                			html+= "<div class='fpb-content ajax-fpb'>";
                        	
                        html+="<div class='fpb-resultEnd1'>해당하는 회원의 정보가</div>";
                         html+="<div class='fpb-resultEnd2'>없습니다.</div>";
                        html+="<div class='fib-result-logo'>";
                            html+="<img src='/resources/yr/imgs/logo.png' width='20%'></div></div>";
                            $(".fpb-content").html("");
                    		$(".fpb-header").after(html);
            			} */
            		},
            		error : function(){
            			
            		}
            		
            	});
            });
        	
        	
            $(".fginput").focusin(function() {
                $(this).addClass("focusinput");
            });
            $(".fginput").blur(function() {
                $(this).removeClass("focusinput");
            });



            //유효성 검사    
            $("input[name=memberName]").blur(function() {
                var memName = $("input[name=memberName]").val();
                if (memName != "") {
                    var regExp = /^[가-힣]{1,6}$/;

                    if (!regExp.test(memName)) {
                       $("input[name=memberName]").css("border", "1px solid #d00c0a");
                        $("input[name=memberName]").css("box-shadow", "0px 0px 3px #d00c0a");
                        $(".fib-msg").html("유효하지 않은 입력입니다.");
                        name = 0;
                    } else {
                        $("input[name=memberName]").css("border", "1px solid #eeeeee");
                        $("input[name=memberName]").css("box-shadow", "none");
                        if (phone == 1) {
                            $(".fib-msg").html("");
                        }

                        name = 1;
                    }
                }else{
                    $(".fib-msg").html("");
                    name = 0;
                }
            });

            $("input[name=memberPhone]").blur(function() {
                if ($("input[name=memberPhone]").val() != "") {
                    var regExp = /^[0-9]{11}$/;
                    var memPhone = $("input[name=memberPhone]");
                    if (!regExp.test(memPhone.val())) {
                        $("input[name=memberPhone]").css("border", "1px solid #d00c0a");
                        $("input[name=memberPhone]").css("box-shadow", "0px 0px 3px #d00c0a");
                        $(".fib-msg").html("유효하지 않은 입력입니다.");
                        phone = 0;
                    } else {
                        $("input[name=memberPhone]").css("border", "1px solid #eeeeee");
                        $("input[name=memberPhone]").css("box-shadow", "none");
                        if (name == 1) {
                            $(".fib-msg").html("");
                        }

                        phone = 1;
                    }
                }else{
                    phone = 0;
                    $(".fib-msg").html("");
                }
            });
            $(".jcb-mail").blur(function(){
                if ($(".jcb-mail").val() != "") {
                    var regExp = /^[a-zA-Z0-9\_\-\.]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
                    var memEmail = $(".jcb-mail").eq(0).val();
                    if (!regExp.test(memEmail)) {
                        $("input[name=memberEmail]").css("border", "1px solid #d00c0a");
                        $("input[name=memberEmail]").css("box-shadow", "0px 0px 3px #d00c0a");
                        $(".fpb-msg").html("유효하지 않은 입력입니다.");
                        email=0;
                    } else {
                        $("input[name=memberEmail]").css("border", "1px solid #eeeeee");
                        $("input[name=memberEmail]").css("box-shadow", "none");
                        $(".fpb-msg").html("");
                       email=1;
                    }
                }else{
                    email=0;
                    $(".fpb-msg").html("");
                }
                
            });
            $(".fg-btn-email").click(function(){
            	var memberName = $("input[name=memberName]").val();
            	var memberPhone = $("input[name=memberPhone]").val();
            	var html="";
            	console.log("dd");
                if(name==1 &&phone==1){
                	console.log("tt");
                    $.ajax({
                    	
                    	url:"/meister/member/findEmail.do",
                    	data: {memberName: memberName, memberPhone:memberPhone},
                    	type: "post",
                    	success: function(data){
                    		if(data!=null){
                    		console.log(data);
                    		html+="<div class='fib-content ajax-fib'>";
                    		html+="<div class='fib-userName'>";
                    		html+="["+memberName+"]님의 아이디는";
                    		html+="</div>";
                    		html+="<div class='fib-userEmail'>";
                    		html+=data;
                    		html+="</div>";
                    		html+="<div class='fib-resultEnd'>";
                    		html+="입니다.";
                    		html+="</div>";
                    		html+="<div class='fib-result-logo'>";
                    		html+="<img src='/resources/yr/imgs/logo.png' width='20%'>";
                    		html+="</div>";
                    		html+="</div>";
                    		$(".fib-content").html("");
                    		$(".fib-header").after(html);
                    			
                    		}else{
                    			html+="<div class='fib-content ajax-fib'>";
                        		html+="<div class='fib-userName'>";
                        		html+="해당하는 회원정보가";
                        		html+="</div>";
                        		html+="<div class='fib-resultEnd'>";
                        		html+="없습니다.";
                        		html+="</div>";
                        		html+="<div class='fib-result-logo'>";
                        		html+="<img src='/resources/yr/imgs/logo.png' width='20%'>";
                        		html+="</div>";
                        		html+="</div>";
                        		
                        		$(".fib-content").html("");
                        		$(".fib-header").after(html);
                    		}
                    		
                    	},
                    	error: function(){
                    		console.log("ajax통신 실패");
                    	},
                    	complete:function(){
                    		console.log("ajax 끝");
                    	}
                    });
                    }else{
                    	console.log("gg");
                    	$(".fib-msg").html("유효하지 않은 입력입니다.");
                    }
                
                });
            
            
            });



        

    </script>

</body>

</html>
