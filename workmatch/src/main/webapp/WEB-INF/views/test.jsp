<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){init();});
function init(){
	const jsonString = localStorage.getItem("index");
	const indexArr = JSON.parse(jsonString);
	const arrLength = indexArr.length;
	if(arrLength>0){
		for(let i=0; i<arrLength; i++){
			$(".p-text a").eq(parseInt( indexArr[i], 10 )).css("color", "purple");
		}
	}
}
function hyperlink(index){
 	const jsonString = localStorage.getItem("index");
	const indexArr = JSON.parse(jsonString);
	const arrLength = indexArr.length;
	if(arrLength>0){
		if(jsonString.match(index)===null){
			indexArr.push(index);
			const arrString = JSON.stringify(indexArr);
			localStorage.setItem('index', arrString);
		}
	} 
}
</script>
</head>
<body>
<center>
	<h1>테스트</h1>
	<p class="p-text">
		<a class="korean pointer" onclick="hyperlink('0')" >000000000000</a><br><br>
		<a class="korean pointer" onclick="hyperlink('1')" >1111111111111</a><br><br>
		<a class="korean pointer" onclick="hyperlink('2')" >22222222222222</a><br><br>
		<a class="korean pointer" onclick="hyperlink('3')" >333333333333333</a><br><br>
		<a class="korean pointer" onclick="hyperlink('4')" >444444444444</a>
	</p>
</center>
</body>
</html>
