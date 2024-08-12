<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.a-container{
	width : 580px;
	height: 800px;
	border: 1px solid black;
	padding: 20px;
}

.a-block{
	margin: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.input-size {
	width : 500px;
	height: 50px;
	padding: 15px;
}

.a-block select {
	height: 50px;
	font-size: 13px;
}
</style>
<script>

	$(function(){init();});
	function init(){
		var mid = '${requestScope.mid}';
		if(mid!=""){
	        var obj = $("[name='signUpForm']");
			obj.find("input[name='is_update'][type='hidden']").val("업데이트");
	        obj.find("input[name='name']").val("${requestScope.infoMap.NAME}");
	        obj.find("input[name='mid']").val("${requestScope.infoMap.MID}");
	        obj.find("input[name='pwd']").val("${requestScope.infoMap.PWD}");
	        obj.find("input[name='jumin_number1']").val("${requestScope.infoMap.JUMIN_NUMBER1}");
	        obj.find("input[name='jumin_number2']").val("${requestScope.infoMap.JUMIN_NUMBER2}");
	        obj.find("input[name='phone_number']").val("${requestScope.infoMap.PHONE_NUMBER}");
	        obj.find("input[name='email']").val("${requestScope.infoMap.EMAIL}");
	        obj.find("input[name='occupation']").val("${requestScope.infoMap.OCCUPATION}");
	        obj.find("select[name='region']").val("${requestScope.infoMap.REGION}");
	        obj.find("input[name='address']").val("${requestScope.infoMap.ADDRESS}");
		}
	}
	
	
	
	function signUp(){
		
		//유효성 검사
		if (!isValid()) {
	        return;
		}
		
		var formObj = $('[name="signUpForm"]');
		var is_update = formObj.find("input[name='is_update'][type='hidden']").val();
		
		if(is_update !== "업데이트"){
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
		}else{
			ajax(
				     "/infoUpdateProc.do",
				     "post",
				     formObj,
				     function (responseJson) {
				    	 var updateCnt = responseJson["updateCnt"];
				    	 if(updateCnt==1){
				    		 alert("성공");
				    		 location.href = "/main.do";
				    	 }else{
				    		 alert("실패");
				    	 }
				     }
			);
		}
	}
	
	
	function isValid() {
		var isValid = true;
		var messages = [];
		
		// 입력 필드 가져오기
		var name = $("[name='name']").val().trim();
		var mid = $("[name='mid']").val().trim();
		var pwd = $("[name='pwd']").val().trim();
		var jumin_number1 = $("[name='jumin_number1']").val().trim();
		var jumin_number2 = $("[name='jumin_number2']").val().trim();
		var phone_number = $("[name='phone_number']").val().trim();
		var email = $("[name='email']").val().trim();
		var occupation = $("[name='occupation']").val().trim();
		var region = $("[name='region']").val().trim();
		var address = $("[name='address']").val().trim();
		
		
		if (name === "") {
			messages.push("이름을 입력하세요.");
			isValid = false;
		} else if (!/^[가-힣]+$/.test(name)) { // 한글만 허용
			messages.push("이름은 한글만 입력할 수 있습니다.");
			isValid = false;
		}
		
		if (mid === "") {
			messages.push("아이디를 입력하세요.");
			isValid = false;
		} else if (!/^[a-zA-Z0-9]{6,15}$/.test(mid)) { // 영어+숫자 6~10자리
			messages.push("아이디는 영어와 숫자로 6~15자리여야 합니다.");
			isValid = false;
		}
		
		if (pwd === "") {
			messages.push("비밀번호를 입력하세요.");
			isValid = false;
		} else if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/.test(pwd)) { // 영어+숫자+특수문자 8~15자리
			messages.push("비밀번호는 영어, 숫자, 특수문자를 포함한 8~20자리여야 합니다.");
			isValid = false;
		}
		
		if (jumin_number1 === "" || jumin_number2 === "") {
			messages.push("주민등록번호를 입력하세요.");
			isValid = false;
		} else if (!/^\d{6}$/.test(jumin_number1) || !/^\d{7}$/.test(jumin_number2)) { // 주민등록번호 형식
			messages.push("주민등록번호는 앞자리 6자리, 뒷자리 7자리여야 합니다.");
			isValid = false;
		}
		
		if (phone_number === "") {
			messages.push("전화번호를 입력하세요.");
			isValid = false;
		} else if (!/^\d{2,3}-?\d{3,4}-?\d{4}$/.test(phone_number)) { // 전화번호 형식
			messages.push("전화번호는 10~11자리의 숫자만 입력 가능합니다.");
			isValid = false;
		}
		
		if (email === "") {
			messages.push("이메일을 입력하세요.");
			isValid = false;
			//첫 문자는 영어, @ 나오기 전까지는 영어+숫자 4~12자리, @ 하나, 영어+숫자 하나 이상, . 하나 , 소문자 2~4자리 
		} else if (!/^([a-zA-Z][a-zA-Z0-9]{4,16})@([a-z0-9]+\.)[a-z]{2,4}$/.test(email)) { // 이메일 형식
			messages.push("유효한 이메일 주소를 입력하세요.");
			isValid = false;
		}
		
		if (occupation === "") {
			messages.push("직업을 입력하세요.");
			isValid = false;
		}
		
		if (region === "") {
			messages.push("지역을 선택하세요.");
			isValid = false;
		}
		
		if (address === "") {
			messages.push("상세주소를 입력하세요.");
			isValid = false;
		}

		// 에러 메시지 출력
		if (!isValid) {
			alert(messages.join("\n"));
		}

		return isValid;
	}
	
	
	
	
	
	
	
	function deleteAccount(){
		if(confirm( "계정을 삭제하시겠습니까?" )){			
			if((prompt( "계정을 삭제하려면 ${requestScope.infoMap.MID} 를 입력하세요" )==="${requestScope.infoMap.MID}")){
			}else{
				return;
			}
		}else{
			return;
		}
		
		var formObj = $('[name="signUpForm"]');
		ajax(
			     "/deleteAccountProc.do",
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
</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
	
	<form name="signUpForm">
	    <div class="a-container">
	        <div class="a-block">
	            <input type="text" id="name" name="name" class="input-size" placeholder="이름">
	        </div>
	        <div class="a-block">
	            <input type="text" id="mid" name="mid" class="input-size" placeholder="아이디 영어+숫자 6~10자리"
	            	<c:if test='${not empty requestScope.mid}'>readonly</c:if>  >
	        </div>
	        <div class="a-block">
	            <input type="password" id="pwd" name="pwd" class="input-size" placeholder="비밀번호 영어+숫자 8~15자리">
	        </div>
	        <div class="a-block">
	            <span>
	                <input type="text" name="jumin_number1" placeholder="주민등록번호 앞자리" maxlength="6" style="width: 230px; height: 50px; padding: 15px;">
	            </span>
	            <span style="width: 50px; align-items: center; justify-content: center;"> - </span>
	            <span>
	                <input type="text" name="jumin_number2" placeholder="주민등록번호 뒷자리" maxlength="7" style="width: 230px; height: 50px; padding: 15px;">
	            </span>
	        </div>
	        <div class="a-block">
	            <input type="text" id="phone_number" name="phone_number" class="input-size" placeholder="전화번호      예시) 010-1234-5678">
	        </div>
	        <div class="a-block">
	            <input type="text" id="email" name="email" class="input-size" placeholder="이메일">
	        </div>
	        <div class="a-block">
	            <input type="text" id="occupation" name="occupation" class="input-size" placeholder="직업">
	        </div>
	        <div class="a-block">
	            <select id="region" name="region">
	                <option value="">지역</option>
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
	            <input type="text" id="address" name="address" class="input-size" placeholder="상세주소">
	        </div>
	    </div>
	<input type="hidden" name="is_update">
	</form>
	<input type="button" value="확인" onclick="signUp()">
	<c:if test='${not empty requestScope.mid}'>
		<input type="button" value="계정삭제" onclick="deleteAccount()">
	</c:if>
</center>
</body>
</html>