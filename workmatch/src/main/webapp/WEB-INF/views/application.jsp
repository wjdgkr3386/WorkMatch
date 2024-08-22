<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청서 작성</title>
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

function init(){}
	
	function submit(){
		var formObj = $("[name='formApplication']");
		ajax(
			     "/applicationProc.do",
			     "post",
			     formObj,
			     function (responseJson) {
			    	 var insertCnt = responseJson["insertCnt"];
			    	 if(insertCnt===1){
			    		 alert("성공");
			    		 history.back();
			    	 }else{
			    		 alert("실패");
			    	 }
			     }
		);
	}
</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
	<form name="formApplication">
	<table>
		<tr>
			<td rowspan='4' style="width:100px;">
				<div class="upload-box">
       				<img class="image" src="/img/${requestScope.infoMap.MID}/${requestScope.infoMap.IMG}">
				</div>
			</td>
			<td>이름: ${requestScope.infoMap.NAME}</td>
			<td>나이: ${requestScope.infoMap.AGE}</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td colspan='2'>전화번호: ${requestScope.infoMap.PHONE_NUMBER}</td>
			<!-- <td></td><td></td> -->
		</tr>
		<tr>
			<!-- <td></td> -->
			<td colspan='2'>이메일: ${requestScope.infoMap.EMAIL}</td>
			<!-- <td></td><td></td> -->
		</tr>
		<tr>
			<!-- <td></td> -->
			<td colspan='2'>
				주소: ${requestScope.infoMap.ADDRESS}
			</td>
			<!-- <td></td><td></td> -->
		</tr>
		<tr>
			<td colspan='4'>
				경력
				<textarea name="self_introduction"></textarea>
			</td>
			<!--<td></td><td></td><td></td> -->
		</tr>
		<tr>
			<td colspan='4'>
				자기소개
				<textarea name="career"></textarea>
			</td>
			<!--<td></td><td></td><td></td> -->
		</tr>
	</table>
	<input type="hidden" name="mid" value="${requestScope.infoMap.MID}">
	<input type="hidden" name="r_code" value="${requestScope.postMap.R_CODE}">
	</form>
	<input type="button" value="제출" onclick="submit()">
</center>
</body>
</html>