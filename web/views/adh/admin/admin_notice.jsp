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