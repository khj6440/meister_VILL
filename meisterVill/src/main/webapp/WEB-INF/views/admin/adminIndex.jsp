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

<title>관리자 메인</title>
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
        <div class="row">
          <div class="col-lg-9 main-chart">


            <div class="row mt">
              <!-- SERVER STATUS PANELS -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>회원 현황</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: ${level0},
                        color: "#FF6B6B"
                      },
                      {
                        value: ${level1},
                        color: "#A593E0"
                      },
                      {
                          value: ${level2},
                          color: "#5CAB7D"
                        }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div>
                    
                     <div style="border: 1px solid #FF6B6B; width: 10px; height: 10px; display: inline-block; background-color: #FF6B6B;"></div>
                     <div style="display: inline-block;">일반 회원 : ${level0Cnt}명</div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #FF6B6B;">${level0}%</div>
                     <br> 
                     
                     <div style="border: 1px solid #A593E0; width: 10px; height: 10px; display: inline-block; background-color: #A593E0;"></div>
                     <div style="display: inline-block;">전문자 회원 : ${level1Cnt}명</div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #A593E0;">${level1}%</div>
                     <br> 
                     
                     <div style="border: 1px solid #5CAB7D; width: 10px; height: 10px; display: inline-block; background-color: #5CAB7D;"></div>
                     <div style="display: inline-block;">관리자 회원 : ${level2Cnt}명</div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #5CAB7D;">${level2}%</div>
                     
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4-->
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>판매 게시물 현황</h5>
                  </div>
                  <canvas id="serverstatus02" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: ${sSell},
                        color: "#1c9ca7"
                      },
                      {
                        value: ${sRequest},
                        color: "#A593E0"
                      },
                      {
                          value: ${sEmploy},  
                          color: "#f68275"
                        }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <footer> 
					<div>
                     <div style="border: 1px solid #1c9ca7; width: 10px; height: 10px; display: inline-block; background-color: #1c9ca7;"></div>
                     <div style="display: inline-block;">
                     		판매 게시물 : ${sSellCnt}개
                     </div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #1c9ca7;">${sSell}%</div>
                     <br> 
                     
                     <div style="border: 1px solid #A593E0; width: 10px; height: 10px; display: inline-block; background-color: #A593E0;"></div>
                     <div style="display: inline-block;">
                     		  견적요청 게시물 : ${sRequestCnt}개
                     </div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #A593E0;">${sRequest}%</div>
                     <br> 
                     
                     <div style="border: 1px solid #f68275; width: 10px; height: 10px; display: inline-block; background-color: #f68275;"></div>
                     <div style="display: inline-block;">
                     		  프로젝트 게시물 : ${sEmployCnt}개
                     </div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #f68275;">${sEmploy}%</div>
                      
                    </div>
                  </footer>
                </div>
              </div>
              <div class="col-md-4 col-sm-4 mb">
                <!-- REVENUE PANEL -->
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>총 판매금액</h5>
                  </div>
                  <div class="chart mt">
                    <!-- <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div> -->
                  </div>
                  <p class="mt"><b style="font-size: xx-large;">
                  
                  <c:if test="${sellRequestSum != null }">${sellRequestSum } ￦</c:if>
                  <c:if test="${sellRequestSum == null }">0 ￦</c:if>
                  </b><p>총 누적 판매금액</p></p>
                  
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>

            <div class="row">
              <!-- TWITTER PANEL -->
              <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <div class="white-panel pn">
                  <div class="white-header">
                    <h5>판매글 최다수익 유저</h5>
                  </div>
                  <p>
                  
                  <c:if test="${sm.memberImg != null}">
                  <img src="/resources/upload/memberImg/${sm.memberImg }" class="img-circle" style="width: 50px; height: 50px;">
                  </c:if>
                  
                  <c:if test="${sm.memberImg == null}">
                  <img src="/resources/upload/memberImg/unnamed.png" class="img-circle" style="width: 50px; height: 50px;">
                  </c:if>
                  
                  </p>
                  <p><b>
                  <c:if test="${sm.memberName != null}">
                  ${sm.memberName }
                  </c:if>
                  
                  <c:if test="${sm.memberName == null}">
                  		없음
                  </c:if>
                  
                  </b></p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="small mt">닉네임</p>
                      <p>
                      <c:if test="${sm.memberNickname != null}">
                      ${sm.memberNickname }
                      </c:if>
                      
                      <c:if test="${sm.memberNickname == null}">
                       		없음
                      </c:if>
                      </p>
                    </div>
                    <div class="col-md-6">
                      <p class="small mt">총 수익</p>
                      <p>
                      <c:if test="${sellSum != null}">
                      ${sellSum } ￦
                      </c:if>
                      
                      <c:if test="${sellSum == null}">
                       0 ￦
                      </c:if>
                      
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <div class="white-panel pn">
                  <div class="white-header">
                    <h5>최다수익 유저</h5>
                  </div>
                  <p>
                  
                  <c:if test="${am.memberImg != null}">
                  <img src="/resources/upload/memberImg/${am.memberImg }" class="img-circle" style="width: 50px; height: 50px;">
                  </c:if>
                  
                  <c:if test="${am.memberImg == null}">
                  <img src="/resources/upload/memberImg/unnamed.png" class="img-circle" style="width: 50px; height: 50px;">
                  </c:if>
                  
                  </p>
                  <p><b>
                  <c:if test="${am.memberName != null}">
                  ${am.memberName }
                  </c:if>
                  
                  <c:if test="${am.memberName == null}">
                  		없음
                  </c:if>
                  
                  </b></p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="small mt">닉네임</p>
                      <p>
                      <c:if test="${am.memberNickname != null}">
                      ${am.memberNickname }
                      </c:if>
                      
                      <c:if test="${am.memberNickname == null}">
                       		없음
                      </c:if>
                      </p>
                    </div>
                    <div class="col-md-6">
                      <p class="small mt">총 수익</p>
                      <p>
                      <c:if test="${allSum != null}">
                      ${allSum } ￦
                      </c:if>
                      
                      <c:if test="${allSum == null}">
                       0 ￦
                      </c:if>
                      
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <div class="white-panel pn">
                  <div class="white-header">
                    <h5>견적글 최다수익 유저</h5>
                  </div>
                  <p>
                  
                  <c:if test="${rm.memberImg != null}">
                  <img src="/resources/upload/memberImg/${rm.memberImg }" class="img-circle" style="width: 50px; height: 50px;">
                  </c:if>
                  
                  <c:if test="${rm.memberImg == null}">
                  <img src="/resources/upload/memberImg/unnamed.png" class="img-circle" style="width: 50px; height: 50px;">
                  </c:if>
                  
                  </p>
                  <p><b>
                  <c:if test="${rm.memberName != null}">
                  ${rm.memberName }
                  </c:if>
                  
                  <c:if test="${rm.memberName == null}">
                  		없음
                  </c:if>
                  
                  </b></p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="small mt">닉네임</p>
                      <p>
                      <c:if test="${rm.memberNickname != null}">
                      ${rm.memberNickname }
                      </c:if>
                      
                      <c:if test="${rm.memberNickname == null}">
                       		없음
                      </c:if>
                      </p>
                    </div>
                    <div class="col-md-6">
                      <p class="small mt">총 수익</p>
                      <p>
                      <c:if test="${requestSum != null}">${requestSum } ￦</c:if>
                      
                      <c:if test="${requestSum == null}">
                       0 ￦
                      </c:if>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
            <div class="row">
            <div style=" display: block;">
          <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <div class="white-panel pn" style=" background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('/resources/upload/admin/img00.jpg');  background-size: cover;">
                  <div class="white-header">
                    <h5>현재 날씨</h5>
                  </div>
                  
                  <p>
					<img id="img">
					<h4 style="color: white;">Seoul</h4>
                  </p>
                  <p><b>
					
                  
                  </b></p>
                  <div class="row">
                    <div class="col-md-6">
                      <p style="font-size: 18px;" class="small mt">온도</p>
                      <p>
                      <span style="font-size: 20px; color: white;" id="temp"></span>
                      </p>
                    </div>
                    <div class="col-md-6">
                      <p style="font-size: 18px;" class="small mt">습도</p>
                      <p>
						<span style="font-size: 20px; color: white;" id="humidity"></span>
                      </p>
                       </div>
                    </div>
                </div>
              </div>
              </div>
              <!-- /col-md-4 -->
           
              <!--  PROFILE 02 PANEL -->
             <div style=" display: block;">
          <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <a href="#">
                <div class="white-panel pn" style=" background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('/resources/upload/admin/reImg.png');  background-size: cover;">
                  <div class="white-header">
                    <h5>신고현황</h5>
                  </div>
                  
                  <p>
					<img src="/resources/upload/admin/reportImg.png" class="img-circle" style="width: 55px; height: 55px; margin-top: 7%;">
					<h4 style="color: white;">미확인 신고</h4>
                  </p>
                  <p><b>
					<div style="font-size: 18px; color: white;">${reportCnt } 개</div>
                  
                  </b></p>

                </div>
                </a>
              </div>
              </div>
              <!--/ col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="white-panel pn">
                  <div class="white-header">
                    <h5>검색</h5>
                  </div>
                  
                  <form action="">
                  <div style="margin-top: 10%;">
                  <input type="text" name="search" style="width: 80%; height: 50px; border-radius: 15px;"><br><br>
                  <input type="submit" value="검색" style="width: 80%; height: 50px; border-radius: 15px;">
                  </div>
                  </form>
                  
