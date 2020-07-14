<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<!-- ******************************************************************************** -->
	<!-- Default : link , meta , script -->
	<jsp:include page="/WEB-INF/views/admin/adminDefault.jsp" />
	
<!-- ******************************************************************************** -->

<title>공지사항</title>
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
      <section class="wrapper">

           
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i>공지사항</h4>
                <hr>
                <thead>
                  <tr>
                  <th></th>
                  	<th class="hidden-phone"><i class="fa fa-user"></i>작성자</th>
                    <th><i class="fa fa-align-left"></i>제목</th>
                    <th><i class="fa fa-bookmark"></i>작성일</th>
                    <th><i class="fa fa-check-square-o"></i>조회수</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="n" varStatus="i">
                  <tr>
                  <td></td>
                  
                  	<td class="hidden-phone">

                    <c:if test="${m.memberImg != null }">
                    		<img src="/resources/upload/memberImg/${m.memberImg}" style="width: 20px; height: 20px;"> 
                    </c:if>
                    
                    <c:if test="${m.memberImg == null }">
                    	<c:if test="${m.memberLevel == 2}">
                    		<img src="/resources/upload/common/adminImg.jpg" style="width: 20px; height: 20px;"> 
                    	</c:if>
                    	<c:if test="${m.memberLevel != 2}">
                    		<img src="/resources/upload/memberImg/unnamed.png" style="width: 20px; height: 20px;"> 
                    	</c:if>
                    </c:if>
                    
                    ${n.noticeWriter }</td>
                  
                    <td>
                      <a href="/meister/adminBoard/noticeView.do?noticeNo=${n.noticeNo }"><div style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 250px;">${n.noticeTitle}</div></a>
                      </td>

                    
                    
                    <td>${n.noticeDate}</td>
                    <td>${n.noticeViewCount} </td>
                    
                    
                    <td>
                     <a href="/meister/adminBoard/noticeView.do?noticeNo=${n.noticeNo }" class="btn btn-danger btn-xs modalDelete" style="background-color: #FFBC42; border-color: #FFBC42; color: white;"><i class="fa fa-check" ></i>글보기</a>
                     <button value="${n.noticeNo }" class="btn btn-danger btn-xs noticeDelete" style="background-color: #F16B6F; border-color: #F16B6F; color: white;"><i class="fa fa-trash-o" ></i>삭제</button>
                     <a href="/meister/adminBoard/noticeModify.do?noticeNo=${n.noticeNo }" class="btn btn-danger btn-xs" style="background-color: #FFBC42; border-color: #FFBC42; color: white;"><i class="fa fa-trash-o" ></i>수정</a>
                    </td>
                    
                  </tr> 

                  </c:forEach>
                </tbody>
              </table> 	
            </div>
            

            	<a href="/meister/adminBoard/adminNoticeWrite.do" class="btn btn-danger btn-xs" style="margin-top: 2%; margin-right: 3%; width:100px; height: 40px; line-height: 40px; float:right; background-color: #6c757d; border-color: #6c757d; color: white;"><i class="fa fa-pencil"></i> 글쓰기</a>

            <div id="pageNavi" style="margin-top: 3%; text-align: center;">${pageNavi }</div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

<!-- ******************************************************************************** -->
		<!-- Footer bar -->
		<jsp:include page="/WEB-INF/views/admin/adminFooter.jsp" />
		
<!-- ******************************************************************************** -->


  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="/resources/adminCss/lib/jquery/jquery.min.js"></script>
  <script src="/resources/adminCss/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="/resources/adminCss/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="/resources/adminCss/lib/jquery.scrollTo.min.js"></script>
  <script src="/resources/adminCss/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="/resources/adminCss/lib/common-scripts.js"></script>
  <!--script for this page-->
     

<!-- --------------------------------sellViewModal----------------------------------------------------- -->

    <div style="padding-top: 10%;" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="width: 600px; height: 600px;" class="modal-dialog" role="document">
            <div  class="modal-content">
                <div style="border-top-left-radius: 4px; border-top-right-radius: 4px; background-color: #6c757d;"class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">회원 정지</h5>
                </div>
                <div class="modal-body">
                   		 정말로 정지하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button style="background-color: #6c757d;" type="button" class="btn btn-primary memberValue">회원 정지</button>
                    
                </div>
            </div>
        </div>
    </div>
    
    
