<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.notificationTable {
	}
</style>
<script>
	$(function(){init();});
	function init(){
		
	}

	function detail
</script>
</head>
<body>
<center>
	<h1>알림</h1>
	<table class="notificationTable">
			<tr>
				<th>내용</th>
				<th>지원자</th>
				<th>시간</th>
			</tr>
		<c:forEach var="i" items="${requestScope.applicationMapList}">
			<tr>
				<td><a class="pointer" onclick="">${i.TITLE} | 자기소개서</a></td>
				<td class="td-b">${i.NAME}</td>
				<td class="td-b">${i.CREATE_TIME}</td>
			</tr>
		</c:forEach>
	</table>
</center>
</body>
</html>
