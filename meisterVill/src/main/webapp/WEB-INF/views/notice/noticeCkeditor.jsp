<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">

<style>
	#cke_ck4{
		width: 80%;
		margin: 0 auto;
	}
</style>
<!-- <link rel="stylesheet" href="/resources/ckeditor/contents.css"> -->
<script src="/resources/ckeditor/ckeditor.js" ></script>


	<textarea id="ck4" name="ck4" style="width: 100px;"></textarea>
	<script>CKEDITOR.replace('ck4',{filebrowserUploadUrl:'/imageUpload.do'});</script>