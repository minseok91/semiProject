<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
</head>
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
.contents {
	width: 100%;
	height: 650px;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	
}
.contents > div:first-child {
	width: 96%;
	height: 25px;
	padding: 20px;

}
.contents > div > p, h3 {
	width: 80px;
	margin: 0;
	float: left;
	
}
.contents > div > p {
	padding-top: 1px;
}
.contents > div:nth-child(2) {
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
#table th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
#table th, td {
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
<body>
	<%@ include file="headerPage.jsp" %>
	
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<p>전체 회원<h3>4명</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>등급</th>
						<th>휴대폰번호</th>
						<th>주소</th>
						<th>이메일</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>kms1234</td>
						<td>김민석</td>
						<td>일반회원</td>
						<td>010-5959-1919</td>
						<td>경기도 성남시 어딘가</td>
						<td>kms1234@naver.com</td>
					</tr>
					<tr>
						<td>2</td>
						<td>kms1234</td>
						<td>김민석</td>
						<td>일반회원</td>
						<td>010-5959-1919</td>
						<td>경기도 성남시 어딘가</td>
						<td>kms1234@naver.com</td>
					</tr>
					<tr>
						<td>3</td>
						<td>kms1234</td>
						<td>김민석</td>
						<td>일반회원</td>
						<td>010-5959-1919</td>
						<td>경기도 성남시 어딘가</td>
						<td>kms1234@naver.com</td>
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
	<script>
	$(function(){
		
		$(document).click(function(e) {
			if(e.target.tagName == "TD"){
				location.href = "admin_userDetailPage.jsp"
			}
		})
	});
	</script>
</body>
</html>