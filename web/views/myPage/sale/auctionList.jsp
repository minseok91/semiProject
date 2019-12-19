<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 5. 오후 5:23:37
 * @ModifyDate  : 2019. 12. 5. 오후 5:23:37
 * @fileName    : biddingList
 * @Description : 마이페이지-경매진행상품 관리
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	margin: 0 auto;
	padding-bottom: 10px;
}

.contents{
	height:650px;
	width:inherit;
	margin-top: 30px;
}

#myPageMenu {
	width: 200px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
	margin-right:10px;
	margin-top: 10px;
}

#myPageMenu>dl>dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
}

#myPageMenu>dl>dd {
	font-size: 15px;
	margin-left: 20px;
	margin-top: 7px;
	margin-bottom: 7px;
}

#h3 {
	font-family: 'Nanum Myeongjo', serif;
	background-color: #211f22;
	padding-top: 7px;
	padding-bottom: 7px;
	color: #a07342;
	margin-top: 0px;
}

#myPageMenu>dl>dd>a {
	color: darkgray;
	text-decoration: none;
	cursor: pointer;
}

#myPageMenu>dl>dd>#selectMenu {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

#myPageMenu>dl>dd>a:hover {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
	margin-bottom: 10px;
}

.menuStatus>.status2 {
	display: flex;
	width: 920px;
	height: 54px;
	background-color: lightgray;
	padding-left: 25px;
    padding-top: 18px;
}

.status2>p:nth-of-type(2) {
	padding-left: 10px;
    color: #f00;
    font-weight: bold;
}

.contentArea {
    text-align: center;
    position: absolute;
    width: 72%;
    margin-top: 75px;
    left: 28%;
}

/* 1920px 전용(작업용) */
@media(min-width: 1919px) {
	.contentArea {
		left: 32%;
		width: 59%;
	}
}

.contentArea>table {
	width: 81%;
}

.contentArea>table>tbody>tr>th, .contentArea>table>tbody>tr>td {
	width: auto;
	border-bottom: 1px solid #d9d9d9;
	padding: 5px;
	font-size: 15px;
	text-align: center;
}

td>a>img {
	width: 100px;
	height: 100px;
}

.contentArea>table>thead>tr>th  {
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}
</style>
<meta charset="UTF-8">
<title>LauXion</title>
</head>
<body onload="doAuction()">
<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<% if(loginMember != null) { %>
	<div class="container">
		<div class="contents">
			<div id="myPageMenu">
				<h3 id="h3" align="center">마이페이지</h3>
				<dl>
					<dt>§  구매정보</dt>
					<dd><a value="buy/wishList">▶   위시리스트</a></dd>
					<dd><a value="../../biddingList.bi">▶   입찰리스트</a></dd>
					<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
					
					<dt>§  판매정보</dt>
					<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
					<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
					<dd><a value="sale/auctionList" id="selectMenu">▶  경매 진행 상품 관리</a></dd>
					<dd><a value="../../closedMemberAuctionList.au">▶  경매 마감 상품 관리</a></dd>
					
					<dt>§  결제/배송조회</dt>
					<dd><a value="delivery/paymentList">▶  결제 내역</a></dd>
					<dd><a value="delivery/apprDeli">▶  감정 상품 배송 조회</a></dd>
					<dd><a value="delivery/sellDeli">▶  구매 상품 배송 조회</a></dd>
					
					<dt>§  문의 및 신고</dt>
					<dd><a value="../../qnaList.qr">▶  문의 내역</a></dd>
					<dd><a value="queAndReport/reportList">▶  신고 내역</a></dd>
					
					<dt>§  회원정보</dt>
					<dd><a value="memberChange/userInfoChange">▶  회원정보 변경</a></dd>
					<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
					
				</dl>
			</div>  <!-- myPageMenu end -->
			<div class="menuStatus">
				<div class="status1">
					<h3>&nbsp;&nbsp;<&nbsp;경매 진행 상품 관리 &nbsp;>&nbsp;</h3>
				</div>  <!-- status1 end -->
				<div class="status2">
					<p>회원님께서 등록하신 상품리스트 입니다.</p>
				</div>  <!-- status2 end -->
			</div>  <!-- menuStatus end -->
			<div class="contentArea">
				<table id="tableArea" border="1">
					<thead id="tableHeadArea">
						<tr>
							<th>경매번호</th>
							<th>상품사진</th>
							<th>브랜드/모델명</th>
							<th>현재 입찰가</th>
							<th>입찰인원</th>
							<th>남은 시간</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="tableBodyArea"></tbody>
				</table>
			</div> <!-- menuStatus End -->
		</div> <!-- contents End -->
	</div> <!-- container End -->
	<% } else {
		request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		request.getRequestDispatcher("../../common/errorPage.jsp").forward(request, response);
	   } %>
<%@ include file="../../common/footer.jsp" %>

