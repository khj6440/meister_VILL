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
                <h4><i class="fa fa-angle-right"></i>   회원 신고 관리  </h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i>유저이메일</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i>유저이름</th>
                    <th><i class="fa fa-bookmark"></i>가입일 </th>
                    <th><i class=" fa fa-edit"></i>신고 현황</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${member}" var="m"> 
                  <tr>
                    <td>
                      <a href="basic_table.html#">${m.memberEmail }</a>
                      </td>
                    <td class="hidden-phone"><img src="/upload/admin/${m.memberImg}" style="width: 20px; height: 18px;"> ${m.memberName }</td>
                    <td>${m.memberDate } </td>
                    <td>
                    <c:if test="${m.reportMemberNickname != null }">
                    	<span class="label label-info label-mini" style="background-color: red">신고 접수</span>
                    </c:if>
                    <c:if test="${m.reportMemberNickname == null }">
                    	<span class="label label-info label-mini">정상 회원</span>
                    </c:if>
                    
                    </td>
                    <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i>회원정보 보기</button>
                      <!-- <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button> -->
                      <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i>회원 정지</button>
                    </td>
                  </tr> 
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
        </div>
        <a href="basic_table.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="resources/adminCss/lib/jquery/jquery.min.js"></script>
  <script src="resources/adminCss/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/adminCss/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/adminCss/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/adminCss/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="resources/adminCss/lib/common-scripts.js"></script>
  <!--script for this page-->
  
</body>

</html>
