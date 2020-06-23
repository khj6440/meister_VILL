<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<title>글쓰기</title>

<!-- <script src="jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/ckeditor/contents.css">
<script src="resources/ckeditor/ckeditor.js"></script>
 -->

<!-- <textarea id="ck4" name="ck4"></textarea>
	<script>CKEDITOR.replace('ck4',{filebrowserUploadUrl:'/imageUpload.do'});</script>
 -->
<jsp:include page="/WEB-INF/views/common/message.jsp"/>
<form action="/meister/member/login.do" method="post">
	이메일 : <input type="text" name="memberEmail"><br> 비밀번호 : <input
		type="password" name="memberPw"><br> <input type="submit"
		value="로그인">
</form>


</html>

