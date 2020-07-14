<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>신고현황</title>




<!-- ******************************************************************************** -->
	<!-- Default : link , meta , script -->
	<jsp:include page="/WEB-INF/views/admin/adminDefault.jsp" />
	
<!-- ******************************************************************************** -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<body>

 <section id="container">
 
 
 <!-- ******************************************************************************** -->
		<!-- Header bar -->
		<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
		
<!-- ******************************************************************************** -->
		<!-- Side bar -->
		<jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp" />
		
<!-- ******************************************************************************** -->

 
 
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">

          <div class="col-lg-12">
            <h3><i class="fa fa-angle-right"></i> 신고현황</h3>
            <hr>
            <br>
            
     
          </div>
          <!--  /col-lg-12 -->
  
        <!-- /row -->
        <div class="row content-panel">
          <h2 class="centered">신고현황</h2>
          <div class="col-md-10 col-md-offset-1 mt mb">
            <div class="accordion" id="accordion2">
            

            <div id="total">
				    <div style="font-size: 20px; text-align: center;">목록없음</div>
				</div>
            
            <c:forEach items="${list }" var="r" varStatus="i">
				<script>
				    $("#total").css("display","none");
				</script>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="qna.jsp#${i.index}">
                    <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>                    	<c:if test="${r.reportBoardType == 1 }">
                    	<span class="label label-info label-mini" style="background-color: #6c757d; font-size: 12.3px;">확인완료</span>
                    	</c:if><br>
                    	신고한 회원 : <img src="/resources/upload/memberImg/${r.memberImg}" style="width: 25px; height: 25px; border-radius: 15px; ">${r.reportMemberNickname}<br>
                    	신고후기가 있는 게시판 : <img src="/resources/upload/sellImg/${r.sellImg}" style="width: 25px; height: 25px; border-radius: 15px; ">${r.sellTitle}


                    																	
                    </a>
                </div>
                <div id="${i.index}" class="accordion-body collapse">
                  <div class="accordion-inner">
                    
                    	신고된 회원 : <img src="/resources/upload/memberImg/${r.reviewWriterImg}" style="width: 25px; height: 25px; border-radius: 15px; ">${r.reviewWriter }<br>
                    	<br><br>후기 내용 : ${r.reviewContent}<br><br><br><br>
                    	작성일 : ${r.reviewDate }<br>
                    	
                    	<button onclick="location.href='/meister/adminSellView/showList.do?sellNo='+${r.sellNo}+'&memberNo='+${r.memberNo}" class="btn btn-success btn-xs sellView" style="background-color: #FFBC42; border-color: #FFBC42; color: white;"><i class="fa fa-check"></i>상세보기</button>
                    	<c:if test="${r.reportBoardType == 0 }">

                    	<button onclick="reviewDelete('${r.reportNo }','${r.sellNo}','${r.reviewContent}', '${r.reviewNo }', '${r.reportBoardNo }');" class="btn btn-danger btn-xs" style="background-color: #F16B6F; border-color: #F16B6F; color: white;"><i class="fa fa-trash-o" ></i>후기삭제</button>
						<button onclick="reviewOK('${r.reportNo }','${r.sellNo}','${r.reviewContent}');" class="btn btn-danger btn-xs" style="background-color: #30A9DE; border-color: #30A9DE; color: white;"><i class="fa fa-trash-o" ></i>신고확인</button>
						</c:if>
						<c:if test="${r.reportBoardType == 1}">
						<button onclick="reviewDelete('${r.reportNo }','${r.sellNo}','${r.reviewContent}', '${r.reviewNo }', '${r.reportBoardNo }');" class="btn btn-danger btn-xs" style="background-color: #F16B6F; border-color: #F16B6F; color: white;"><i class="fa fa-trash-o" ></i>후기삭제</button>
						</c:if>
                  
                  </div>
                </div>
              </div>
			</c:forEach>
            </div>

            <!-- end accordion -->
          </div>
          <!-- col-md-10 -->
        </div>  
         <div id="pageNavi" style="margin-top: 3%; text-align: center;">${pageNavi }</div>
        <!--  /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

  </section>
  
  
  <!-- ******************************************************************************** -->
		<!-- Footer bar -->
		<jsp:include page="/WEB-INF/views/admin/adminFooter.jsp" />
		
