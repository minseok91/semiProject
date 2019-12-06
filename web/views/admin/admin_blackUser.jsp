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
	html body {
	margin: 0;
	padding: 0;
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
#table  th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
#table  th, td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}
#nextPage {
	width: 100%;
	height: 15%;
} 
#searchBox {
	margin-top: 1px;
	width: 130px;
	height: 25px;
	float: right;
	border: none;
	box-shadow: 1px 1px 1px 1px gray;
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
#nextPageBox {
	width: 83px;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<%@ include file="headerPage.jsp" %>
	<form action="" method="post">
		<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<p>블랙 회원<h3>1명</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>휴대폰번호</th>
						<th>주소</th>
						<th>이메일</th>
						<th>설정</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>adh1234</td>
						<td>안동환</td>
						<td>010-2222-1919</td>
						<td>충남 서산시</td>
						<td>adh1234@naver.com</td>
						<td></td>
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
	</form>
	<script>
		$(document).click(function(e) {
			if(e.target.tagName == "TD"){
				location.href = "admin_userDetailPage.jsp"
			}
		})
	</script>
</body>
</html>