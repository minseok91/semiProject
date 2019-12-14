<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 6. 오후 2:29:54
 * @ModifyDate  : 2019. 12. 6. 오후 2:29:54
 * @fileName    : winningBid
 * @Description : 마이페이지의 낙찰리스트
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
	margin-bottom: 10px;
}

.menuStatus>.status2 {
	display: flex;
	width: 920px;
	height: 90px;
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
    width: auto;
    margin-top: 75px;
    left: 28%;
}

/* 나때문에 하는거니 무시해도됨 */
@media(max-width: 1366px) {
	.contentArea {
		left: 24%;
	}
}

.contentArea>table>tbody>tr>th, .contentArea>table>tbody>tr>td {
	width: auto;
	border-bottom: 1px solid #d9d9d9;
	padding: 15px;
	font-size: 15px;
	text-align: center;
}

.contentArea>table>tbody>tr>td>img {
	width: 100px;
	height: 100px;
}

.contentArea>table>tbody>tr>th  {
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}
</style>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>LauXion</title>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container">
	<div class="contents">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a value="buy/wishList">▶   위시리스트</a></dd>
				<dd><a value="buy/biddingList">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid" id="selectMenu">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
				<dd><a value="sale/auctionList">▶  경매 진행 상품 관리</a></dd>
				<dd><a value="sale/auctionDeadline">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a value="delivery/paymentList">▶  결제 내역</a></dd>
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
				<h3>&nbsp;&nbsp;<&nbsp;낙찰리스트 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>
					회원님께서 입찰하신 상품들 중 낙찰 및 차순위입찰된 상품 리스트를 볼 수 있는 공간입니다.<br>
					낙찰자의 결제 기한은 경매 완료 시점부터 48시간이며, 차순위입찰자의 결제 기한은 낙찰자의 결제 기한이 마감된 시점부터 48시간입니다.<br>
					낙찰자가 주어진 기한 내에 결제를 완료하지 않으면 자동으로 차순위입찰자에게 거래 기회가 주어집니다.
				</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
			<table>
				<tr>
					<th>경매번호</th>
					<th>상품사진</th>
					<th>브랜드/모델명</th>
					<th>낙찰가</th>
					<th>낙찰여부</th>
					<th>결제 하기 남은 시간</th>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="<%= request.getContextPath() %>/img/bag1.jpg"></td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td id="price">1,600,000</td>
					<td id="check">낙찰 실패</td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td><img src="<%= request.getContextPath() %>/img/bag1.jpg"></td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td id="price">1,600,000</td>
					<td id="check">
						<div>낙찰 성공</div>
						<button>결제하기</button>
					</td>
					<td>23시간 35분 전</td>
				</tr>
				<tr>
					<td>3</td>
					<td><img src="<%= request.getContextPath() %>/img/bag1.jpg"></td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td id="price">1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>대기중</td>
				</tr>
			</table>
		</div> <!-- menuStatus End -->
		</div> <!-- contents End -->
	</div> <!-- container End -->
	<%@ include file="../../common/footer.jsp" %>

	<script>
		$(function() {
			$('a').click(function() {
				let values=$(this).attr('value');
				console.log(values);
				location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			});
		});
		
		
		
		$('#check>button').click(function() {
			const num=$(this).parents('tr').children().eq(0).text();
			
			location.href="<%= request.getContextPath() %>/views/goods/paymentBefore.jsp";
			// 형식 : location.href = "<%= request.getContextPath() %>/selectOne.tn?num=" + num;
		})
		
	</script>
</body>
</html>