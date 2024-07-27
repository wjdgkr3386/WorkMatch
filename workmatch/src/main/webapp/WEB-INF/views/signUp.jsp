<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>

	$(function(){init();});
	function init(){
        var obj = $("[name='signUpForm']");
        obj.find("input[name='name']").val("홍길동");
        obj.find("input[name='mid']").val("aaaaaa");
        obj.find("input[name='pwd']").val("1111");
        obj.find("input[name='jumin_number1']").val("900101");
        obj.find("input[name='jumin_number2']").val("1234567");
        obj.find("input[name='phone_number']").val("01012345678");
        obj.find("input[name='email']").val("test@example.com");
        obj.find("input[name='occupation']").val("개발자");
        obj.find("select[name='region']").val("서울");
        obj.find("input[name='address']").val("서울시 강남구");
	}
	
	
	
	function signUp(){
		var formObj = $('[name="signUpForm"]');
		ajax(
			     "/signUpProc.do",
			     "post",
			     formObj,
			     function (responseJson) {
			    	var signUpCnt = responseJson["signUpCnt"];
			    	if(signUpCnt==1){ 
			    		 alert("성공!");
			    		 location.href = "/login.do";
			    	} else if(signUpCnt==3){
			    		alert("이미 있는 아이디 입니다.");
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
	<a onclick="location.href = '/main.do';"><h1 class="pointer">WorkMatch</h1></a>
	
	<form name="signUpForm">
		<div class="a-container">
			<div class="a-block">
				<input type="text" name="name" class="input-size" placeholder="이름"> 
			</div>
			<div class="a-block">
				<input type="text" name="mid" class="input-size" placeholder="아이디      영어+숫자  6~10자리"> 
			</div>
			<div class="a-block">
				<input type="password" name="pwd" class="input-size" placeholder="비밀번호   영어+숫자  8~15자리"> 
			</div>
			<div class="a-block">
			<span>
				<input type="text" name="jumin_number1" placeholder="주민등록번호 앞자리" style=" width : 230px; height: 50px; padding: 15px;"> 
			</span>
			<span style="width : 50px; align-items: center;  justify-content: center;"> - </span>
			<span>
				<input type="text" name="jumin_number2" placeholder="주민등록번호 뒷자리" style=" width : 230px; height: 50px; padding: 15px;"> 
			</span>
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
				<input type="text" name="address" class="input-size" placeholder="상세주소"> 
			</div>
		</div>
	</form>
	<input type="button" value="확인" onclick="signUp()">
</center>
</body>
</html>