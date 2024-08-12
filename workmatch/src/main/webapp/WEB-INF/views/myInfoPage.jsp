<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>내 정보</title>
<style>
    .upload-box {
        width: 100px;
        height: 100px;
        border: 1px solid black;
        display: inline-block;
        align-items: center;
        justify-content: center;
    }
    .upload-box img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        pointer-events: none;
    }
    table {
		width: 800px; !important;
    }
    .td-time{
		width: 8%;
	}
	.td-company{
		width: 25%;
		text-align: right;
	}
	.postTable {
	    border-spacing: 0 20px; /* 행 사이의 간격을 10px로 설정 */
	    border-collapse: separate !important;
	    width: 95% !important;
	    max-width: 1200px !important;
	    margin: 0 auto !important;
	}
</style>
<script>
	$(function(){ init();});
	function init(){
	}
	

	function goDetails(r_code){
	    // 새로운 form 엘리먼트 생성
	    var form = document.createElement("form");
	    form.method = "POST";
	    form.action = "/details.do";

	    // 새로운 input 엘리먼트 생성
	    var input = document.createElement("input");
	    input.type = "hidden";
	    input.name = "r_code";
	    input.value = r_code;

	    // form에 input 추가하고 바로 body에 추가하여 submit
	    form.appendChild(input);
	    document.body.appendChild(form).submit();
	}

</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
	<table>
		<tr>
			<td rowspan='2' style="width:100px;">
				<div class="upload-box" onclick="location.href='/imgUpdate.do'">
       				<img class="image" src="/img/${requestScope.mid}/${requestScope.userInfoMap.IMG}">
				</div>
			</td>
			<td>${requestScope.userInfoMap.NAME}</td>
			<td>${requestScope.userInfoMap.AGE}세</td>
			<td>${requestScope.userInfoMap.PHONE_NUMBER}</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td class="td4" colspan='3'>${requestScope.userInfoMap.EMAIL}</td>
			<!-- <td></td>
			<td></td> -->
		</tr>
	</table>
	<br><input type="button" value="수정하기" onclick="location.href='/infoUpdate.do'">
	
	<div style="width:1200px; padding:10px; margin:30px;;">내 구인글
    	<table class="postTable">
    		<c:if test="${empty requestScope.userMyPostMapList}">
				<td style="text-align:center">
					""
				</td>
			</c:if>
			<c:forEach var="i" items="${requestScope.userMyPostMapList}" >
					<tr>
						<td class="td-time">
							${i.CREATE_TIME}
						</td>
						<td class="td-title">
							<a class="pointer" onclick="goDetails('${i.R_CODE}')">${i.TITLE}</a>
						</td>
						<td class="td-company">
							${i.COMPANY}
						</td>
					</tr>
			</c:forEach>
    	</table>
    </div>
</center>
</body>
</html>
