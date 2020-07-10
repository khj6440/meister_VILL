<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
<!-- ******************************************************************************** -->
	<!-- Default : link , meta , script -->
	<jsp:include page="/WEB-INF/views/admin/adminDefault.jsp" />
	
<!-- ******************************************************************************** -->

<title>회원 상제 정보</title>
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
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->


    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <div class="row mt">
          <div class="col-lg-12">
            <div class="row content-panel">

              <!-- /col-md-4 -->
              <div class="col-md-4 profile-text" style="margin-left: 4%; ">
                <h3>실명 : ${m.memberName }</h3>
                <h5>닉네임 : ${m.memberNickname }</h5>
                <p>${m.memberIntro}</p>
                <br>
                <p><button class="btn btn-theme"><i class="fa fa-envelope">&nbsp&nbsp</i>메세지 보내기</button></p>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 centered" style="float: right;">
                <div class="profile-pic">
                  <p>
                  <c:if test="${m.memberImg != null}">
                  
                  	<c:if test="${m.memberLevel == 2 }">
                  		<img src="/resources/upload/memberImg/${m.memberImg}" class="img-circle">
                  	</c:if>
                  	
                  	<c:if test="${m.memberLevel != 2 }">
                  		<img src="/resources/upload/memberImg/${m.memberImg}" class="img-circle">
                  	</c:if>
                  	
                  </c:if>
                  <c:if test="${m.memberImg == null}">
                 	<c:if test="${m.memberLevel == 2 }">
                  		<img src="/resources/upload/common/adminImg.jpg" class="img-circle">
                  	</c:if>
                  	
                  	<c:if test="${m.memberLevel != 2 }">
                  		<img src="/resources/upload/memberImg/unnamed.png" class="img-circle">
                  	</c:if>
                  </c:if>
                  </p>
                  <p>
                  
                  <c:if test="${m.memberStatus == 1 }">
                    <button value="${m.memberNo }" class="btn btn-theme02 modalDeleteRollback" style="background-color: #F16B6F; border-color: #F16B6F;">탈퇴 복구</button>
                  </c:if>
                  <c:if test="${m.memberStatus != 1 }">
                    <button value="${m.memberNo }" class="btn btn-theme02 modalDelete" style="background-color: #F16B6F; border-color: #F16B6F;">회원 탈퇴</button>
                  </c:if>
                  <c:if test="${m.memberStatus != 2 && m.memberStatus == 0}">
                    <button value="${m.memberNo }" class="btn btn-theme02 modalHalt" style="background-color: #6c757d;">회원 정지</button>
                  </c:if>
                  <c:if test="${m.memberStatus == 2 }">
                    <button value="${m.memberNo }" class="btn btn-theme02 modalHaltRollback" style="background-color: #30A9DE; border-color: #30A9DE;">정지 취소</button>
                  </c:if>
                  </p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>
          <!-- /col-lg-12 -->
          <div class="col-lg-12 mt">
            <div class="row content-panel">
              <div class="panel-heading">
                <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                    <a data-toggle="tab" href="#overview">회원 정보</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#contact" class="contact-map">상세 정보</a>
                  </li>
                </ul>
              </div>
              <!-- /panel-heading -->
              <div class="panel-body">
                <div class="tab-content">
                  <div id="overview" class="tab-pane active">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="detailed mt" style="margin: 0 auto;">
                          <h4>정보</h4>
                          <div class="recent-activity">
                            <div class="activity-icon bg-theme"><i class="fa fa-heart"></i></div>
                            <div class="activity-panel">
                              <h5>찜목록</h5>
                              <c:if test="${empty pick}">
                             	찜한 게시물 없음
                             </c:if>
                              
                             <c:forEach items="${pick}" var="pick">
                              <c:if test="${!empty pick}">
                              <div style="display: inline-block;">
                              <img class="img-circle" width="35" height="35" src="/resources/upload/sellImg/${pick.sellImg}">
                              <br>
                              <div style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 70px; height: 15px; display:inline-block;">
                              ${pick.sellTitle}
                              </div>
                              </div> 
                              </c:if>
                             </c:forEach>
                              <div class="row mt">
                            <div class="col-md-4 col-md-offset-4">
                              <button id="pickAllView" value="${m.memberNo }" style="border-style: none; color: #2b90d9;"><h6>VIEW ALL</h6></button>
                            </div>
                          </div>
                            </div>
                            <div class="activity-icon bg-theme02"><i class="fa fa-briefcase"></i></div>
                            <div class="activity-panel">
                              <h5>경력사항</h5>
                              
                             <c:if test="${empty career}">
                             	경력없음
                             </c:if>
                             
                            <c:forEach items="${career}" var="career">
                             <c:if test="${!empty career}">
                              <c:if test="${career.typeFree == 1}">
                              	[프리랜서]
                              </c:if>
                              ${career.companyName}
                              ${career.companyDepartment}
                              ${career.companyJobTitle}
                              ${career.companyJobMon}개월 <br>
                               </c:if>
                              </c:forEach>
                             

                            </div>
                            <div class="activity-icon bg-theme04"><i class="fa fa-credit-card"></i></div>
                            <div class="activity-panel">
                              <h5>자격증 현황</h5>
                              
                              <c:if test="${empty license}">
                             	자격증없음
                             </c:if>
                             
                            <c:forEach items="${license}" var="license">
                             <c:if test="${!empty license}">   
                              ${license.licenseName}
                              ${license.licenseDate}
                              ${license.licenseAgency}<br>
                              </c:if>
                              </c:forEach>
                              
                              
                            </div>
                          </div>
                          <!-- /recent-activity -->
                        </div>
                        <!-- /detailed -->
                      </div>
                      <!-- /col-md-6 -->
                      
                      <div class="col-md-6 detailed">
                        <h4>회원 판매정보</h4>
                        <div class="row centered mt mb">
                          <div class="col-sm-4">
                            <h1><i class="fa fa-money"></i></h1>
                            <h3>
                            <c:if test="${sum != 0 }">${sum}원</c:if> 
                            <c:if test="${sum == 0 }">0원</c:if>
                            </h3>
                            <h6>총판매 금액</h6>
                          </div>
                          <div class="col-sm-4">
                            <h1><i class="fa fa-trophy"></i></h1>
                            <h3>
                            <c:if test="${price != 0 }">${price}</c:if>
                             <c:if test="${price == 0 }">0</c:if>
								
                            </h3>
                            <h6>게시물 최고 가격</h6>
                          </div>
                          <div class="col-sm-4">
                            <h1><i class="fa fa-shopping-cart"></i></h1>
                            <h3>
                          <c:if test="${listNum != 0 }">${listNum}</c:if>
                             <c:if test="${listNum == 0 }">0</c:if> 
                            </h3>
                            <h6>총 판매글</h6>
                          </div>
                        </div>
                        <!-- /row -->
                        <h4>판매글 목록</h4>

                        <div class="row centered mb">

                          
                           <c:forEach items="${s}" var="sell" begin="0" end="6" step="1" varStatus="i">
                       		<c:if test="${sell.sellImg !=null }">
                              <div style="display: inline-block;">
                              <img class="img-circle" width="35" height="35" src="/resources/upload/sellImg/${sell.sellImg}">
                              <br>
                              <div style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 70px; height: 15px; display:inline-block;">
                              ${sell.sellTitle}
                              </div>
                              </div> 
                            </c:if>
                            
                            <c:if test="${sell.sellImg == null }">
                         			<div>목록 없음</div>
                            </c:if>
						 </c:forEach>
                          
                          <div class="row mt">
                            <div class="col-md-4 col-md-offset-4">
                               <button id="sellAllView" value="${m.memberNo }" style="border-style: none; background-color: white; color: #2b90d9;"><h6>VIEW ALL</h6></button>
                            </div>
                          </div>
                        </div>
                        <!-- /row -->
                        <h4>학력 & 보유기술</h4>
                            <div class="recent-activity">
                         <div class="activity-icon bg-theme04" style="background-color: #5CAB7D;"><i class="fa fa-user"></i></div>
                            <div class="activity-panel">
                              <h5>학력정보</h5>
                              
                             <c:if test="${m.memberSchool != null}">
                              	    ${m.memberSchool}
                              	    /
                              	    ${m.memberMajor}
                              	    /
                              	    ${m.memberGrade}
                              	    </c:if>
                              	    
                              <c:if test="${m.memberSchool == null}">
                              		학력정보 없음
                              </c:if>
                              	 

                             

                            </div>
                           
                            <div class="activity-icon bg-theme04" style="background-color: #30A9DE;"><i class="fa fa-gavel"></i></div>
                            <div class="activity-panel">
                              <h5>기술 정보</h5>

                             <c:if test="${m.memberSkill != null}">
                   				보유기술 : ${m.memberSkill}<br>
                   			 </c:if>
                   			 
                   			 <c:if test="${m.memberSkill == null}">
                   			 	보유기술 : 없음<br>
                   			 </c:if>
                   			 
                   			 <c:if test="${m.memberField != null}">
                              		상세분야 : ${m.memberField}<br>
                             </c:if>
                             
                             <c:if test="${m.memberField == null}">
                             		상세분야 : 없음
                             </c:if>
                             

                            </div>
                            </div>

                    
                          <!-- /col-md-8 -->
                        
                        <!-- /row -->
                      </div>
                      <!-- /col-md-6 -->
                    </div>
                    <!-- /OVERVIEW -->
                  </div>
                  <!-- /tab-pane -->
                  <div id="contact" class="tab-pane" style="text-align: center;">
     		  이메일 : ${m.memberEmail}<br>
                            생년월일 : ${m.memberHbd }<br>     
                            연락가능 번호 : ${m.memberPhone }<br>
                            은행명 : ${m.memberBank }<br>
                            계좌번호 : ${m.memberAccount }<br>
               연락가능 시간 : ${m.memberTime }<br>
               <!-- 0:정상 1:탈퇴 2:정지 -->
               <c:if test="${m.memberStatus == 0}">
                회원상태 : <div class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 12px;">
                   	정상</div>
               </c:if>
               
                <c:if test="${m.memberStatus == 1}">
               	                회원상태 : <div class="label label-info label-mini"style="background-color: #F16B6F; font-size: 12px;">
                   	탈퇴</div>
               </c:if>
               
                <c:if test="${m.memberStatus == 2}">      
                회원상태 : <div class="label label-info label-mini"style="background-color: #6c757d; font-size: 12px;">
                   	정지</div>
               </c:if>

                  </div>
                  <!-- /tab-pane -->
                </div>
                <!-- /tab-content -->
              </div>
              <!-- /panel-body -->
            </div>
            <!-- /col-lg-12 -->
          </div>
          <!-- /row -->
        </div>
        <!-- /container -->
      </section>
      <!-- /wrapper -->
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
  <!-- MAP SCRIPT - ALL CONFIGURATION IS PLACED HERE - VIEW OUR DOCUMENTATION FOR FURTHER INFORMATION -->
  <!--  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script> -->
  
  
  
    <!-- --------------------------------Modal----------------------------------------------------- -->
    <div style="padding-top: 5%;" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="width: 60%; height: 600px;" class="modal-dialog" role="document">
            <div  class="modal-content">
                <div style="border-top-left-radius: 4px; border-top-right-radius: 4px; background-color: #6c757d;"class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">회원 정지</h5>
                </div>
                <div class="modal-body">
                   		 

			 <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i>판매 리스트</h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-align-left"></i>제목</th>
                    <th class="hidden-phone"><i class="fa fa-tags"></i>카테고리</th>
                    <th><i class="fa fa-money"></i>가격</th>
                    <th><i class="fa fa-question-circle"></i>상태</th>
                    <!-- <i class="fa fa-bookmark"> -->
                    <!-- <i class=" fa fa-edit"> -->
                    <th><i class="fa fa-bookmark"></i>작성일</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody id="dynamicTbody">


                </tbody>
              </table>
                       
                   		 
                   		 
                </div>
                <div class="modal-footer">
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
		  
		  $(".modalHalt").click(function() {
			  $("#exampleModal").modal("show");  
			  var memberNo = $(this).val(); 
			  $(".modal-title").html("회원 정지");
			  $(".modal-header").css("background-color","#6c757d");
			  $(".memberValue").css("background-color","#6c757d");
			  $(".memberValue").css("border-color","#6c757d");
			  $(".memberValue").html("회원 정지");
			  $(".modal-body").html("정말로 회원을 정지시키시겠습니까?");
		  $(".memberValue").click(function() {		
	  $.ajax({
		    url: "/meister/admin/memberHalt.do?memberNo="+memberNo,

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
		  
		  
		  
		   $(".modalHaltRollback").click(function() {
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
		   
		   
		   
		   
			  $(".modalDelete").click(function() {
				  $("#exampleModal").modal("show");  
				  var memberNo = $(this).val(); 
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
			    		}, 1000);
			    }
			    
					});
				});
			});
			  
			  
			  
			  $(".modalDeleteRollback").click(function() {
				  $("#exampleModal").modal("show");  
				  var memberNo = $(this).val(); 
				  $(".modal-title").html("탈퇴 복구");
				  $(".modal-header").css("background-color","#6c757d");
				  $(".memberValue").css("background-color","#6c757d");
				  $(".memberValue").css("border-color","#6c757d");
				  $(".memberValue").html("탈퇴 복구");
				  $(".modal-body").html("정말로 회원을 복구시키시겠습니까?");
			  $(".memberValue").click(function() {		
		  $.ajax({
			    url: "/meister/admin/memberDeleteRollback.do?memberNo="+memberNo,
			    
			    

			    success: function(){
			    	$("#exampleModal").modal("hide");
			    	$(".modal2text").html("회원이 복구되었습니다.");
			    	$(".modal-content2").css("background-color","#6c757d");
			    	$("#exampleModal2").modal("show");
			    	setTimeout(function() {
			    		location.reload();
			    		}, 1000);		
			    }
			    
			    
			  		});
				});
			});
			  
			  

			   $("#sellAllView").click(function() { 

				  $("#exampleModal").modal("show"); 
	
				  var memberNo = $(this).val(); 
				  var html ="";
				  $.ajax({
					    url: "/meister/adminBoard/sellAllView.do?reqPage="+1+"&memberNo="+memberNo,
					    data: "json",
					    success: function(data){
					    	console.log(data);
							console.log(Object.keys(data.list).length);
							
							if(Object.keys(data.list).length === 0){
								html += '<tr>';
								html += '<td>'+"목록없음"+'</td>';
								html += '</tr>';
							}
							
							if(Object.keys(data.list).length > 0){
							for(var i=0; Object.keys(data.list).length > i; i++){
							html += '<tr>';
							html += '<td>'
							+'<img src="/resources/upload/sellImg/'+data.list[i].sellImg+'" style="width: 30px; height: 30px; border-radius: 25px;">'+'</img>'+'<div style=" display: inline-block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 270px; font-size: 15px;">'+data.list[i].sellTitle+'</div>'+'</td>';
							
							
							
							html += '<td>'+data.list[i].sellCategory1+'</td>';
							html += '<td>'+data.list[i].sellPrice+'</td>';

 					    	if(data.list[i].sellStatus === 0){
 					    		html += '<td>'+"정상"+'</td>';
					    	}
							
							if(data.list[i].sellStatus === 1){
								html += '<td>'+"비활성화"+'</td>';
								}
							
							if(data.list[i].sellStatus === 2){
								html += '<td>'+"삭제됨"+'</td>';
								} 
							
							html += '<td>'+data.list[i].sellDate+'</td>';
							
							html += '<td>'+'<a href="/meister/adminSellView/showList.do?sellNo='+data.list[i].sellNo+'&memberNo='+data.list[i].sellWriter+'" style=" background-color: #6c757d;" type="button" class="btn btn-primary memberValue">'+"게시글 조회"+'</a>'+'</td>';
						
							html += '</tr>';
							
							$("#dynamicTbody").empty();
							$("#dynamicTbody").append(html);

							
							}
							}

					    }
			  });
		});
			   
			   
			   
		
			   $("#pickAllView").click(function() { 

					  $("#exampleModal").modal("show"); 
		
					  var memberNo = $(this).val(); 
					  var html ="";
					  $.ajax({
						    url: "/meister/adminBoard/pickAllView.do?reqPage="+1+"&memberNo="+memberNo,
						    data: "json",
						    success: function(data){
						    	
							    console.log(data);
						    	if(data === 1){
						    	 html += '<td>'+"목록없음"+'</td>';	
						    	}

								
								if(Object.keys(data.list).length !== null){
								for(var i=0; Object.keys(data.list).length > i; i++){
								html += '<tr>';
								html += '<td>'
									+'<img src="/resources/upload/sellImg/'+data.list[i].sellImg+'" style="width: 30px; height: 30px; border-radius: 25px;">'+'</img>'+'<div style="display: inline-block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 270px; font-size: 15px;">'+data.list[i].sellTitle+'</div>'+'</td>';
									
								html += '<td>'+data.list[i].sellCategory1+'</td>';
								html += '<td>'+data.list[i].sellPrice+'</td>';

	 					    	if(data.list[i].sellStatus === 0){
	 					    		html += '<td>'+"정상"+'</td>';
						    	}
								
								if(data.list[i].sellStatus === 1){
									html += '<td>'+"비활성화"+'</td>';
									}
								
								if(data.list[i].sellStatus === 2){
									html += '<td>'+"삭제됨"+'</td>';
									} 
								
								html += '<td>'+data.list[i].sellDate+'</td>';
								
								html += '<td>'+'<a href="/meister/adminSellView/showList.do?sellNo='+data.list[i].sellNo+'&memberNo='+data.list[i].sellWriter+'" style="background-color: #6c757d;" type="button" class="btn btn-primary memberValue">'+"게시글 조회"+'</a>'+'</td>';
							
								html += '</tr>';
								
								$("#dynamicTbody").empty();
								$("#dynamicTbody").append(html);

								
								}

						    }
						    }

				  });
			});


	  $("#close_modal").click(function() {
          $("#exampleModal").modal("hide");
      });
  });
  </script>
  

  

  
  
  
  
<!--  <script>
    $('.contact-map').click(function() {

      //google map in tab click initialize
      function initialize() {
        var myLatlng = new google.maps.LatLng(40.6700, -73.9400);
        var mapOptions = {
          zoom: 11,
          scrollwheel: false,
          center: myLatlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById('map'), mapOptions);
        var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: 'Dashio Admin Theme!'
        });
      }
      google.maps.event.addDomListener(window, 'click', initialize);
    });
  </script> -->
  
<!--   <script>
  $(function(){
	
	  var memberNo = ${m.memberNo};
  $.ajax({

	    url: "/meister/admin/memberSell.do?memberNo="+memberNo,

	    data: "json",
	    
	    success: function(data){
	    	console.log(data);
	    	
			alert("환영"+data[0].memberNo);
			
			$("#asd").html("환영"+data[0].memberNo);

	    },

	    error: function (request, status, error){        



	    }

	  });
  });
  </script> -->
</body>

</html>
