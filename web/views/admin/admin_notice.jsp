<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/admin_notice.css">
</head><link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
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
.contents{
	width: 100%;
	height: 650px;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	
}
.contents> div:first-child {
	width: 94%;
	height: 120px;
	margin: 0 auto;

}
.contents> div:first-child > div {
	width: 100%;
	height: 50px;

}
#table {
	width: 100%;	
	border-collapse: collapse;
}
#table tr th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
#table tr th,#table tr td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
} 
#search_Box {
	width: 100%;
	height: 100%;
	border: none;
	border-collapse: collapse;
	margin-top: 10px;
	
}
#search_Box tr td:nth-of-type(1) {
	width: 150px;
	border: 1px solid;
	margin-right: 0px; 
	text-align: center;
	border: 1px solid gray;
}
#search_Box tr td {
	border: 1px solid ;
	border: 1px solid gray;
}

.contents> div > p, h3 {
	width: 90px;
	margin: 0;
	float: left;
	
}
.contents> div > p {
	padding-top: 1px;
}
.contents> div:nth-child(2) {
	width: 95%;
	height: 73.5%;
	margin-left: auto;
	margin-right: auto;
	margin-top: -14px;
}

#nextPage {
	width: 100%;
	height: 15%;
} 


#nextPageBox {
	width: 83px;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}
#updateBtn {
	border: none;
	background: rgb(160, 115, 66);
	color : #e2ceb8;
	margin-bottom: 7px;
}
#deleteBtn {
	border: none;
	background: red;
	color : #e2ceb8;
	margin-bottom: 7px;
}

#search_Box td:nth-of-type(2) select{
	margin-left: 8px;
	width: 80px;
	height: 30px;
	border-radius: 5px; 
}
#idSearch {
	width: 130px;
	height: 30px;
	margin-left: 8px;
	border: 1px solid gray;
	border-radius: 5px;
}
#idSearchBtn {
	width: 50px;
	height: 30px;
	background: rgb(160, 115, 66);
	color: #e2ceb8;
	border: 1px solid rgb(160, 115, 66);
}
#NoticeNumber > p {
	width: 101px;
	margin-bottom: 0px;
	margin-top: 17px;
	float: left;
}

#NoticeNumber > h4 {
	width: 34px;
	margin-bottom: 0px;
	margin-top: 17px;
	float: left;
}
</style>
<body>
	<%@ include file="headerPage.jsp" %>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<div>
					<table id="search_Box">
						<tr>
							<td>아이디 검색</td>
							<td>
								<input type="text" id="idSearch">
								<button id="idSearchBtn">검색</button>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<table id="search_Box">
							<tr>
								<td>검색판명 선택</td>
								<td>
								<select>
									<option> -- 선택 -- </option>
									<option> 자유 게시판 </option>
									<option> 건의 게시판 </option>
									<option> 리뷰 게시판 </option>
								</select>
								</td>
							</tr>
						</table>
				</div>
			</div>
			<div>
			<div id="NoticeNumber">
				<p>총 게시판 수 :</p><h4>4명</h4>
			</div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>그룹명</th>
						<th>아이디</th>
						<th>게시판명</th>
						<th>목록보기</th>
						<th>내용보기</th>
						<th>글쓰기</th>
						<th>답변쓰기</th>
						<th>코멘트쓰기</th>
						<th>기능</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>커뮤니티</td>
						<td>adh5677</td>
						<td>자유게시판</td>
						<td>전체</td>
						<td>전체</td>
						<td>전체</td>
						<td>전체</td>
						<td>전체</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					 <tr>
						<td>2</td>
						<td>커뮤니티</td>
						<td>kingminseok</td>
						<td>건의게시판</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>사용자</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>커뮤니티</td>
						<td>관리자</td>
						<td>공지</td>
						<td>전체</td>
						<td>전체</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
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
	$(document).click(function(e) {
		if(e.target.tagName == "TD"){
			location.href = "admin_noticeDetailPage.jsp"
		}
	})
	</script>
</body>
</html>