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
                     <div style="display: inline-block;">판매 게시물 : ${sSellCnt}개</div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #1c9ca7;">${sSell}%</div>
                     <br> 
                     
                     <div style="border: 1px solid #A593E0; width: 10px; height: 10px; display: inline-block; background-color: #A593E0;"></div>
                     <div style="display: inline-block;">견적요청 게시물 : ${sRequestCnt}개</div>
                     <div style=" display: inline-block; float:right; margin-right:15%; color: #A593E0;">${sRequest}%</div>
                     <br> 
                     
                     <div style="border: 1px solid #f68275; width: 10px; height: 10px; display: inline-block; background-color: #f68275;"></div>
                     <div style="display: inline-block;">프로젝트 게시물 : ${sEmployCnt}개</div>
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
                  <p class="mt"><b style="font-size: xx-large;">${sellRequestSum } ￦</b><p>총 누적 판매금액</p></p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>

            <div class="row">
              <!-- TWITTER PANEL -->
              <div class="col-md-4 mb">
                <div class="twitter-panel pn">
                  <i class="fa fa-twitter fa-4x"></i>
                  <p>Dashio is here! Take a look and enjoy this new Bootstrap Dashboard theme.</p>
                  <p class="user">@Alvrz_is</p>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <div class="white-panel pn">
                  <div class="white-header">
                    <h5>TOP USER</h5>
                  </div>
                  <p><img src="resources/adminCss/img/ui-zac.jpg" class="img-circle" width="50"></p>
                  <p><b>Zac Snider</b></p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="small mt">MEMBER SINCE</p>
                      <p>2012</p>
                    </div>
                    <div class="col-md-6">
                      <p class="small mt">TOTAL SPEND</p>
                      <p>$ 47,60</p>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 mb">
                <!-- INSTAGRAM PANEL -->
                <div class="instagram-panel pn">
                  <i class="fa fa-instagram fa-4x"></i>
                  <p>@THISISYOU<br/> 5 min. ago
                  </p>
                  <p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
            <div class="row">
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="product-panel-2 pn">
                  <div class="badge badge-hot">HOT</div>
                  <img src="resources/adminCss/img/product.jpg" width="200" alt="">
                  <h5 class="mt">Flat Pack Heritage</h5>
                  <h6>TOTAL SALES: 1388</h6>
                  <button class="btn btn-small btn-theme04">FULL REPORT</button>
                </div>
              </div>
              <!-- /col-md-4 -->
              <!--  PROFILE 02 PANEL -->
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="profile-02">
                    <div class="user">
                      <img src="resources/adminCss/img/friends/fr-06.jpg" class="img-circle" width="80">
                      <h4>DJ SHERMAN</h4>
                    </div>
                  </div>
                  <div class="pr2-social centered">
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-dribbble"></i></a>
                  </div>
                </div>
                <!-- /panel -->
              </div>
              <!--/ col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>DISK SPACE</h5>
                  </div>
                  <canvas id="serverstatus03" height="120" width="120"></canvas>
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
                  <h3>60% USED</h3>
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
            <div class="donut-main">
              <h4>COMPLETED ACTIONS & PROGRESS</h4>
              <canvas id="newchart" height="130" width="130"></canvas>
              <script>
                var doughnutData = [{
                    value: 70,
                    color: "#4ECDC4"
                  },
                  {
                    value: 30,
                    color: "#fdfdfd"
                  }
                ];
                var myDoughnut = new Chart(document.getElementById("newchart").getContext("2d")).Doughnut(doughnutData);
              </script>
            </div>
            <!--NEW EARNING STATS -->
            <div class="panel terques-chart">
              <div class="panel-body">
                <div class="chart">
                  <div class="centered">
                    <span>TODAY EARNINGS</span>
                    <strong>$ 890,00 | 15%</strong>
                  </div>
                  <br>
                  <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>
                </div>
              </div>
            </div>
            <!--new earning end-->
            <!-- RECENT ACTIVITIES SECTION -->
            <h4 class="centered mt">RECENT ACTIVITY</h4>
            <!-- First Activity -->
            <div class="desc">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details">
                <p>
                  <muted>Just Now</muted>
                  <br/>
                  <a href="#">Paul Rudd</a> purchased an item.<br/>
                </p>
              </div>
            </div>
            <!-- Second Activity -->
            <div class="desc">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details">
                <p>
                  <muted>2 Minutes Ago</muted>
                  <br/>
                  <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                </p>
              </div>
            </div>
            <!-- Third Activity -->
            <div class="desc">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details">
                <p>
                  <muted>3 Hours Ago</muted>
                  <br/>
                  <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                </p>
              </div>
            </div>
            <!-- Fourth Activity -->
            <div class="desc">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details">
                <p>
                  <muted>7 Hours Ago</muted>
                  <br/>
                  <a href="#">Brando Page</a> purchased a year subscription.<br/>
                </p>
              </div>
            </div>
            <!-- USERS ONLINE SECTION -->
            <h4 class="centered mt">TEAM MEMBERS ONLINE</h4>
            <!-- First Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="/resources/adminCss/img/ui-divya.jpg" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">DIVYA MANIAN</a><br/>
                  <muted>Available</muted>
                </p>
              </div>
            </div>
            <!-- Second Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="/resources/adminCss/img/ui-sherman.jpg" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">DJ SHERMAN</a><br/>
                  <muted>I am Busy</muted>
                </p>
              </div>
            </div>
            <!-- Third Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="/resources/adminCss/img/ui-danro.jpg" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">DAN ROGERS</a><br/>
                  <muted>Available</muted>
                </p>
              </div>
            </div>
            <!-- Fourth Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="/resources/adminCss/img/ui-zac.jpg" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">Zac Sniders</a><br/>
                  <muted>Available</muted>
                </p>
              </div>
            </div>
          </div>
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
        image: '/upload/common/adminImg.jpg',
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
  </script>
</body>

</html>
