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
  <title>QnA</title>




<!-- ******************************************************************************** -->
	<!-- Default : link , meta , script -->
	<jsp:include page="/WEB-INF/views/admin/adminDefault.jsp" />
	
<!-- ******************************************************************************** -->

<title>QnA</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<style>
	.fa-3x:hover{
		background-color: #30A9DE;	
	}
</style>
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
        <div class="row mt mb">
          <div class="col-lg-12">
            <h3><i class="fa fa-angle-right"></i> QnA</h3>
            <br>
            <div class="col-lg-4 col-md-4 col-sm-12">
              <div class="dmbox">
                <div class="service-icon">
                  <i class="dm-icon fa fa-user fa-3x"></i>  
                </div>
                <h4>1. 회원가입은 어떻게 하나요?</h4>
                <p>메인페이지에서 상단에 있는 버튼을 누르시면 됩니다.</p>
              </div>
            </div>
            <!-- end dmbox -->
            <div class="col-lg-4 col-md-4 col-sm-12">
              <div class="dmbox">
                <div class="service-icon">
                  <i class="dm-icon fa fa-gavel fa-3x"></i>
                </div>
                <h4>2. 마이스터 등록은 어떻게 하나요?</h4>
                <p>회원가입을 하면 일반회원으로 등록이 되고 추가로 마이스터 등록을 위한 정보를 입력하면 마이스터 등록이 완료됩니다.</p>
              </div>
            </div>
            <!-- end dmbox -->
            <div class="col-lg-4 col-md-4 col-sm-12">
              <div class="dmbox">
                <div class="service-icon">
                  <i class="dm-icon fa fa-random fa-3x"></i>

                </div>
                <h4>3. 마이스터에게 견적요청은 어떻게 하나요?</h4>
                <p>회원가입 후, 견적요청글의 정보를 입력하여 글을 작성하시면 마이스터들이 볼수 있는 게시글이 등록됩니다.</p>
              </div>
            </div>
            <!-- end dmbox -->
          </div>
          <!--  /col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row content-panel">
          <h2 class="centered">자주 묻는 질문</h2>
          <div class="col-md-10 col-md-offset-1 mt mb">
            <div class="accordion" id="accordion2">
            
            <c:forEach items="${list }" var="q" varStatus="i">
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="qna.jsp#${i.index}">
                    <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>${q.qnaTitle} 
                    </a>
                </div>
                <div id="${i.index}" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>${q.qnaContent } </p>
                  </div>
                </div>
              </div>
			</c:forEach>
            </div>
            
            <div id="pageNavi" style="margin-top: 3%; text-align: center;">${pageNavi }</div>
            <div class="newQna" style=" border-radius: 15px; text-align: center; display: inline-block; float:right; width: 80px; line-height:29px; font-size:18px; height: 30px; border: 1px soild #30A9DE; background-color: #30A9DE; color: white;">작성</div>
            <!-- end accordion -->
          </div>
          <!-- col-md-10 -->
        </div>
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
                <form action="newQna.do" method="get">
                <div class="modal-body">
					
                   		 <input type="text" name="qnaTitle" placeholder="Title" style="border-radius: 15px; border: 1px solid #6c757d; font-size: 20px; height: 40px; width: 99%;">
							<br><br><br>
                   		 
                   		 <textarea name="qnaContent" rows="15" cols="49.9" placeholder="Content" style="resize: none; border-radius: 15px; font-size: 20px;"></textarea>
                	
                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <input type="submit" style="background-color: #6c757d;" class="btn btn-primary memberValue" value="작성"></input>
                    
                </div>
                </form>
            </div>
        </div>
    </div>
    
    
    
    
    <script>
  $(function(){
	  $(".newQna").click(function() {
		  var reqPage = ${reqPage};
		  var totalCnt = ${totalCnt}-1;
		  var html = "";
		  $("#exampleModal").modal("show");  
    	  $(".modal-title").html("QnA작성");
		  $(".modal-header").css("background-color","#6c757d");
		  $(".memberValue").css("background-color","#6c757d");
		  $(".memberValue").css("border-color","#6c757d");
	
		
		});
	});

    </script>
  
  

</body>
</html>