<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.form-container{
		border: 1px solid black;
		width:100%;
		max-width:800px;
        margin: 0 auto;
		padding:20px;
        box-sizing: border-box;
	}
    input[type="text"], textarea {
        width: 100%;
        max-width: 600px;
        padding: 8px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .sub_button{
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 10px;
        cursor: pointer;
        border-radius: 4px;
    }
    .td-a{
        width: 100px;
    }
</style>
<script>

	$(function(){init();});
	
	function init(){
	}
	
	function submitForm(){
		var formObj = $("[name='posting_form']");
        $("[name='r_code']").val(rCode(10));
		ajax(
			     "/postingProc.do",
			     "post",
			     formObj,
			     function (responseJson) {
			    	 var postCnt = responseJson["postCnt"];
			    	 if(postCnt===1){
			    		 alert("성공");
			    		 location.replace("/main.do");
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
	<div class="form-container">
	<form name="posting_form">
		<table>
			<tr>
				<td class="td-a">제목</td>
				<td><input type="text" name="title" placeholder="구인글 제목"></td>
			</tr>
			<tr>
				<td class="td-a">업체명</td>
				<td><input type="text" name="company" placeholder="업체명"></td>
			</tr>
			<tr>
				<td class="td-a">모집인원</td>
				<td><input type="text" name="participants" placeholder="모집 인원"></td>
			</tr>
			<tr>
				<td class="td-a">모집내용</td>
				<td><input type="text" name="recruitment" placeholder="모집 내용"></td>
			</tr>
			<tr>
				<td class="td-a">업무내용</td>
				<td><textArea name="job" placeholder="업무내용"></textArea></td>
			</tr>
			<tr>
				<td class="td-a">급여</td>
				<td><input type="text" name="income" placeholder="급여"></td>
			</tr>
			<tr>
				<td class="td-a">자격요건</td>
				<td><textArea name="condition" placeholder="자격 요건"></textArea></td>
			</tr>
			<tr>
				<td class="td-a">근무지역</td>
				<td><input type="text" name="location" placeholder="근무 지역     예) 서울시 강서구"></td>
			</tr>
			<tr>
				<td class="td-a">근무지주소</td>
				<td><input type="text" name="address" placeholder="근무지 상세한 주소"></td>
			</tr>
			<tr>
				<td class="td-a">연락처</td>
				<td><input type="text" name="phone_number" placeholder="연락처"></td>
			</tr>
			<tr>
				<td class="td-a">이메일</td>
				<td><input type="text" name="email" placeholder="이메일"></td>
			</tr>
		</table>
		<input type="hidden" name="r_code">
		<input type="hidden" name="mid" value='${requestScope.mid}'>
	</form>
		<input type="button" class="sub_button" value="제출" onclick="submitForm()">
	</div>
</center>
</body>
</html>