<script>
	var tempTime = 0;
	var timeArray = new Array();
	$(function() {
		$('a').click(function() {
			let values=$(this).attr('value');
			console.log(values);
			location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
		})
	});
	
	function getSecTime(time) {
		tempTime = time;
	}
	
	function doAuction() {
		$.ajax({
			url: "<%= request.getContextPath() %>/selectDoAuction.au",
			type: "post",
			data: {
				memberNo: <%= loginMember.getMemberNo() %>
			},
			success: function(data) {
				console.log(data);
				var arr = data.split("#");
				for(i in arr) {
					temp = "";
					var arr2 = arr[i].split("::");			//  0: 경매번호, 1: 사진, 2: 브랜드/모델명, 3: 현재입찰가, 4: 입찰인원, 5: 남은 시간, 6: 상세보기
					for(j in arr2) {
						if(j == 1){
							if(arr2[j] != "null"){
								temp += "<td><a class='resLink'><img src='<%= request.getContextPath() %>/img/appraisal/" + arr2[j] + "'></a></td>";
							}else {
								temp += "<td><a class='resLink'><img src='<%= request.getContextPath() %>/img/appraisal/noImage.png'></a></td>";
							}
						}else if(j == 3){
							
						} else if(j == 6) {
							tempTime = arr2[j];
							temp += "<td class='time'><input type='hidden' value='" + arr2[j] + "'><label>" + changeTime(arr2[j]) + "</label></td>";
						} else {
							temp += "<td><a class='resLink'>" + arr2[j] + "</a></td>"
						}
					}
					temp += "<td><button>상세보기</button></td>";
					$("#tableArea > #tableBodyArea:last").append("<tr>" + temp + "</tr>");
				}
				getWebsocket();
			},
			error: function(data) {
				console.log("ajax실패");
			}
		});
	}//---doAuction() endPoint---
	
	function changeTime(time) {
		var second = time;
		
		var day = leadingZeros(Math.floor(second / (60 * 60 * 24)), 2);
		var hour = leadingZeros(Math.floor((second - day * 60 * 60 * 24) / (60 * 60)), 2);
		var min = leadingZeros(Math.floor((second - day * 60 * 60 * 24 - hour * 3600) / 60), 2);
		var sec = leadingZeros(second % 60, 2);
		
		
		
		return day + "일" + hour + "시간" + min + "분" + sec + "초";
	}//---changeTime() endPoint---
	
	function leadingZeros(date, num) {
		 var zero = '';
		 date = date.toString();
		
		 if (date.length < num) {
		  for (i = 0; i < num - date.length; i++)
		   zero += '0';
		 }
		 return zero + date;
	}
	
	function getWebsocket() {
		console.log("웹소켓 실행합니다");
		var length = $("table>tbody>tr").length;
		//보조메소드 = 자체제작메소드
		var url = "ws://localhost:8010/lp/endTime/<%= loginMember.getMemberId() %>";
		//new를 통해 웹소켓을 불러온다.
		ws = new WebSocket(url);
		
		//웹소켓 연결될 때 실행되는 메소드
		ws.onopen = function(event) {
			onOpen(event);
		};
		
		//웹소켓으로부터 메세지를 받을 때 실행되는 메소드
		ws.onmessage = function(event) {
			onMessage(event);
		};
		
		//서버에서 에러가 발생할 경우 동작할 메소드
		ws.onerror = function(event) {
			
		};

		//서버와의 연결이 종료될 경우 동작하는 메소드
		ws.onclose = function(event) {
			
		};
		
		//웹소켓 보조 메소드 - 웹소켓 연결 되었을 때 동작할 메소드
		function onOpen(event) {
			for(var i = 0; i < length; i++) {
				timeArray[i] = $("table>tbody>tr").eq(i).children().eq(5).children().eq(0).val();
				console.log(timeArray[i]);
			}
				send(timeArray);
		};
		
		//웹소켓 보조 메소드 - 메세지 받을 때 동작할 메소드
		function onMessage(event) {
			/* send(event.data);
			$("table>tbody>tr>td").eq(5).text(changeTime(event.data));
			console.log(changeTime(event.data)); */
			console.log(event.data);
			var rarr = event.data.split(",");
			for(var i = 0; i < length; i++) {
				if(rarr[i] == 0) {
					console.log
				} else {
					console.log(rarr[i]);
					console.log($("table>tbody>tr").eq(i).children().eq(5).children().text());
					$("table>tbody>tr").eq(i).children().eq(5).children().text(changeTime(rarr[i]));
				}
			}
			send(event.data);
		};
		
		//웹소켓 보조 메소드 - 웹소켓에 메세지 보내는 메소드
		function send(msg) {
			ws.send(msg);
		};
		
		//웹소켓 보조 메소드 - 웹소켓 에러 관련 메소드
		function onError(event) {
			alert(event.data);
		};
		
		//웹소켓 보조 메소드 - 웹소켓 닫혔을 때 관련 메소드
		function onClose(event) {
			alert(event);
		};
	}//---getWebsocket() endPoint---
</script>
</body>
</html>