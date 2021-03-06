<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 7. 오후 8:59:54
 * @ModifyDate  : 2019. 12. 7. 오후 8:59:54
 * @fileName    : reportList
 * @Description : 마이페이지 - 사용자가 다른 사용자를 신고한 목록
 * </pre>
 */
--%>

<%@page import="com.kh.lp.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
/* 	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
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
.status2 p {
	font-size: 17px;
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

.contentArea {
    text-align: center;
    position: absolute;
    width: 920px;
    margin-top: 75px;
    margin-left: 220px;
}

/* 1920px 전용(작업용) */
@media(min-width: 1919px) {
	.contentArea {
	/* 	left: 32%; */
		width: 59%;
	}
}

.contentArea>table {
	width: 920px;
}

.contentArea>table>thead>tr>th, .contentArea>table>tbody>tr>td {
	width: 152px;
	border-bottom: 1px solid #d9d9d9;
	padding: 15px;
	font-size: 15px;
	text-align: center;
}

.container>.contents>#contentArea>#tableArea {
	width: 200px;
}

.contentArea>table>thead>tr>th  {
	height: 33px;
	border-top: 1px solid;
	background: #E2CEB8;
	color: #211f22;
	font-size: 1.2em;
	height: 32px;
	border-top: 1px solid #211f22;
}
#reportBtn {
border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
		height:24px;
		border-radius:4px;
		font-size:16px;
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
				<dd><a value="../../wishList.wi">▶   위시리스트</a></dd>
				<dd><a value="../../biddingList.bi">▶   입찰리스트</a></dd>
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
				<dd><a value="queAndReport/reportList" id="selectMenu">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a value="memberChange/userInfoChange">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;신고 내역 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님께서 신고하신 내역과 그에 대한 접수 및 처리 상황을 확인할 수 있는 공간입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
			<table id="tableArea">
				<thead id="tableHeadArea">
					<tr>
					<th>신고번호</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>답변여부</th>
				</tr>
				</thead>
				<tbody id="tableBodyArea">
				<tr>
					<td>1</td>
					<td>배송하긴 한건가요</td>
					<td>2019-12-06</td>
					<td>답변완료</td>
				</tr>
				</tbody>
			</table>
		</div> <!-- contentArea End -->
		<div class="pagingArea" align="center">	
		<%-- <button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=1'"><</button>
			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% } else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage - 1%>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled><%= p %></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=p%>'"><%= p %></button>
			<% }
			} %>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			
		<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage%>'">></button>
		</div> <!-- pagingArea End --> --%>
		</div> <!-- contents End -->
		</div>
		<button id="reportBtn" style="float: right;">신고하기</button>
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