<!-- ******************************************************************************** -->
  
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="/resources/adminCss/lib/jquery/jquery.min.js"></script>
  <script src="/resources/adminCss/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="/resources/adminCss/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="/resources/adminCss/lib/jquery.scrollTo.min.js"></script>
  <script src="/resources/adminCss/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="/resources/adminCss/lib/common-scripts.js"></script>
  <!--script for this page-->
  
  
  <!-- --------------------------------Modal----------------------------------------------------- -->
    <div style="padding-top: 10%;" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="width: 600px; height: 600px;" class="modal-dialog" role="document">
            <div  class="modal-content">
                <div style="border-top-left-radius: 4px; border-top-right-radius: 4px; background-color: #6c757d;"class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">회원 정지</h5>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button style="background-color: #6c757d;" type="button" class="btn btn-primary memberValue">회원 정지</button>
                    
                </div>
            </div>
        </div>
    </div>
    
  <!-- --------------------------------mini Modal----------------------------------------------------- --> 
     <div style="padding-top: 10%;" class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="width: 400px; height: 400px;" class="modal-dialog" role="document">
            <div style="background-color: #6c757d; border-radius: 12px;" class="modal-content2">

                <div style=" width: 400px; height: 150px; text-align: center; line-height: 50px; color: white;" class="modal-body2">
                   		<span style="font-size: xx-large; line-height: 150px;" class="modal2text">정지되었습니다.</span>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    <script>


  function reviewDelete(reportNo, sellNo, reviewContent, reviewNo, reportBoardNo) {
	  var reqPage = ${reqPage};
	  var totalCnt = ${totalCnt}-1;
	  $("#exampleModal").modal("show");   
	  $(".modal-title").html("후기삭제");
	  $(".modal-header").css("background-color","#F16B6F");
	  $(".memberValue").css("background-color","#F16B6F");
	  $(".memberValue").css("border-color","#F16B6F");
	  $(".memberValue").html("삭제");
	  $(".modal-body").html("정말로 후기를 삭제하시겠습니까?");
	 console.log(reportNo);
	 console.log(sellNo);
	 console.log(reviewContent);
   $(".memberValue").click(function() {		
$.ajax({

    url: "/meister/adminBoard/reviewDelete.do?reportNo="+reportNo+"&sellNo="+sellNo+"&reviewContent="+reviewContent+"&reviewNo="+reviewNo+"&reportBoardNo="+reportBoardNo,

    success: function(){
    	$("#exampleModal").modal("hide");
    	$(".modal2text").html("삭제되었습니다.");
    	$(".modal-content2").css("background-color","#F16B6F");
    	$("#exampleModal2").modal("show");
    	setTimeout(function() {
    		location.reload();
    		if(totalCnt%12 == 0){
    			reqPage=reqPage-1;
    		window.location.href="reportList.do?reqPage="+reqPage;
    		}else{
    			reqPage = 1;
    			window.location.href="reportList.do?reqPage="+reqPage;
    		}
    		
    		}, 1000);
    }

  		});
	}); 
  };
  

  function reviewOK(reportNo, sellNo, reviewContent) {
	  $("#exampleModal").modal("show");   
	  $(".modal-title").html("신고확인");
	  $(".modal-header").css("background-color","#30A9DE");
	  $(".memberValue").css("background-color","#30A9DE");
	  $(".memberValue").css("border-color","#30A9DE");
	  $(".memberValue").html("확인");
	  $(".modal-body").html("신고를 확인하면 삭제처리가 되지않습니다. ");
	 console.log(reportNo);
	 console.log(sellNo);
	 console.log(reviewContent);
   $(".memberValue").click(function() {		
$.ajax({
    url: "/meister/adminBoard/reviewOk.do?reportNo="+reportNo+"&sellNo="+sellNo+"&reviewContent="+reviewContent,

    success: function(){
    	$("#exampleModal").modal("hide");
    	$(".modal2text").html("확인되었습니다.");
    	$(".modal-content2").css("background-color","#30A9DE");
    	$("#exampleModal2").modal("show");
    	setTimeout(function() {
    		location.reload();
    		}, 1000);	
    }

  		});
	}); 
  };


    </script>
  
  

</body>
</html>