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

<title>프로젝트글 리스트</title>
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
              <table class="table table-striped">
                <h4><i class="fa fa-angle-right"></i>프로젝트글 리스트</h4>
                <hr>
					 <thead>
                  <tr>
                    <th><i class="fa fa-sort-numeric-asc"></i>번호</th>
                    <th class="hidden-phone"><i class="fa fa-align-left"></i>제목</th>
                    <th class="hidden-phone"><i class="fa fa-user"></i>주최자</th>
                    <th><i class="fa fa-tags"></i>(대)카테고리</th>
                    <th><i class="fa fa-tag"></i>(소)카테고리</th>
                     <th><i class="fa fa-money"></i>예산</th>
                    <!-- <i class="fa fa-bookmark"> -->
                    <!-- <i class=" fa fa-edit"> -->
                    <th><i class="fa fa-question-circle"></i>상태</th>
                    <th><i class="fa fa-calendar-check-o"></i>프로젝트 시작일</th>
                    <th><i class="fa fa-calendar-times-o"></i>게시글 마감일</th>
                  </tr>
                </thead>
					
					
               <tbody>
                <tr>
                <c:forEach items="${list}" var="e" varStatus="i">
                	
                 	<tr>
                 	
                 	<td>${e.rnum }</td>
                 	<td><span style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 250px;">${e.employTitle }</span></td>
                 	<td>
                 	
                 	<c:if test="${e.memberImg != null }">
                    		<div><img src="/resources/upload/memberImg/${e.memberImg}" style="width: 25px; height: 25px;"> 
                    		 <a href="/meister/admin/memberOneViewFrm.do?memberNo=${e.memberNo}">${e.memberName }</a></div>
                    </c:if>
                    
                    <c:if test="${e.memberImg == null }">
                    	<c:if test="${e.memberLevel == 2}">
                    		<img src="/resources/upload/common/adminImg.jpg" style="width: 25px; height: 25px;"> 
                    		 <a href="/meister/admin/memberOneViewFrm.do?memberNo=${e.memberNo}">${e.memberName }</a>
                    	</c:if>
                    	<c:if test="${e.memberLevel != 2}">
                    		<img src="/resources/upload/memberImg/unnamed.png" style="width: 25px; height: 25px;"> 
                    		 <a href="/meister/admin/memberOneViewFrm.do?memberNo=${e.memberNo}">${e.memberName }</a>
                    	</c:if>
                    </c:if>
                 	
                 	</td>
                    <td> ${e.employCategory1 }</td>
                    <td>${e.employCategory2}</td>
                    <td>${e.employPrice}￦ </td>
                    
                    <td>
                    <c:if test="${e.employStatus == 0}">
                    <span class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 12px;">
                   	정상
                    </span>
                    </c:if>
                    
                    <c:if test="${e.employStatus == 1}">
                    <span class="label label-info label-mini" style="font-size: 12px;">
                   	진행중
                    </span>
                    </c:if>
                    
                    <c:if test="${e.employStatus == 2}">
                    <span class="label label-info label-mini" style="background-color: #A593E0; font-size: 12px;">
                   	마감
                    </span>
                    </c:if>
                    
                    </td>
                    
                    <td>${e.projectStart } </td>
                    <td>${e.employBoardEnd}</td>
                    
                     <td>
                      <a href="/meister/admin/memberOneViewFrm.do?memberNo=${r.memberNo}" class="btn btn-success btn-xs" style="background-color: #FFBC42; border-color: #FFBC42; text-decoration: none; color: white;"><i class="fa fa-check"></i>게시물 보기</a>
                    </td>
                    

                    	


                  </tr> 
     
                  </c:forEach>
                  </tr> 
              	</tbody>
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
                   		 내용
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button style="background-color: #6c757d;" type="button" class="btn btn-primary memberValue">회원 정지</button>
                    
                </div>
            </div>
        </div>
    </div>
    
    
<!-- --------------------------------sellViewModal----------------------------------------------------- -->
    <div style="padding-top: 10%;" class="modal fade" id="sellExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="width: 70%;" class="modal-dialog" role="document">
            <div  class="modal-content">
                <div style="border-top-left-radius: 4px; border-top-right-radius: 4px; background-color: #6c757d;"class="sell-modal-header modal-header">
                    <h5 class="modal-title sell-modal-title" id="exampleModalLabel">상세 내용</h5>
                </div>
                <div class="sell-modal-body modal-body">
                   		 내용
                </div>
                <div class="sell-modal-footer modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button style="background-color: #6c757d;" type="button" class="btn btn-primary sellValue" data-dismiss="modal">닫기</button>       
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
    	  
    	  $(".requestEnd").click(function() {
    		  $("#sellExampleModal").modal("show");  
    		  var requestNo = $(this).val(); 
    		  console.log(requestNo);
    		  $(".sell-modal-title").html("강제 마감");
    		  $(".sell-modal-header").css("background-color","#6c757d");
    		  $(".sell-modal-body").html("게시물을 강제로 마감시키시겠습니까?");
    		  $(".sellValue").html("마감");
    	  $(".sellValue").click(function() {		
      $.ajax({
    	    url: "/meister/adminBoard/requestEnd.do?requestNo="+requestNo,
    	         
    	    success: function(){
    	    	$("#sellExampleModal").modal("hide");
    	    	$(".modal2text").html("마감되었습니다.");
    	    	$(".modal-content2").css("background-color","#6c757d");
    	    	$("#exampleModal2").modal("show");
    	    	setTimeout(function() {
    	    		location.reload();
    	    		}, 1000);			
    	    } 
    	  		});
    		});
    	});
    	  

    	  $(".requestRollback").click(function() {
    		  $("#sellExampleModal").modal("show");  
    		  var requestNo = $(this).val(); 
    		  console.log(requestNo);
    		  $(".sell-modal-title").html("마감 취소");
    		  $(".sell-modal-header").css("background-color","#6c757d");
    		  $(".sell-modal-body").html("게시물의 마감을 취소시키시겠습니까?");
    		  $(".sellValue").html("마감 취소");
    	  $(".sellValue").click(function() {		
      $.ajax({
    	    url: "/meister/adminBoard/requestRollback.do?requestNo="+requestNo,
    	         
    	    success: function(){
    	    	$("#sellExampleModal").modal("hide");
    	    	$(".modal2text").html("마감이 취소되었습니다.");
    	    	$(".modal-content2").css("background-color","#6c757d");
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
