<%--
/**
 * <pre>
 * @Author      : 양승현
 * @CreateDate  : 2019. 12. 5. 오후 2:03:53
 * @ModifyDate  : 2019. 12. 5. 오후 2:03:53
 * @fileName    : dagDetail
 * @Description : 가방상품의 상세정보페이지
 * </pre>
 */
--%>

<%@page import="com.kh.lp.appraisal.model.vo.Bag"%>
<%@page import="com.kh.lp.bidding.model.vo.Bid"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.container {
		width: 1080px;
		margin: auto;
	}
	
	.contents{
		width:inherit;
	}
	
	.imgBox {
		margin-top: 50px;
	}
	
	#part1 {
		display: flex;
		margin-bottom: 50px;
		height: 612px;
	}

	.title>img {
		border: 1px solid #d9d9d9;
		width: 330px;
		height: 330px;
		margin-left: 10px;
	}
	
	#wish {
		position: absolute;
		font-size: 3rem;
		border: none;
		color: #c20808;
		padding: 0;
		font-weight: lighter;
		transform: translateX(0%);
		margin-left: 10px;
	}
	
	#biddingList {
		position: absolute;
		font-family: 'Nanum Myeongjo', serif;
		color: #cca071;
		background: #211f24;
		border: 1px solid #a07342;
		margin-left: 270px;
		padding: 3px 7px;
		border-radius: 2px;
	}
	
	#detailImg>table {
		margin-top: 20px;
		border-collapse: separate;
		border-spacing: 10px;
	}
	
	#detailImg>table>tbody>tr>td>img {
		border: 1px solid #d9d9d9;
		width: 75px;
    	height: 75px;
	}
	
	#contents {
		width: 100%;
		display: inline;
		margin-left: 75px;
	}
	
	#contents>#head {
		margin-top: 50px;
		width: 660px;
		border-bottom: 1px solid #3e2d1a;
	}
	
	#contents>#head>label {
		font-family: 'Nanum Myeongjo', serif;
		font-size: 20px;
		margin: 0;
	}
	
	/* 최고입찰가와 입찰가 입력 컨테이너를 묶음 */
	#set {
		display: flex;
	}
	
	#price {
		margin-top: 50px;
	    display: grid;
	    width: 326px;
	}
	
	#price>label:nth-of-type(1) {
		font-size: 20px;
		color: #3e2d1a;
		border-left: 5px solid #3e2d1a;
		margin-top: 50px;
		padding-left: 10px;
	}
	
	#price>label:nth-of-type(2) {
		font-size: 3.5rem;
    	font-weight: 100;
	}
	
	#biddingUsers {
    	position: relative;
   		margin-top: 59px;
	}
	
	#biddingUsers>table>tbody>tr>th {
		background: #f2f2f2;
	}
	
	#biddingUsers>table>tbody>tr>th:nth-of-type(1) {
		width: 150px;
	}
	
	#biddingUsers>table>tbody>tr>th:nth-of-type(2) {
		width: 200px;
	}
	
	#biddingUsers>table>tbody>tr>th:nth-of-type(3) {
		width: 100px;
	}
	
	#biddingUsers>table>tbody>tr>th, #biddingUsers>table>tbody>tr>td {
		border: 1px solid #d9d9d9;
		padding: 5px;
		font-size: 15px;
		text-align: center;
	}
	
		#biddingApply {
		margin-top: 100px;
		margin-left: 85px;
	}
	
	#biddingApply>label {
		font-size: 20px;
		color: #3e2d1a;
		border-left: 5px solid #3e2d1a;
		padding-left: 10px;
	}
	
	#biddingApply>input[type="text"] {
		font-size: 2rem;
    	font-weight: 100;
		border: none;
		box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
		padding: 3px;
		padding-right: 7px;
		margin: 7px;
		text-align: right;
	}
	
	#biddingApply>button {
		font-size: 2rem;
		color: #cca071;
		background: #211f24;
		border: 1px solid #a07342;
		padding: 3px;
		width: 75px;
		border-radius: 3px;
	}
	
	#biddingApply>label:nth-of-type(2) {
		border: none;
		font-size: 1.7rem;
		margin-left: 7px;
		color: #ff0000;
	}
	
	#part2 {
		display: flex;
		margin: 50px 0;
		margin-left: -94px;
		padding-bottom: 50px;
		justify-content: center;
		border-bottom: 1px solid #3e2d1a;
	}
	
	#part2 label {
		font-size: 20px;
    	color: #3e2d1a;
    	border-left: 5px solid #3e2d1a;
    	padding-left: 10px;
    	margin-bottom: 10px;
	}
	
	#detailContent {
		position: relative;
		right: 16%;
	}
	
	#goods {
		margin-left: 90px;
	}

	#detailContent>table>tbody>tr>td, #goods>table>tbody>tr>td {
		border: 1px solid #d9d9d9;
		padding: 10px;
	}
	
	#detailContent>table>tbody>tr>td:nth-of-type(1), #goods>table>tbody>tr>td:nth-of-type(1) {
		background: #f2f2f2;
	}
