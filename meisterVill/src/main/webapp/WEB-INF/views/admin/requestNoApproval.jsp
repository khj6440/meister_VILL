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

<title>견적요청글 비승인 목록</title>
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
                <h4><i class="fa fa-angle-right"></i>견적요청글 비승인 목록</h4>
                <hr>
					 <thead>
                  <tr>
                    <th><i class="fa fa-align-left"></i>제목</th>
                    <th class="hidden-phone"><i class="fa fa-user"></i>작성자</th>
                    <th><i class="fa fa-tags"></i>카테고리</th>
                    <th><i class="fa fa-money"></i>가격</th>
                     <th><i class="fa fa-question-circle"></i>상태</th>
                    <!-- <i class="fa fa-bookmark"> -->
                    <!-- <i class=" fa fa-edit"> -->
                    <th><i class="fa fa-bookmark"></i>작성일</th>
                    <th></th>
                  </tr>
                  

                  
                   <tr id="total">
                 	<td colspan="6" style="font-size: 20px; text-align: center;">목록없음</td>
                </tr>
                </thead>
					
					
               <tbody>
                <tr>
                
                <c:forEach items="${list}" var="r" varStatus="i">
                	
                	<script>
                 			$("#total").css("display","none");
                 	</script>
                 	<tr>
                 		<td>${r.requestTitle }</td>
                    

                    <td class="hidden-phone">

                    <c:if test="${r.memberImg != null }">
                        <c:if test="${r.memberLevel == 2}">
                    		<img src="/resources/upload/memberImg/${r.memberImg}" style="width: 20px; height: 20px;"> 
                    	</c:if>
                    	<c:if test="${r.memberLevel != 2}">
                    		<img src="/resources/upload/memberImg/${r.memberImg}" style="width: 20px; height: 20px;"> 
                    	</c:if>
                    </c:if>
                    
                    <c:if test="${r.memberImg == null }">
                    	<c:if test="${r.memberLevel == 2}">
                    		<img src="/resources/upload/common/adminImg.jpg" style="width: 20px; height: 20px;"> 
                    	</c:if>
                    	<c:if test="${r.memberLevel != 2}">
                    		<img src="/resources/upload/memberImg/unnamed.png" style="width: 20px; height: 20px;"> 
                    	</c:if>
                    </c:if>
                     <a href="/meister/admin/memberOneViewFrm.do?memberNo=${r.memberNo}">${r.memberName }</a></td>
                    
                   <td> ${r.requestCategory1 }</td>
                    
                    
                    <td>${r.requestPrice}￦ </td>
                    
                    <td>
                    
                    <span class="label label-info label-mini"style="background-color: #6c757d; font-size: 12px;">
                   	[비승인]
                    </span>
                    </td>
                    
                    <td>${r.requestDate } </td>
                    <td>
                      <!-- <span class="label label-info label-mini" style="background-color: red">신고 접수</span> -->
                      <a href="/meister/admin/memberOneViewFrm.do?memberNo=${r.memberNo}" class="btn btn-success btn-xs" style="background-color: #FFBC42; border-color: #FFBC42; text-decoration: none; color: white;"><i class="fa fa-check"></i>게시물 보기</a>
                      <!-- <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button> -->
                    

                    	<button value="${r.requestNo }" class="btn btn-danger btn-xs requestApproval" style="background-color: #30A9DE; border-color: #30A9DE; color: white;"><i class="fa fa-bell" ></i>재승인</button>
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
    	  
    	  $(".requestApproval").click(function() {
    		  $("#exampleModal").modal("show");  
    		  var requestNo = $(this).val(); 
    		  var reqPage = ${reqPage};
    		  var totalCnt = ${totalCnt}-1;
    		  console.log(pageNavi);
    		  $(".modal-title").html("게시물 승인");
    		  $(".modal-header").css("background-color","#6c757d");
    		  $(".modal-body").html("게시물을 승인하시겠습니까?");
    		  $(".memberValue").html("승인");
    	  $(".memberValue").click(function() {		
      $.ajax({
    	    url: "/meister/adminBoard/requestApproval.do?requestNo="+requestNo,
    	         
    	    success: function(){
    	    	$("#exampleModal").modal("hide");
    	    	$(".modal2text").html("승인되었습니다.");
    	    	$(".modal-content2").css("background-color","#6c757d");
    	    	$("#exampleModal2").modal("show");
    	    	setTimeout(function() {
    	    		location.reload();
    	    		if(totalCnt%6 == 0){
    	    			reqPage=reqPage-1;
    	    		window.location.href="requestApprovalNoListFrm.do?reqPage="+reqPage;
    	    		}
    	    		}, 1000);			
    	    } 
    	  		});
    		});
    	});
    	  
    	  
    	  
    	  $(".requestNoApproval").click(function() {
    		  $("#exampleModal").modal("show");  
    		  var requestNo = $(this).val(); 
    		  var reqPage = ${reqPage};
    		  var totalCnt = ${totalCnt}-1;
    		  $(".modal-title").html("게시물 비승인");
    		  $(".modal-header").css("background-color","#6c757d");
    		  $(".modal-body").html("게시물을 비승인하시겠습니까?");
    		  $(".memberValue").html("비승인");
    	  $(".memberValue").click(function() {		
      $.ajax({
    	    url: "/meister/adminBoard/requestNoApproval.do?requestNo="+requestNo,
    	         
    	    success: function(){
    	    	$("#exampleModal").modal("hide");
    	    	$(".modal2text").html("비승인되었습니다.");
    	    	$(".modal-content2").css("background-color","#6c757d");
    	    	$("#exampleModal2").modal("show");
    	    	setTimeout(function() {
    	    		location.reload();
    	    		if(totalCnt%6 == 0){
    	    			reqPage=reqPage-1;
    	    		window.location.href="requestApprovalNoListFrm.do?reqPage="+reqPage;
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
