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
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
<style>
	html, body {
		padding: 0;
		margin: 0;
	}
	html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
#container {
	width: 1080px;
	height: 800px;
	margin-left: auto;
	margin-right: auto;
	
}
#container_Box {
	width: 100%;
	height: 90%;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	
}
#container_Box > div:first-child {
	width: 96%;
	height: 25px;
	padding: 20px;

}
#container_Box > div > p, h3 {
	width: 120px;
	margin: 0;
	float: left;
	
}
#container_Box > div > p {
	padding-top: 1px;
}
#container_Box > div:nth-child(2) {
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
	<%@ include file="headerPage.jsp" %>
	<div id="container">
		<div id="container_Box">
			<div>
				<p>판매 상품 이력<h3>3권</h3>
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
					 <tr>
						<td>1</td>
						<td>시계</td>
						<td>명품시계</td>
						<td>32,000,000원</td>
						<td>adh1234</td>
						<td>2019-12-02</td>
						<td>2019-12-04</td>
					</tr>
					<tr>
						<td>2</td>
						<td>가방</td>
						<td>구찌가방</td>
						<td>4,000,000원</td>
						<td>dksn213</td>
						<td>2019-11-30</td>
						<td>2019-12-01</td>
					</tr>
					<tr>
						<td>3</td>
						<td>시계</td>
						<td>샤넬 시계</td>
						<td>6,000,000원</td>
						<td>ahffk1234</td>
						<td>2019-12-05</td>
						<td>2019-12-06</td>
					</tr>
					
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