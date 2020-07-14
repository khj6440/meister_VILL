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
          <img src="/resources/upload/memberImg/${member.memberImg}" class="img-circle" width="90px;" height="80px;">
          </c:if>
          
          <c:if test="${member.memberImg == null }">
          <img src="/resources/upload/common/adminImg.jpg" class="img-circle" width="90px;" height="80px;">
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
              <span>게시물 승인</span>
              <!-- <span class="label label-theme pull-right mail-info">2</span> -->
              </a>
            <ul class="sub">
            
              <li><a href="/meister/admin/sellApprovalFrm.do?reqPage=1">마이스터 판매글 승인</a></li>
              <li><a href="/meister/admin/requestApprovalFrm.do?reqPage=1">견적요청글 승인</a></li>
              <li><a href="gallery.html">프로젝트글 승인</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-cogs"></i>
              <span>거래글 관리</span>
              </a>
            <ul class="sub">
            
              <li><a href="/meister/admin/sellListFrm.do?reqPage=1">마이스터 판매글 관리</a></li>
              <li><a href="/meister/admin/requestListFrm.do?reqPage=1">견적요청글 관리</a></li>
              <li><a href="gallery.html">프로젝트글 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-book"></i>
              <span>공지 & QnA</span>
              </a>
            <ul class="sub">
              <li><a href="/meister/adminBoard/adminNotice.do?reqPage=1">공지사항</a></li>
              <li><a href="/meister/adminBoard/adminQnA.do?reqPage=1">QnA</a></li>

            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" style="background-color: #4D4D4D;">
              <i class="fa fa-tasks"></i>
              <span>신고</span>
              </a>
            <ul class="sub">
              <li><a href="/meister/adminBoard/reportList.do?reqPage=1">신고현황</a></li>
              <li><a href="advanced_form_components.html">처리된 신고</a></li>
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
