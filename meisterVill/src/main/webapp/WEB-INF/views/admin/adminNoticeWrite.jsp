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

<title>전체 회원 관리</title>
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

<section id="main-content">
	<section class="wrapper ">

<div>
	<form action="/meister/adminBoard/adminNoticeInsert.do" method="post">
	<input type="hidden" name="memberNickname" value="${sessionScope.member.memberNickname }">
	<br><br><br>
	<div style="width: 100%; margin: 0 auto; text-align: center;"><input type="text" name="noticeTitle" style="width: 80%; height: 30px; font-size: 20px;" placeholder="Title"></div>
	<br><br>
	
	<div style="width: 100%;">
		<jsp:include page="/WEB-INF/views/notice/noticeCkeditor.jsp" />
	</div>
	
		<div style="text-align: center; margin-top: 2%;"><button type="submit" style="width: 150px; height: 30px; margin-right: 1%;">작성</button><div style="width: 150px; height: 30px; display: inline-block;"><a href='/meister/adminBoard/adminNotice.do?reqPage=1' style="width: 150px; height: 30px;">뒤로가기</a></div></div>
	
	</form>
	
</div>
	</section>
</section>
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

</body>



</html>