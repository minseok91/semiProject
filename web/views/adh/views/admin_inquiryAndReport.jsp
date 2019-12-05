<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 5. 오후 12:53:56
 * @ModifyDate  : 2019. 12. 5. 오후 12:53:56
 * @fileName    : 문의 및 신고 페이지
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
</head><link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
<link rel="stylesheet" type="text/css" href="css/admin_userDetailPage.css">
<meta content="text/html;">
<style>
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
	width: 94%;
	height: 120px;
	margin: 0 auto;

}
#container_Box > div:first-child > div {
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

#container_Box > div > p, h3 {
	width: 90px;
	margin: 0;
	float: left;
	
}
#container_Box > div > p {
	padding-top: 1px;
}
#container_Box > div:nth-child(2) {
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="headerPage.jsp" %>
	<div id="container">
		<div id="container_Box">
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
									<option> 신고 게시판 </option>
									<option> 문의 게시판 </option>
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
						<th>번호</th>
						<th>카테고리</th>
						<th>신고제목</th>
						<th>글쓴이</th>
						<th>게시물ID</th>
						<th>기능</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>신고게시판</td>
						<td>게시판 도배</td>
						<td>킹민석</td>
						<td>NT1234</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					 <tr>
						<td>2</td>
						<td>문의게시판</td>
						<td>악성광고</td>
						<td>안동환</td>
						<td>NT1235</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>신고게시판</td>
						<td>그냥 심심</td>
						<td>안동</td>
						<td>NT1237</td>
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