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
    input[type="text"], textarea, select {
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
		var r_code = '${requestScope.postMap.R_CODE}';
		if(r_code){
			$("[name='r_code']").val(r_code);
	        var obj = $("[name='posting_form']");
	        obj.find("input[name='title']").val('${requestScope.postMap.TITLE}');
	        obj.find("input[name='company']").val('${requestScope.postMap.COMPANY}');
	        obj.find("input[name='participants']").val('${requestScope.postMap.PARTICIPANTS}');
	        obj.find("input[name='recruitment']").val('${requestScope.postMap.RECRUITMENT}');
	        obj.find("textArea[name='job']").val('${requestScope.postMap.JOB}');
	        obj.find("input[name='income']").val('${requestScope.postMap.INCOME}');
	        obj.find("textarea[name='condition']").val('${requestScope.postMap.CONDITION}');
	        obj.find("select[name='region']").val('${requestScope.postMap.REGION}');
	        obj.find("input[name='address']").val('${requestScope.postMap.ADDRESS}');
	        obj.find("input[name='phone_number']").val('${requestScope.postMap.PHONE_NUMBER}');
	        obj.find("input[name='email']").val('${requestScope.postMap.EMAIL}');
		}
	}
	
	function submitForm(){
		
		if (isEmpty()===true) {
	        alert("값이 비어있는 문제가 있습니다.");
	        return;
		}
		
		var formObj = $("[name='posting_form']");
		var r_code = $("[name='r_code']").val();
		if(r_code===""){
        	$("[name='r_code']").val(rCode(10));
		}
		
		var formObj = $("[name='posting_form']");
		ajax(
			     "/postingProc.do",
			     "post",
			     formObj,
			     function (responseJson) {
			    	 var postCnt = responseJson["postCnt"];
			    	 if(postCnt===1){
			    		 alert("성공");
			    		 location.href = "/main.do";
			    	 }else{
			    		 alert("실패");
			    	 }
			     }
			);
	}
	
	function isEmpty() {
	    var inputs = $("[name='posting_form'] input[type='text'], [name='posting_form'] textarea, [name='posting_form'] select");

	    for (var i = 0; i < inputs.length; i++) {
	        var value = $(inputs[i]).val().trim();
	        if (value === "") {
	            return true;
	        }
	    }
	    return false;
	}

    
</script>
</head>
<body>
<center>
	<a onclick="location.href = '/main.do';"><h1 class="pointer">WorkMatch</h1></a>
	<div class="form-container">
	<form name="posting_form">
		<table class="postTable">
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
				<td class="td-a">자격조건</td>
				<td><textArea name="condition" placeholder="자격 조건"></textArea></td>
			</tr>
			<tr>
				<td class="td-a">근무지</td>
				<td>
					<select name="region">
						<option value=""></option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="인천">인천</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="제주">제주</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="td-a">근무지 주소</td>
				<td><input type="text" name="address" placeholder="근무지 주소"></td>
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