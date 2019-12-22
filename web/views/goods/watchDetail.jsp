<%@page import="com.kh.lp.appraisal.model.vo.Watch"%>
<%@page import="com.kh.lp.bidding.model.vo.Bid"%>
<%@page import="com.kh.lp.auction.model.vo.Auction"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<style>
	.container {
		width: 1080px;
		margin: 0 auto;
		padding: 6px 0px 0;
	}
	.contents{
		height:650px;
		width:inherit;
	}
	
	#part1 {
		display: flex;
		padding-top: 10%;
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
		text-decoration: none;
		cursor: pointer;
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
	
	.contents {
		width: 100%;
		display: inline;
		margin-left: 75px;
	}
	
	.contents>#head {
		border-bottom: 1px solid #3e2d1a;
	}
	
	.contents>#head>label {
		font-family: 'Nanum Myeongjo', serif;
		font-size: 20px;
		margin: 0;
	}
	
	.contents>#head>label:nth-of-type(2) {
		margin-left: 54%;
	}
	
	#timeArea > label:nth-of-type(2) {
		font-weight: 100;
		font-size: 2.5em;
		color: #555;
	/* 최고입찰가와 입찰가 입력 컨테이너를 묶음 */
	#set {
		display: flex;
	}
	
	#price {
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
    	color: #555;
	}
	
	#biddingUsers {
    	position: relative;
   		margin-top: 59px;
	}
	
	#biddingUsers>table>thead>tr>th {
		background: #f2f2f2;
	}
	
	#biddingUsers>table>thead>tr>th:nth-of-type(1) {
		width: 150px;
	}
	
	#biddingUsers>table>thead>tr>th:nth-of-type(2) {
		width: 200px;
	}
	
	#biddingUsers>table>thead>tr>th:nth-of-type(3) {
		width: 100px;
	}
	
	#biddingUsers>table>thead>tr>th, #biddingUsers>table>tbody>tr>td {
		border: 1px solid #d9d9d9;
		padding: 5px;
		font-size: 15px;
		text-align: center;
	}
	
	#biddingApply {
		margin-top: 50px;
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
	#endTime {
		font-size: 30px;
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
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<%
		ArrayList<Bid> watchDetailInfo = (ArrayList<Bid>)request.getAttribute("list");
		String img = (String) request.getAttribute("img");
		int auctionId = (Integer) request.getAttribute("auctionId");
		Watch w = (Watch) request.getAttribute("watch");
		Auction ac = (Auction) request.getAttribute("auction");		//시간만 가져오는 옥션
		String msg = (String) request.getAttribute("msg");
	%>
		<div class="container">
		<div class="contents">
			<!-- 사진, 상품명, 입찰가, 등록칸 -->
			<span id="part1">
				<span class="imgBox">
					<div class="title">
					<% if(loginMember != null) { %>
						<a id="wish"></a>
					<% } %>
						<img id="title" src="<%= request.getContextPath() %>/img/appraisal/<%= img %>" alt="" >
					</div>
					<div id="detailImg">
						<table>
						<!-- 사진 갯수에 따라서 조율가능 -->
							<tr>
							<% for(int i=1; i<watchDetailInfo.size(); i++) { %>
								<td>
									<img src="<%= request.getContextPath() %>/img/appraisal/<%= watchDetailInfo.get(i).getBidAttachment() %>" alt="" >
								</td>
							<% } %>
							</tr>
						</table>
					</div> <!-- detailImg End -->
				</span> <!-- imgBox End -->
				<span class="contents">
					<div id="head">
						<label><%= watchDetailInfo.get(0).getBidBrand() +" "+ watchDetailInfo.get(0).getBidModel() %></label>
						<label>판매자 : <%= watchDetailInfo.get(0).getBidUserId() %></label>
					</div>
					<div id="timeArea">
							<input type="hidden" id="endHiddenTime" name="endHiddenTime" value=""/>
							<label for="" id="endTime" name="endTime"></label>
					</div>  <!-- timeArea end -->
					<div id=set>
						
						<div id="price">
							<label id="nowPriceLabel">현재 가격</label>
							<label id="maxPrice"></label>
							<% if(loginMember == null) { %>
								<p>입찰을 하기 위해선 로그인을 해야합니다.</p>
							<% } %>
							</div>
							<% if(loginMember != null && !loginMember.getMemberId().equals(watchDetailInfo.get(0).getBidUserId())) { %>
							<div id="biddingApply">
								<label id="unit"></label><br>
								<input type="text" name="bidding" id="minPrice" size="25" placeholder="">
								<button id="insertBid" onclick="watchBiddingSend()" disabled>입찰</button>
							<label>※경매 수수료 : 낙찰가의 15%</label>
						</div>
						<% } %>
					</div>
					<div id="biddingUsers">
					<label>입찰 이력</label>
							<table id="tableBiddingArea">
								<thead id="tableBiddingHeadArea">
									<tr>
										<th>입찰자</th>
										<th>입찰 금액</th>
										<th>입찰 시간</th>
									</tr>
								</thead>
							</table>  <!-- tableBiddingArea end -->
						</div>
				</span> <!-- contents End -->
			</span> <!-- part1 End -->

			<!-- 상품 상세정보(from 관리자), 상품정보 테이블형태 -->
			<div id="part2">
				<div id="detailContent">
				<label>경매 정보</label>
					<table>
					<% if(watchDetailInfo.size() > 0) { %>
						<tr>
							<td>상품번호</td>
							<td><%= auctionId %></td>
						</tr>
						<tr>
							<td>브랜드명</td>
							<td><%= watchDetailInfo.get(0).getBidBrand() %></td>
						</tr>
						<tr>
							<td>모델명</td>
							<td><%= watchDetailInfo.get(0).getBidModel() %></td>
						</tr>
						<tr>
							<td>판매자 아이디</td>
							<td><%= watchDetailInfo.get(0).getBidUserId() %></td>
						</tr>
						<% } %>
					</table>
				</div>
				
				<div id="goods">
					<label>상품 정보</label>
					<table>
						<tr>
							<td>보증서 유무</td>
							<td><%= w.getWatchGuaranteeYn() %></td>
						</tr>
						<tr>
							<td>오리지널 박스 유무</td>
							<td><%= w.getWatchBoxYn() %></td>
						</tr>
						<tr>
							<td>재질</td>
							<td><%= w.getWatchMaterial() %></td>
						</tr>
						<tr>
							<td>무브먼트 종류</td>
							<td><%= w.getWatchMovement() %></td>
						</tr>
						<tr>
							<td>크로노그래프</td>
							<td><%= w.getWatchChronograph() %></td>
						</tr>
					</table>
				</div>
			</div> <!-- part2 End -->
			</div>
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
			
			// 위시등록여부
			$.ajax({
				url: "<%= request.getContextPath() %>/wishstatus.se",
				type: "post",
				data: {
					memberNo: <%= loginMember.getMemberNo() %>,
					auctionId: <%= auctionId %>,
				},
				success: function(data) {
					console.log(data);
					if(data === 'null' || data === 'N')
						$('#wish').text('♡');
					else 
						$('#wish').text('♥');
				}
			})
			
			var tempTime = Number("<%= ac.getAuctionPeriod() %>");
			$("#endTime").text(changeTime(tempTime));
			$("#endHiddenTime").val(tempTime);
			
			// 위시리스트 추가
			$('#wish').click(function() {
				$.ajax({
					url: "<%= request.getContextPath() %>/wish.in",
					type: "post",
					data: {
						memberNo: <%= loginMember.getMemberNo() %>,
						auctionId: <%= auctionId %>,
					},
					success: function(data) {
						if(data === 'successWishY') {
							alert('위시리스트에 추가했습니다.');
							$('#wish').text('♥');
						} else if(data === 'successWishN') {
							alert('위시리스트에서 제거되었습니다.');
							$('#wish').text('♡');
						}
						
						else {
							alert('위시리스트에 추가되지않았습니다.');
							$('#wish').text('♡');
						}
					},
					error: function(data) {
						alert('에러발생');
					}
				});
			});
			
			watchGetWebSocket();
			endTimeWatchDetailGetWebSocket();
			updateBiddingInfo();
			
		});
		
			function updateBiddingInfo() {
				// 입찰이력불러오기 관련 ajax
				$.ajax({
					url: "<%= request.getContextPath() %>/selectBidUser.se",
					type: "post",
					data: {
						auctionId: <%= auctionId %>,
					},
					success: function(data) {
						const arr = data.split("#");
						console.log(data);
						
						let temp="<tbody>";
						for(i in arr) {
							var arr2 = arr[i].split("::");
							temp += "<tr>";
							
							for(j in arr2){
								if(j == 0)
									temp += "<td>" + arr2[j] + "</td>";
								else if(j == 1) 
									temp += "<td>" + arr2[j] + "</td>";
								else if(j == 2)
									temp += "<td>" + arr2[j] + "</td>";
								else if(j == 3)
									temp += "<td>" + arr2[j] + "</td>";	
							}
							
							temp += "</tr>";
						}

						temp+="</tbody>";
						$("#tableBiddingArea>tbody").empty();
						$("#tableBiddingArea").append(temp);
						
						// 입찰리스트에서 최댓값 추출
						let maxPrice = $("#biddingUsers > table > tbody > tr:nth-of-type(1)").children().eq(1).text();
						$('#maxPrice').text(numberFormat(maxPrice)+'원');
						
						// 최댓값기준 입찰단위
						let unit = maxPrice*0.05;
						$('#unit').text('입찰 단위 : ' + numberFormat(unit)+'원');
						
						// 최소입찰금액
						let minPrice = maxPrice*1.05;
						$('#minPrice').attr('placeholder', numberFormat(minPrice)+'원 이상 입력하세요.');
						
						console.log($("#tableBiddingArea > tbody").children().eq(0).children().eq(0).text());
						if($("#tableBiddingArea > tbody").children().eq(0).children().eq(3).text() == <%= loginMember.getMemberNo() %>) {
							$("#insertBid").hide();
							$("#minPrice").val("최고가 입찰자 입니다.").css({"text-align":"center"});
						} else {
							$("#insertBid").show();
							$('#minPrice').attr('placeholder', numberFormat(minPrice)+'원 이상 입력하세요.');
						}
					},
					error: function(data) {
						console.log('실패');
					}
				});
			}
		
		
			function numberFormat(inputNumber) {
				return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			};
			
			
			function watchGetWebSocket() {	//입찰웹소켓
				url = "ws://172.31.12.9:8010/<%= request.getContextPath() %>/bidding/<%= loginMember.getMemberId() %>";
				watchBiddingWebSocket = new WebSocket(url);
				
				watchBiddingWebSocket.onopen = function(event) {
					watchBiddingOnOpen(event);
				};
				
				watchBiddingWebSocket.onmessage = function(event) {
					watchBiddingOnMessage(event);
				};
				
				watchBiddingWebSocket.onclose = function(event) {
					watchBiddingOnClose(event);
				};
				
				watchBiddingWebSocket.onerror = function(event) {
					watchBiddingOnError(event);
				};
			};
			
			
			function watchBiddingOnOpen(event) {
				console.log("웹소켓 접속 완료");
				$("#insertBid").attr("disabled", false);
			};
			
			function watchBiddingOnMessage(event) {
				updateBiddingInfo();
			};
			
			function watchBiddingOnClose(event) {
				$("#insertBid").attr("disabled", true);
			};
			
			function watchBiddingOnError(event) {
				alert(event.data);
				$("#insertBid").attr("disabled", true);
			};
			
			function watchBiddingSend(msg) {
				var memberNo = "<%= loginMember.getMemberNo() %>";
				var auctionId = "<%= auctionId %>";
				var biddingPrice = $("#minPrice").val();
				
				if(Number(biddingPrice) < Number($("#maxPrice").val()) * 1.05){
					alert("최소입력금액보다 낮습니다.")
				} else {
					var sendMsg = memberNo + "::" + auctionId + "::" + biddingPrice;
					$("#minPrice").val("");
					$.ajax({
						url: "<%= request.getContextPath() %>/biddingCount.bid",
						type: "post",
						data: {
							auctionId: <%= auctionId %>,
							memberNo: <%= loginMember.getMemberNo() %>
						},
						success: function(data) {
							var result = Number(data);
							if(data < 3) {
								watchBiddingWebSocket.send(sendMsg);
								alert("성공적으로 입찰했습니다.");
							} else {
								alert("한 경매에 3번 넘게 입찰 할 수 없습니다.");
							}
						},
						error: function(data) {
							alert("입찰에 실패했습니다. 새로고침 후 다시 시도해주세요");
						}
					});
				}
			};
			
			function endTimeWatchDetailGetWebSocket() {
				url = "ws://172.31.12.9:8010/<%= request.getContextPath() %>/endTime/<%= loginMember.getMemberId() %>";
				watchTimeWebSocket = new WebSocket(url);
				
				watchTimeWebSocket.onopen = function(event) {
					watchTimeOnOpen(event);
				};
				
				watchTimeWebSocket.onmessage = function(event) {
					watchTimeOnMessage(event);
				};
				
				watchTimeWebSocket.onclose = function(evnet) {
					watchTimeOnClose(event);
				};
				
				watchTimeWebSocket.onerror = function(event) {
					watchTimeOnError(event);
				};
			};
			
			function watchTimeOnOpen(event) {
				console.log("watchTimeWebSocket 실행");
				console.log($("#endHiddenTime").val());
				if($("#endHiddenTime").val() <= 0) {
					endAuction();
				} else {
					watchTimeSend($("#endHiddenTime").val());
				}
			};
			
			
			
			function watchTimeOnMessage(event) {
				console.log(event.data);
				var temp = Number(event.data);
				if(temp <= 0) {
					// 경매 완료 처리
					$("emdTime").text(changeTime(0));
					$.ajax({
						url: "<%= request.getContextPath() %>/biddingCount.bid",
						type: "post",
						data: {
							auctionId: <%= auctionId %>,
							memberNo: <%= loginMember.getMemberNo() %>
						},
						success: function(data) {
							$.ajax({
								url: "<%= request.getContextPath() %>/endAuction.au",
								type: "post",
								data2 : {
									auctionId: <%= auctionId %>,
									biddingCount: data
								},
								success: function(data2){
									endAuction();
								},
								error: function(data2){
									console.log("ajax에러");
								}
							});
						},
						error: function(data) {
							console.log("ajax에러");
						}
					});
				} else {
					$("#endTime").text(changeTime(temp));
					watchTimeSend(temp);
				}
			};
			
			function watchTimeOnClose(event) {
				
			};
			
			function watchTimeOnError(event) {
				
			};
			
			function watchTimeSend(msg) {
				watchTimeWebSocket.send(msg);
			};
			
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
			};
			
			function endAuction() {
				$("#endTime").text("경매종료").css({"color":"red"});
				$("#nowPriceLabel").text("낙찰가");
				$("#biddingApply").css({"display":"none"});
			};
	</script>
</body>
</html>