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
/* 	// 엔터키 눌렀을때 폼 제출 막기
	$('input[type="text"]').on("keypress", function(event) {
	    // 엔터 키의 키코드는 13
	    if (event.which === 13) {
	        event.preventDefault();
	    }
	}); */
}

function login(){
	
	var formObj = $("[name='loginForm']");
	ajax(
	     "/loginProc.do",
	     "post",
	     formObj,
	     function (loginCnt) {
	    	 if(loginCnt==1){
	    		 alert("로그인 성공!");
	    		 location.replace("/main.do");
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
	<a onclick="location.replace('/main.do');"><h1 class="pointer">WorkMatch</h1></a>
	로그인<br>
	<form name="loginForm">
		<input type="text" name="mid" placeholder="아이디"><br>
		<input type="password" name="pwd" placeholder="패스워드"><br><br>
	</form>

	<input type="button" value="확인" onclick="login()">
	<input type="button" value="회원가입">

	
</center>
</body>
</html>