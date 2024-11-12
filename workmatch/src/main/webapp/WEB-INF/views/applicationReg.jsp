<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원서 작성</title>
<style>
    .upload-box {
        width: 100px;
        height: 100px;
        border: 1px solid black;
        display: inline-block;
        align-items: center;
        justify-content: center;
    }
    .upload-box img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        pointer-events: none;
    }
    textarea{
    	resize: none;
    	height: 200px;
    	width: 100%;
    	padding: 10px;
    }
    td{
    	padding: 10px; !important;
    }
</style>
<script>
$(function(){init();});

function init(){
	$("[name='img']")
}

</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
	<table>
		<tr>
			<td rowspan='4' style="width:100px;">
				<div class="upload-box">
       				<img class="image" src="/img/${requestScope.applicationReg.APPLICANT}/${requestScope.applicationReg.IMG}">
				</div>
			</td>
			<td>이름: ${requestScope.applicationReg.NAME}</td>
			<td>나이: ${requestScope.applicationReg.AGE}</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td colspan='2'>전화번호: ${requestScope.applicationReg.PHONE_NUMBER1}-${requestScope.applicationReg.PHONE_NUMBER2}-${requestScope.applicationReg.PHONE_NUMBER3}</td>
			<!-- <td></td><td></td> -->
		</tr>
		<tr>
			<!-- <td></td> -->
			<td colspan='2'>이메일: ${requestScope.applicationReg.EMAIL}</td>
			<!-- <td></td><td></td> -->
		</tr>
		<tr>
			<!-- <td></td> -->
			<td colspan='2'>
				주소: ${requestScope.applicationReg.ADDRESS}
			</td>
			<!-- <td></td><td></td> -->
		</tr>
		<tr>
			<td colspan='4'>
				경력
				<textarea name="self_introduction" readonly>${requestScope.applicationReg.CAREER}</textarea>
			</td>
			<!--<td></td><td></td><td></td> -->
		</tr>
		<tr>
			<td colspan='4'>
				자기소개
				<textarea name="career" readonly>${requestScope.applicationReg.SELF_INTRODUCTION}</textarea>
			</td>
			<!--<td></td><td></td><td></td> -->
		</tr>
	</table>


</center>
</body>
</html>