<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 6. 오후 7:44:42
 * @ModifyDate  : 2019. 12. 6. 오후 7:44:42
 * @fileName    : biddingEnroll
 * @Description : 진품일 경우 경매를 등록하는데 그때 정보를 입력하는 페이지
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

.container>.contents>#myPageMenu {
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

.container>.contents>.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
	margin-bottom: 10px;
}

.menuStatus>.status2 {
	width: 920px;
	height: 54px;
	background-color: lightgray;
	padding-left: 25px;
    padding-top: 3px;
}

.status2>p:nth-of-type(2) {
    color: #f00;
    font-weight: bold;
}

.contentArea {
    text-align: center;
    position: absolute;
    width: auto;
    margin-top: 75px;
    left: 24%;
}

.title>img {
		border: 1px solid #d9d9d9;
		width: 330px;
		height: 330px;
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
	
#content {
	margin-left: 6%;
}

#content>h2 {
	border-left: 5px solid #3e2d1a;
	padding-left: 13px;
}

#content>h3 {
	margin: 0 0 65px 0;	
}

#content>.price {
	display: flex;
	font-size: 20px;
}

#content>.price>p {
	margin-left: 7px;
}

input[type=date] {
	font-size: 20px;
    padding: 0;
    line-height: 1;
}

#content>button {
	margin-top: 16%;
    padding: 3% 19%;
    font-size: 23px;
    font-weight: bold;
}
</style>
<meta charset="UTF-8">
<title>LauXion</title>
</head>
<body>
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
				<dd><a value="buy/biddingList">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList" id="selectMenu">▶  등록상품 관리</a></dd>
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
					<h3>&nbsp;&nbsp;<&nbsp;등록상품 경매 등록 &nbsp;>&nbsp;</h3>
				</div><!-- status1 end -->
				<div class="status2">
					<p>진품 보증 및 상품 감정이 완료된 상품의 경매진행하기 전 경매에 대한 설정을 입력하는 공간입니다.</p>
					<p>경매를 등록할 시 취소가 불가능하며 내용의 변경 또한 불가능합니다.</p>
				</div><!-- status2 end -->
			</div><!-- menuStatus end -->
			<div class="contentArea">
			<!-- 사진, 상품명, 입찰가, 등록칸 -->
				<span class="imgBox">
					<div class="title">
						<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
					</div>
					<div id="detailImg">
						<table>
						<!-- 사진 갯수에 따라서 조율가능 -->
							<tr>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
							</tr>
							<tr>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								</td>
							</tr>
						</table>
					</div> <!-- detailImg End -->
				</span> <!-- imgBox End -->
				<div id="content">
					<h2>구찌 GG마몽 미니 토트겸 숄더백</h2>
					<h3>(442622)</h3>
					<div class="price">경매 시작가 : <p>￦1,000,000</p></div>
					<div class="price">상승가 : <p>￦50,000</p></div>
					<input type="date" id="startDate" name="startDate" min="" max=""> <!-- 현재날짜를 기준으로 최소 이틀, 최대 일주일로 설정 -->
					<br><button>경매올리기</button>
				</div>
				</div> <!-- contentArea End -->
		</div> <!-- contents End -->
	</div> <!-- container End -->
	<% } else {
		request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		request.getRequestDispatcher("../../common/errorPage.jsp").forward(request, response);
	   } %>
	<%@ include file="../../common/footer.jsp" %>

	<script>
		$(function() {
			$('a').click(function() {
				let values=$(this).attr('value');
				console.log(values);
				location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			})
		});
	</script>
</body>
</html>