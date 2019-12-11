<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 5. 오후 5:23:37
 * @ModifyDate  : 2019. 12. 5. 오후 5:23:37
 * @fileName    : biddingList
 * @Description : 마이페이지-결제내역
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

.container>#myPageMenu {
	width: 210px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
}

.container>#myPageMenu>dl>dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
}

.container>#myPageMenu>dl>dd {
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

.container>#myPageMenu>dl>dd>a {
	color: darkgray;
	text-decoration: none;
}

.container>#myPageMenu>dl>dd>#selectMenu {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>#myPageMenu>dl>dd>a:hover {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
}

.container>.menuStatus>.status2 {
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
	position: relative;
	width: auto;
	margin-top: 75px;
	left: 1%;
}

.contentArea>table>tbody>tr>th, .contentArea>table>tbody>tr>td {
	width: auto;
	border-bottom: 1px solid #d9d9d9;
	padding: 5px;
	font-size: 15px;
	text-align: center;
}

.contentArea>table>tbody>tr>td>img {
	width: 100px;
	height: 100px;
}

.contentArea>table>tbody>tr>th  {
	font-size: 12px;
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}

</style>
<meta charset="UTF-8">
<title>LauXion</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a value="buy/wishList">▶   위시리스트</a></dd>
				<dd><a value="buy/biddingList">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningList">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
				<dd><a value="sale/auctionList">▶  경매 진행 상품 관리</a></dd>
				<dd><a value="sale/auctionDeadline">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a id="selectMenu" value="delivery/paymentList">▶  결제 내역</a></dd>
				<dd><a value="delivery/apprDeli">▶  감정 상품 배송 조회</a></dd>
				<dd><a value="delivery/sellDeli">▶  구매 상품 배송 조회</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a value="queAndReport/questionList">▶  문의 내역</a></dd>
				<dd><a value="queAndReport/reportList">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a value="memberChange/userInfoChange">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;결제내역 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님께서 결제하신 상품 리스트를 볼 수 있는 공간입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
		
			<table>
				<tr>
					<th>경매번호</th>
					<th>상품사진</th>
					<th>상품명</th>
					<th>결제일시</th>
					<th>종류<br>(감정신청/상품구매)</th>
					<th>결제금액</th>
					<th>상태<br>(결제완료/환불진행중/환불완료)</th>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="<%= request.getContextPath() %>/img/bag1.jpg"></td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>2019/12/18</td>
					<td>상품구매	</td>
					<td>1,600,000</td>
					<td id="finish">
						결제완료<br>
						<button id="refund">환불하기</button>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td><img src="<%= request.getContextPath() %>/img/bag1.jpg"></td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td></td>
					<td></td>
					<td></td>
					<td>환불진행중</td>
				</tr>
				<tr>
					<td>3</td>
					<td><img src="<%= request.getContextPath() %>/img/bag1.jpg"></td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td></td>
					<td></td>
					<td></td>
					<td>환불완료</td>
				</tr>
			</table>
		</div> <!-- menuStatus End -->
	</div> <!-- container End -->
	<%@ include file="../../common/footer.jsp" %>
	<script>
		$(function(){
			$("#refund").click(function(){
				$(this).hide();
				$("#finish").html('환불진행중')
			})
		})
	</script>
</body>
</html>