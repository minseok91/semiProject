<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 6. 오후 7:29:37
 * @ModifyDate  : 2019. 12. 6. 오후 7:29:37
 * @fileName    : goodsEnrollList
 * @Description : 등록된 상품 관리 리스트
 * </pre>
 */
--%>

<%@page import="com.kh.lp.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
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

.container>.contents>#myPageMenu>dl>dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
}

.container>.contents>#myPageMenu>dl>dd {
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

.container>.contents>#contentArea>#tableArea{
	width: 920px;
	border-collapse: separate;
    border-spacing: 0 25px;
	
}

.container>.contents>#myPageMenu>dl>dd>a {
	color: darkgray;
	text-decoration: none;
	cursor: pointer;
}

.container>.contents>#myPageMenu>dl>dd>#selectMenu {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>.contents>#myPageMenu>dl>dd>a:hover {
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

.container>.contents>.menuStatus>.status2 {
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
.contentArea>table>tbody>tr>td>img {
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
<body onload="selectTable()">
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
				<h3>&nbsp;&nbsp;<&nbsp;등록상품 관리 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>진품 보증 및 상품 감정이 완료되어 경매 진행이 가능한 상품 리스트 및 감정 결과를 볼 수 있는 공간입니다.</p>
				<p>감정 완료 시점으로부터 7일 이내에 경매가 진행되지 않은 상품은 자동 반송 처리됩니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
			<table id="tableArea" border="1">
				<thead id="tableHeadArea">
					<tr>
						<th>상품번호</th>
						<th>상품사진</th>
						<th>브랜드/모델명</th>
						<th>감정 결과</th>
						<th>경매 진행</th>
						<th>남은 시간</th>
					</tr>
				</thead>
				<tbody id="tableBodyArea"></tbody>
			</table>
			
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>

			<% if(currentPage <= 1) { %>
				<button disabled><</button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>'/selectList.bo?currentPage=<%= currentPage - 1 %>"><</button>
			<% } %>

			<% for (int p=startPage; p <= endPage; p++) {
				if(p == currentPage) {
			%>
			<button disabled><%= p %></button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
			<% } %>

			<% if(currentPage >= maxPage) { %>
			<button disabled>></button>
			<% } else { %>
			<button
				onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage + 1 %>'">></button>
			<% } %>

			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>'">>></button>
		</div>
		
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
		
		function selectTable(){
			console.log("페이지 로드 될때마다 실행");
			$.ajax({
				url: "<%= request.getContextPath() %>/selectItemResult.app",
				type: "post",
				data: {
					memberNo: <%= loginMember.getMemberNo() %>
				},
				success: function(data){
					console.log(data);
					var arr = data.split("#");
					for(i in arr){
						console.log(arr[i]);
						var arr2 = arr[i].split("::");
						$("#tableArea > #tableBodyArea:last").append("<tr>");
						for(j in arr2){
							console.log(arr2[j]);
							$("#tableArea > #tableBodyArea:last").append("<td>" + arr2[j] + "</td>");
						}
						$("#tableArea > #tableBodyArea:last").append("<td></td><td><button onclick='startAuction()'>경매시작</button><br><button onclick='endAuction()'>경매취소</button></td>");
						$("#tableArea > #tableBodyArea:last").append("<td name='a" + i + "'></td>");
						$("#tableArea > #tableBodyArea:last").append("</tr>");
						
					}
				},
				error: function(data){
					console.log("테스트 실패");
				}
			});
		}
		
		function startAuction(){
			console.log("경매시작합니다.");
		};
		
		function endAuction(){
			console.log("경매를 취소합니다.");
		};
	</script>
</body>
</html>