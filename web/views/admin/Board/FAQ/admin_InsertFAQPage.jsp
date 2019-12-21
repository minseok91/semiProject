<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 15. 오후 6:10:57
 * @ModifyDate  : 2019. 12. 15. 오후 6:10:57
 * @fileName    : 
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" import="com.kh.lp.admin.board.model.vo.*
	,java.util.*"%>
<%
Date day = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
String today = df.format(day);
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/views/admin/image/loginimg(2).png">
<title>FAQ 작성</title>
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
	width: 90%;
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="../../common/headerPage.jsp"%>
	<div id="container" class="contents">
		<div id="contents" class="contents">
			<div id="infoBox">
				<form action="<%=request.getContextPath()%>/InsertFAQ.bo" method="post" onsubmit="return ok()">
					<h3 align="center">FAQ 글쓰기</h3>
					<table id="infoTable">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
						</tr>
						<tr>
							<td>게시판 종류</td>
							<td>
								<input type="text" name="type" value="FAQ" readonly>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer"
								value="admin"readonly></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td id="today"><input type="text" id="today" name="date" value="<%= today %>"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content"></textarea></td>
						</tr>
					</table>
					<div id="buttonBox">
						<button id="back">뒤로 가기</button>
						<input id="submit" type="submit" value="작성하기">
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
	<script>
		
	</script>
</body>
</html>