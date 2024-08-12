<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
$(function(){init();});
function init(){
	
}

function login(event){
	//폼 제출을 막기 위한 기본동작 방지
	event.preventDefault();
	
	var formObj = $("[name='loginForm']");
	ajax(
	     "/loginProc.do",
	     "post",
	     formObj,
	     function (loginCnt) {
	    	 if(loginCnt==1){
	    		 alert("로그인 성공!");
	    		 location.href = "/main.do";
	    	 }else{
	    		 alert("로그인 실패!");
	    	 }
	     }
	);
}
</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
	로그인<br>
	<form name="loginForm" onsubmit="login(event)">
		<input type="text" name="mid" placeholder="아이디"><br>
		<input type="password" name="pwd" placeholder="패스워드"><br><br>
	<input type="submit" value="확인">
	<input type="button" value="회원가입" onclick="location.href = '/signUp.do';">
	</form>
	
</center>
</body>
</html>