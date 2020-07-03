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

<title>정지 회원 관리</title>
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
                <h4><i class="fa fa-angle-right"></i>정지 회원 관리</h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i>유저 이메일</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i>유저 이름</th>
                    <th><i class="fa fa-question-circle"></i>유저 닉네임 </th>
                    <th><i class="fa fa-question-circle"></i>유저 레벨 </th>
                    <!-- <i class="fa fa-bookmark"> -->
                    <!-- <i class=" fa fa-edit"> -->
                    <th><i class="fa fa-bookmark"></i>유저 가입일</th>
                    <th></th>
                  </tr>
                </thead>
                <tr id="total">
                 	<td colspan="6" style="font-size: 20px; text-align: center;">목록없음 ${time }</td>
                </tr>
                
				 <c:forEach items="${list}" var="m">
                 	<c:if test="${m.memberStatus == 2 }">
                 	<script>
                 			$("#total").css("display","none");
                 	</script>
                <tbody>
                  <tr>
                    <td>
                      <a href="/meister/admin/memberOneViewFrm.do?memberNo=${m.memberNo}">${m.memberEmail }</a>
                      </td>
                    <td class="hidden-phone">

                    <c:if test="${m.memberImg != null }">
                        <c:if test="${m.memberLevel == 2}">
                    		<img src="/upload/common/adminImg.jpg" style="width: 20px; height: 18px;"> 
                    	</c:if>
                    	<c:if test="${m.memberLevel != 2}">
                    		<img src="/upload/memberImg/${m.memberImg}" style="width: 20px; height: 18px;"> 
                    	</c:if>
                    </c:if>
                    
                    <c:if test="${m.memberImg == null }">
                    	<c:if test="${m.memberLevel == 2}">
                    		<img src="/upload/common/adminImg.jpg" style="width: 20px; height: 18px;"> 
                    	</c:if>
                    	<c:if test="${m.memberLevel != 2}">
                    		<img src="/upload/memberImg/unnamed.png" style="width: 20px; height: 18px;"> 
                    	</c:if>
                    </c:if>
                    
                    ${m.memberName }</td>
                    
                    <td>${m.memberNickname } </td>
                    <td>
                    <c:if test="${m.memberLevel == 0}">
                    <span class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 12px;">
                   	일반회원
                    </span>
                    </c:if>
                    
                    <c:if test="${m.memberLevel == 1}">
                    <span class="label label-info label-mini" style="font-size: 12px;">
                   	마이스터
                    </span>
                    </c:if>
                    
                    <c:if test="${m.memberLevel == 2}">
                    <span class="label label-info label-mini" style="background-color: #A593E0; font-size: 12px;">
                   	관리자
                    </span>
                    </c:if>
                    
                    </td>
                    <td>${m.memberDate } </td>
                    <td>
                      <!-- <span class="label label-info label-mini" style="background-color: red">신고 접수</span> -->
                      <button class="btn btn-success btn-xs" style="background-color: #FFBC42; border-color: #FFBC42;"><i class="fa fa-check"></i><a href="/meister/admin/memberOneViewFrm.do?memberNo=${m.memberNo}" style="text-decoration: none; color: white;">회원정보 보기</a></button>
                      <!-- <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button> -->
                      <button value="${m.memberNo}" class="btn btn-danger btn-xs modalHalt" style="background-color: #30A9DE; border-color: #30A9DE; text-decoration: none; color: white;"><i class="fa fa-trash-o"></i>정지 취소</button>
                    </td>
                  </tr> 
                </tbody>
                </c:if>
                </c:forEach>
              </table>
            </div>
            
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
  
  
  
  
  <!-- --------------------------------Modal----------------------------------------------------- -->
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
	  
	  $(".modalHalt").click(function() {
		  $("#exampleModal").modal("show");  
		  var memberNo = $(this).val(); 
		  $(".modal-title").html("정지 복구");
		  $(".modal-header").css("background-color","#30A9DE");
		  $(".memberValue").css("background-color","#30A9DE");
		  $(".memberValue").css("border-color","#30A9DE");
		  $(".memberValue").html("정지 복구");
		  $(".modal-body").html("정말로 회원을 복구시키시겠습니까?");
	  $(".memberValue").click(function() {		
  $.ajax({
	    url: "/meister/admin/memberHaltRollback.do?memberNo="+memberNo,
	    

	    success: function(){
	    	$("#exampleModal").modal("hide");
	    	$(".modal2text").html("회원이 복구되었습니다.");
	    	$(".modal-content2").css("background-color","#30A9DE");
	    	$("#exampleModal2").modal("show");
	    	setTimeout(function() {
	    		location.reload();
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