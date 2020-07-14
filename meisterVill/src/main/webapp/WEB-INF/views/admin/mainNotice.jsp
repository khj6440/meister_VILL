<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/yr/imgs/logo.png">

<!-- ******************************************************************************** -->
	<!-- Default : link , meta , script -->
	<jsp:include page="/WEB-INF/views/admin/adminDefault.jsp" />
	
<!-- ******************************************************************************** -->

    <title>공지사항</title>


    <!--slick-slider-->
    <link rel="stylesheet" type="text/css" href="/resources/yr/slick/slick.css" />

    <link rel="stylesheet" type="text/css" href="/resources/yr/slick/slick-theme.css" />
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

</head>
<style>
	.fa-3x:hover{
		background-color: #30A9DE;	
	}
</style>
<body>
	 <jsp:include page="/WEB-INF/views/common/main_header.jsp"></jsp:include>
	 
	 
	 <section id="container">
 
 
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
            
            <c:forEach items="${list }" var="an" varStatus="i">
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="qna.jsp#${i.index}">
                    <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>${an.noticeTitle} 
                    </a>
                </div>
                <div id="${i.index}" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>${an.noticeContent } </p>
                  </div>
                </div>
              </div>
			</c:forEach>
            </div>
            
            <div id="pageNavi" style="margin-top: 3%; text-align: center;">${pageNavi }</div>
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
	 
	 
	 
	 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	 
	   <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="/resources/yr/slick/slick.min.js"></script>
    
    
    
    
    
</body>
</html>