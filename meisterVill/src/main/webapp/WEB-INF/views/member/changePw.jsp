<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <title>Change Forgotten Password</title>

    <!--모달-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>

<body>



   <jsp:include page="/WEB-INF/views/common/simple_header.jsp"></jsp:include>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <div class="content-box-yr2">
        <div class="content-yr">

            <div class="cpb-title">
                비밀번호 변경
            </div>
            <div class="cpb-content">
                <div class="cpb-word">
                    새로운 비밀번호를 입력하세요.
                </div>
                <div class="cpb-input-box">
                    
                    	<input type="hidden" name="memberEmail" value="${memberEmail }">
                        <input type="password" class="input-yr-normal cpb-input" name="memberPw"placeholder="영문 소문자, 숫자, 특수문자 포함 8~20자리"><br>
                        <input type="password" class="input-yr-normal cpb-input cursor-not" placeholder="한 번 더 입력하세요." disabled>
                        <div class="cpb-msg2">특수문자는 $@!%*#?만 사용 가능 합니다.</div>
                        <div class="cpb-msg"></div>
                        <button type="button" id="btnChangePw" class="btn btn-yr-normal btn-cng" disabled>비밀번호 변경</button>
                    
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<!-- Modal -->
        <div class="modal fade" id="submitModal">
            <div class="modal-dialog modal-m">
                <div class="modal-content">
                    <div class="modal-body pcsm-body">
                        <div class="modal-bg">
                            <div class="modal-btn-top">
                                <button type="button" class="close" data-dismiss="modal" onclick="location.href='/meister/member/goMain.do'">&times;</button>
                            </div>

                            <div class="pcn-result-logo">
                                <img src="/resources/yr/imgs/meistervill_01.png" width="40%">
                            </div>

                            <div class="pcn-result">
                                <p>비밀번호 변경 완료</p>
                            </div>
                            <div class="pcn-result-msg">
                                <p>새로운 비밀번호로 로그인 하세요!</p>
                            </div>

                            <div class="pcn-result-btn">
                                <a href="/" class="btn btn-yr-normal pcn-btn">메인화면 이동</a>
                                <a href="#" class="btn btn-yr-normal pcn-btn" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">로그인</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    


    <style>
        .content-box-yr2 {
            width: 400px;
            margin: 3% auto;
        }

        .content-yr {
            width: 100%;

        }

        .cpb-title {
            height: 50px;
            width: 100%;
            text-align: center;
            font-weight: 700;
            color: white;
            font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 45px;

            background-color: #ffbc42;
            border: 5px solid #ffbc42;
            border-top-left-radius: 18px;
            border-top-right-radius: 18px;

        }

        .cpb-content {
            width: 100%;
            padding-right: 8%;
            padding-left: 8%;
            padding-bottom: 15%;
            padding-top: 15%;

            border-bottom-left-radius: 18px;
            border-bottom-right-radius: 18px;
            border: 3px dashed #ffbc42;
            border-top: none;
        }

        .cpb-word {

            text-align: center;
            font-weight: 900;
            font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
            margin-bottom: 5%;
        }

        .cpb-input-box {
            width: 100%;
            text-align: center;
        }

        .cpb-input-box>input[type=password] {
            width: 100%;
            margin-top: 3%;
            height: 45px;
            padding-left: 3%;
            padding-right: 3%;
            font-size: 13px;
            font-family: 'Noto Sans KR', sans-serif;
            color: #4d4d4d;
        }

        .cpb-msg2 {
            width: 100%;
            margin-top: 5%;
            font-size: 12px;
            color: #4d4d4d;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .cpb-msg {
            width: 100%;
            height: 30px;
            margin-top: 5%;
            margin-bottom: 5%;
            color: #D00C0A;
            font-size: 13px;
           font-family: 'Noto Sans KR', sans-serif;
            font-weight: 700;
        }

        .btn-cng {
            width: 100%;
            height: 45px;
            margin-left: 0px;
            margin-right: 0px;
        }

        .invalid-input {
            border: 2px solid #D00C0A;
            box-shadow: 0px 0px 3px #D00C0A;
            outline: 0 none;
        }

        .cursor-not {
            cursor: not-allowed;

        }
        
        
        
        
        /*모달*/
        #submitModal {
            top: 50%;
            margin-top: -200px;
        }


        .modal-content {
            border-radius: 15px;
        }

        .pcsm-body {
            /*background-image: url(/resources/yr/imgs/bg-5gray.png);
            background-position: bottom center;
            background-repeat: no-repeat;
            background-size: 100%;*/
            background-color: white;
            padding: 10%;
            border-radius: 15px;
            height: 400px;
            position: relative;
        }

        .modal-btn-top {
            margin-top: -7%;
            margin-left: 83%;
            float: right;
            position: absolute;

        }

        .pcn-result {
            text-align: center;
            margin-bottom: 1%;
            font-size: 26px;
            font-weight: 900;
            font-family: 'Noto Sans KR', sans-serif;
            color: #4d4d4d;
        }

        .pcn-result-msg {
            text-align: center;
            margin-bottom: 15%;
            font-size: 16px;
            font-weight: 900;
            font-family: 'Noto Sans KR', sans-serif;
            color: #c5c6b6;
        }

        .pcn-result-logo {
            text-align: center;
            margin-bottom: 10%;
        }

        .pcn-result-btn {
            text-align: center;
            width: 100%;
        }

        .pcn-btn {
            width: 35%;
            height: 45px;
            margin: 1%;
            line-height: 35px;
            font-size: 15px;
        }
        
        
    </style>


    <script>
        //유효성 검사
        var exp = 0;
        var same = 0;
        $(function() {
            $("input[type=password]").eq(0).keyup(function() {
                var pw = $("input[type=password]").eq(0).val();
                if (pw != "") {
                    var regExp = /^(?=.*[a-z])(?=.*[0-9])(?=.*[$@!%*#?])[a-z0-9$@!%*#?].{8,20}$/;
                    if (!regExp.test(pw)) {
                        $(this).addClass("invalid-input");
                        $("input[type=password]").eq(1).addClass("cursor-not");
                        $("input[type=password]").eq(1).removeClass("invalid-input");
                        $("input[type=password]").eq(1).attr("disabled", "true");
                        $("input[type=password]").eq(1).val("");
                        $(".cpb-msg").html("영문 소문자, 숫자, 특수문자 포함 8~20자리")
                        exp = 0;
                        console.log(exp);
                    } else {
                        $(this).removeClass("invalid-input");
                        $(".cpb-msg").html("");
                        $("input[type=password]").eq(1).removeClass("cursor-not");
                        $("input[type=password]").eq(1).removeAttr("disabled");
                        exp = 1;
                        console.log(exp);
                    }
                } else {

                }


            });

            $("input[type=password]").eq(1).keyup(function() {

                if (exp == 1) {
                    var pw = $("input[type=password]").eq(0).val();
                    var pw2 = $("input[type=password]").eq(1).val();
                    if (pw == pw2) {
                        $(this).removeClass("invalid-input");
                        $(".cpb-msg").html("");
                        same = 1;
                        console.log(same);
                    } else {
                        $(this).addClass("invalid-input");
                        $(".cpb-msg").html("비밀번호가 같지 않습니다.");
                        same = 0;
                    }
                }
            });
            
            //비번 버튼 활성화
            $("body").mouseover(function(){
            	
            	if(exp==1 && same==1){
            		$("#btnChangePw").prop("disabled",false);
            	}else{
            		$("#btnChangePw").prop("disabled",true);
            	}
            });
            
            //비번 버튼 누름
            $("#btnChangePw").click(function(){
            	var memberEmail = $("input[name=memberEmail]").val();
            	var memberPw = $("input[name=memberPw]").val();
            	$.ajax({
            		url: "/meister/member/changeForgottenPw.do",
            		data : {memberEmail:memberEmail, memberPw:memberPw},
            		type: "post",
            		success:function(data){
            			console.log(data);
            			if(data=="0"){
            				console.log("비번 변경 완료");
            				$("#submitModal").modal("show");
            			}else{
            				console.log("실패 메인 ㄱㄱ");
            				location.href("/");
            			}
            		},
            		error: function(){
            			console.log("ajax실패");
            		}
            	});
            });
            
      
        });
        
        function func(){
            if(exp==1 &&same==1){
                console.log("true");
                return true;
            }else{
                console.log("false");
                return false;
            }
        }
        
        
        
        /*모달*/
        
        

    </script>


</body>

</html>
