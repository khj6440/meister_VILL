<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">

<script src="jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" href="resources/ckeditor/contents.css">
<script src="resources/ckeditor/ckeditor.js" ></script>


	<textarea id="ck4" name="ck4"></textarea>
	<script>CKEDITOR.replace('ck4',{filebrowserUploadUrl:'/imageUpload.do'});</script>
