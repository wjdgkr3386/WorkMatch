<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 수정</title>
<style>
.image{
	width:200px;
	height:200px;
}
</style>
<script>

	$(function(){init();});
	
	function init(){
		$('#fileInput').on('change', function(event){
			var file = event.target.files[0];
			if(file){
				var reader = new FileReader();
				
				//파일 읽기가 완료되면 자동으로 실행되는 onload, 그 안에 실행될 함수 지정
				reader.onload = function(e){
					$('.image').attr('src', e.target.result);
					$("[name='is_select']").val('1');
				}
				
				reader.readAsDataURL(file);
			}
		});
	}
	
	function updateImage(){
		var formObj = $("[name='imageForm']");
		var is_select = $('input[name=is_select]').val();
		if(is_select==='0') { return; }
		
		ajax(
			     "/imgUpdateProc.do",
			     "post",
			     formObj,
			     function (responseJSON) {
			    	var updateCnt = responseJSON["updateCnt"];
			    	if(updateCnt==1){
			    		alert("성공");
			    		$("[name='is_select']").val('0');
			    		return;
			    	}else{
			    		alert("실패");
			    	}
			     }
			);
	}
	

</script>
</head>
<body>
<center>
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
<form name="imageForm">
<table>
	<tr>
		<td style="text-align:center;">프로필 사진</td>
		<td>
			<img class="image" src="/img/${requestScope.mid}/${requestScope.imgMap.IMG}"><br><br>
			<input type="button" value="사진 변경" onclick="$('#fileInput').click();">
			<input type="button" value="삭제" onclick="$('.image').attr('src', '/sys_img/none_img.png'); $('input[name=is_select]').val('2'); " >
			<input type="file" id="fileInput" name="img" style="display:none;">
		</td>
	</tr>
</table>
<br><input type="button" value="적용" onclick="updateImage()">
<input type="hidden" name="mid" value="${requestScope.mid}">
<!-- 기본0 사진변경1 삭제2 -->
<input type="hidden" name="is_select" value="0">
</form>
</center>
</body>
</html>