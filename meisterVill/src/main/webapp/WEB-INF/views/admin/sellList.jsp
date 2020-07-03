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

<title>판매글 리스트</title>
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
                <h4><i class="fa fa-angle-right"></i>판매글 리스트</h4>
                <hr>

               <tbody style="text-align: center;">
                <tr>
                <c:forEach items="${list}" var="s" varStatus="i">
                    <td style=" margin-left: 5%; margin-bottom: 5%; margin-top:5%; display: inline-block; border-top-style: none; width: 25%; height: 25%;">
                     <div><img src="/upload/sellImg/${s.sellImg}" style="width: 100%; height: 300px;" ></div> 
                     
                    <div style="margin: 0 auto;">
                    <div style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 95%;"><a href="/meister/admin/memberOneViewFrm.do?memberNo=${s.sellTitle}">${s.sellTitle}</a></div>
				
				<div>
                    <c:if test="${s.memberImg != null }">
                    		<div><img src="/upload/memberImg/${s.memberImg}" style="width: 25px; height: 25px;"> 
                    		 ${s.memberName }</div>
                    </c:if>
                    
                    <c:if test="${s.memberImg == null }">
                    	<c:if test="${s.memberLevel == 2}">
                    		<img src="/upload/common/adminImg.jpg" style="width: 25px; height: 25px;"> 
                    		 ${s.memberName }
                    	</c:if>
                    	<c:if test="${s.memberLevel != 2}">
                    		<img src="/upload/memberImg/unnamed.png" style="width: 25px; height: 25px;"> 
                    		 ${s.memberName }
                    	</c:if>
                    </c:if>

                   </div>
                   
                    
                    <div>카테고리 : ${s.sellCategory1 } </div>
                    
                    <div>(소)카테고리 : ${s.sellCategory2 } </div>

                    <div>
                    ${s.sellPrice} ￦ 
                    
                     <c:if test="${s.sellStatus == 0 }">
                     <span class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 12px;">
                   	상태[정상]
                    </span>
                    </c:if>
                    
                    <c:if test="${s.sellStatus == 1 }">
                     <span class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 12px;">
                   	상태[비활성화]
                    </span>
                    </c:if>
                    
                    <c:if test="${s.sellStatus == 2 }">
                     <span class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 12px;">
                   	상태[삭제됨]
                    </span>
                    </c:if>
                    </div>
                    
                    <div>작성일 : ${s.sellDate }</div>
                    

					<div>
                      <!-- <span class="label label-info label-mini" style="background-color: red">신고 접수</span> -->
                      <button value="${s.sellNo }" class="btn btn-success btn-xs sellView" style="background-color: #FFBC42; border-color: #FFBC42; color: white;"><i class="fa fa-check"></i>상세보기</button>
                      <!-- <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button> -->
                    <c:if test="${s.sellStatus != 1 }">
                      <button value="${s.sellNo }" class="btn btn-danger btn-xs modalHalt" style="background-color: #6c757d; border-color: #6c757d; color: white;"><i class="fa fa-trash-o"></i>비활성하기</button>
                    </c:if>
                    
                    <c:if test="${s.sellStatus == 1 }">
                    	<button value="${s.sellNo }" class="btn btn-danger btn-xs modalHaltRollback" style="background-color: #30A9DE; border-color: #30A9DE; color: white;"><i class="fa fa-trash-o" ></i>활성화하기</button>
                    </c:if>
                    
                    <c:if test="${s.sellStatus != 2 }">
                      <button value="${s.sellNo }" class="btn btn-danger btn-xs modalDelete" style="background-color: #F16B6F; border-color: #F16B6F; color: white;"><i class="fa fa-trash-o" ></i>게시글 삭제</button>
                    </c:if>
                    </div>
					</div>
					</td>
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
                   		 
                   		  
                   		 
                </div>
                <div class="sell-modal-footer modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>     
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
    	  
    	  $(".sellView").click(function() {
    		  $("#sellExampleModal").modal("show");  
    		  var sellNo = $(this).val(); 
    		  $(".sell-modal-title").html("상세 내용");
    		  $(".sell-modal-header").css("background-color","#6c757d");
    		  $(".sell-modal-body").html("내용<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>넣는 칸");
    	  $(".memberValue").click(function() {		
      $.ajax({
    	    url: "/meister/admin/memberOneViewFrm.do?sellNo="+sellNo,
    	         
    	    success: function(){
    	    	$("#exampleModal").modal("hide");
    	    	$(".modal2text").html("정지되었습니다.");
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
