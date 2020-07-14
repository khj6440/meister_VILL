<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<body>
<c:if test="${empty sessionScope.member }">
		<form action="/meister/member/login2.do" method="post">
			아이디 : <input type="text" name="memberEmail"><br> 비밀번호 : <input
				type="password" name="memberPw"><br> <input
				type="submit" value="로그인">
		</form>
	</c:if>
	<c:if test="${not empty sessionScope.member }">
		<h1>[${sessionScope.member.memberNickname }]</h1>
		<a href="/meister/member/goChat.do">쪽지함</a><br>
		<a href="/meister/project/home.do?projectNo=1">프로젝트 룸(1번프로젝트)</a><br>
		<a href="/meister/project/home.do?projectNo=21">프로젝트 룸(21번프로젝)</a><br>
		<a href="/meister/member/message.do">메세지</a><br>
		<a href="/meister/project/test.do?projectNo=1">test</a><br>
		<a href="/meister/project/schedule.do?projectNo=1">캘린더</a><br>
		<a href="/meister/project/modal.do">모달</a><br>
		<a href="/meister/project/todo.do?projectNo=1">투두</a><br>
		
		<a href="/meister/member/logout.do">로그아웃</a><br>
		
	</c:if>
	
</body>
</html>