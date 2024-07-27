<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목</title>
<style>
	.mainButton{
		display:inline-block;
		margin: 0 20px 0 0;
		background-color: lightgray;
		width:45px;
		height:25px;
	}
	.detailsBox{
		display:none;
		position: absolute;
		background-color: white;
		border: 1px solid #ccc;
		padding: 10px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		width: 200px;
	}
	.mainSearchContainer{
		width: 1200px;
		min-height:200px;
	
	}
	.td-company{
		width: 30%;
		text-align: right;
	}
	
.postTable {
    border-spacing: 0 20px; /* 행 사이의 간격을 10px로 설정 */
    border-collapse: separate !important;
    width: 95% !important;
    max-width: 1200px !important;
    margin: 0 auto !important;
}
}
</style>
<script>
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	$( function(){init();});

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	function init(){

		//상세 버튼 눌렀을때 상세박스 뜨게하기
		$('.mainButton').on('click', function() { 
			var offset = $('.mainButton').offset();
			var selectHeight = $('.mainButton').outerHeight();
			
			$('.detailsBox').css({
                top: offset.top + selectHeight + 'px',
                left: offset.left + 'px'
            }).toggle();
		});
	}
	

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	function search(){
		var formObj = $("[name='searchForm']");
		
		ajax(
			     "/main.do",
			     "post",
			     formObj,
			     function (responseHtml) {
			    	 var obj = $(responseHtml);
			    	 $(".postTable").html(obj.find("[name='searchForm'] .postTable").html());
			     }
			);
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//구인글 작성 페이지 이동
	function createPost(){
		var midObj = $("[name='mid']");
		if(midObj.val()===""){
			alert("구인글을 작성하려면 로그인을 해주세요");
			location.href = '/login.do';
		} else {
			location.href = '/posting.do';
		}
	}

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
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
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
</script>
</head>
<body>
<center>
	<a onclick="location.href = '/main.do';"><h1 class="pointer">WorkMatch</h1></a>
    <div style="float: right;">
        <span style="margin-right: 20px;">
        	<c:if test="${empty requestScope.mid}">
	            <a class="pointer" onclick="location.href = '/login.do';">로그인</a> | 
	            <a class="pointer" onclick="location.href = '/signUp.do';">회원가입</a>
            </c:if>
        	<c:if test="${not empty requestScope.mid}">
	            <a class="pointer">${requestScope.mid}</a> | 
	            <a class="pointer" onclick="location.href = '/login.do';">로그아웃</a>
            </c:if>
        </span>
    </div>
    <br>
    
    
    <div class="mainSearchContainer">
    <form name="searchForm">
    	<input type="text" name="keyword">
    	<button class="searchButton" onclick="search()">검색</button>
    	<span class="mainButton pointer">상세</span>
		<a class="pointer" onclick="createPost()">구인글 작성</a>
		
		
		<div class="detailsBox">
		    서울 <input type="checkbox" name="detailsRegion" value="서울">
		    부산 <input type="checkbox" name="detailsRegion" value="부산">
		    대구 <input type="checkbox" name="detailsRegion" value="대구"> <br>
		    인천 <input type="checkbox" name="detailsRegion" value="인천">
		    광주 <input type="checkbox" name="detailsRegion" value="광주">
		    대전 <input type="checkbox" name="detailsRegion" value="대전"> <br>
		    울산 <input type="checkbox" name="detailsRegion" value="울산">
		    세종 <input type="checkbox" name="detailsRegion" value="세종">
		    경기 <input type="checkbox" name="detailsRegion" value="경기"> <br>
		    강원 <input type="checkbox" name="detailsRegion" value="강원">
		    충북 <input type="checkbox" name="detailsRegion" value="충북">
		    충남 <input type="checkbox" name="detailsRegion" value="충남"> <br>
		    전북 <input type="checkbox" name="detailsRegion" value="전북">
		    전남 <input type="checkbox" name="detailsRegion" value="전남">
		    경북 <input type="checkbox" name="detailsRegion" value="경북"> <br>
		    경남 <input type="checkbox" name="detailsRegion" value="경남">
		    제주 <input type="checkbox" name="detailsRegion" value="제주">
		</div>
    </form>
    	<table class="postTable">
    		<c:if test="${requestScope.searchMap.searchResultCount eq 0}">
				<td style="text-align:center">
					결과물이 없습니다
				</td>
			</c:if>
			<c:forEach var="i" items="${requestScope.searchMap.postList}" >
					<tr>
						<td>
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

<input type="hidden" name="mid" value='${requestScope.mid}'>
</body>
</html>
