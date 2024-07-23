<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목</title>
<style>

</style>
<script>
	$( function(){init();});
	
	function init(){
	}
	
	
	
	
	
	function createPost(){
		var midObj = $("[name='mid']");
		if(midObj.val()===""){
			alert("구인글을 작성하려면 로그인을 해주세요");
			location.replace('/login.do');
		} else {
			location.replace('/posting.do');
		}
	}
</script>
</head>
<body>
<center>
	<a onclick="location.replace('/main.do');"><h1 class="pointer">WorkMatch</h1></a>
    <div style="float: right;">
        <span style="margin-right: 20px;">
        	<c:if test="${empty requestScope.mid}">
	            <a class="pointer" onclick="location.replace('/login.do');">로그인</a> | 
	            <a class="pointer" onclick="location.replace('/signUp.do');">회원가입</a>
            </c:if>
        	<c:if test="${not empty requestScope.mid}">
	            <a class="pointer">${requestScope.mid}</a> | 
	            <a class="pointer" onclick="location.replace('/login.do');">로그아웃</a>
            </c:if>
        </span>
    </div>
    <br>
    
    <input type="text" name="search">
    
    상세
    
	<a class="pointer" onclick="createPost()">구인글 작성</a>
    
    <div class="mainSearchContainer">
    </div>
</center>

<input type="hidden" name="mid" value='${requestScope.mid}'>
</body>
</html>
