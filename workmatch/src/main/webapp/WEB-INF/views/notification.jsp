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
	
	function detailApplication(applicant, r_code){
		$("[name='applicant']").val(applicant);
		$("[name='r_code']").val(r_code);
		var formObj = $("[name='appForm']");
		formObj.submit();
	}
	
</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
	<table class="notificationTable">
			<tr>
				<th>내용</th>
				<th>지원자</th>
				<th>시간</th>
			</tr>
		<c:forEach var="i" items="${requestScope.applicationMapList}">
			<tr>
				<td><a class="pointer" onclick="detailApplication('${i.APPLICANT}', '${i.R_CODE}')">${i.TITLE} | 자기소개서</a></td>
				<td class="td-b">${i.APPLICANT_NAME}</td>
				<td class="td-b">${i.CREATE_TIME}</td>
			</tr>
		</c:forEach>
	</table>
<form name="appForm" action="/applicationReg.do" method="post">
	<input type="hidden" name="r_code">
	<input type="hidden" name="applicant">
</form>
</form>
</center>
</body>
</html>
