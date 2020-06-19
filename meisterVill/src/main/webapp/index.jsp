<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/ckeditor/ckeditor.js"></script>

﻿
<script src="jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" href="/ckeditor/contents.css">
<script src="/ckeditor/ckeditor.js" ></script>
﻿
<script >
CKEDITOR.replace('ckeditor'); // 에디터로 생성
</script >



<body>
	<h1>글쓰기</h1>
	
	<textarea id="ck4" name="ck4"></textarea>
	<script>CKEDITOR.replace('ck4',{filebrowserUploadUrl:'/imageUpload.do'});</script>
	
</body>
</html>