<%--                   <canvas id="serverstatus03" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 60,
                        color: "#2b2b2b"
                      },
                      {
                        value: 40,
                        color: "#fffffd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <h3>60% USED</h3> --%>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          <div class="col-lg-3 ds">
            <!--COMPLETED ACTIONS DONUTS CHART-->
           
            <!--NEW EARNING STATS -->
            
            <!--new earning end-->
            <!-- RECENT ACTIVITIES SECTION -->
            <h4 class="centered mt">최근 판매 리스트</h4>
            <!-- First Activity -->
            <c:if test="${empty mainSell }">
            	<div class="desc" style="text-align: center;">목록없음</div>
            </c:if>
            
            <c:if test="${not empty mainSell }">
            <c:forEach items="${mainSell}" var="ms" varStatus="i" begin="0" end="3">
            <div class="desc">
              <div class="thumb">
                <div><img style="width: 40px; height: 40px; border-radius: 15px;" src="/resources/upload/sellImg/${ms.sellImg}"></div>
              </div>
              <div class="details">
                <p>
                  <span style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 100%; display: inline-block;">${ms.sellTitle }</span>
                  <br/>
                  <a href="#">게시글 이동</a>
                  <c:if test="${ms.sellStatus == 0}">
                  		<span class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 9px;">
                   	상태&nbsp[정상]
                    </span>
                  </c:if>
                  <c:if test="${ms.sellStatus == 1 }">
                     <span class="label label-info label-mini"style="background-color: #6c757d; font-size: 9px;">
                   	상태&nbsp[비활성화]
                    </span>
                    </c:if>
                    
                    <c:if test="${ms.sellStatus == 2 }">
                     <span class="label label-info label-mini"style="background-color: #F16B6F; font-size: 9px;">
                   	상태&nbsp[삭제됨]
                    </span>
                    </c:if><span style="display: inline-block;">&nbsp&nbsp&nbsp&nbsp&nbsp[${ms.memberNickname }] / [${ms.sellDate }]</span>
                   
                   <br/>
                </p>
              </div>
            </div>
           </c:forEach>
           </c:if>
           <a href="/meister/admin/sellListFrm.do?reqPage=1" style="border-style: none; color: #2b90d9; text-align: center;"><h6>VIEW ALL</h6></a>
          	<br><br>
            <!-- USERS ONLINE SECTION -->
            <h4 class="centered mt">프로젝트 현황</h4>
            <!-- First Member -->
            <c:if test="${empty mainEmploy}">
            <div class="desc" style="text-align: center;">목록없음</div>
            </c:if>
            
            <c:if test="${not empty mainEmploy}">
            <c:forEach items="${mainEmploy}" var="me" varStatus="i" begin="0" end="3">
            <div class="desc">
              <div class="thumb">
                <div><img style="width: 40px; height: 40px; border-radius: 15px;" src="/resources/upload/project/projectImg.jpg"></div>
              </div>
              <div class="details">
                <p>
                  <span style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 100%; display: inline-block;">${me.employTitle }</span>
                  <br/>
                  <a href="#">게시글 이동</a>
                  <c:if test="${me.employStatus == 0}">
                  		<span class="label label-info label-mini"style="background-color: #5CAB7D; font-size: 9px;">
                   	상태&nbsp[모집중]
                    </span>
                  </c:if>
                  <c:if test="${me.employStatus == 1 }">
                     <span class="label label-info label-mini"style="background-color: #6c757d; font-size: 9px;">
                   	상태&nbsp[진행중]
                    </span>
                    </c:if>
                    
                    <c:if test="${me.employStatus == 2 }">
                     <span class="label label-info label-mini"style="background-color: #F16B6F; font-size: 9px;">
                   	상태&nbsp[마감]
                    </span>
                    </c:if><span style="display: inline-block;">&nbsp&nbsp&nbsp&nbsp&nbsp[${me.memberNickname }] / [${me.employEnrollDate }]</span>
                   
                   <br/>
                </p>
              </div>
            </div>
            </c:forEach>
            </c:if>
            <a href="#" style="border-style: none; color: #2b90d9; text-align: center;"><h6>VIEW ALL</h6></a>
          	<br><br>
            
          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!--main content end-->
    
    
<!-- ******************************************************************************** -->
		<!-- Footer bar -->
		<jsp:include page="/WEB-INF/views/admin/adminFooter.jsp" />
		
<!-- ******************************************************************************** -->


  </section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="/resources/adminCss/lib/jquery/jquery.min.js"></script>
  <script src="/resources/adminCss/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="/resources/adminCss/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="/resources/adminCss/lib/jquery.scrollTo.min.js"></script>
  <script src="/resources/adminCss/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="/resources/adminCss/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="/resources/adminCss/lib/common-scripts.js"></script>
  <script type="text/javascript" src="/resources/adminCss/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="/resources/adminCss/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="/resources/adminCss/lib/sparkline-chart.js"></script>
  <script src="/resources/adminCss/lib/zabuto_calendar.js"></script>
 
  <script type="text/javascript">
    $(document).ready(function() {
      var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: '관리자님 환영합니다!',
        // (string | mandatory) the text inside the notification
        text: '페이지 테스트 중!',
        // (string | optional) the image to display on the left
        image: '/resources/upload/memberImg/${sessionScope.member.memberImg}',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: 8000,
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
      });

      return false;
    });
  </script>
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
    

      

    	  var apiURI ="http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=04003b0b72f9410592237a06f042555e"   
              $.ajax({
                url : apiURI,
                method : 'GET',
                success :  (data)=> {
                  var temp = String((data.main.temp- 273.15)).substring(0,4); // 온도
                  var humidity = data.main.humidity;
                  var location = data.name; // 지역이름 
                 
                  $('#chatLog').append('지역 ：' + location + ' 온도　：' + temp　+ '도   습도 : ' + humidity + "%입니다. "+'\n');
                  $("#temp").html(temp + " °C");
                  $("#humidity").html(humidity + " %");
     // 아이콘 취득 
                  var imgURL = "http://openweathermap.org/img/w/" + data.weather[0].icon + ".png";
                  // 아이콘 표시
                  $('#img').attr("src", imgURL);
                }
              });    
    	  

  </script>
</body>

</html>
