	<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 5. 오전 11:52:26
 * @ModifyDate  : 2019. 12. 5. 오전 11:52:26
 * @fileName    : 구매 이력 페이지
 * @Description :
 * </pre>
 */
--%>
<%@page import="java.util.ArrayList, com.kh.lp.admin.member.model.vo.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<purchaseHistory> list = (ArrayList<purchaseHistory>)request.getAttribute("purchaseList");
	pageInfo pi = (pageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	int listCount = pi.getListCount();
	int maxPage = pi.getMaxPage();
	int startPage =  pi.getStartPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
</head><link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
<title>Insert title here</title>
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
#searchBox {
	width: 250px;
	height: 25px;
	float: right;
	border: 1px solid rgb(160, 115, 66);
	border-radius: 5px; 
}
#sarchBoxBtn {
	width: 65px;
	height: 31px;
	margin-left: 2%;
	float: right;
	background: rgb(33, 31, 34);
	border: none;
	color: #e2ceb8;
	border-radius: 5px; 
}
#nextPageBox {
	width: 83px;
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
				<p>판매 상품 이력<h3><%= list.size() %>권</h3>
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
						<th>판매자</th>
						<th>낙찰 날짜</th>
						<th>구매 날짜</th>
					</tr>
					 <% for(int p=0; p<list.size(); p++) {%>
					 	<tr>
					 		<td><%= list.get(p).getRnum()%></td>
					 		<td><%= list.get(p).getTitle()%></td>
					 		<td><%= list.get(p).getProduct_name()%></td>
					 		<td><%= list.get(p).getWinning_bid()%></td>
					 		<td><%= list.get(p).getSeller()%></td>
					 		<td><%= list.get(p).getBid_date()%></td>
					 		<td><%= list.get(p).getPurchase_date()%></td>
					 	</tr>
					 	
					 <% } %>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox">
					<button><</button>
					<button>o</button>
					<button>></button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>