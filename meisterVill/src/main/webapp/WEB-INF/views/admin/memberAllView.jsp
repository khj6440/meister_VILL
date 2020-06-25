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

<title>회원 전체 조회</title>
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
                <h4><i class="fa fa-angle-right"></i>회원 전체 관리</h4>
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
                <tbody>
                <c:forEach items="${list}" var="m"> 
                  <tr>
                    <td>
                      <a href="/meister/admin/memberOneViewFrm.do?memberNo=${m.memberNo}">${m.memberEmail }</a>
                      </td>
                    <td class="hidden-phone">
                    <c:if test="${m.memberImg != null }">
                    <img src="/upload/admin/${m.memberImg}" style="width: 20px; height: 18px;"> 
                    </c:if>
                    
                    <c:if test="${m.memberImg == null }">
                    <img src="/upload/admin/unnamed.png" style="width: 20px; height: 18px;"> 
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
                      <button class="btn btn-success btn-xs" style="background-color: #FFBC42; border-color: #FFBC42;"><i class="fa fa-check"></i><a href="meister/admin/memberOneViewFrm.do?memberNo=${m.memberNo}" style="text-decoration: none; color: white;">회원정보 보기</a></button>
                      <!-- <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button> -->
                      <button class="btn btn-danger btn-xs" style="background-color: #6c757d; border-color: #6c757d;"><i class="fa fa-trash-o" ></i>회원 정지</button>
                    </td>
                  </tr> 
                  </c:forEach>
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
  <script class="include" type="text/javascript" src="resources/adminCss/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="/resources/adminCss/lib/jquery.scrollTo.min.js"></script>
  <script src="/resources/adminCss/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="/resources/adminCss/lib/common-scripts.js"></script>
  <!--script for this page-->
  
</body>

</html>
