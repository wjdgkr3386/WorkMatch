<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보</title>
<style>
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

	function deletePost(){
		if( !confirm( "구인글을 삭제하시겠습니까?" )){
			return;
		}
		var formObj = $('[name="posting_form"]');
		ajax(
			     "/deletePostProc.do",
			     "post",
			     formObj,
			     function (responseJson) {
			    	 var deleteCnt = responseJson["deleteCnt"];
			    	 if(deleteCnt==1){
			    		 alert("성공");
			    		 location.href = "/main.do";
			    	 }else{
			    		 alert("실패");
			    	 }
			     }
		);		
	}

    function checkApplication(){
		var formObj = $('[name="posting_form"]');
		ajax(
			     "/checkApplication.do",
			     "post",
			     formObj,
			     function (responseJson) {
			    	 var checkCnt = responseJson["checkCnt"];
			    	 if(checkCnt===0){
			    		 goApplication();
			    	 }else if(checkCnt===-2){
			    		 alert("이미 지원했습니다.");
			    	 }else{
			    		 alert("실패");
			    	 }
			     }
		);
    }	
    
    
    function goApplication(){
        // 새로운 form 엘리먼트 생성
        var form = document.createElement("form");
        form.method = "POST";
        form.action = "/application.do";

        // 새로운 input 엘리먼트 생성
        var mid = document.createElement("input");
        mid.type = "hidden";
        mid.name = "mid";
        mid.value = $("[name='mid']").val();

        // 새로운 input 엘리먼트 생성
        var r_code = document.createElement("input");
        r_code.type = "hidden";
        r_code.name = "r_code";
        r_code.value = $("[name='r_code']").val();

        // form에 input 추가하고 바로 body에 추가하여 submit
        form.appendChild(mid);
        form.appendChild(r_code);
        document.body.appendChild(form).submit();
    }
</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
	
	<div class="form-container updelDiv">
		<span style="float: right">
			<c:if test="${requestScope.postMap.MID eq mid}">
				<input type="button" value="수정" onclick="update()">
				<input type="button" value="삭제" onclick="deletePost()">
			</c:if>
			<c:if test="${requestScope.postMap.MID ne mid}">
				<input type="button" value="신청하기" onclick="checkApplication()">
			</c:if>
		</span>
	</div>

	<div class="form-container">
	<form name="posting_form">
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
		<input type="hidden" name="mid" value="${requestScope.mid}">
		<input type="hidden" name="r_code" value="${requestScope.postMap.R_CODE}">
	</form>
	</div>
</center>
</body>
</html>