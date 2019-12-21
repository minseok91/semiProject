<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 5. 오후 5:23:37
 * @ModifyDate  : 2019. 12. 5. 오후 5:23:37
 * @fileName    : biddingList
 * @Description : 마이페이지-입찰한 상품들을 보여주는 입찰리스트 페이지
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.lp.bidding.model.vo.*, java.util.*, com.kh.lp.common.*"%>
<%
	ArrayList<BiddingList> memberBiddingList = (ArrayList<BiddingList>)request.getAttribute("memberBiddingList");
%>
    
    
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

.container>.contents>.menuStatus {
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
    width: auto;
    height: 1000px;
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

.contentArea>table>thead>tr>th, .contentArea>table>tbody>tr>td {
	width: 152px;
	border-bottom: 1px solid #d9d9d9;
	padding: 15px;
	font-size: 15px;
	text-align: center;
}
.container>.contents>#contentArea>#tableArea> {
	width: 200px;
}
td>img {
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
<body>
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container">
	<div class="contents">
	<% if(loginMember != null) { %>
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a value="../../wishList.wi">▶   위시리스트</a></dd>
				<dd><a value="../../biddingList.bi" id="selectMenu">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
				<dd><a value="sale/auctionList">▶  경매 진행 상품 관리</a></dd>
				<dd><a value="../../closedMemberAuctionList.au">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a value="delivery/paymentList">▶  결제 내역</a></dd>
				<dd><a value="delivery/apprDeli">▶  감정 상품 배송 조회</a></dd>
				<dd><a value="delivery/sellDeli">▶  경매 상품 배송 조회</a></dd>
				
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
				<h3>&nbsp;&nbsp;<&nbsp;입찰리스트 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님께서 입찰하신 상품 리스트를 볼 수 있는 공간입니다.</p>
				<p>다섯 상품만 입찰이 가능합니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
				<table id="tableArea" border="1">
					<thead id="tableHeadArea">
						<tr>
							<th>상품번호</th>
							<th>상품사진</th>
							<th>브랜드/모델명</th>
							<th>최고 입찰가</th>
							<th>내 입찰가</th>
							<th>남은 시간</th>
							<th>비 고</th>
						</tr>
					</thead>


					<tbody id="tableBodyArea">
						<%
							for (BiddingList bl : memberBiddingList) {
						%>
						<tr>
							<td><%=bl.getBiddingAuctionId()%></td>
							<td><img src="<%=request.getContextPath()%>/img/appraisal/<%=bl.getThumbnailRename()%>"></td>
							<td><%=bl.getBrand()%> / <br><%=bl.getModel()%></td>
							<td><%=bl.getBiddingMaxPrice()%></td>
							<td><%=bl.getBiddingMemberPrice()%></td>
							<td>23시간 35분 전</td>
							<td><button>상세보기</button></td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
				<!-- tableArea End -->
			</div> <!-- menuStatus End -->
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