</style>
</head>
<body onload="getWebsocket2()">
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<%
		ArrayList<Bid> bagDetailInfo = (ArrayList<Bid>)request.getAttribute("list");
		ArrayList<Bid> bagBiddingUser = (ArrayList<Bid>)request.getAttribute("bidList");
		String img = (String) request.getAttribute("img");
		int num = (Integer) request.getAttribute("num");
		Bag bag = (Bag) request.getAttribute("bag");
	%>
		<div class="container">
			<div class="contents">
				<!-- 사진, 상품명, 입찰가, 등록칸 -->
				<span id="part1">
					<span class="imgBox">
						<div class="title">
							<a id="wish">♡</a>
							<img id="title" src="<%= request.getContextPath() %>/img/appraisal/<%= img %>" alt="" >
						</div>
						<div id="detailImg">
							<table>
							<!-- 사진 갯수에 따라서 조율가능 -->
								<tr>
									<% for(Bid b : bagDetailInfo) { %>
									<td>
										<img src="<%= request.getContextPath() %>/img/appraisal/<%= b.getBidAttachment() %>" alt="" >
									</td>
									<% } %>
								</tr>
							</table>
						</div> <!-- detailImg End -->
					</span> <!-- imgBox End -->
					<span id="contents">
						<div id="head">
							<label><%= bagDetailInfo.get(0).getBidBrand() +" "+ bagDetailInfo.get(0).getBidModel() %></label>
							<label style="float: right;">판매자 : <%= bagDetailInfo.get(0).getBidUserId() %></label>
							<label id="endTime"></label>
						</div>
						<div id=set>
							<div id="price">
								<label>현재 가격</label>
							<label id="maxPrice"></label>
							<% if(loginMember == null) { %>
								<p>입찰을 하기 위해선 로그인을 해야합니다.</p>
							<% } %>
							</div>
							<% if(loginMember != null) { %>
							<div id="biddingApply">
								<label id="unit"></label><br>
								<input type="text" name="bidding" id="minPrice" size="25" placeholder="">
								<button id="insertBid" disabled>입찰</button>
							<label>※경매 수수료 : 낙찰가의 15%</label>
						</div>
						<% } %>
						</div>
						<div id="biddingUsers">
						<label>입찰 이력</label>
								<table>
								</table>
						</div>
					</span> <!-- contents End -->
				</span> <!-- part1 End -->
	
				<!-- 상품 상세정보(from 관리자), 상품정보 테이블형태 -->
				<div id="part2">
					<div id="detailContent">
					<label>경매 정보</label>
					<table>
						<tr>
							<td>상품번호</td>
							<td><%=num%></td>
						</tr>
						<tr>
							<td>브랜드명</td>
							<td><%=bagDetailInfo.get(0).getBidBrand()%></td>
						</tr>
						<tr>
							<td>모델명</td>
							<td><%=bagDetailInfo.get(0).getBidModel()%></td>
						</tr>
						<tr>
							<td>판매자 아이디</td>
							<td><%=bagDetailInfo.get(0).getBidUserId()%></td>
						</tr>
					</table>
				</div>
					
					<div id="goods">
						<label>상품 정보</label>
						<table>
							<tr>
								<td>사이즈</td>
								<td><%= bag.getBagSize() %></td>
							</tr>
							<tr>
								<td>끈높이</td>
								<td><%= bag.getBagStrap() %></td>
							</tr>
							<tr>
								<td>북렛</td>
								<td><%= bag.getGender() %></td>
							</tr>
						</table>
					</div>
				</div> <!-- part2 End -->
			</div> <!-- contents End -->
		</div> <!-- container End -->
	<%@ include file="../common/footer.jsp" %>
	
	<script type="text/javascript">
		$(function() {
			const title = $('#title').attr('src');
			$('#detailImg img').mouseover(function() {
				$('#title').attr('src', $(this).attr('src'));
			}).mouseout(function() {
				$('#title').attr('src', title);
			});
			
			let temp="<thead><tr><th>입찰자</th><th>입찰 금액</th><th>입찰 시간</th></tr></thead><tbody>";
			
			<% for(Bid b : bagBiddingUser) { %>
				temp+="<tr><td><%= b.getBidUserId() %></td><td>"+numberFormat(<%= b.getBidPrice() %>)+"</td><td hidden><%= b.getBidPrice() %></td><td><%= b.getBidAuctionStartTime() %></td></tr>"
			<% } %>
				temp+="</tbody>";
				$("#biddingUsers > table").append(temp);
				
			// 입찰리스트에서 최댓값 추출
			let maxPrice = $("#biddingUsers > table > tbody > tr:nth-of-type(1)").children().eq(2).text();
			$('#maxPrice').text(numberFormat(maxPrice)+'원');
			
			// 최댓값기준 입찰단위
			let unit = maxPrice*0.05;
			$('#unit').text('입찰 단위 : ' + numberFormat(unit)+'원');
			
			// 최소입찰금액
			let minPrice = maxPrice*1.05;
			$('#minPrice').attr('placeholder', numberFormat(minPrice)+'원 이상 입력하세요.');
			
			// 위시리스트 추가
			$('#wish').click(function() {
				$.ajax({
					url: "<%= request.getContextPath() %>/wish.in",
					type: "post",
					data: {
						memberNo: <%= loginMember.getMemberNo() %>,
						auctionId: <%= num %>,
					},
					success: function(data) {
						if(data === 'success')
							alert('위시리스트에 추가했습니다.');
						else 
							alert('위시리스트에 추가되지않았습니다.');
					},
					error: function(data) {
						alert('에러발생');
					}
				});
			});
		});
		
		function getWebsocket() {	//시간흐르는거 보여주는 웹소켓
			var url = "ws://localhost:8010/endTime";
			var ws = new WebSocket(url);
			
			ws.onopen = function(event) {
				onOpen(event);
			};
			
			ws.onmessage = function(event) {
				onMessage(event);
			};
			
			ws.onclose = function(event) {
				onClose(event);
			};
			
			ws.onerror = function(event) {
				onError(event);
			};
			
			function onOpen(event) {
				
			};
			
			function onMessage(event) {
				
			};
			
			function onClose(event) {
				
			};
			
			function onError(event) {
				
			};
			
			function send(msg) {
				ws.send(msg);
			};
		};
		
		function getWebsocket2() {	//입찰웹소켓
			var url = "ws://localhost:8010/<%= request.getContextPath() %>/bidding";
			var ws = new WebSocket(url);
			
			ws.onopen = function(event) {
				onOpen(event);
			};
			
			ws.onmessage = function(event) {
				onMessage(event);
			};
			
			ws.onclose = function(event) {
				onClose(event);
			};
			
			ws.onerror = function(event) {
				onError(event);
			};
			
			function onOpen(event) {
				console.log("웹소켓 접속 완료");
				$("#insertBid").attr("disabled", false);
			};
			
			function onMessage(event) {
				
			};
			
			function onClose(event) {
				$("#insertBid").attr("disabled", true);
			};
			
			function onError(event) {
				alert(event.data);
				$("#insertBid").attr("disabled", true);
			};
			
			function send(msg) {
				ws.send(msg);
			};
		};
	</script>
</body>
</html>