<!-- --------------------------------Modal-mini----------------------------------------------------- -->  
    
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
  $(function(){
	  
	  $(".noticeDelete").click(function() {
		  $("#exampleModal").modal("show");  
		  var noticeNo = $(this).val();
		  var reqPage = ${reqPage};
		  var totalCnt = ${totalCnt}-1;
		  
		  console.log("알이큐페이지"+reqPage);
		  console.log(""+totalCnt);
		  $(".modal-title").html("공지 삭제");
		  $(".modal-header").css("background-color","#6c757d");
		  $(".memberValue").css("background-color","#6c757d");
		  $(".memberValue").css("border-color","#6c757d");
		  $(".memberValue").html("삭제");
		  $(".modal-body").html("정말로 글을 삭제시키시겠습니까?");
	  $(".memberValue").click(function() {		
  $.ajax({
	    url: "/meister/adminBoard/noticeDelete.do?noticeNo="+noticeNo,

	    success: function(){
	    	$("#exampleModal").modal("hide");
	    	$(".modal2text").html("삭제되었습니다.");
	    	$(".modal-content2").css("background-color","#6c757d");
	    	$("#exampleModal2").modal("show");
	    	setTimeout(function() {
	    		location.reload();
	    		if(totalCnt%12 == 0){
	    			reqPage=reqPage-1;
	    			if(reqPage == 1){
	    				reqPage = reqPage+0;
	    			}
	    			
	    		window.location.href="adminNotice.do?reqPage="+reqPage;
	    		}
	    		}, 1000);
	    	

	    			
	    }
	    
	    
	  		});
		});
	});

/*--------------------------------------------------------------------------------------------- */	  


	  $(".noticeModify").click(function() {
		  $("#exampleModal").modal("show");  
		  var memberNo = $(this).val();
		  $(".modal-title").html("정지 취소");
		  $(".modal-header").css("background-color","#30A9DE");
		  $(".memberValue").css("background-color","#30A9DE");
		  $(".memberValue").css("border-color","#30A9DE");
		  $(".memberValue").html("정지 취소");
		  $(".modal-body").html("정말로 정지를 취소하시겠습니까?");
	  $(".memberValue").click(function() {		
  $.ajax({
	    url: "/meister/admin/memberRollback.do?memberNo="+memberNo,
	    		
	    

	    success: function(){	
	    	$("#exampleModal").modal("hide");
	    	$(".modal2text").html("정지가 취소되었습니다.");
	    	$(".modal-content2").css("background-color","#30A9DE");
	    	$("#exampleModal2").modal("show");
	    	setTimeout(function() {
	    		location.reload();
	    		}, 1000);
	    }
	    
			});
		});
	});

	  
/*--------------------------------------------------------------------------------------------- */	 
	  
	  
	  
	  $(".modalDelete").click(function() {
		  $("#exampleModal").modal("show");  
		  var memberNo = $(this).val(); 
		  var reqPage = ${reqPage};
		  var totalCnt = ${totalCnt}-1;
		  $(".modal-header").css("background-color","#F16B6F");
		  $(".modal-title").html("회원 탈퇴");
		  $(".memberValue").html("회원 탈퇴");
		  $(".modal-body").html("정말로 회원를 탈퇴시키시겠습니까?<br>※ 회원을 탈퇴할 경우, 회원정보가 손실될 수 있습니다. ※");
		  $(".memberValue").css("background-color","#F16B6F");
		  $(".memberValue").css("border-color","#F16B6F");
	  $(".memberValue").click(function() {		
  $.ajax({
	    url: "/meister/admin/memberDeletion.do?memberNo="+memberNo,

	    success: function(){	
	    	$("#exampleModal").modal("hide");
	    	$(".modal2text").html("탈퇴되었습니다.");
	    	$(".modal-content2").css("background-color","#F16B6F");
	    	$("#exampleModal2").modal("show");
	    	setTimeout(function() {
	    		location.reload();
	    		if(totalCnt%6 == 0){
	    			reqPage=reqPage-1;
	    		window.location.href="memberAllViewFrm.do?reqPage="+reqPage;
	    		}
	    		}, 1000);
	    }
	    
			});
		});
	});
	  



	  $("#close_modal").click(function() {
          $("#exampleModal").modal("hide");
      });
  });
  </script>
  
  
</body>

</html>
