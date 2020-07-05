<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<meta charset="UTF-8">


<!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse" style="background-color: #4D4D4D;">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="/meister/admin/memberOneViewFrm.do?memberNo=${member.memberNo}">
          <c:if test="${member.memberImg != null }">
          <img src="/upload/memberImg/${member.memberImg}" class="img-circle" width="90px;" height="80px;">
          </c:if>
          
          <c:if test="${member.memberImg == null }">
          <img src="/upload/common/adminImg.jpg" class="img-circle" width="90px;" height="80px;">
          </c:if>
          </a></p>
          <h5 class="centered">${member.memberName}</h5>
          <li class="mt">
            <a href="/meister/admin/adminIndexFrm.do" style="background-color: #4D4D4D;">
              <i class="fa fa-dashboard"></i>
              <span>관리자 메인 페이지</span>
              </a>
          </li>
          <li class="sub-menu" >
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-desktop"></i>
              <span>회원관리</span>
              </a>
            <ul class="sub">
              <li><a href="/meister/admin/memberAllViewFrm.do?reqPage=1">회원 전체 관리</a></li>
              <li><a href="/meister/admin/memberHaltFrm.do?reqPage=1">정지 회원 관리</a></li>
              <li><a href="/meister/admin/memberDeletionFrm.do?reqPage=1">탈퇴 회원  관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-cogs"></i>
              <span>거래글 관리</span>
              </a>
            <ul class="sub">
            
              <li><a href="/meister/admin/sellListFrm.do?reqPage=1">마이스터 판매글 관리</a></li>
              <li><a href="calendar.html">견적요청글 관리</a></li>
              <li><a href="gallery.html">프로젝트글 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-book"></i>
              <span>견적요청</span>
              </a>
            <ul class="sub">
              <li><a href="blank.html">Blank Page</a></li>
              <li><a href="login.html">Login</a></li>
              <li><a href="lock_screen.html">Lock Screen</a></li>
              <li><a href="profile.html">Profile</a></li>
              <li><a href="invoice.html">Invoice</a></li>
              <li><a href="pricing_table.html">Pricing Table</a></li>
              <li><a href="faq.html">FAQ</a></li>
              <li><a href="404.html">404 Error</a></li>
              <li><a href="500.html">500 Error</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-tasks"></i>
              <span>Forms</span>
              </a>
            <ul class="sub">
              <li><a href="form_component.html">Form Components</a></li>
              <li><a href="advanced_form_components.html">Advanced Components</a></li>
              <li><a href="form_validation.html">Form Validation</a></li>
              <li><a href="contactform.html">Contact Form</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-th"></i>
              <span>Data Tables</span>
              </a>
            <ul class="sub">
              <li><a href="basic_table.html">Basic Table</a></li>
              <li><a href="responsive_table.html">Responsive Table</a></li>
              <li><a href="advanced_table.html">Advanced Table</a></li>
            </ul>
          </li>
          <li>
            <a href="inbox.html" style="background-color: #4D4D4D;">
              <i class="fa fa-envelope"></i>
              <span>Mail </span>
              <span class="label label-theme pull-right mail-info">2</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class=" fa fa-bar-chart-o"></i>
              <span>Charts</span>
              </a>
            <ul class="sub">
              <li><a href="morris.html">Morris</a></li>
              <li><a href="chartjs.html">Chartjs</a></li>
              <li><a href="flot_chart.html">Flot Charts</a></li>
              <li><a href="xchart.html">xChart</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-comments-o"></i>
              <span>Chat Room</span>
              </a>
            <ul class="sub">
              <li><a href="lobby.html">Lobby</a></li>
              <li><a href="chat_room.html"> Chat Room</a></li>
            </ul>
          </li>
          <li>
            <a href="google_maps.html" style="background-color: #4D4D4D;">
              <i class="fa fa-map-marker"></i>
              <span>Google Maps </span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    
    <!--sidebar end-->
