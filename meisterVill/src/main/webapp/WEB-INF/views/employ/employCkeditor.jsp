<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/ckeditor/contents.css">
<script src="/resources/ckeditor/ckeditor.js" ></script>
<textarea id="ck4" name="ck4" class="form-input-content">
<프로젝트의 현재 상황>
예시) 프로젝트의 목적, 현재 준비 상황, 진행 계획 등
<br>
<상세한 업무 내용>
예시) 앱의 용도, Android? iOS?, 작업 분량, 주요 기능 List, 필요한 조건 등
<br>
<참고자료 / 유의사항>
예시) 참고 앱, 기타 유의사항 등
</textarea>
<script>CKEDITOR.replace('ck4',{filebrowserUploadUrl:'/imageUpload.do'});</script>
