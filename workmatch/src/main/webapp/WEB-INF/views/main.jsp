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
		width: 200px;
	}
	.mainSearchContainer{
		width: 1200px;
		min-height:200px;
	}
	.td-time{
		width: 10%;
		text-align: center;
	}
	.td-company{
		width: 25%;
		text-align: right;
	}
	.user{
		font-size: 18px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.postTable {
	    border-spacing: 0 20px; /* 행 사이의 간격을 10px로 설정 */
	    border-collapse: separate !important;
	    width: 95% !important;
	    max-width: 1200px !important;
	    margin: 0 auto !important;
	}
	.image{
		width:40px;
		height:40px;
		cursor: pointer;
	}
	.notification-badge {
		position: absolute;
		display: none;
		background-color: red;
		color: white;
		border-radius: 50%;
		width: 15px;
		height: 15px;
		font-size:20px;
		align-items: center;
		justify-content: center;
		cursor:pointer;
	}
</style>
<script>
	let socket;
	let checkApplicationCnt = "${requestScope.checkApplicationCnt}";
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	$(function() {init();});

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	function init(){
		socketOpen();

		
		//상세 버튼 눌렀을때 상세박스 뜨게하기
		$('.mainButton').on('click', function() { 
			var offset = $('.mainButton').offset();
			var selectHeight = $('.mainButton').outerHeight();
			
			$('.detailsBox').css({
                top: offset.top + selectHeight + 'px',
                left: offset.left + 'px'
            }).toggle();
		});
		
		//엔터를 눌렀을때 폼 제출 방지
		$("[name='searchForm'] input[name='keyword']").on('keydown', function(event) {
			if (event.key === 'Enter') {
				//폼 제출 방지
				event.preventDefault();
				search();
			}
		});
		
 	    
	    updateNotificationBadgePosition();
		//화면 크기가 변경될때마다 실행
		$(window).resize(updateNotificationBadgePosition);
	}//init() 종료
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	function search(){
		var keyword = $("[name='keyword']").val().trim();
		$("[name='keyword']").val(keyword);
		var formObj = $("[name='searchForm']");
		ajax(
			     "/main.do",
			     "post",
			     formObj,
			     function (responseHtml) {
 			    	var obj = $(responseHtml);
					$(".pageNos").html(obj.find(".pageNos").html());
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
	     function pageNoClick(clickPageNo) {
         var formObj = $("[name='searchForm']");
         formObj.find("[name='selectPageNo']").val(clickPageNo);
         search();
     }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	function socketOpen(){
		//웹소켓이 이미 열려있다면 리턴
		if (socket && socket.readyState === WebSocket.OPEN) {
		    return;
		}
		
		//웹소켓 서버와 연결
		socket = new WebSocket('ws://localhost:8081/ws');
		//웹소켓을 열었을 때
		socket.onopen = function(event) {
			sendMessage();
		};
		//서버에서 메세지를 받았을 때
		socket.onmessage = function(event) {
			checkApplicationCnt = event.data;
			updateNotificationBadgePosition();
		};
		//웹소켓이 닫힐 때
		socket.onclose = function(event) {
		};
		//웹소켓 에러 발생
		socket.onerror = function(error) {
			alert(error);
		};
		
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 메시지 전송 함수
    function sendMessage() {
    	var mid = $("[name='mid']").val();
        socket.send(mid);
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//알림 위치 조정
	function updateNotificationBadgePosition() {
		var notificationOffset = $('.notification').offset();
		var notificationSelectHeight = $('.notification').outerHeight();
		
		if (parseInt(checkApplicationCnt, 10) !== 0){
			$('.notification-badge').css({
				display: 'flex',
				top: notificationOffset.top + notificationSelectHeight -30 + 'px',
				left: notificationOffset.left +20 + 'px'
			});
		}else{
			$('.notification-badge').css({
				display: 'none',
				top: notificationOffset.top + notificationSelectHeight -30 + 'px',
				left: notificationOffset.left +20 + 'px'
			});
		}
	}	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

</script>
</head>
<body>
<center>

    
	<h1 class="main_logo pointer" onclick="location.href = '/main.do';">WorkMatch</h1>
    <div style="float: right;">
        <span class="user" style="margin-right: 20px;">
        	<c:if test="${empty requestScope.mid}">
	            <a class="pointer" onclick="location.href = '/login.do';">로그인</a>&nbsp;|&nbsp; 
	            <a class="pointer" onclick="location.href = '/signUp.do';">회원가입</a>
            </c:if>
        	<c:if test="${not empty requestScope.mid}">
        		<img class="image notification" src="/sys_img/notification.png" onclick="location.href='/notification.do'">
       			<img class="image" src="/img/${requestScope.mid}/${requestScope.imgMap.IMG}" onclick="location.href='/imgUpdate.do'">&nbsp;
	            <a class="pointer" onclick="location.href = '/myInfoPage.do';">${requestScope.mid}</a>&nbsp;|&nbsp;
	            <a class="pointer" onclick="location.href = '/login.do';">로그아웃</a>
            </c:if>
        </span>
    </div>
    <br>
    
    <div class="mainSearchContainer">
    <form name="searchForm">
    	<input type="hidden" name="selectPageNo" value="1">
    	
    	<input type="text" name="keyword">
    	<input type="button" value="검색" class="searchButton" onclick="search()">
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
    	<table class="postTable">
    		<c:if test="${requestScope.searchMap.searchResultCount eq 0}">
				<td style="text-align:center">
					""
				</td>
			</c:if>
			<c:forEach var="i" items="${requestScope.searchMap.postList}" >
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
    	
    	<div class="pageNos">
            <span style="cursor:pointer" onClick="pageNoClick(1)">[처음]</span>
            <span style="cursor:pointer" onClick="pageNoClick(${requestScope.searchMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;

            <c:forEach var="pageNo" begin="${requestScope.searchMap.begin_pageNo}" end="${requestScope.searchMap.end_pageNo}">
                <c:choose>
                    <c:when test="${requestScope.searchMap.selectPageNo==pageNo}">
                        ${pageNo}
                    </c:when>
                    <c:otherwise>
                        <span style="cursor:pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            &nbsp;&nbsp;
            <span style="cursor:pointer" onClick="pageNoClick(${requestScope.searchMap.selectPageNo}+1)">[다음]</span>
            <span style="cursor:pointer" onClick="pageNoClick(${requestScope.searchMap.last_pageNo})">[마지막]</span>
        </div>
        
    </div>
    </form>
</center>

<input type="hidden" name="mid" value='${requestScope.mid}'>
<div class="notification-badge" onclick="location.href='/notification.do'">
	!
</div>
</body>
</html>
