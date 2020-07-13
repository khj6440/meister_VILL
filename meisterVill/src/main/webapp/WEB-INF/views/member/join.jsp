<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">
    <link rel="stylesheet" href="/resources/yr/css/join_css.css" type="text/css">
    <title>Join Member</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/member/serviceTermModalTest.jsp"/>
    <jsp:include page="/WEB-INF/views/member/useTermModalTest.jsp"/>
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
                    약관동의
                </div>
                <form action="/meister/member/joinEnd.do" method="post">
                    <div class="jcb-content">
                        <div class="all-ok">
                            <input type="checkbox" name="all-check" value="allCheck" id="all-check">
                            <span>

                                <label class="chbx-la all-check" for="all-check">
                                    <img src="/resources/yr/imgs/chkbox.png" class="checked-yellow" width="20px" height="20px">
                                    <img src="/resources/yr/imgs/chkbox_none2.png" class="checked-none" width="20px" height="20px">
                                    전체동의
                                </label>
                            </span>



                        </div>
                        <div class="jcb-line"></div>
                        <div class="jcb-terms">

                            <input type="checkbox" name="old-agree" id="old-agree" value="oldAgree">
                            <span>

                                <label class="chbx-la old-agree" for="old-agree">
                                    <img src="/resources/yr/imgs/chkbox.png" class="checked-yellow" width="20px" height="20px">
                                    <img src="/resources/yr/imgs/chkbox_none2.png" class="checked-none" width="20px" height="20px">
                                    만 14세 이상입니다.</label><label class="chbx-la old-agree" for="old-agree">(필수)</label>
                            </span><br>
                            <input type="checkbox" name="service-agree" id="service-agree" value="serviceAgree">
                            <span>

                                <label class="chbx-la service-agree" for="service-agree">
                                    <img src="/resources/yr/imgs/chkbox.png" class="checked-yellow" width="20px" height="20px">
                                    <img src="/resources/yr/imgs/chkbox_none2.png" class="checked-none" width="20px" height="20px">
                                    <a href="#" data-toggle="modal" data-target="#serviceTermModal">서비스 이용약관</a>에 동의합니다.</label><label class="chbx-la service-agree" for="service-agree">(필수)</label>
                            </span><br>
                            <input type="checkbox" name="use-agree" id="use-agree" value="useAgree">
                            <span>

                                <label class="chbx-la use-agree" for="use-agree">
                                    <img src="/resources/yr/imgs/chkbox.png" class="checked-yellow" width="20px" height="20px">
                                    <img src="/resources/yr/imgs/chkbox_none2.png" class="checked-none" width="20px" height="20px">
                                    <a href="#" data-toggle="modal" data-target="#useTermModal">
                                        개인정보 수집·이용</a>에 동의합니다.</label><label class="chbx-la use-agree" for="use-agree">(필수)</label>
                            </span><br>
                            <input type="checkbox" name="event-agree" id="event-agree" value="eventAgree">
                            <span>

                                <label class="chbx-la event-agree" for="event-agree">
                                    <img src="/resources/yr/imgs/chkbox.png" class="checked-yellow" width="20px" height="20px">
                                    <img src="/resources/yr/imgs/chkbox_none2.png" class="checked-none" width="20px" height="20px">
                                    이벤트 할인 혜택 알림 수신에 동의합니다.(선택)</label>
                            </span><br>
                            <input type="checkbox" name="active-agree" id="active-agree" value="activeAgree">
                            <span>

                                <label class="chbx-la active-agree" for="active-agree">
                                    <img src="/resources/yr/imgs/chkbox.png" class="checked-yellow" width="20px" height="20px">
                                    <img src="/resources/yr/imgs/chkbox_none2.png" class="checked-none" width="20px" height="20px">
                                    장기 미접속 시 계정 활성상태 유지합니다.(선택)</label>
                            </span><br>

                        </div>

                    </div>
                    <button type="submit" class="btn btn-yr-normal btn-join-next" disabled>다음</button>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script>
        $(function() {

            //필수 체크사항 체크시 버튼 활성화
            $(".jcb-content").mouseover(function() {
                if ($("#old-agree").prop("checked") && $("#service-agree").prop("checked") && $("#use-agree").prop("checked")) {
                    $(".btn-join-next").prop("disabled", false);
                } else {
                    $(".btn-join-next").prop("disabled", true);
                }
            });


            $(".all-check").mouseup(function() {
                console.log($(".all-check").children().eq(0).css("display"));
                if ($(".all-check").children().eq(0).css("display") == "none") { //체크 안된 상태->ㅊㅔ크
                    $(".jcb-terms").children("input[type=checkbox]").prop("checked", true);
                } else {

                    $(".jcb-terms").children("input[type=checkbox]").prop("checked", false);
                }
            });
        });

    </script>
    
</body>

</html>
