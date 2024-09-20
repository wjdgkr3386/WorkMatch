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
	var a  = "${requestScope.postMap.JOB}";
    $("[name='job']").val(a);
    
}
</script>
</head>
<body>
<center>
	<h1>테스트</h1>
	<textarea name="job"></textarea>
</center>
</body>
</html>
