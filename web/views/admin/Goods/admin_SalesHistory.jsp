<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 5. 오전 12:25:23
 * @ModifyDate  : 2019. 12. 5. 오전 12:25:23
 * @fileName    : 판매상품 이력
 * @Description :
 * </pre>
 */
--%>
<%@page import="com.kh.lp.admin.member.model.vo.pageInfo,java.util.ArrayList
,com.kh.lp.admin.member.model.vo.salesHistory"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<salesHistory> salesList = (ArrayList<salesHistory>)request.getAttribute("salesList");
	pageInfo pi = (pageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	int listCount = pi.getListCount();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
<title>판매 상품 이력</title>
<style>
	html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
.container {
	width: 1080px;
	margin-left: auto;
	margin-right: auto;
	
}
.contents{
	width: 100%;
	height: 650px;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	
}
.contents> div:first-child {
	width: 96%;
	height: 25px;
	padding: 20px;

}
.contents> div > p, h3 {
	width: 120px;
	margin: 0;
	float: left;
	
}
.contents> div > p {
	padding-top: 1px;
}
.contents> div:nth-child(2) {
	width: 95%;
	height: 73.5%;
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
}
#table {
	width: 100%;	
	border-collapse: collapse;
}
th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
th, td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}
#nextPage {
	width: 100%;
	height: 15%;
} 
#sarchBoxBtn {
	width: 65px;
	height: 31px;
	margin-left: 2%;
	float: right;
	background: rgb(33, 31, 34);
	border: 2px solid rgb(160, 115, 66);
	color: rgb(160, 115, 66);
}
#searchBox {
	margin-top: 1px;
	width: 130px;
	height: 25px;
	border: none;
	box-shadow: 2px 2px 6px 1px gray;
	float: right;
}
#nextPageBox {
	width: 80%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<%@ include file="../common/headerPage.jsp" %>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<p>판매 상품 이력<h3><%= salesList.size() %>권</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>상품종류</th>
						<th>상품명</th>
						<th>낙찰가</th>
						<th>구매자</th>
						<th>낙찰 날짜</th>
						<th>구매 날짜</th>
					</tr>
					<% for(int p=0; p<salesList.size(); p++) { %>
						<tr>
							<th><%= salesList.get(p).getRum()%></th>
							<th><%= salesList.get(p).getTitle()%></th>
							<th><%= salesList.get(p).getGoods_kinds()%></th><!-- 참고 바람 상품명이름을 이상하게 지음 -->
							<th><%= salesList.get(p).getWinning_bid()%>원</th>
							<th><%= salesList.get(p).getBuyer_no()%></th>
							<th><%= salesList.get(p).getBid_date()%></th>
							<th><%= salesList.get(p).getPurchase_date()%></th>
						</tr>
					<% } %>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox"align="center">
					<button onclick="location.href='<%=request.getContextPath()%>/userSalesHistory.me?currentPage=1&userId=<%=request.getParameter("userId")%>'"><<</button>
						<% for(int b=1; b<= maxPage; b++) { %>
							<button onclick="location.href='<%=request.getContextPath()%>/userSalesHistory.me?currentPage=<%= b%>&userId=<%=request.getParameter("userId")%>'"><%= b %></button>
						<% } %>
					<button onclick="location.href='<%=request.getContextPath()%>/userSalesHistory.me?currentPage=<%= maxPage%>&userId=<%=request.getParameter("userId")%>'">>></button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>