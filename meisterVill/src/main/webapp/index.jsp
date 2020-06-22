<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/write.do">글쓰기 이동</a>
	<a href="/adminJoin.do">관리자 페이지 이동</a>
	
	<form action="/memberLogin.do" method="post">
		아이디 : <input type="text" name="memberEmail"><br>
		비밀번호 : <input type="password" name="memberPw"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>