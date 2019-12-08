<%--
/**
 * <pre>
 * @Author      : minseok
 * @CreateDate  : 2019. 12. 8. 오후 12:03:13
 * @ModifyDate  : 2019. 12. 8. 오후 12:03:13
 * @fileName    : 	noticeInsert.jsp
 * @Description :	게시판 글쓰기
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.lp.board.model.vo.*"  %>
    
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
	height: 800px;
	margin-left: auto;
	margin-right: auto;
}
.contents{
	width: 100%;
	height: 90%;
	margin-top: 10%;
	
}
#infoBox {
	width: 90%;
	height: 100%;
	margin: 0 auto;
}
#infoTable {
	margin-top: 56px;
	margin-left: 38%;	
	width: 45%;
	border-collapse: collapse;
}
#infoTable  td{
	height: 60px;
}
td:nth-of-type(1) {
	font-weight: bold;
	color: #404040;
}
td:nth-of-type(2) {
	color: #000000;
}
#infoBox > h3{
	text-align: center;
}
#buttonBox {
	margin-top: 30px;
	width: 73.03px;
	margin-left: auto;
	margin-right: auto;
}
#buttonBox button {
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="headerPage.jsp" %>
	<div id="container" class="contents">
		<div id="contents" class="contents">
			<div id="infoBox">
			<form action="<%=request.getContextPath()%>/insert.bo" method="post">
			<h3>게시판 글쓰기</h3>
				<table id="infoTable">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr>
						<td>게시판 종류</td>
						<td>
							<select name="category">
								<option value="10">자유게시판</option>
								<option value="20">리뷰게시판</option>
								<option value="30">FAQ</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" placeholder="로그인유저 불러오기"></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td><input type="text" name="date" placeholder="오늘날짜 가져오기"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content"></textarea></td>
					</tr>
				</table>
				<input type="submit" value="작성하기">
				</form>
				<div id="buttonBox">
						<button>뒤로 가기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#salesHistory").click(function(){
			location.href = "admin_SalesHistory.jsp";
		}).mouseover(function(){
			$("#salesHistory").css({'cursor':'pointer'})
		})
		$("#purchaseHistory").click(function(){
			location.href = "admin_purchaseHistory.jsp";
		}).mouseover(function(){
			$("#purchaseHistory").css({'cursor':'pointer'})
		})
		$("#buttonBox > button").click(function(){
			location.href="<%= request.getContextPath()%>/selectAll.bo";
		}).mouseover(function(){
			$("#buttonBox > button").css({'cursor':'pointer'})
		})
	</script>
</body>
</html>