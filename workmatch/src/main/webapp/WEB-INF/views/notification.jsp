<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
</style>
<script>
	$(function(){init();});
	
	function init(){
		const arrString = localStorage.getItem('arr')
		if(arrString){
			const arr = JSON.parse(arrString);
			for(let i=0; i<arr.length; i++){
				const applicant = arr[i].applicant;
				const r_code = arr[i].r_code;
				if(applicant != null && r_code != null){
					const appR_code = applicant + r_code;
					$("#" + appR_code).css("color", "purple");
				}
			}
		}	
		
	} // init() 종료
	
	function detailApplication(applicant, r_code) {
	    // 로컬 스토리지에서 배열 가져오기 (없을 경우 빈 배열로 초기화)
	    const arrString = localStorage.getItem('arr');
	    const arr = arrString!=null ? JSON.parse(arrString) : []; // null 방지 처리

	    // 중복 확인
	    let isDuplicate = false;
	    for (let i = 0; i < arr.length; i++) {
	        if (arr[i].applicant === applicant && arr[i].r_code === r_code) {
	            isDuplicate = true;
	            break;
	        }
	    }

	    // 중복이 없으면 추가
	    if (!isDuplicate) {
	        const obj = {
	            applicant: applicant,
	            r_code: r_code
	        };
	        arr.push(obj);
	        localStorage.setItem('arr', JSON.stringify(arr));
	    }
		
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
		<c:forEach var="i" items="${requestScope.applicationMapList}" varStatus="status">
			<tr>
				<td><a class="pointer" id="${i.APPLICANT}${i.R_CODE}" onclick="detailApplication('${i.APPLICANT}', '${i.R_CODE}')">${i.TITLE} | 자기소개서</a></td>
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
