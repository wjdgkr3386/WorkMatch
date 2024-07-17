<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목</title>
<style>

</style>
</head>
<body>
<center>
	<a onclick="location.replace('/main.do');"><h1 class="pointer">WorkMatch</h1></a>
    <div style="float: right;">
        <span style="margin-right: 20px;">
            <a class="pointer" onclick="location.replace('/login.do');">로그인</a> | 
            <a class="pointer" onclick="location.replace('/signUp.do');">회원가입</a>
        </span>
    </div>
</center>
</body>
</html>
