<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.form-container {
		border: 1px solid black;
		width:100%;
		max-width:800px;
        margin: 0 auto;
		padding:20px;
        box-sizing: border-box;
	}
    .td-a{
        width: 100px;
    }
    .updelDiv{
		border: none; !important;
        margin: 10 auto; !important;
    }
</style>
<script>

	$(function(){init();});
	
	function init(){
	}
	

	function update(){
		var r_code = $("[name='r_code']").val();
		
	    // 새로운 form 엘리먼트 생성
	    var form = document.createElement("form");
	    form.method = "POST";
	    form.action = "/posting.do";
	
	    // 새로운 input 엘리먼트 생성
	    var input = document.createElement("input");
	    input.type = "hidden";
	    input.name = "r_code";
	    input.value = r_code;
	
	    // form에 input 추가하고 바로 body에 추가하여 submit
	    form.appendChild(input);
	    document.body.appendChild(form).submit();
	}
    
</script>
</head>
<body>
<center>
	<a onclick="location.href = '/main.do';"><h1 class="pointer">WorkMatch</h1></a>
	
	<c:if test="${requestScope.postMap.MID eq mid}">
		<div class="form-container updelDiv">
			<span style="float: right">
				<input type="button" value="수정" onclick="update()">
				<input type="button" value="삭제">
			</span>
		</div>
	</c:if>
	<div class="form-container">
	<form name="posting_form">
	<br><br>
		<table class="postTable">
			<tr>
				<td class="td-a">제목</td>
				<td>${requestScope.postMap.TITLE}</td>
			</tr>
			<tr>
				<td class="td-a">업체명</td>
				<td>${requestScope.postMap.COMPANY}</td>
			</tr>
			<tr>
				<td class="td-a">모집인원</td>
				<td>${requestScope.postMap.PARTICIPANTS}</td>
			</tr>
			<tr>
				<td class="td-a">모집내용</td>
				<td>${requestScope.postMap.RECRUITMENT}</td>
			</tr>
			<tr>
				<td class="td-a">업무내용</td>
				<td>${requestScope.postMap.JOB}</td>
			</tr>
			<tr>
				<td class="td-a">급여</td>
				<td>${requestScope.postMap.INCOME}</td>
			</tr>
			<tr>
				<td class="td-a">자격조건</td>
				<td>${requestScope.postMap.CONDITION}</td>
			</tr>
			<tr>
				<td class="td-a">근무지</td>
				<td>${requestScope.postMap.REGION}</td>
			</tr>
			<tr>
				<td class="td-a">근무지 주소</td>
				<td>${requestScope.postMap.ADDRESS}</td>
			</tr>
			<tr>
				<td class="td-a">연락처</td>
				<td>${requestScope.postMap.PHONE_NUMBER}</td>
			</tr>
			<tr>
				<td class="td-a">이메일</td>
				<td>${requestScope.postMap.EMAIL}</td>
			</tr>
		</table>
		<input type="hidden" name="r_code" value="${requestScope.postMap.R_CODE}">
	</form>
	</div>
</center>
</body>
</html>