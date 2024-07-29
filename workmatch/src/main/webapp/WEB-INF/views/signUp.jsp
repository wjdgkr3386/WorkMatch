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
		
		if (isEmpty()===true) {
	        alert("값이 비어있는 문제가 있습니다.");
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
	
	function isEmpty() {
	    var inputs = $("[name='signUpForm'] input[type='text']");

	    for (var i = 0; i < inputs.length; i++) {
	        var value = $(inputs[i]).val().trim();
	        if (value === "") {
	            return true;
	        }
	    }
	    return false;
	}
	
	
	function deleteAccount(){
		var formObj = $('[name="signUpForm"]');
		alert("123123123");
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
	<a onclick="location.href = '/main.do';"><h1 class="pointer">WorkMatch</h1></a>
	
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
	            <input type="text" id="phone_number" name="phone_number" class="input-size" placeholder="전화번호 -없이 입력">
	        </div>
	        <div class="a-block">
	            <input type="text" id="email" name="email" class="input-size" placeholder="이메일">
	        </div>
	        <div class="a-block">
	            <input type="text" id="occupation" name="occupation" class="input-size" placeholder="직업">
	        </div>
	        <div class="a-block">
	            <select id="region" name="region">
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
	            <input type="text" id="address" name="address" class="input-size" placeholder="상세주소">
	        </div>
	    </div>
	<input type="hidden" name="is_update">
	</form>
	<input type="button" value="확인" onclick="signUp()">
	<input type="button" value="회원탈퇴" onclick="deleteAccount()">
</center>
</body>
</html>