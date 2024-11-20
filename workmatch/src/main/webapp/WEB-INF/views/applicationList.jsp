<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원서</title>
<style>
	.td-company{
		width:75%;
	}
</style>
<script>
	$(function(){init();});
	function init(){
	}
	
	function detailApplication(applicant){
		$("[name='applicant']").val(applicant);
		var formObj = $("[name='appForm']");
		formObj.submit();
	}
</script>
</head>

<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>

<table>
	<tr>
		<th>내용</td>
		<th>지원자</td>
	</tr>
	<c:if test="${empty requestScope.applicationList}">
		<tr>
			<td colspan='2' style="text-align:center">""</td>
			<!-- <td></td> -->
		</tr>
	</c:if>
	<c:forEach var="i" items="${requestScope.applicationList}">
		<tr>
			<td class="td-company pointer" onclick="detailApplication('${i.APPLICANT}')">${i.COMPANY} 에 새로운 신청서가 왔습니다.</td>
			<td style="text-align: center">${i.APPLICANT_NAME}</td>
		</tr>
	</c:forEach>
</table>
</center>
<form name="appForm" action="/applicationReg.do" method="post">
	<input type="hidden" name="r_code" value="${requestScope.r_code}">
	<input type="hidden" name="applicant">
</form>
</body>
</html>