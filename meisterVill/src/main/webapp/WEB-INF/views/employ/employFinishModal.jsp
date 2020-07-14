<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  </head>
<script>
var modal = document.getElementById('myModal');
var btn = document.getElementById("employBtn");
var span = document.getElementsByClassName("close")[0];                                          

$(function() {
	$("#submitProject").on("click", insertProject);
	$("span").click(function() {
		$("#employModal").css("display","none");
	});
	$("#insertProject").click(function() {
		$("#projectForm").submit();
	});
});
</script>
    <!-- The Modal -->
 <div class="modal fade" id="employModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">마이스터 알림창</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      관리자 승인 후 서비스가 등록 됩니다. 
       	프로젝트를 등록 하시겠습니까?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button id="insertProject" style="background-color:#FFBC42; border: 1px solid #FFBC42" type="button" class="btn btn-primary" data-dismiss="modal">네</button>
        <button style="background-color:#6c757d; border: 1px solid #6c757d" type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
      </div>
      <input type="submit" style="display:none;" id="submitProject">
    </div>
  </div>
</div>
