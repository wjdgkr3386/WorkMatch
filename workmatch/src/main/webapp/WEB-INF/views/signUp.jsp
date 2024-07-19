<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function signUp(){
		var formObj = $('[name="signUpForm"]');
		ajax(
			     "/signUpProc.do",
			     "post",
			     formObj,
			     function (signUpCnt) {
			    	 if(signUpCnt==1){ 
			    		 alert("성공!");
			    		 location.replace("/main.do");
			    	} else {
			    		 alert("실패!");
			    	 }
			     }
			);
	}
</script>
</head>
<body>
<center>
	<a onclick="location.replace('/main.do');"><h1 class="pointer">WorkMatch</h1></a>
	
	<form name="signUpForm">
		<div class="a-container">
			<div class="a-block">
				<input type="text" name="name" class="input-size" placeholder="이름"> 
			</div>
			<div class="a-block">
				<input type="text" name="ID" class="input-size" placeholder="아이디      영어+숫자  6~10자리"> 
			</div>
			<div class="a-block">
				<input type="password" name="password" class="input-size" placeholder="비밀번호   영어+숫자  8~15자리"> 
			</div>
			<div class="a-block">
				<input type="text" name="jumin_number1" class="input-size" placeholder="주민등록번호 앞자리"> 
			</div>
			<div class="a-block">
				<input type="text" name="jumin_number2" class="input-size" placeholder="주민등록번호 뒷자리"> 
			</div>
			<div class="a-block">
				<input type="text" name="phone_number" class="input-size" placeholder="전화번호   -없이 입력"> 
			</div>
			<div class="a-block">
				<input type="text" name="email" class="input-size" placeholder="이메일"> 
			</div>
			<div class="a-block">
				<input type="text" name="occupation" class="input-size" placeholder="직업"> 
			</div>
			<div class="a-block">
				<select name="location">
					<option value="">주소지</option>
					<option value="서울">서울특별시</option>
					<option value="부산">부산광역시</option>
					<option value="인천">인천광역시</option>
					<option value="대구">대구광역시</option>
					<option value="광주">광주광역시</option>
					<option value="대전">대전광역시</option>
					<option value="울산">울산광역시</option>
					<option value="세종">세종특별자치시</option>
					<option value="경기">경기도</option>
					<option value="강원">강원도</option>
					<option value="충북">충청북도</option>
					<option value="충남">충청남도</option>
					<option value="전북">전라북도</option>
					<option value="전남">전라남도</option>
					<option value="경북">경상북도</option>
					<option value="경남">경상남도</option>
					<option value="제주">제주특별자치도</option>
				</select>
				<input type="text" name="address" class="input-size" placeholder="상세주소"> 
			</div>
		</div>
	</form>
	<input type="button" value="확인" onclick="signUp()">
</center>
</body>
</html>