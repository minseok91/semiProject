<%--
/**
 * <pre>
 * @Author      : minseok
 * @CreateDate  : 2019. 12. 5. 오후 12:03:13
 * @ModifyDate  : 2019. 12. 5. 오후 12:03:13
 * @fileName    : 	noticeDetail.jsp
 * @Description :	게시판 상세
 * </pre>
 */
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.lp.admin.board.model.vo.*
	,java.util.*"%>
    <%
    Board list = (Board)request.getAttribute("list");
	Date day = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String today = df.format(day);
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

.contents {
	width: 100%;
	height: 90%;
	margin-top: 5%;
}

#infoBox {
	width: 90%;
	height: 100%;
	margin: 0 auto;
}

#infoTable {
	border: 1px solid;
	width: 1000px;
	height: 566px;
	margin: 0 auto;
	border-collapse: collapse;
}

td:nth-of-type(1) {
	font-weight: bold;
	text-align: center;
	color: #404040;
	background: #EAEAEA;
	border-bottom: 1px solid;
}

td:nth-of-type(2) {
	color: #000000;
	border-bottom: 1px solid;
}
input:nth-of-type(text) {
	border: hidden;
}
#infoBox>h3 {
	text-align: center;
}

#buttonBox {
	margin-top: 30px;
	width: 159px;
	margin-left: auto;
	margin-right: auto;
}

#buttonBox button {
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
#infoTable td:nth-child(1){
	width: 200px;
}
#infoTable textarea {
	width: 783px;
	height: 350px;
	resize: none;
	overflow: scroll;
}
input[type="text"] {
	margin-left: 30px;
	border: hidden;
}
input[type="text"]:focus {
	outline: none;
}
#category {
	margin-left: 30px;
	height: 30px;
}
#today {
	color: #404040;
}
#comment_top {
	border-bottom: none;
		background: white;
}
#comment_bottom {
	border-top: none;
	text-align:right;
	background: white;
}
#comment_btn {
	margin-right: 30px;
	width: 75px;
	height: 48px;
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
#comment_div {
	margin: 0 auto;
	width: 986px;
	height: 300px;
	background: white;
	overflow: scroll;
}
#comment_text {
	width: 837px;
	float: left;
	border: 1px solid;
	height: 45px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="headerPage.jsp"%>
	<div id="container" class="contents">
		<div id="contents" class="contents">
			<div id="infoBox">
				<form action="<%=request.getContextPath()%>/updateBoard.bo" method="post" onsubmit="return ok()">
					<h3 align="center">게시판 상세</h3>
					<table id="infoTable">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="<%=list.getBoardTitle()%>" readonly></td>
						</tr>
						<tr>
							<td>게시판 종류</td>
							<td><% if(list.getBoardType().equals("BT1")){ %>
									<input type="text" value= "자유게시판" readonly>
								<% } else { %>
									<input type="text" value= "리뷰게시판" readonly>
								<% } %>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer"
								value="<%=list.getBoardMemberName()%>"readonly>
								<input type="hidden" name="memberNo" value="<%= list.getBoardMemberNo()%>">
								<input type="hidden" name="boardId" value="<%= list.getBoardId() %>">
								</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td id="today"><input type="text" id="today" name="date" value="<%= today %>"readonly></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content" readonly><%= list.getBoardContent() %></textarea></td>
						</tr>
						<tr>
							<td colspan="2">댓글</td>
						</tr>
						<tr>
							<td colspan="2" id="comment_top">
								<div id="comment_div">
								
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" id="comment_bottom">
							<input type="text" id="comment_text">
							<button id="comment_btn">작성하기</button>
							</td>
						</tr>
					</table>
					<div id="buttonBox">
						<button id="back">뒤로 가기</button>
						<input id="submit" type="submit" value="수정하기">
					</div>
				</form>
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
		<%-- $("#buttonBox > button").click(function(){
			location.href="<%=request.getContextPath()%>
		/selectAll.bo";
		}).mouseover(function() {
			$("#buttonBox > button").css({
				'cursor' : 'pointer'
			})
		}) --%>
		var nn = false;
		$("#submit").click(function(){
			nn = true;
		})
		$("#back").click(function(){
			window.history.back();
		})
			function ok(){
				return nn;
			}
	</script>
</body>
</html>