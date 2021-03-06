<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 6. 오후 8:38:58
 * @ModifyDate  : 2019. 12. 6. 오후 8:38:58
 * @fileName    : 경매 마감 상품
 * @Description : 
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.lp.auction.model.vo.*, java.util.*, com.kh.lp.common.*"%>
    
<%
	ArrayList<ClosedAuction> memberClosedAuctionList = (ArrayList<ClosedAuction>)(request.getAttribute("memberClosedAuctionList"));
	PageInfo pInfo = (PageInfo)request.getAttribute("pInfo");
	int startPage = pInfo.getStartPage();
	int currentPage = pInfo.getCurrentPage();
	int endPage = pInfo.getEndPage();
	int limit = pInfo.getLimit();
	int listCount = pInfo.getListCount();
	int maxPage = pInfo.getMaxPage();
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
.cotentsArea {
	height: 600px;
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
.status2 p {
	font-size: 17px;
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
   /*  left: 28%; */
   margin-left: 220px;
}

/* 1920px 전용(작업용) */
@media(min-width: 1919px) {
	.contentArea {
		/* left: 32%; */
		width: 59%;
	}
}
.btn {
	border:1px solid #a07342;
	background:#211f22;
	color:#e2ceb8;
	height:26px;
	border-radius:5px;
}
.contentArea>table {
	width: 920px;
}

.contentArea>table>theady>tr>th, .contentArea>table>tbody>tr>td {
	width: 152px;
	border-bottom: 1px solid #d9d9d9;
	padding: 15px;
	font-size: 15px;
	text-align: center;
}

.contentArea>table>tbody>tr>td>img {
	width: 100px;
	height: 100px;
}

.contentArea>table>thead>tr>th  {
	border-top: 1px solid;
	background: #E2CEB8;
	color: #211f22;
	font-size: 1.2em;
	border-top: 1px solid #211f22;
	height: 33px;
	text-align: center;
}
.btn2 {
	background: none;
	border: none;
	border: 1px solid white;
	background: white;
	color: black;
	height: 23px;
	border-radius: 5px;
	font-size: 17px;
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
				<dd><a value="../../wishList.wi">▶   위시리스트</a></dd>
				<dd><a value="../../biddingList.bi">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
				<dd><a value="sale/auctionList">▶  경매 진행 상품 관리</a></dd>
				<dd><a value="../../closedMemberAuctionList.au" id=selectMenu>▶  경매 마감 상품 관리</a></dd>
				
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
				<h3>&nbsp;&nbsp;<&nbsp;경매 마감 상품&nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>경매 완료된 회원님의 상품 리스트 및 경매 결과를 볼 수 있는 공간입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
			<table id="itemTableArea">
			<thead id="itemTableHeadArea">
				<tr>
					<th>경매번호</th>
					<th>상품사진</th>
					<th>브랜드/모델명</th>
					<th>낙찰가</th>
					<th>정산 상태</th>
					<th>경매 회차</th>
				</tr>
			</thead>
			<tbody id="itemTableBodyArea">
			 <% for(ClosedAuction cau : memberClosedAuctionList){%>
				<tr>
					<td><%=cau.getAuctionId() %></td>
					<td><img src="<%= request.getContextPath() %>/img/appraisal/<%= cau.getAttachmentRename() %>"></td>
					<td><%=cau.getAr1Brand() %> /<br><%=cau.getAr1Model() %></td>
					<td><%=cau.getCurrentPrice() %></td>
					<td><%=cau.getMoneyStatus().equals("not paid")?"미결제":"결제" %></td>
					<td><%=cau.getAuctionCount()==2?"재경매":"첫경매" %></td>
				</tr>
			<%} %>   
			</tbody>
			</table>
		</div> <!-- menuStatus End -->
		</div> <!-- contents End -->
		<div class="pagingArea" align="center">	
		
		  <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/closedMemberAuctionList.au.jsp?currentPage=1'"><<</button>
		<%if(currentPage==1) {%>
			<button class="btn2" disabled><</button>
		<%}else { %>
			<button class="btn2" onclick="location.href='<%=request.getContextPath()%>/closedMemberAuctionList.au.jsp?currentPage=<%=currentPage-1%>'"><</button>
		<%} %>
		
		<% for(int p = startPage; p<=endPage; p++) {
			if(p==currentPage){%>
				<button class="btn2" disabled style="font-weight: bold;"><%= p %></button>
			<%}else { %>
				<button class="btn2" onclick="location.href='<%=request.getContextPath()%>/closedMemberAuctionList.au.jsp?currentPage=<%=p%>'"><%=p %></button>
			<%}
		}%>
		<% if(currentPage >= maxPage) { %>
			<button class="btn2" disabled>></button>
		<%} else { %>
			<button class="btn2" onclick="location.href='<%=request.getContextPath()%>/closedMemberAuctionList.au.jsp?currentPage=<%=currentPage+1%>'">></button>
		<%} %>
		
		<button class="btn2" onclick="location.href='<%=request.getContextPath()%>/closedMemberAuctionList.au.jsp?currentPage=<%=maxPage%>'">>></button>
		</div> <!-- pagingArea End -->
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